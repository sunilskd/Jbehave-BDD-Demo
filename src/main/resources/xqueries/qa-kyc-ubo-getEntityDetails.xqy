xquery version "1.0-ml";
import module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc" at "qa-kyc-ubo-getLegalEntityDoc.xqy";
import module namespace qa-kyc-ubo-getLookupDoc  = "qa-kyc-ubo-getLookupDoc" at "qa-kyc-ubo-getLookupDoc.xqy";
import module namespace qa-kyc-ubo-getRoutingCodeDocs = "qa-kyc-ubo-getRoutingCodeDocs" at "qa-kyc-ubo-getRoutingCodeDocs.xqy";
import module namespace qa-kyc-ubo-getCountryDoc = "qa-kyc-ubo-getCountryDoc" at "qa-kyc-ubo-getCountryDoc.xqy";
import module namespace qa-kyc-ubo-getCityDoc = "qa-kyc-ubo-getCityDoc" at "qa-kyc-ubo-getCityDoc.xqy";
import module namespace qa-kyc-ubo-getAreaDoc = "qa-kyc-ubo-getAreaDoc" at "qa-kyc-ubo-getAreaDoc.xqy";
import module namespace qa-kyc-ubo-getRelationshipDocs = "qa-kyc-ubo-getRelationshipDocs" at "qa-kyc-ubo-getRelationshipDocs.xqy";
import module namespace qa-kyc-ubo-getHeadOfficeDoc = "qa-kyc-ubo-getHeadOfficeDoc" at "qa-kyc-ubo-getHeadOfficeDoc.xqy";
import module namespace qa-kyc-ubo-getVirtualPresenceDoc = "qa-kyc-ubo-getVirtualPresenceDoc" at "qa-kyc-ubo-getVirtualPresenceDoc.xqy";

let $pFid := xs:string(xdmp:get-request-field("fid"))
let $pName := xs:string(xdmp:get-request-field("name"))

let $legalEntity := if(empty($pFid))
		    then qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDocByName($pName)
		    else qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDoc($pFid)

let $virtualPresence := if(empty($pFid))
		    	then qa-kyc-ubo-getVirtualPresenceDoc:getVirtualPresenceDocByName($pName)
	        	else qa-kyc-ubo-getVirtualPresenceDoc:getVirtualPresenceDocByFid($pFid)

let $stockExchangeRelationship := if(empty($pFid))
				 	then qa-kyc-ubo-getRelationshipDocs:getRelationshipsByName($pName, "exchange member", "stock exchange")
					else qa-kyc-ubo-getRelationshipDocs:getRelationships($pFid, "exchange member", "stock exchange")

let $regulationRelationship := if(empty($pFid))
				 	then qa-kyc-ubo-getRelationshipDocs:getRelationshipsByName($pName, "regulated", "regulation")
					else qa-kyc-ubo-getRelationshipDocs:getRelationships($pFid, "regulated", "regulation")

let $legalTitle := $legalEntity//summary/names/name[type="Legal Title"]/value/text()
let $bankersAlmanacID := $legalEntity/@fid/string()
let $GIIN := $legalEntity/summary/identifiers/identifier[type="Global Intermediary Identification Number"]/value/text()
let $FATCAStatus := $legalEntity/summary/fatcaStatus/text()

let $addnLookup := qa-kyc-ubo-getLookupDoc:getLookupDoc("THIRD_PARTY_IDENTIFIER_LEGAL_ENTITY")
let $legalEntityIdentifierType := $legalEntity/summary/identifiers/identifier/type/text()

let $LEIs:= 
for $x in $legalEntityIdentifierType
let $legalEntityIdentifierTypeIgnoringThe := if(starts-with($x,"The"))
						then substring-after($x,"The ")
						else $x

let $LEIFlag := $addnLookup/lookupBody/entry[@id=$x][@leiFlag="true"]
let $legalEntityIdentifierValue := $legalEntity/summary/identifiers/identifier[type = $x]/value/text()
order by $legalEntityIdentifierTypeIgnoringThe ascending
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

let $primaryPhysicalAddress := $headOffice/locations/location/address[type = "physical" and function="Head Office"]
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
let $headOfficeAddress := string-join(($officeAddressLine1,$officeAddressLine2,$officeAddressLine3,$officeAddressLine4,$cityName,$subAreaName,$areaName,$countryName), ", ")


let $stockExchangeInfo := for $x in $stockExchangeRelationship
let $stockExchangeDoc := qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDocByResource($x/parties/party[partyType = "stock exchange"]/entityReference/link/@href)
let $stockExchangeLegalTitle := $stockExchangeDoc/summary/names/name[type="Legal Title"]/value/text()

let $stockExchangeAbbrName := if(fn:exists($stockExchangeDoc/summary/names/name[type="Abbreviated Name"]/value))
                              then <abbr> ({$stockExchangeDoc/summary/names/name[type="Abbreviated Name"]/value/text()})</abbr>
                              else ()
let $isStockExchangePrimary := $x/details/stockExchange/primary/text()
let $displayPrimary := if($isStockExchangePrimary eq "true")
                       then " PRIMARY"
                       else ()
order by $isStockExchangePrimary descending, $stockExchangeLegalTitle ascending
return if($stockExchangeDoc/summary/status="active") 
	then <stockExchange legalEntityFid="{data($stockExchangeDoc/@fid)}" relationshipFid="{data($x/@fid)}">{$stockExchangeLegalTitle}{$stockExchangeAbbrName/text()}{$displayPrimary}</stockExchange>
	else()

