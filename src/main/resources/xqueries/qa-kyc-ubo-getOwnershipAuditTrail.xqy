import module namespace qa-kyc-ubo-getDateAsPerAccuracy = "qa-kyc-ubo-getDateAsPerAccuracy" at "qa-kyc-ubo-getDateAsPerAccuracy.xqy";
import module namespace qa-kyc-ubo-getLegalEntityDoc = "qa-kyc-ubo-getLegalEntityDoc" at "qa-kyc-ubo-getLegalEntityDoc.xqy";

let $fid := xs:string(xdmp:get-request-field("fid"))
let $legalEntityDoc := qa-kyc-ubo-getLegalEntityDoc:getLegalEntityDoc($fid)
let $auditInfo := <auditInfo>{concat('Audit information for ',$legalEntityDoc/summary/names/name[type="Legal Title"]/value)}</auditInfo>
let $reviews := for $x in $legalEntityDoc/ownership/reviews/review/actions/action
let $actionType := $x/type
let $actionDate := $x/date
return <review>{$actionType}{$actionDate}</review>

let $supplieDate := (for $x in $reviews[type='Supplied']/date order by $x descending return $x)[1]
let $verifieDate := (for $x in $reviews[type='Verified']/date order by $x descending return $x)[1]

let $latestReview := if(exists($supplieDate/text()))
                         then if (exists($verifieDate/text()))
                              then (if (xs:date($supplieDate/text()) gt xs:date($verifieDate/text()))
                                   then <review><action type="Supplied">Last updated on</action>{$supplieDate}</review>
                                   else <review><action type="Verified">Last updated on</action>{$verifieDate}</review>
                                   )
                              else <review><action type="Supplied">Last updated on</action>{$supplieDate}</review>
                         else <review><action type="Verified">Last updated on</action>{$verifieDate}</review>
                         
let $otherReviewDates := for $x in $reviews where $x/type = 'Attempt' or $x/type = 'Denied' return $x
let $otherReviews := for $x in $otherReviewDates
let $otherAttempts := if(xs:date($x/date/text()) gt xs:date($latestReview/date/text()))
                      then <review><action type="{data($x/type)}">Update attempted on</action>{$x/date}</review>
                      else ()                      
return $otherAttempts

let $completeReviews := <reviews>{$otherReviews}{$latestReview}</reviews>

let $orderdReviews := for $x in $completeReviews/review
let $action := $x/action
let $date := <date accuracy="{data($x/date/@accuracy)}">{qa-kyc-ubo-getDateAsPerAccuracy:getDateAsPerAccuracy($x/date)}</date>
order by $x/date descending
return <review>{$action}{$date}</review>

return <reviews>{$auditInfo}{$orderdReviews}</reviews>