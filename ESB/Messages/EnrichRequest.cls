Class ESB.Messages.EnrichRequest Extends (%Persistent, %XML.Adaptor)
{

Property Person As ESB.Model.Person;

Property Command As %String;

Storage Default
{
<Data name="EnrichRequestDefaultData">
<Subscript>"EnrichRequest"</Subscript>
<Value name="1">
<Value>Person</Value>
</Value>
<Value name="2">
<Value>Command</Value>
</Value>
<Value name="3">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^ESB.Messages.EnrichRequestD</DataLocation>
<DefaultData>EnrichRequestDefaultData</DefaultData>
<IdLocation>^ESB.Messages.EnrichRequestD</IdLocation>
<IndexLocation>^ESB.Messages.EnrichRequestI</IndexLocation>
<StreamLocation>^ESB.Messages.EnrichRequestS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
