/// RECORDMAP: Generated from RecordMap 'demo.RecordMap.Map.FixedWidth'
/// on 2010-09-30 at 17:42:18.386 [2010-09-30 22:42:18.386 UTC]
/// by user demoUser
Class demo.RecordMap.Map.FixedWidth.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Index PersonIDIdx On PersonID;

Index SSNIdx On SSN;

Parameter RECORDMAPGENERATED = 1;

Parameter INCLUDETOPFIELDS = 1;

Property PersonID As %String(MAXLEN = 8);

Property FirstName As %String(MAXLEN = 25);

Property MiddleInitial As %String(MAXLEN = 25);

Property LastName As %String(MAXLEN = 30);

Property DateOfBirth As %Date(FORMAT = 3);

Property SSN As %String(MAXLEN = 11, PATTERN = "3N1""-""2N1""-""4N");

Property HomeAddress As demo.RecordMap.Map.FixedWidth.Record.HomeAddress;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>%Source</Value>
</Value>
<Value name="3">
<Value>FirstName</Value>
</Value>
<Value name="4">
<Value>MiddleInitial</Value>
</Value>
<Value name="5">
<Value>LastName</Value>
</Value>
<Value name="6">
<Value>DateOfBirth</Value>
</Value>
<Value name="7">
<Value>SSN</Value>
</Value>
<Value name="8">
<Value>HomeAddress</Value>
</Value>
<Value name="9">
<Value>PersonID</Value>
</Value>
</Data>
<DataLocation>^demo.RecordMap.Map7F0B.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^demo.RecordMap.Map7F0B.RecordD</IdLocation>
<IndexLocation>^demo.RecordMap.Map7F0B.RecordI</IndexLocation>
<StreamLocation>^demo.RecordMap.Map7F0B.RecordS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
