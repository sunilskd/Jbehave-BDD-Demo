xquery version "1.0-ml";
import module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc" at "qa-kyc-ubo-getLegalEntityDoc.xqy";
import module namespace qa-kyc-ubo-getLookupDoc  = "qa-kyc-ubo-getLookupDoc" at "qa-kyc-ubo-getLookupDoc.xqy";
import module namespace qa-kyc-ubo-getRoutingCodeDocs = "qa-kyc-ubo-getRoutingCodeDocs" at "qa-kyc-ubo-getRoutingCodeDocs.xqy";
import module namespace qa-kyc-ubo-getCountryDoc = "qa-kyc-ubo-getCountryDoc" at "qa-kyc-ubo-getCountryDoc.xqy";
import module namespace qa-kyc-ubo-getCityDoc = "qa-kyc-ubo-getCityDoc" at "qa-kyc-ubo-getCityDoc.xqy";
import module namespace qa-kyc-ubo-getAreaDoc = "qa-kyc-ubo-getAreaDoc" at "qa-kyc-ubo-getAreaDoc.xqy";


let $fid := xs:string(xdmp:get-request-field("fid"))

let $legalEntity := qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDoc($fid)
let $legalTitle := $legalEntity//summary/names/name[type="Legal Title"]/value/text()
let $bankersAlmanacID := $legalEntity/@fid/string()
let $GIIN := $legalEntity/summary/identifiers/identifier[type="Global Intermediary Identification Number"]/value/text()
let $FATCAStatus := $legalEntity/summary/fatcaStatus/text()

let $addnLookup := qa-kyc-ubo-getLookupDoc:getLookupDoc("THIRD_PARTY_IDENTIFIER_LEGAL_ENTITY")
let $legalEntityIdentifierType := $legalEntity/summary/identifiers/identifier/type/text()

let $LEIs:= 
for $x in $legalEntityIdentifierType
let $LEIFlag := $addnLookup/lookupBody/entry[@id=$x][@leiFlag="true"]
let $legalEntityIdentifierValue := $legalEntity/summary/identifiers/identifier[type = $x]/value/text()
order by $x 
return if ($LEIFlag)
       then <LEI>             
             <LEIIssuer>{$x}</LEIIssuer>
             <LEIValue>{$legalEntityIdentifierValue}</LEIValue>
            </LEI>
       else()            

let $headOffice := cts:search(/office,
			cts:and-query((
			cts:collection-query(("current")),
			cts:collection-query(("office")),
			cts:collection-query("source-fdb"), 
		        cts:element-attribute-value-query(xs:QName("office"), xs:QName("resource"), $legalEntity/locations/headOffice/link/@href))))


let $primaryPhysicalAddress := $headOffice/locations/location[@primary = "true"]/address[type = "physical"]
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
                    then $subArea/summary/names/name[type="Full Name"]/value/text()
                    else ()

let $area := qa-kyc-ubo-getAreaDoc:getAreaDoc($primaryPhysicalAddress/area/link/@href)

let $areaName := if ($area/summary/useInAddress = "true")
                 then $area/summary/names/name[type="Full Name"]/value/text()
                 else ()

let $country := qa-kyc-ubo-getCountryDoc:getCountryDoc($primaryPhysicalAddress/country/link/@href)

let $countryName := if ($country/summary/useInAddress = "true")
                    then $country/summary/names/name[type="Country Name"]/value/text()
                    else ()

let $headOfficeAddress := string-join(($officeAddressLine1,$officeAddressLine2,$officeAddressLine3,$officeAddressLine1,$cityName,$subAreaName,$areaName,$countryName), ", ")

let $swiftBicDocs := qa-kyc-ubo-getRoutingCodeDocs:getRoutingCodeDocs($legalEntity/@resource)

let $orderedSwiftBicsList := 
for $x in $swiftBicDocs
let $swiftBicCode := $x/codeValue/text()
order by fn:string-length($swiftBicCode) ascending, $swiftBicCode ascending
return <swiftBic routingCodeFid="{data($x/@fid)}">{$swiftBicCode}</swiftBic>       

return <entityDetails>
          <header>
            <legalTitle legalEntityFid="{data($legalEntity/@fid)}">{$legalTitle}</legalTitle>
            <bankersAlmanacID>{$bankersAlmanacID}</bankersAlmanacID>
          </header>
          <summary>
	    <addressInfo> 
		<city cityValue="{data($cityName)}" cityFid="{data($city/@fid)}" cityUseInAddress="{data($city/summary/useInAddress)}"></city>
		<area areaValue="{data($areaName)}" areaFid="{data($area/@fid)}" areaUseInAddress="{data($area/summary/useInAddress)}"></area>
		<subArea subAreaValue="{data($subAreaName)}" subAreaFid="{data($subArea/@fid)}" subAreaUseInAddress="{data($subArea/summary/useInAddress)}"></subArea>
		<country countryName="{data($countryName)}" countryFid="{data($country/@fid)}" countryUseInAddress="{data($country/summary/useInAddress)}"></country>
	    </addressInfo>
            <headOfficeAddress officeFid="{data($headOffice/@fid)}">{$headOfficeAddress}</headOfficeAddress>
          </summary>
          <identifiers>
            <GIIN>{$GIIN}</GIIN>
            <FATCAStatus>{$FATCAStatus}</FATCAStatus>
            <LEIs>{$LEIs}</LEIs>
          </identifiers>
          <swiftBics>{$orderedSwiftBicsList}</swiftBics>
       </entityDetails>