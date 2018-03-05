Class ESB.REST.PersonService Extends EnsLib.REST.Service
{

Parameter ADAPTER = "EnsLib.HTTP.InboundAdapter";

XData UrlMap
{
<Routes>
<Route Url="/api/v1/published/FirmStepPerson" Method="POST" Call="createPerson"/>
<Route Url="/api/v1/published/FirmStepPerson/:guid" Method="GET" Call="getPersonJSON"/>
 <Route Url="/api/v1/published/XML/FirmStepPerson/:guid" Method="GET" Call="getPersonXML"/></Routes>
}

/// Create or replace
Method createPerson(pInput As %Library.AbstractStream, Output pOutput As %Stream.Object) As %Status
{
	
	try {
		set tSC=$$$OK
		Set tSC=..JSONStreamToObject(pInput,.JSONObj) 
		set datelength=$L(JSONObj.dob)
		If (datelength'=8) 
		{
			do pOutput.SetAttribute("ResponseCode",..#HTTP400BADREQUEST)
		}
		Else{
			set tPersonObj=##class(ESB.Model.Person).%New()
			set tPersonObj.system=JSONObj.system
			set tPersonObj.firstname=JSONObj.firstname
			set tPersonObj.lastname=JSONObj.lastname
			set tPersonObj.email=JSONObj.email
			set tPersonObj.phonenumber=JSONObj.phonenumber
			set tPersonObj.dob=JSONObj.dob
			set tPersonObj.prefixid=JSONObj.prefixid
			set tPersonObj.genderid=JSONObj.genderid
			For i=1:1:JSONObj.addresses.Count(){
				set taddress=##class(ESB.Model.Address).%New()
				set taddress.type=JSONObj.addresses.GetAt(i).type
				set taddress.addressline1=JSONObj.addresses.GetAt(i).addressline1
				set taddress.postcode=JSONObj.addresses.GetAt(i).postcode
				set taddress.city=JSONObj.addresses.GetAt(i).city
				set taddress.country=JSONObj.addresses.GetAt(i).country
				do tPersonObj.addresses.SetAt(taddress,i)
			}
			Set tSC=tPersonObj.%Save()  Quit:$$$ISERR(tSC)
			set tResponse=##class(ESB.Model.EnrichedPerson).%New()
			set tSC=..SendRequestSync("EnrichProcess",tPersonObj,.tResponse)
			set dynamicObject={}
			do dynamicObject.%Set("GUID",$ZSTRIP(tResponse.GUID,"*C"))
			Do pOutput.Write(dynamicObject.%ToJSON())
			//Do pOutput.Write(tResponse.GUID)
			// return 201 if successfully created
			Do:$$$ISOK(tSC) pOutput.SetAttribute("ResponseCode",..#HTTP201CREATED)
		}
	} catch {
		Kill tRS
		Set tSC=$$$SystemError
	}
	
	Quit tSC
}

Method getPersonJSON(pInput As %Library.AbstractStream, pOutput As %Stream.Object, pGuid As %String) As %Status
{
	set tSC=$$$OK
	set tRequest=##class(ESB.Messages.QueryRequest).%New()
	set tRequest.GUID=pGuid
	set tRequest.ResponseType="JSON"
	set tResponse=##class(ESB.Messages.QueryResponse).%New()
	set tSC=..SendRequestSync("QueryProcess",tRequest,.tResponse)
	Do tResponse.ResponseStream.Rewind()  
	Set tSC=pOutput.Write(tResponse.ResponseStream.Read()) 
	// return 201 if successfully created
	Do pOutput.SetAttribute("Content-Type","application/json")
	Do pOutput.SetAttribute("ResponseCode",..#HTTP200OK)
	q tSC
}

Method getPersonXML(pInput As %Library.AbstractStream, pOutput As %Stream.Object, pGuid As %String) As %Status
{
	set tSC=$$$OK
	set tRequest=##class(ESB.Messages.QueryRequest).%New()
	set tRequest.GUID=pGuid
	set tRequest.ResponseType="XML"
	set tResponse=##class(ESB.Messages.QueryResponse).%New()
	set tSC=..SendRequestSync("QueryProcess",tRequest,.tResponse)
	Do tResponse.ResponseStream.Rewind()  
	Set tSC=pOutput.Write(tResponse.ResponseStream.Read())  
	// return 201 if successfully created
	Do pOutput.SetAttribute("Content-Type","application/xml")
	do pOutput.SetAttribute("ResponseCode",..#HTTP200OK)
	q tSC
}

/// Control the type and content of error returned to the REST caller
ClassMethod OnErrorStream(pStatus As %Status)
{
 	Set tStream = ##class(%GlobalBinaryStream).%New()  $$$ASSERT($IsObject(tStream))
	Do tStream.Write($ZConvert($$$StatusDisplayString(pStatus)_$C(13,10),"O","UTF8"))
	Set tStream.Attributes("Content-Type")=" text/plain; charset=""UTF-8"""
	Set tStream.Attributes("ResponseCode")=..#HTTP500INTERNALSERVERERROR
 	Quit tStream
}

}
