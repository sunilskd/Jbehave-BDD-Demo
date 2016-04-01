xquery version "1.0-ml";
module namespace qa-kyc-ubo-getLookupDoc = "qa-kyc-ubo-getLookupDoc";
declare function getLookupDoc($lookupName as xs:string)
{
let $lookup := cts:search(/lookup,
			        cts:and-query((
			        cts:collection-query(("current")),
			        cts:collection-query(("lookup")),
				(:cts:collection-query("source-fdb"),:)
		                cts:element-attribute-value-query(xs:QName("lookup"), xs:QName("fid"), $lookupName))))

return $lookup
};