xquery version "1.0-ml";
import module namespace qa-kyc-ubo-getEntityList = "qa-kyc-ubo-getEntityList" at "qa-kyc-ubo-getEntityList.xqy";
import module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc" at "qa-kyc-ubo-getLegalEntityDoc.xqy";

let $pFid := xs:string(xdmp:get-request-field("fid"))
let $percentageFilter := xs:string(xdmp:get-request-field("percentage"))
let $pName := xs:string(xdmp:get-request-field("name"))

let $fid := if(empty($pFid))
	    then qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDocByName($pName)/@fid
	    else $pFid

let $subsidiariesList := qa-kyc-ubo-getEntityList:getEntityList($fid, "subsidiaries")

let $subsWithNullOwnership := for $results in $subsidiariesList/entity[entityInfo[@entityType="legalEntity"]]
				 return if($results/relationship/percentOwnership eq '')
				        then $results
				        else ()

let $subsidiariesFilteredList := for $results in $subsidiariesList/entity[entityInfo[@entityType="legalEntity"]]
				 return if($percentageFilter ne "all")
				        then if (xs:double($results/relationship/percentOwnership/text()) >= xs:double($percentageFilter))
				             then $results
				             else ()
				        else $results

let $orderdSubsidiariesList := for $x in $subsidiariesFilteredList
order by xs:double($x/relationship/percentOwnership/text()) descending, $x/entityInfo/entitySortKey ascending
return $x

return <entitiesInfo>{$orderdSubsidiariesList}{$subsWithNullOwnership}</entitiesInfo>
