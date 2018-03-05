Class demo.Loan.WebOperations Extends Ens.BusinessOperation
{

/// 2 modes: Queue, InProc
Parameter INVOCATION = "Queue";

Parameter USEWEBSERVICES = "no";

XData MessageMap
{
<MapItems>
<MapItem MessageType="demo.Loan.Msg.PrimeRateRequest">
<Method>GetPrimeRate</Method>
</MapItem>
<MapItem MessageType="demo.Loan.Msg.CreditRatingRequest">
<Method>GetCreditRating</Method>
</MapItem>
</MapItems>
}

Method GetPrimeRate(pRequest As demo.Loan.Msg.PrimeRateRequest, Output pResponse As demo.Loan.Msg.PrimeRateResponse) As %Status
{
	$$$TRACE("PrimeRate requested")
	If ..#USEWEBSERVICES="yes" {
		Set tResult = ##class(demo.WebService.FederalReserveClient).GetPrimeRate()
	} Else {
		Set tResult = 3
	}
	Set pResponse = ##class(demo.Loan.Msg.PrimeRateResponse).%New()
	Set pResponse.PrimeRate = tResult
	$$$TRACE("value of '"_tResult_"' returned")
	Quit $$$OK
}

Method GetCreditRating(pRequest As demo.Loan.Msg.CreditRatingRequest, Output pResponse As demo.Loan.Msg.CreditRatingResponse) As %Status
{
	$$$TRACE("CreditRating requested for '"_pRequest.TaxID_"'")
	If ..#USEWEBSERVICES="yes" {
		Set tResult = ##class(demo.WebService.CreditBureauClient).GetCreditRating(pRequest.TaxID)
	} Else {
		Set tResult = pRequest.TaxID#10*10
	}
	Set pResponse = ##class(demo.Loan.Msg.CreditRatingResponse).%New()
	Set pResponse.TaxID = pRequest.TaxID
	Set pResponse.CreditRating = tResult
	$$$TRACE("value of '"_tResult_"' returned")
	Quit $$$OK
}

}

