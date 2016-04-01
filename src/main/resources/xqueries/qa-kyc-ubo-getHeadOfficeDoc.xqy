xquery version "1.0-ml";
module namespace qa-kyc-ubo-getHeadOfficeDoc = "qa-kyc-ubo-getHeadOfficeDoc";
import module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc" at "qa-kyc-ubo-getLegalEntityDoc.xqy";


declare function getHeadOfficeDoc($institutionName as xs:string)
{
let $legalEntity := qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDoc($institutionName)
let $headOfficeDoc := cts:search(/office,
                      cts:and-query((
                      cts:collection-query(("current")),
                      cts:collection-query(("office")),
		      cts:collection-query("source-fdb"),
                      cts:path-range-query("/office/@source", "=", "fdb", "collation=http://marklogic.com/collation/"),
                      cts:path-range-query("/office/summary/types/type", "=", "Head Office", "collation=http://marklogic.com/collation//S1"),
                      cts:path-range-query("/office/summary/institution/link/@href", "=", $legalEntity/@resource, "collation=http://marklogic.com/collation/")
                       )))

return $headOfficeDoc
};



