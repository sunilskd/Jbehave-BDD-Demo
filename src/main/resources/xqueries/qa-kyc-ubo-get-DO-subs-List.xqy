xquery version "1.0-ml";
declare namespace html = "http://www.w3.org/1999/xhtml";
declare namespace functx = "http://www.functx.com";
import module namespace qa-kyc-ubo-getRelationshipDocs = "qa-kyc-ubo-getRelationshipDocs" at "qa-kyc-ubo-getRelationshipDocs.xqy";

declare function functx:month-abbrev-en ( $date as xs:anyAtomicType? )  as xs:string? 
{
    ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')
    [month-from-date(xs:date($date))]
} ;

declare function functx:day-abbrev-en ( $date as xs:anyAtomicType? )  as xs:string? 
{
    ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31')
    [day-from-date(xs:date($date))]
} ;

declare function local:getDateAsPerAccuracy ( $date as node() ) 
{
    switch($date/@accuracy/string())
        case "day" return fn:concat(functx:day-abbrev-en(xs:date($date)), ' ', functx:month-abbrev-en(xs:date($date)), ' ', year-from-date(xs:date($date)))
        case "month" return fn:concat(functx:month-abbrev-en(xs:date($date)),	 ' ', year-from-date(xs:date($date)))
        case "year"  return year-from-date(xs:date($date))
        default return "date not valid"
};

let $fid := xs:string(xdmp:get-request-field("fid"))
let $listType := xs:string(xdmp:get-request-field("listType"))

let $searchedEntityPartyType := if($listType = "direct owners")
		                then "owned"
                  		else if ($listType = "subsidiaries")
		                        then "owner"
                		        else()

let $returnedEntityPartyType := if($listType = "direct owners")
                                  then "owner"
                                  else if ($listType = "subsidiaries")
                                        then "owned"
                                        else()                                        

let $relationshipDocs := qa-kyc-ubo-getRelationshipDocs:getRelationships($fid, $searchedEntityPartyType)

let $directOwnersInfo := for $x in $relationshipDocs

let $legalEntity := cts:search(/legalEntity,
			cts:and-query((
			cts:collection-query(("current")),
			cts:collection-query(("legalEntity")),
			cts:collection-query("source-fdb"), 
			cts:path-range-query("/legalEntity/summary/status", "=", "active", "collation=http://marklogic.com/collation/"),
			cts:element-attribute-value-query(xs:QName("legalEntity"), xs:QName("resource"), $x/parties/party[partyType = $returnedEntityPartyType][entityType = "institution"]/entityReference/link/@href)))) 
           
let $legalTitle := $legalEntity/summary/names/name[type="Legal Title"]/value/text()
let $percentOwnership := $x/details/ownership/percentage/text()

let $country := cts:search(/country,
				cts:and-query((
				cts:collection-query(("current")),
				cts:collection-query(("country")),
				cts:collection-query("source-fdb"), 
				cts:element-attribute-value-query(xs:QName("country"), xs:QName("resource"), $legalEntity/summary/countryOfOperations/link/@href))))

let $countryOfOperations := $country/summary/names/name[type="Country Name"]/value/text()
let $lastValidatedDate := local:getDateAsPerAccuracy($x/validationDate)

order by xs:double($percentOwnership) descending, $legalTitle ascending

return <entityInfo>
       <legalTitle>{$legalTitle}</legalTitle>
       <percentOwnership>{$percentOwnership}</percentOwnership> 
       <countryOfOperations>{$countryOfOperations}</countryOfOperations> 
       <lastValidatedDate>{$lastValidatedDate}</lastValidatedDate> 
       </entityInfo>

return <entitiesInfo>{$directOwnersInfo}</entitiesInfo>