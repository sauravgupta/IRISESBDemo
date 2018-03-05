Class ESB.BO.PeopleDirectory Extends EnsLib.REST.Operation
{

Parameter INVOCATION = "Queue";

Method getGUID(pRequest As ESB.Messages.PeopleDirectoryRequest, Output pResponse As ESB.Messages.PeopleDirectoryResponse) As %Status
{
   
   try {
      // Prepare and log the call
      Set tURL=..Adapter.URL      
      set tURL="/csp/peopledirectory/people/CreatePerson"
      // Execute the call
      set tSC = ##class(%ZEN.Auxiliary.jsonProvider).%WriteJSONStreamFromObject(.tStream,pRequest.EnrichedPerson,"","",1,"n")
      Set tSC=..Adapter.PostURL(tURL,.tHttpResponse,"",tStream)
      
      // Return the response
      If $$$ISERR(tSC)&&$IsObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size {
         Set tSC=$$$ERROR($$$EnsErrGeneral,$$$StatusDisplayString(tSC)_":"_tHttpResponse.Data.Read())
      }
      Quit:$$$ISERR(tSC)
      If $IsObject(tHttpResponse) {
         // Instantiate the response object
         set pResponse = ##class(ESB.Messages.PeopleDirectoryResponse).%New()
         // Set response properties from the Proxy Object
         set pResponse.GUID = tHttpResponse.Data.Read()
            
       }
   }catch{
       Set tSC=$$$SystemError
   }
   Quit tSC
}

Method getPerson(pRequest As ESB.Messages.QueryRequest, Output pResponse As ESB.Messages.QueryResponse) As %Status
{
   
   try {
      // Prepare and log the call
      Set tURL=..Adapter.URL      
      If (pRequest.ResponseType="JSON"){
      	set tURL="/csp/peopledirectory/people/PersonService/"_pRequest.GUID
      }
      Else{
	    set tURL="/csp/peopledirectory/people/PersonService/XML/"_pRequest.GUID 
      }    	
      // Execute the call
      Set tSC=..Adapter.GetURL(tURL,.tHttpResponse) 
      // Return the response
      If $$$ISERR(tSC)&&$IsObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size {
         Set tSC=$$$ERROR($$$EnsErrGeneral,$$$StatusDisplayString(tSC)_":"_tHttpResponse.Data.Read())
      }
      Quit:$$$ISERR(tSC)
      If $IsObject(tHttpResponse) {
         // Instantiate the response object
         set pResponse = ##class(ESB.Messages.QueryResponse).%New()
         
         // Set response properties from the Proxy Object
         do pResponse.ResponseStream.CopyFrom(tHttpResponse.Data)
            
       }
   }catch{
       Set tSC=$$$SystemError
   }
   Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="ESB.Messages.PeopleDirectoryRequest">
    <Method>getGUID</Method>
  </MapItem>
    <MapItem MessageType="ESB.Messages.QueryRequest">
    <Method>getPerson</Method>
  </MapItem>
</MapItems>
}

}
