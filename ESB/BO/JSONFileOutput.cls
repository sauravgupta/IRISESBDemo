Class ESB.BO.JSONFileOutput Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Property Adapter As EnsLib.File.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method CreateFile(pRequest As ESB.Model.EnrichedPerson, Output pResponse As Ens.Response) As %Status
{
	set tSC=$$$OK
	set tSC = ##class(%ZEN.Auxiliary.jsonProvider).%WriteJSONStreamFromObject(.tStream,pRequest,"","",1,"n")
	set tSC=..Adapter.PutStream("Person.json",tStream)
	Quit tSC
}

Method CreateDelimitedJSONFile(pRequest As ESB.RecordMap.Map.Delimited.Record, Output pResponse As Ens.Response) As %Status
{
	set tSC=$$$OK
	set tSC = ##class(%ZEN.Auxiliary.jsonProvider).%WriteJSONStreamFromObject(.tStream,pRequest,"","",1,"n")
	set tSC=..Adapter.PutStream("DelimitedJSON.json",tStream)
	Quit tSC
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="ESB.Model.EnrichedPerson"> 
		<Method>CreateFile</Method>
	</MapItem>
		<MapItem MessageType="ESB.RecordMap.Map.Delimited.Record"> 
		<Method>CreateDelimitedJSONFile</Method>
	</MapItem>
</MapItems>
}

}
