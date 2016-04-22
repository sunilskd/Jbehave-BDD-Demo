xquery version "1.0-ml";
module namespace qa-kyc-ubo-getCityDoc = "qa-kyc-ubo-getCityDoc";

declare function getCityDoc($resource as xs:string)
{
let $cityDoc := cts:search(/city,
                      cts:and-query((
                      cts:collection-query(("current")),
                      cts:collection-query(("city")),
   		      cts:collection-query("source-fdb"), 	
		      cts:element-attribute-value-query(xs:QName("city"), xs:QName("resource"), $resource))))                                                
return $cityDoc
};



