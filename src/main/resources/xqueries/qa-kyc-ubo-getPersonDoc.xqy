xquery version "1.0-ml";
module namespace qa-kyc-ubo-getPersonDoc = "qa-kyc-ubo-getPersonDoc";

declare function getPersonDoc($resource as xs:string)
{
let $personDoc := cts:search(/person,
                      cts:and-query((
                      cts:collection-query(("current")),
                      cts:collection-query(("person")),
   		      cts:collection-query("source-fdb"), 	
		      cts:element-attribute-value-query(xs:QName("person"), xs:QName("resource"), $resource))))                                                
return $personDoc
};



