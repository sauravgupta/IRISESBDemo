Class demo.Loan.FindRateFileOperation Extends Ens.BusinessOperation
{

/// 2 modes: Queue, InProc
Parameter INVOCATION = "Queue";

/// Name of the adapter class
Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

XData MessageMap
{
<MapItem MessageType="demo.Loan.Msg.SendReply">
<Method>FileSendReply</Method>
</MapItem>
}

/// Send an approval to the output file
Method FileSendReply(pRequest As demo.Loan.Msg.SendReply, Output pResponse As Ens.Response) As %Status
{
	$$$TRACE("write to file "_pRequest.Destination)
	Set tSC=..Adapter.PutString(pRequest.Destination, pRequest.Text)
	Quit tSC
}

}

