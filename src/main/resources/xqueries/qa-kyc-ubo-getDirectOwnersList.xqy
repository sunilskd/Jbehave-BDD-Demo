xquery version "1.0-ml";
import module namespace qa-kyc-ubo-getEntityList = "qa-kyc-ubo-getEntityList" at "qa-kyc-ubo-getEntityList.xqy";

let $fid := xs:string(xdmp:get-request-field("fid"))
let $percentageFilter := xs:string(xdmp:get-request-field("percentage"))

let $directOwnersList := qa-kyc-ubo-getEntityList:getEntityList($fid, "direct owners")

let $directOwnersFilteredList:= for $results in $directOwnersList/entityInfo
				return if($percentageFilter ne "all")
				        then if (xs:double($results/percentOwnership) >= xs:double($percentageFilter))
				             then $results
				             else ()
				        else $results

return <entitiesInfo>{$directOwnersFilteredList}</entitiesInfo>
