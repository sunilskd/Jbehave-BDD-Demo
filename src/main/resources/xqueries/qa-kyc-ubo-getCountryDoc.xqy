xquery version "1.0-ml";
module namespace qa-kyc-ubo-getCountryDoc = "qa-kyc-ubo-getCountryDoc";

declare function getCountryDoc($resource as xs:string)
{
let $countryDoc := cts:search(/country,
                      cts:and-query((
                      cts:collection-query(("current")),
                      cts:collection-query(("country")),
   		      cts:collection-query("source-fdb"), 	
		      cts:element-attribute-value-query(xs:QName("country"), xs:QName("resource"), $resource))))                                                
return $countryDoc
};



