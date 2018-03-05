/// Use or operation of this code is subject to acceptance of the license available in the code repository for this code.
/// 
Class demo.coffeemakerResponse Extends Ens.Response
{

Property Name As %String;

Property Brand As %String;

Property Color As %String;

Property NumCups As %Integer(VALUELIST = ",1,3,5,12,16,32,64");

Property Price As %Numeric(SCALE = 2);

Property Img As %String(MAXLEN = 256);

Storage Default
{
<Data name="coffeemakerResponseDefaultData">
<Subscript>"coffeemakerResponse"</Subscript>
<Value name="1">
<Value>Name</Value>
</Value>
<Value name="2">
<Value>Brand</Value>
</Value>
<Value name="3">
<Value>Color</Value>
</Value>
<Value name="4">
<Value>NumCups</Value>
</Value>
<Value name="5">
<Value>Price</Value>
</Value>
<Value name="6">
<Value>Img</Value>
</Value>
</Data>
<DefaultData>coffeemakerResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
