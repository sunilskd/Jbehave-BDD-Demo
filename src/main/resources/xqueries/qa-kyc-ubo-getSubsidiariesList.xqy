xquery version "1.0-ml";
import module namespace qa-kyc-ubo-getEntityList = "qa-kyc-ubo-getEntityList" at "qa-kyc-ubo-getEntityList.xqy";

let $fid := xs:string(xdmp:get-request-field("fid"))
let $subsidiariesList := qa-kyc-ubo-getEntityList:getEntityList($fid, "subsidiaries")
return $subsidiariesList