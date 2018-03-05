Class ESB.Messages.PeopleDirectoryRequest Extends Ens.Request
{

Property EnrichedPerson As ESB.Model.EnrichedPerson;

Property Command As %String;

Storage Default
{
<Data name="PeopleDirectoryRequestDefaultData">
<Subscript>"PeopleDirectoryRequest"</Subscript>
<Value name="1">
<Value>EnrichedPerson</Value>
</Value>
<Value name="2">
<Value>Command</Value>
</Value>
</Data>
<DefaultData>PeopleDirectoryRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
