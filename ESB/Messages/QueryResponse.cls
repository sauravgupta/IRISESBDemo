Class ESB.Messages.QueryResponse Extends Ens.Response
{

Property ResponseStream As %GlobalCharacterStream;

Storage Default
{
<Data name="QueryResponseDefaultData">
<Subscript>"QueryResponse"</Subscript>
<Value name="1">
<Value>ResponseStream</Value>
</Value>
</Data>
<DefaultData>QueryResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
