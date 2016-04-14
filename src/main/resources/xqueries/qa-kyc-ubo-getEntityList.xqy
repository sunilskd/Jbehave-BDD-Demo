xquery version "1.0-ml";
module namespace qa-kyc-ubo-getEntityList = "qa-kyc-ubo-getEntityList";
import module namespace qa-kyc-ubo-getRelationshipDocs = "qa-kyc-ubo-getRelationshipDocs" at "qa-kyc-ubo-getRelationshipDocs.xqy";
import module namespace qa-kyc-ubo-getDateAsPerAccuracy = "qa-kyc-ubo-getDateAsPerAccuracy" at "qa-kyc-ubo-getDateAsPerAccuracy.xqy";

declare function getEntityList($fid as xs:string, $listType as xs:string) 
{
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
			cts:element-attribute-value-query(xs:QName("legalEntity"), xs:QName("resource"), $x/parties/party[partyType = $returnedEntityPartyType][entityType = "institution"]/entityReference/link/@href)))) 

           
let $legalTitle := $legalEntity/summary[status="active"]/names/name[type="Legal Title"]/value/text()

let $percentOwnership := if(fn:exists($x/details/ownership/percentage))
				then $x/details/ownership/percentage/text()
				else()

let $country := cts:search(/country,
				cts:and-query((
				cts:collection-query(("current")),
				cts:collection-query(("country")),
				cts:collection-query("source-fdb"), 
				cts:element-attribute-value-query(xs:QName("country"), xs:QName("resource"), $legalEntity/summary/countryOfOperations/link/@href))))

let $countryOfOperations := $country/summary/names/name[type="Country Name"]/value/text()
let $lastValidatedDate := qa-kyc-ubo-getDateAsPerAccuracy:getDateAsPerAccuracy($x/validationDate)

order by xs:double($percentOwnership) descending, $legalEntity/summary/names/legalEntitySortKey ascending

return if(fn:exists($legalTitle))
	then <entityInfo entityType= "legalEntity">
	       <legalTitle legalEntityFid="{data($legalEntity/@fid)}">{$legalTitle}</legalTitle>
	       <percentOwnership relationshipFid="{data($x/@fid)}">{$percentOwnership}</percentOwnership> 
	       <countryOfOperations countryFid="{data($country/@fid)}">{$countryOfOperations}</countryOfOperations> 
	       <lastValidatedDate relationshipFid="{data($x/@fid)}" accuracy="{data($x/validationDate/@accuracy)}">{$lastValidatedDate}</lastValidatedDate> 
	       </entityInfo>
	else()


return <entitiesInfo>{$directOwnersInfo}</entitiesInfo>
};