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

declare function getLegalEntityDocByName($name as xs:string)
{
let $legalEntityDoc := cts:search(/legalEntity,
                      	cts:and-query((
                      	cts:collection-query(("current")),
                      	cts:collection-query(("legalEntity")),
			cts:collection-query("source-fdb"), 		                  
                      	cts:element-query(xs:QName("name"),
                      	cts:and-query((
                      		cts:element-query(xs:QName("type"),"Legal Title"),
                      		cts:element-value-query(xs:QName("value"), $name)
	                      ))))))
                      
return $legalEntityDoc
};

declare function getLegalEntityDocByResource($resource as xs:string)
{
let $legalEntityDoc := cts:search(/legalEntity,
			cts:and-query((
			cts:collection-query(("current")),
			cts:collection-query(("legalEntity")),
			cts:collection-query("source-fdb"), 
			cts:element-attribute-value-query(xs:QName("legalEntity"), xs:QName("resource"), $resource)))) 
                      
return $legalEntityDoc
};





