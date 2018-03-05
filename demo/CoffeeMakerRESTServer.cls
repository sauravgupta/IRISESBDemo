/// Use or operation of this code is subject to acceptance of the license available in the code repository for this code.
/// 
Class demo.CoffeeMakerRESTServer Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/test" Method="GET" Call="test"/>
<Route Url="/coffeemakers" Method="GET" Call="GetAll" />
<Route Url="/coffeemaker/:id" Method="GET" Call="GetCoffeeMakerInfo" />
<Route Url="/newcoffeemaker" Method="POST" Call="NewMaker" />
<Route Url="/coffeemaker/:id" Method="PUT" Call="EditMaker" />
<Route Url="/coffeemaker/:id" Method="DELETE" Call="RemoveCoffeemaker"/>

<Route Url="/coffeemakers/int" Method="GET" Call="GetCoffeeMakersFromInterface"/>
<Route Url="/coffeemaker/:id/int" Method="GET" Call="GetCoffeeMakerInfoFromInterface" />
<Route Url="/newcoffeemaker/int" Method="POST" Call="NewMakerThroughInterface" />
<Route Url="/coffeemaker/:id/int" Method="PUT" Call="EditMakerThroughInterface" />
<Route Url="/coffeemaker/:id/int" Method="DELETE" Call="RemoveCoffeeMakerFromInterface"/>
<Route Url="/coffeemaker/brand/:brand/int" Method="GET" Call="FindCoffeeMakersByBrand"/>
</Routes>
}

/// Tester method
ClassMethod test() As %Status
{
	Set cm = {
		"coffeemakerID": "20",
		"name": "My Coffee Maker",
		"brand": "Coffee Inc",
		"price": "23.45",
		"numcups": "1",
		"color": "green",
		"img": "img/coffee1.png"
	}
	Write cm.%ToJSON()
	quit $$$OK
}

// DATABASE METHODS

ClassMethod GetAll() As %Status
{
	Set tArr = []
	Set rs = ##class(%SQL.Statement).%ExecDirect(,"SELECT * FROM demo.coffeemaker")
	While rs.%Next() {
		Do tArr.%Push({
			"img":    			(rs.%Get("Img")),
			"coffeemakerID":    (rs.%Get("CoffeemakerID")),
			"name": 			(rs.%Get("Name")),
			"brand":        	(rs.%Get("Brand")),
			"color":   			(rs.%Get("Color")),
			"numcups":          (rs.%Get("NumCups")),
			"price":        	(rs.%Get("Price"))
		})
	}
	
	Write tArr.%ToJSON()
	Quit $$$OK
}

ClassMethod NewMaker() As %Status
{
	If '..GetJSONFromRequest(.obj) {
		Set %response.Status = ..#HTTP400BADREQUEST
		Set error = {"errormessage": "JSON not found"}
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	If '..ValidateJSON(obj,.error) {
		Set %response.Status = ..#HTTP400BADREQUEST
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	Set cm = ##class(demo.coffeemaker).%New()
	Do ..CopyToCoffeemakerFromJSON(.cm,obj)
	
	Set sc = cm.%Save()
	
	Set result={}
	do result.%Set("Status",$s($$$ISERR(sc):$system.Status.GetOneErrorText(sc),1:"OK"))
	write result.%ToJSON()
	Quit sc
}

ClassMethod EditMaker(id As %String = "") As %Status
{
	If '..GetJSONFromRequest(.obj) {
		Set %response.Status = ..#HTTP400BADREQUEST
		Set error = {"errormessage": "JSON not found"}
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	If '..ValidateJSON(obj,.error) {
		Set %response.Status = ..#HTTP400BADREQUEST
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	Set cm = ##class(demo.coffeemaker).%OpenId(id)
	If '$IsObject(cm) {
		Set %response.Status = ..#HTTP404NOTFOUND
		Set error = {"errormessage": "Coffee maker does not exist"}
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	Do ..CopyToCoffeemakerFromJSON(.cm,obj)
	
	Set sc = cm.%Save()
	
	Set result={}
	do result.%Set("Status",$s($$$ISERR(sc):$system.Status.GetOneErrorText(sc),1:"OK"))
	write result.%ToJSON()
	Quit sc
}

ClassMethod RemoveCoffeemaker(id As %String) As %Status
{
	Set result={}
	Set sc=0
	
	if id'="",##class(demo.coffeemaker).%ExistsId(id) {
	  Set sc=##class(demo.coffeemaker).%DeleteId(id)
	  do result.%Set("Status",$s($$$ISERR(sc):$system.Status.GetOneErrorText(sc),1:"OK"))
	}
	else  {
	  do result.%Set("Status","")	
	}
	
	write result.%ToJSON()
	
  	quit sc
}

