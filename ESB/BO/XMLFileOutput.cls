Class ESB.BO.XMLFileOutput Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Property Adapter As EnsLib.File.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method CreateFile(pRequest As ESB.Model.EnrichedPerson, Output pResponse As Ens.Response) As %Status
{
	set tSC=$$$OK
	set tSC=pRequest.XMLExportToString(.str)
	set tSC=..Adapter.PutString("Person.xml",str)
	Quit tSC
}

Method CreateDelimitedXMLFile(pRequest As ESB.RecordMap.Map.Delimited.Record, Output pResponse As Ens.Response) As %Status
{
	set tSC=$$$OK
	set tSC=pRequest.XMLExportToString(.str)
	set tSC=..Adapter.PutString("DelimitedXML.xml",str)
	Quit tSC
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="ESB.Model.EnrichedPerson"> 
		<Method>CreateFile</Method>
	</MapItem>
	<MapItem MessageType="ESB.RecordMap.Map.Delimited.Record"> 
		<Method>CreateDelimitedXMLFile</Method>
	</MapItem>
</MapItems>
}

}
