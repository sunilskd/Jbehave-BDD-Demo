xquery version "1.0-ml";
import module namespace qa-kyc-ubo-getCountryDoc = "qa-kyc-ubo-getCountryDoc" at "qa-kyc-ubo-getCountryDoc.xqy";
import module namespace qa-kyc-ubo-getCityDoc = "qa-kyc-ubo-getCityDoc" at "qa-kyc-ubo-getCityDoc.xqy";
import module namespace qa-kyc-ubo-getAreaDoc = "qa-kyc-ubo-getAreaDoc" at "qa-kyc-ubo-getAreaDoc.xqy";


let $fid := xs:string(xdmp:get-request-field("fid"))
let $legalEntity  := /legalEntity[@fid=$fid]
let $headOffice := cts:search(/office,
			cts:and-query((
			cts:collection-query(("current")),
			cts:collection-query(("office")),
			cts:collection-query("source-fdb"), 
		  cts:element-attribute-value-query(xs:QName("office"), xs:QName("resource"), $legalEntity/locations/headOffice/link/@href))))
let $primaryPhysicalAddress := $headOffice/locations/location[@primary = "true"]/address[type = "physical" and function = "Registered Office"]
let $officeAddressLine1 := if (fn:exists($primaryPhysicalAddress/streetAddress/addressLine1)) 
                           then $primaryPhysicalAddress/streetAddress/addressLine1/text()
                           else ()                           
let $officeAddressLine2 := if (fn:exists($primaryPhysicalAddress/streetAddress/addressLine2)) 
                           then $primaryPhysicalAddress/streetAddress/addressLine2/text()
                           else ()                           
let $officeAddressLine3 := if (fn:exists($primaryPhysicalAddress/streetAddress/addressLine3)) 
                           then $primaryPhysicalAddress/streetAddress/addressLine3/text()
                           else ()                           
let $officeAddressLine4 := if (fn:exists($primaryPhysicalAddress/streetAddress/addressLine4)) 
                           then $primaryPhysicalAddress/streetAddress/addressLine4/text()
                           else ()
let $city := qa-kyc-ubo-getCityDoc:getCityDoc($primaryPhysicalAddress/city/link/@href)
let $cityName := if ($city/summary/useInAddress = "true") 
                 then $city/summary[useInAddress="true"]/names/name[type="Full Name"]/value/text()
                 else()

let $subArea := qa-kyc-ubo-getAreaDoc:getAreaDoc($primaryPhysicalAddress/subarea/link/@href)
let $subAreaName := if ($subArea/summary/useInAddress = "true") 
                    then $subArea/summary/names/name[type='Full Name']/value/text()
                    else()
let $area := qa-kyc-ubo-getAreaDoc:getAreaDoc($primaryPhysicalAddress/area/link/@href)
let $areaName := if($area/summary/useInAddress = "true")
                 then $area/summary/names/name[type='Full Name']/value/text()
                 else()
let $country := qa-kyc-ubo-getCountryDoc:getCountryDoc($primaryPhysicalAddress/country/link/@href)
let $countryName := $country/summary/names/name[type='Country Name']/value/text()

let $registeredOffice := string-join(($officeAddressLine1,$officeAddressLine2,$officeAddressLine3,$officeAddressLine4,$cityName,$subAreaName,$areaName,$countryName),",")
return <registeredOffice> {$registeredOffice}</registeredOffice>