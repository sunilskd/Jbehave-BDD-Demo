import module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc" at "qa-kyc-ubo-getLegalEntityDoc.xqy";

let $name := xdmp:get-request-field("name")
let $legalEntity := qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDoc($name)
return $legalEntity