xquery version "1.0-ml";
import module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc" at "qa-kyc-ubo-getLegalEntityDoc.xqy";
import module namespace qa-kyc-ubo-getLookupDoc  = "qa-kyc-ubo-getLookupDoc" at "qa-kyc-ubo-getLookupDoc.xqy";
import module namespace qa-kyc-ubo-getRoutingCodeDocs = "qa-kyc-ubo-getRoutingCodeDocs" at "qa-kyc-ubo-getRoutingCodeDocs.xqy";

let $fid := xs:string(xdmp:get-request-field("fid"))

let $legalEntity := qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDoc($fid)
let $legalTitle := $legalEntity//summary/names/name[type="Legal Title"]/value/text()
let $bankersAlmanacID := $legalEntity/@fid/string()
let $GIIN := $legalEntity/summary/identifiers/identifier[type="Global Intermediary Identification Number"]/value/text()
let $FATCAStatus := $legalEntity/summary/fatcaStatus/text()

let $addnLookup := qa-kyc-ubo-getLookupDoc:getLookupDoc("LEGAL_ENTITY_THIRD_PARTY_IDENTIFIER")
let $legalEntityIdentifierType := $legalEntity/summary/identifiers/identifier/type/text()

let $LEIs:= 
for $x in $legalEntityIdentifierType
let $LEIFlag := $addnLookup/lookupBody/entry[@id=$x]/@leiFlag
let $legalEntityIdentifierValue := $legalEntity/summary/identifiers/identifier[type = $x]/value/text()
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
                           
let $city := cts:search(/city,
			        cts:and-query((
			        cts:collection-query(("current")),
			        cts:collection-query(("city")),
			        cts:collection-query("source-fdb"), 
              cts:element-attribute-value-query(xs:QName("city"), xs:QName("resource"), $primaryPhysicalAddress/city/link/@href))))

let $cityName := if ($city/summary/useInAddress) 
                 then $city/summary[useInAddress="true"]/names/name[type="Full Name"]/value/text()
                 else()

let $subArea := cts:search(/area,
			        cts:and-query((
			        cts:collection-query(("current")),
			        cts:collection-query(("area")),
			        cts:collection-query("source-fdb"), 
              cts:element-attribute-value-query(xs:QName("area"), xs:QName("resource"), $primaryPhysicalAddress/subArea/link/@href))))

let $subAreaName := if ($subArea/summary/useInAddress) 
                    then $subArea/summary/names/name[type="Full Name"]/value/text()
                    else ()

let $area := cts:search(/area,
			        cts:and-query((
			        cts:collection-query(("current")),
			        cts:collection-query(("area")),
			        cts:collection-query("source-fdb"), 
              cts:element-attribute-value-query(xs:QName("area"), xs:QName("resource"), $primaryPhysicalAddress/area/link/@href))))

let $areaName := if ($area/summary/useInAddress)
                 then $area/summary/names/name[type="Full Name"]/value/text()
                 else ()

let $country := cts:search(/country,
			        cts:and-query((
			        cts:collection-query(("current")),
			        cts:collection-query(("country")),
			        cts:collection-query("source-fdb"), 
              cts:element-attribute-value-query(xs:QName("country"), xs:QName("resource"), $primaryPhysicalAddress/country/link/@href))))

let $countryName := if ($country/summary/useInAddress)
                    then $country/summary/names/name[type="Country Name"]/value/text()
                    else ()

let $headOfficeAddress := string-join(($officeAddressLine1,$officeAddressLine2,$officeAddressLine3,$officeAddressLine1,$cityName,$subAreaName,$areaName,$countryName), ", ")

let $swiftBicDocs := qa-kyc-ubo-getRoutingCodeDocs:getRoutingCodeDocs($legalEntity/@resource)

let $orderedSwiftBicsList := 
for $x in $swiftBicDocs
let $swiftBicCode := $x/codeValue/text()
order by fn:string-length($swiftBicCode) ascending, $swiftBicCode ascending
return <swiftBic>{$swiftBicCode}</swiftBic>       

return <entityDetails>
          <header>
            <legalTitle>{$legalTitle}</legalTitle>
            <bankersAlmanacID>{$bankersAlmanacID}</bankersAlmanacID>
          </header>
          <summary>
            <headOfficeAddress>{$headOfficeAddress}</headOfficeAddress>
          </summary>
          <identifiers>
            <GIIN>{$GIIN}</GIIN>
            <FATCAStatus>{$FATCAStatus}</FATCAStatus>
            <LEIs>{$LEIs}</LEIs>
          </identifiers>
          <swiftBics>{$orderedSwiftBicsList}</swiftBics>
       </entityDetails>