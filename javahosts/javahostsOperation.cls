Class javahosts.javahostsOperation Extends com.intersys.gateway.bh.BusinessOperation [ ProcedureBlock ]
{

Parameter IMPORTTIMESTAMP As STRING = "1970-01-01 01:00:00.0";

Method %OnNew(ByRef p0 As %ObjectHandle) As %Status
{
	Quit:'$D(p0) $$$OK
	Quit ..%Constructor(p0,"javahosts.javahostsOperation",0)
}

///p0: class [Ljava.lang.String;
Method OnInit(ByRef p0 As %ObjectHandle) As %ObjectHandle
{
	Do ..%PreInvoke()
	Set x=$zobjexport("OnInit",18)
	Set x=$zobjexport(-1,18)
	Do ..%WriteArray(..Gateway,"[Ljava.lang.String;",p0)
	Set x=..%GetObject(..Gateway)
	Set:$zobjexport(17) p0=..%ReadArrayArgument(..Gateway)
	Do ..%PostInvoke()
	Quit x
}

Method OnTearDown() As %ObjectHandle
{
	Quit ..%IR("OnTearDown")
}

///p0: class java.lang.String
Method OnMessage(ByRef p0 As %ObjectHandle) As %ObjectHandle
{
	Quit ..%IR("OnMessage",.p0)
}

Parameter SETTINGS As STRING = "LogFile";

}
