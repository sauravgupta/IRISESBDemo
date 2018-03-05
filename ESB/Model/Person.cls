Class ESB.Model.Person Extends (%Persistent, %Populate, %XML.Adaptor)
{

Property system As %String;

Property firstname As %String;

Property lastname As %String;

Property email As %String;

Property phonenumber As %String;

Property dob As %String;

Property prefixid As %Integer;

Property genderid As %Integer;

Property addresses As array Of Address;

Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>system</Value>
</Value>
<Value name="3">
<Value>firstname</Value>
</Value>
<Value name="4">
<Value>lastname</Value>
</Value>
<Value name="5">
<Value>email</Value>
</Value>
<Value name="6">
<Value>phonenumber</Value>
</Value>
<Value name="7">
<Value>dob</Value>
</Value>
<Value name="8">
<Value>prefixid</Value>
</Value>
<Value name="9">
<Value>genderid</Value>
</Value>
</Data>
<Data name="addresses">
<Attribute>addresses</Attribute>
<Structure>subnode</Structure>
<Subscript>"addresses"</Subscript>
</Data>
<DataLocation>^ESB.Model.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^ESB.Model.PersonD</IdLocation>
<IndexLocation>^ESB.Model.PersonI</IndexLocation>
<StreamLocation>^ESB.Model.PersonS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
