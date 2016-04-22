xquery version "1.0-ml";
module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc";

declare function getLegalEntityDoc($fid as xs:string)
{
let $legalEntityDoc := cts:search(/legalEntity,
                      cts:and-query((
                      cts:collection-query(("current")),
                      cts:collection-query(("legalEntity")),
   		      cts:collection-query("source-fdb"), 	
		      cts:element-attribute-value-query(xs:QName("legalEntity"), xs:QName("fid"), $fid))))                                                
return $legalEntityDoc
};



