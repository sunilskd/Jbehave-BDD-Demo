let $area := xs:string(xdmp:get-request-field("name"))
let $source := xs:string(xdmp:get-request-field("source"))

let $area := /area[@source = $source][summary[type="area"]/names/name[type = "Full Name"]/value = $area]
let $city := /city[@source = $source][within/place/link/@href=$area/@resource]
let $cityList := for $x in $city order by $x/summary/names/name[type="Full Name"]/value return <city>{$x/summary/names/name[type="Full Name"]/value/text()}</city>
return <cities>{$cityList}</cities>