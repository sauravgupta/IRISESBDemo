/// A business service for FindRate using MSMQ adapters
Class demo.Loan.FindRateMQSeriesService Extends Ens.BusinessService
{

/// Name of the adapter class
Parameter ADAPTER = "EnsLib.MQSeries.InboundAdapter";

/// Authors of BusinessService implements this method to receive incoming data
Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
	#; assuming the first line is 'amount:name:TaxID:nationality'
	Set tSubject=pInput.Body
	If $IsObject(tSubject) {
		#; The body is a stream
		Set tSubject=tSubject.ReadLine()
	}
	
	Set tApplication = ##class(demo.Loan.Msg.Application).%New()
	Set tApplication.Amount=$p(tSubject,":",1)
	Set tApplication.Name=$p(tSubject,":",2)
	Set tApplication.TaxID=$p(tSubject,":",3)
	Set tApplication.Nationality=$p(tSubject,":",4)
	Set tApplication.BusinessOperationType="mqseries"
	Set tApplication.Destination="FindRateResponse"
	Set tSC=..SendRequestAsync("demo.Loan.FindRateDecisionProcessCustom",tApplication)  Quit:$$$ISERR(tSC) tSC

	$$$TRACE("record number is "_tApplication.RecordNumber())

	Set tSendReply = ##class(demo.Loan.Msg.SendReply).%New()
	Set tSendReply.Text=tApplication.GetRecordNumberText()
	Set tSendReply.Destination="FindRateResponse"
	Set tSC=..SendRequestAsync("demo.Loan.FindRateMQSeriesOperation",tSendReply)
	Quit tSC
}

}

