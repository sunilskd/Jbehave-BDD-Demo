xquery version "1.0-ml";
module namespace qa-kyc-ubo-getRoutingCodeDocs = "qa-kyc-ubo-getRoutingCodeDocs";

declare function qa-kyc-ubo-getRoutingCodeDocs:getRoutingCodeDocs($assignedInstitution as xs:string)
{
let $routingCodes := cts:search(/routingCode,
			        cts:and-query((
			        cts:collection-query(("current")),
			        cts:collection-query(("routingCode")),
			        cts:collection-query("source-fdb"), 
		                cts:path-range-query("/routingCode/codeType", "=", "SWIFT BIC", "collation=http://marklogic.com/collation//S1"),
		                cts:element-query(xs:QName("assignedInstitution"), cts:element-attribute-value-query(xs:QName("link"), xs:QName("href"), $assignedInstitution)
              ))))

return $routingCodes
};