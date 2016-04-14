xquery version "1.0-ml";
module namespace qa-kyc-ubo-getDateAsPerAccuracy = "qa-kyc-ubo-getDateAsPerAccuracy";
declare function month-abbrev-en ( $date as xs:anyAtomicType? )  as xs:string? 
{
    ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')
    [month-from-date(xs:date($date))]
} ;

declare function day-abbrev-en ( $date as xs:anyAtomicType? )  as xs:string? 
{
    ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31')
    [day-from-date(xs:date($date))]
} ;

declare function getDateAsPerAccuracy ( $date as node() ) 
{
    switch($date/@accuracy/string())
        case "day" return fn:concat(day-abbrev-en(xs:date($date)), ' ', month-abbrev-en(xs:date($date)), ' ', year-from-date(xs:date($date)))
        case "month" return fn:concat(month-abbrev-en(xs:date($date)),	 ' ', year-from-date(xs:date($date)))
        case "year"  return year-from-date(xs:date($date))
        default return "date not valid"
};

