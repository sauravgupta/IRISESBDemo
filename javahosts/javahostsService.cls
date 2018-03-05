Class javahosts.javahostsService Extends com.intersys.gateway.bh.BusinessService [ ProcedureBlock ]
{

Parameter IMPORTTIMESTAMP As STRING = "1970-01-01 01:00:00.0";

Method %OnNew(ByRef p0 As %ObjectHandle) As %Status
{
	Quit:'$D(p0) $$$OK
	Quit ..%Constructor(p0,"javahosts.javahostsService",0)
}

///p0: interface com.intersys.gateway.bh.Production
Method OnInit(ByRef p0 As %ObjectHandle) As %ObjectHandle
{
	Quit ..%IR("OnInit",.p0)
}

Method OnTearDown() As %ObjectHandle
{
	Quit ..%IR("OnTearDown")
}

Parameter SETTINGS As STRING = "Min,Max";

}
