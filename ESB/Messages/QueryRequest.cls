Class ESB.Messages.QueryRequest Extends Ens.Request
{

Property GUID As %String;

Property ResponseType As %String;

Storage Default
{
<Data name="QueryRequestDefaultData">
<Subscript>"QueryRequest"</Subscript>
<Value name="1">
<Value>GUID</Value>
</Value>
<Value name="2">
<Value>ResponseType</Value>
</Value>
</Data>
<DefaultData>QueryRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