let $stockSymbolInfo := for $x in $stockExchangeRelationship
let $stockExchangeDoc := qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDocByResource($x/parties/party[partyType = "stock exchange"]/entityReference/link/@href)
let $stockExchangeAbbrName := $stockExchangeDoc/summary/names/name[type="Abbreviated Name"]/value/text()
let $tickerSymbol := $x/details/stockExchange/tickerSymbol/text()		
let $stockSymbol := string-join(($stockExchangeAbbrName,$tickerSymbol), ": ")	
let $isStockExchangePrimary := $x/details/stockExchange/primary/text()	
order by $isStockExchangePrimary descending, $stockExchangeAbbrName ascending
return if($stockExchangeDoc/summary/status="active") 
	then if(fn:exists($stockExchangeAbbrName) or fn:exists($tickerSymbol)) 
		then <stockSymbol relationshipFid="{data($x/@fid)}" stockExchangeAbbr="{data($stockExchangeAbbrName)}" tickerSymbol="{data($tickerSymbol)}">{$stockSymbol}</stockSymbol>           	
		else()
	else()

let $regulatorName := for $x in $regulationRelationship
let $regulatorDoc := qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDocByResource($x/parties/party[partyType = "regulator"]/entityReference/link/@href)
order by $regulatorDoc/summary/names/legalEntitySortKey
return <regulator relationshipFid="{data($x/@fid)}" legalEntityFid="{data($regulatorDoc/@fid)}">{$regulatorDoc/summary/names/name[type="Legal Title"]/value/text()}</regulator>


let $swiftBicDocs := qa-kyc-ubo-getRoutingCodeDocs:getRoutingCodeDocs($legalEntity/@resource)
let $orderedSwiftBicsList := 
for $x in $swiftBicDocs
let $swiftBicCode := $x/codeValue/text()
order by fn:string-length($swiftBicCode) ascending, $swiftBicCode ascending
return <swiftBic routingCodeFid="{data($x/@fid)}">{$swiftBicCode}</swiftBic>       


let $legalEntity  := /legalEntity[@fid=$pFid]
let $registeredOffice := cts:search(/office,
			cts:and-query((
			cts:collection-query(("current")),
			cts:collection-query(("office")),
			cts:collection-query("source-fdb"), 
	      	        cts:element-attribute-value-query(xs:QName("office"), xs:QName("resource"), $legalEntity/locations/headOffice/link/@href))))

let $primaryPhysicalAddress := $registeredOffice/locations/location[@primary = "true"]/address[type = "physical" and function = "Registered Office"]
let $registeredOfficeAddressLine1 := if (fn:exists($primaryPhysicalAddress/streetAddress/addressLine1)) 
                           then $primaryPhysicalAddress/streetAddress/addressLine1/text()
                           else ()                           
let $registeredOfficeAddressLine2 := if (fn:exists($primaryPhysicalAddress/streetAddress/addressLine2)) 
                           then $primaryPhysicalAddress/streetAddress/addressLine2/text()
                           else ()                           
let $registeredOfficeAddressLine3 := if (fn:exists($primaryPhysicalAddress/streetAddress/addressLine3)) 
                           then $primaryPhysicalAddress/streetAddress/addressLine3/text()
                           else ()                           
let $registeredOfficeAddressLine4 := if (fn:exists($primaryPhysicalAddress/streetAddress/addressLine4)) 
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

let $registeredOffice := string-join(($registeredOfficeAddressLine1, $registeredOfficeAddressLine2, $registeredOfficeAddressLine3, $registeredOfficeAddressLine4, $cityName, $subAreaName, $areaName, $countryName),", ")

return <entityDetails>
          <header>
            <legalTitle legalEntityFid="{data($legalEntity/@fid)}">{$legalTitle}</legalTitle>
            <bankersAlmanacID>{$bankersAlmanacID}</bankersAlmanacID>
          </header>
          <summary>
	    <addressInfo officeFid="{data($headOffice/@fid)}"> 
		<addressLine1>{$officeAddressLine1}</addressLine1>
		<addressLine2>{$officeAddressLine2}</addressLine2>
		<addressLine3>{$officeAddressLine3}</addressLine3>
		<addressLine4>{$officeAddressLine4}</addressLine4>
		<city cityValue="{data($cityName)}" cityFid="{data($city/@fid)}" cityUseInAddress="{data($city/summary/useInAddress)}"></city>
		<area areaValue="{data($areaName)}" areaFid="{data($area/@fid)}" areaUseInAddress="{data($area/summary/useInAddress)}"></area>
		<subArea subAreaValue="{data($subAreaName)}" subAreaFid="{data($subArea/@fid)}" subAreaUseInAddress="{data($subArea/summary/useInAddress)}"></subArea>
		<country countryName="{data($countryName)}" countryFid="{data($country/@fid)}" countryUseInAddress="{data($country/summary/useInAddress)}"></country>		
	    </addressInfo>
            <headOfficeAddress>{$headOfficeAddress}</headOfficeAddress>
            <registeredOffice>{$registeredOffice}</registeredOffice>
	    <stockExchanges>{$stockExchangeInfo}</stockExchanges>
	    <regulators>{$regulatorName}</regulators>
          </summary>
          <identifiers legalEntityFid="{data($legalEntity/@fid)}">
            <GIIN>{$GIIN}</GIIN>
            <FATCAStatus>{$FATCAStatus}</FATCAStatus>
            <LEIs>{$LEIs}</LEIs>
	    <stockSymbols>{$stockSymbolInfo}</stockSymbols>
          </identifiers>
	  <website virtualPresenceFid="{data($virtualPresence[1]/@fid)}">{$virtualPresence[1]/locations/location/telecom[type="website"]/value/text()}</website>
          <swiftBics>{$orderedSwiftBicsList}</swiftBics>          
       </entityDetails>