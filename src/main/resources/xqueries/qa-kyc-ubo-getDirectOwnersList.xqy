xquery version "1.0-ml";
import module namespace qa-kyc-ubo-getEntityList = "qa-kyc-ubo-getEntityList" at "qa-kyc-ubo-getEntityList.xqy";
import module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc" at "qa-kyc-ubo-getLegalEntityDoc.xqy";

let $pFid := xs:string(xdmp:get-request-field("fid"))
let $percentageFilter := xs:string(xdmp:get-request-field("percentage"))
let $pName := xs:string(xdmp:get-request-field("name"))
let $pUserType := xs:string(xdmp:get-request-field("userType"))

let $fid := if(empty($pFid))
	    then qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDocByName($pName)/@fid
	    else $pFid

let $directOwnersList := qa-kyc-ubo-getEntityList:getEntityList($fid, "direct owners")

let $eDirectOwnersList := for $results in $directOwnersList/entity
				return if($pUserType="kyc")
	                      	then $results[entityInfo[@entityType="legalEntity" or @entityType="freeText"]]
        		              else if ($pUserType="ubo")
                        		    then $results[entityInfo[@entityType="legalEntity" or @entityType="nonEntityNonPerson" or @entityType="person"]]
	                      	else()

let $directOwnersFilteredList:= for $results in $eDirectOwnersList
				return if($percentageFilter ne "all")
					then if(fn:exists($results/relationship/percentOwnership))							
					        then if (xs:double($results/relationship/percentOwnership/text()) >= xs:double($percentageFilter))
					             then $results
					             else ()
					else $results
					        else $results
					
let $orderdDirectOwnersList := for $x in $directOwnersFilteredList
order by xs:double($x/relationship/percentOwnership/text()) descending, $x/entityInfo/entitySortKey ascending
return $x

return <directOwnersList>{$orderdDirectOwnersList}</directOwnersList>