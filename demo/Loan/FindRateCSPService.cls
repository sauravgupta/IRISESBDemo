Class demo.Loan.FindRateCSPService Extends Ens.BusinessService
{

Method OnProcessInput(pCSPRequest As %CSP.Request, pOutput As Ens.StringContainer) As %Status
{
	Set tApplication = ##class(demo.Loan.Msg.Application).%New()
	Set tApplication.Amount = pCSPRequest.Get("Amount")
	Set tApplication.Name = pCSPRequest.Get("Name")
	Set tApplication.TaxID = pCSPRequest.Get("NINumber")
	Set tApplication.Nationality = pCSPRequest.Get("Nationality")
	Set tApplication.BusinessOperationType = "mail"
	Set tApplication.Destination = pCSPRequest.Get("EMail")
	Set tSC = ..SendRequestAsync("demo.Loan.FindRateDecisionProcessBPL",tApplication)  Quit:$$$ISERR(tSC) tSC

	Set pOutput = ##class(Ens.StringContainer).%New(tApplication.GetRecordNumberText(1))
	Quit tSC
}

}
