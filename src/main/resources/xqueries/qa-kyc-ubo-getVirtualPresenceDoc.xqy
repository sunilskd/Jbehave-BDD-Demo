xquery version "1.0-ml";
module namespace qa-kyc-ubo-getVirtualPresenceDoc = "qa-kyc-ubo-getVirtualPresenceDoc";
import module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc" at "qa-kyc-ubo-getLegalEntityDoc.xqy";

declare function getVirtualPresenceDocByFid($fid as xs:string)
{
let $legalEntity := qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDoc($fid)
let $virtualPresenceDoc := cts:search(/virtualPresence,
                      	    cts:and-query((
                      	    cts:collection-query(("current")),
                      	    cts:collection-query(("virtualPresence")),
			                      cts:collection-query("source-fdb"),
                            cts:path-range-query("/virtualPresence/summary/institution/link/@href", "=", $legalEntity/@resource)))
                            )                      	

return $virtualPresenceDoc
};

declare function getVirtualPresenceDocByName($name  as xs:string)
{
let $legalEntity := qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDocByName($name)
let $virtualPresenceDoc := cts:search(/virtualPresence,
                      	    cts:and-query((
                      	    cts:collection-query(("current")),
                      	    cts:collection-query(("virtualPresence")),
			                      cts:collection-query("source-fdb"),
                            cts:path-range-query("/virtualPresence/summary/institution/link/@href", "=", $legalEntity/@resource)))
                            )                      	

return $virtualPresenceDoc
};