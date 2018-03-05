Include (%occInclude, Ensemble)
Class demo.Loan.FindRateTCPOperation Extends Ens.BusinessOperation
{

/// 2 modes: Queue, InProc
Parameter INVOCATION = "Queue";

/// Name of the adapter class
Parameter ADAPTER = "EnsLib.TCP.TextLineOutboundAdapter";

XData MessageMap
{
<MapItem MessageType="demo.Loan.Msg.SendReply">
<Method>TCPSendReply</Method>
</MapItem>
}

/// Send an approval to the output TCP listener
Method TCPSendReply(pRequest As demo.Loan.Msg.SendReply, Output pResponse As Ens.Response) As %Status
{
	Set tSC=..Adapter.SendMessageString(pRequest.Text)
	Quit tSC
}

}