ClassMethod GetCoffeeMakerInfo(id As %String) As %Status
{
	Set coffeemaker = ##class(demo.coffeemaker).%OpenId(id)
	If '$IsObject(coffeemaker) {
		Set %response.Status = ..#HTTP204NOCONTENT
	} Else {
		Set obj = {
			"img": (coffeemaker.Img),
			"coffeemakerID": (coffeemaker.CoffeemakerID),
			"name": 		(coffeemaker.Name),
			"brand":        (coffeemaker.Brand),
			"color":   		(coffeemaker.Color),
			"numcups":      (coffeemaker.NumCups),
			"price":        (coffeemaker.Price)
		}
		Write obj.%ToJSON()
	}
	Quit $$$OK
}

// INTERFACE METHODS

ClassMethod GetCoffeeMakerInfoFromInterface(id As %String) As %Status
{
	set tSC = ..CallInterface("/coffeemaker/:id/int","GET",id)
	//Error handling here if we need it
	quit $$$OK
}

ClassMethod GetCoffeeMakersFromInterface() As %Status
{
	set tSC = ..CallInterface("/coffeemakers/int","GET")
	quit $$$OK
}

ClassMethod RemoveCoffeeMakerFromInterface(id As %String) As %Status
{
	set tSC = ..CallInterface("/coffeemaker/:id/int","DELETE",id)
	quit $$$OK
}

ClassMethod NewMakerThroughInterface() As %Status
{
	If '..GetJSONFromRequest(.obj) {
		Set %response.Status = ..#HTTP400BADREQUEST
		Set error = {"errormessage": "JSON not found"}
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	If '..ValidateJSON(obj,.error) {
		Set %response.Status = ..#HTTP400BADREQUEST
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	set cm = ##class(demo.tempCoffeemaker).%New()
	do ..CopyToCoffeemakerFromJSON(.cm,obj)
		
	set tSC = ..CallInterface("/newcoffeemaker/int","POST","",cm)
	quit $$$OK
}

ClassMethod EditMakerThroughInterface(id As %String) As %Status
{
	If '..GetJSONFromRequest(.obj) {
		Set %response.Status = ..#HTTP400BADREQUEST
		Set error = {"errormessage": "JSON not found"}
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	If '..ValidateJSON(obj,.error) {
		Set %response.Status = ..#HTTP400BADREQUEST
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	set cm = ##class(demo.tempCoffeemaker).%New()
	do ..CopyToCoffeemakerFromJSON(.cm,obj)
		
	set tSC = ..CallInterface("/coffeemaker/:id/int","PUT",id,cm)
	quit $$$OK
}

ClassMethod FindCoffeeMakersByBrand(brand As %String) As %Status
{
	set brand = $replace(brand,"+"," ")
	set tSC = ..CallInterface("/coffeemakers/brand/:brand/int","GET",brand)
	quit $$$OK
}

// HELPER METHODS

/// Helper method to send a message to the interface
ClassMethod CallInterface(URL As %String, Method As %String, Argument1 As %String = "", Payload As demo.coffeemaker = "") As %Status
{
	set tSC = $$$OK
	try {
		//Instantiate business service
		set tSC = ##class(Ens.Director).CreateBusinessService("demo.RESTCoffeeMakerService",.tService)
		
		$$$ThrowOnError(tSC)
		
		//Pass along input from url to ProcessInput.
		set request = ##class(demo.GenericCoffeeMakerRequest).%New()
		set request.URL = URL
		set request.Method = Method
		set request.Argument1 = Argument1
		set request.Payload = Payload
		set tSC = tService.ProcessInput(request, .output)
		
		$$$ThrowOnError(tSC)
		
	    do %response.SetHeader("ContentType", "application/json")
	    
	    #Dim output As demo.GenericCoffeeMakerResponse
	    
	    //Write to JSON response back to REST client
	    write output.JSONResponse 
	}
	catch ex {
		set tSC = ex.AsStatus()
	}
	return tSC
}

/// Helper method
ClassMethod ValidateJSON(obj As %DynamicObject, Output error As %DynamicObject) As %Boolean
{
	Set error = {}
	
	If obj.%Get("name") = "" {
		Set error.errormessage = "Name was blank"
		Quit 0
	}	
	
	If obj.%Get("brand") = "" {
		Set error.errormessage = "Brand was blank"
		Quit 0
	}
	
	Quit 1
}

/// Helper method
ClassMethod CopyToCoffeemakerFromJSON(ByRef cm As demo.coffeemaker, obj As %DynamicObject) [ Private ]
{
	Set cm.Name=obj.name
	set cm.Brand = obj.brand
	Set cm.Img = obj.img
	set cm.Color = obj.color
	set cm.NumCups = obj.numcups
	set cm.Price = obj.price
}

/// Helper method
ClassMethod GetJSONFromRequest(Output obj As %DynamicObject) As %Boolean
{
	Set ok = 1
	Try {
		Set obj = ##class(%DynamicObject).%FromJSON(%request.Content)
	} Catch ex {
		Set ok = 0
	}
	Quit ok
}

}
