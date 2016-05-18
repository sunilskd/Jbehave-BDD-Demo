xquery version "1.0-ml";
module namespace qa-kyc-ubo-getEntityList = "qa-kyc-ubo-getEntityList";
import module namespace qa-kyc-ubo-getRelationshipDocs = "qa-kyc-ubo-getRelationshipDocs" at "qa-kyc-ubo-getRelationshipDocs.xqy";
import module namespace qa-kyc-ubo-getDateAsPerAccuracy = "qa-kyc-ubo-getDateAsPerAccuracy" at "qa-kyc-ubo-getDateAsPerAccuracy.xqy";
import module namespace qa-kyc-ubo-getPersonDoc = "qa-kyc-ubo-getPersonDoc" at "qa-kyc-ubo-getPersonDoc.xqy";
import module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc" at "qa-kyc-ubo-getLegalEntityDoc.xqy";
import module namespace qa-kyc-ubo-getCountryDoc = "qa-kyc-ubo-getCountryDoc" at "qa-kyc-ubo-getCountryDoc.xqy";

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
                                  
let $ownershipFreeTextInLegalEntity := (qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDoc($fid))/ownership/summaries/summary[1]/text()
let $freeTextInOwnership := if(fn:exists($ownershipFreeTextInLegalEntity))
                            then <freeTextEntity>{$ownershipFreeTextInLegalEntity}</freeTextEntity>
                            else ()

let $relationshipDocs := qa-kyc-ubo-getRelationshipDocs:getRelationships($fid, $searchedEntityPartyType, "ownership")

let $directOwnersInfo := for $x in $relationshipDocs

let $legalEntity := qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDocByResource($x/parties/party[partyType = $returnedEntityPartyType][entityType = "institution"]/entityReference/link/@href)

let $legalTitle := $legalEntity/summary[status="active"]/names/name[type="Legal Title"]/value/text()
let $legalTitleSortKey := $legalEntity/summary/names/legalEntitySortKey/text()           

let $person := qa-kyc-ubo-getPersonDoc:getPersonDoc($x/parties/party[partyType = $returnedEntityPartyType][entityType = "person"]/entityReference/link/@href)

let $personName := $person/summary/names/name/formattedName/text()
let $personSortKey := $person/summary/names/personSortKey/text()

let $nonEntityNonPersonOwners := string-join(($x/details/ownership/ownerType, $x/parties/party[partyType='owner'][entityType = 'owner']/entityReference/description/text()), ", ")

let $percentOwnership := if(fn:exists($x/details/ownership/percentage))
				then $x/details/ownership/percentage/text()
				else()

let $country := qa-kyc-ubo-getCountryDoc:getCountryDoc($legalEntity/summary/countryOfOperations/link/@href)
let $countryOfOperations := $country/summary/names/name[type="Country Name"]/value/text()
let $lastValidatedDate := qa-kyc-ubo-getDateAsPerAccuracy:getDateAsPerAccuracy($x/validationDate)

let $sourceProvider := $x/provider/legalName/text()
let $extendedSource := $x/extendedSource/text()
let $displaySource := string-join(($sourceProvider, $extendedSource), ", ")

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
			<displaySource sourceProvider="{data($sourceProvider)}" extendedSource="{data($extendedSource)}">{$displaySource}</displaySource>
		</relationship>	
	      </entity>	
	else if(fn:exists($personName))
	then <entity>
		<entityInfo entityType= "person" personFid="{data($person/@fid)}">
			<entityName>{$personName}</entityName>
		       <entitySortKey>{$personSortKey}</entitySortKey>		
	       	</entityInfo>
		<countryOfOperations countryFid="{data($country/@fid)}">{$countryOfOperations}</countryOfOperations> 
	    	<relationship relationshipFid="{data($x/@fid)}">		
	       		<percentOwnership>{$percentOwnership}</percentOwnership> 
			<lastValidatedDate accuracy="{data($x/validationDate/@accuracy)}">{$lastValidatedDate}</lastValidatedDate> 
			<displaySource sourceProvider="{data($sourceProvider)}" extendedSource="{data($extendedSource)}">{$displaySource}</displaySource>
		</relationship>	
	      </entity>	
	else if(fn:exists($nonEntityNonPersonOwners))
	then <entity>
		<entityInfo entityType= "nonEntityNonPerson" relationshipFid="{data($x/@fid)}">
			<entityName>{$nonEntityNonPersonOwners}</entityName>
		       <entitySortKey>{$nonEntityNonPersonOwners}</entitySortKey>		
	       	</entityInfo>
		<countryOfOperations countryFid="{data($country/@fid)}">{$countryOfOperations}</countryOfOperations> 
	    	<relationship relationshipFid="{data($x/@fid)}">		
	       		<percentOwnership>{$percentOwnership}</percentOwnership> 
			<lastValidatedDate accuracy="{data($x/validationDate/@accuracy)}">{$lastValidatedDate}</lastValidatedDate> 
			<displaySource sourceProvider="{data($sourceProvider)}" extendedSource="{data($extendedSource)}">{$displaySource}</displaySource>
		</relationship>	
	      </entity>	
	else ()

return <entities>
		{$directOwnersInfo}
		<entity>
	       	<entityInfo entityType= "freeText" legalEntityFid="{data($fid)}">
			{$freeTextInOwnership}
		</entityInfo>
		</entity>
	</entities>
};