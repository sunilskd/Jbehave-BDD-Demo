xquery version "1.0-ml";
module namespace qa-kyc-ubo-getRelationshipDocs = "qa-kyc-ubo-getRelationshipDocs";
import module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc" at "qa-kyc-ubo-getLegalEntityDoc.xqy";

declare function getRelationships($fid as xs:string, $searchedEntityPartyType as xs:string, $relationshipType as xs:string)
{
let $legalEntity := qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDoc($fid)
let $relationshipDocs := cts:search(/relationship,
                      cts:and-query((
                      cts:collection-query(("current")),
                      cts:collection-query(("relationship")),
                      cts:collection-query("source-fdb"), 
                      cts:element-value-query(xs:QName("status"), "active"),  
                      cts:element-query(xs:QName("relationshipType"), $relationshipType),
                      cts:element-query(xs:QName("party"), 
                      cts:and-query((
                      cts:element-query(xs:QName("partyType"), $searchedEntityPartyType),
                      cts:element-query(xs:QName("entityType"), "institution"),
                      cts:path-range-query("/relationship/parties/party/entityReference/link/@href", "=", $legalEntity/@resource, "collation=http://marklogic.com/collation/")
                      ))))))
                      
return $relationshipDocs
};