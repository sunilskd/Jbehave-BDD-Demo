xquery version "1.0-ml";
import module namespace qa-kyc-ubo-getRelationshipDocs = "qa-kyc-ubo-getRelationshipDocs" at "qa-kyc-ubo-getRelationshipDocs.xqy";
import module namespace qa-kyc-ubo-getDateAsPerAccuracy = "qa-kyc-ubo-getDateAsPerAccuracy" at "qa-kyc-ubo-getDateAsPerAccuracy.xqy";
import module namespace qa-kyc-ubo-getPersonDoc = "qa-kyc-ubo-getPersonDoc" at "qa-kyc-ubo-getPersonDoc.xqy";
import module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc" at "qa-kyc-ubo-getLegalEntityDoc.xqy";
import module namespace qa-kyc-ubo-getCountryDoc = "qa-kyc-ubo-getCountryDoc" at "qa-kyc-ubo-getCountryDoc.xqy";


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
                                  
let $ownershipFreeTextInLegalEntity := (qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDoc($fid))/ownership/summaries/summary[1]/text()
let $freeTextInOwnership := if(fn:exists($ownershipFreeTextInLegalEntity))
                            then <ownershipFreeText>{$ownershipFreeTextInLegalEntity}</ownershipFreeText>
                            else ()

let $relationshipDocs := qa-kyc-ubo-getRelationshipDocs:getRelationships($fid, $searchedEntityPartyType)

let $directOwnersInfo := for $x in $relationshipDocs

let $legalEntity := cts:search(/legalEntity,
			cts:and-query((
			cts:collection-query(("current")),
			cts:collection-query(("legalEntity")),
			cts:collection-query("source-fdb"), 
			cts:element-attribute-value-query(xs:QName("legalEntity"), xs:QName("resource"), $x/parties/party[partyType = $returnedEntityPartyType][entityType = "institution"]/entityReference/link/@href)))) 

let $legalTitle := $legalEntity/summary[status="active"]/names/name[type="Legal Title"]/value/text()
let $legalTitleSortKey := $legalEntity/summary/names/legalEntitySortKey/text()           

let $person := qa-kyc-ubo-getPersonDoc:getPersonDoc($x/parties/party[partyType = $returnedEntityPartyType][entityType = "person"]/entityReference/link/@href)

let $personName := $person/summary/names/name/formattedName/text()
let $personSortKey := $person/summary/names/personSortKey/text()

let $percentOwnership := if(fn:exists($x/details/ownership/percentage))
				then $x/details/ownership/percentage/text()
				else()

let $country := qa-kyc-ubo-getCountryDoc:getCountryDoc($legalEntity/summary/countryOfOperations/link/@href)
let $countryOfOperations := $country/summary/names/name[type="Country Name"]/value/text()
let $lastValidatedDate := qa-kyc-ubo-getDateAsPerAccuracy:getDateAsPerAccuracy($x/validationDate)

order by xs:double($percentOwnership) descending, $legalEntity/summary/names/legalEntitySortKey ascending

return if(fn:exists($legalTitle))
	then <entity>
	       	<entityInfo entityType= "legalEntity" legalEntityFid="{data($legalEntity/@fid)}">
		       <entityName>{$legalTitle}</entityName>
		       <entitySortKey>{$legalTitleSortKey}</entitySortKey>		
	       	</entityInfo>
		<countryOfOperations countryFid="{data($country/@fid)}">{$countryOfOperations}</countryOfOperations> 
	    	<relationship relationshipFid="{data($x/@fid)}">		
	       		<percentOwnership>{$percentOwnership}</percentOwnership> 
			<lastValidatedDate accuracy="{data($x/validationDate/@accuracy)}">{$lastValidatedDate}</lastValidatedDate> 
		</relationship>	
	      </entity>	
	else if(fn:exists($personName))
	then <entity>
		<entityInfo entityType= "person" personFid="{data($person /@fid)}">
			<entityName>{$personName}</entityName>
		       <entitySortKey>{$personSortKey }</entitySortKey>		
	       	</entityInfo>
		<countryOfOperations countryFid="{data($country/@fid)}">{$countryOfOperations}</countryOfOperations> 
	    	<relationship relationshipFid="{data($x/@fid)}">		
	       		<percentOwnership>{$percentOwnership}</percentOwnership> 
			<lastValidatedDate accuracy="{data($x/validationDate/@accuracy)}">{$lastValidatedDate}</lastValidatedDate> 
		</relationship>	
	      </entity>	
	else()

return <entities>
		{$directOwnersInfo}
		<entity>
	       	<entityInfo entityType= "freeText" legalEntityFid="{data($fid)}">
			{$freeTextInOwnership}
		</entityInfo>
		</entity>
	</entities>