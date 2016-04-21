xquery version "1.0-ml";
module namespace qa-kyc-ubo-getAreaDoc = "qa-kyc-ubo-getAreaDoc";

declare function getAreaDoc($resource as xs:string)
{
let $areaDoc := cts:search(/area,
                      cts:and-query((
                      cts:collection-query(("current")),
                      cts:collection-query(("area")),
   		      cts:collection-query("source-fdb"), 	
		      cts:element-attribute-value-query(xs:QName("area"), xs:QName("resource"), $resource))))                                                
return $areaDoc
};



