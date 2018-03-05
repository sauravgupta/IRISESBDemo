Class ESB.DTL.EnrichPerson Extends Ens.DataTransformDTL [ DependsOn = (ESB.Model.Person, ESB.Model.EnrichedPerson) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ESB.Model.Person' targetClass='ESB.Model.EnrichedPerson' create='new' language='objectscript' >
<assign value='source.system' property='target.system' action='set' />
<assign value='source.firstname' property='target.firstname' action='set' />
<assign value='source.lastname' property='target.lastname' action='set' />
<assign value='source.email' property='target.email' action='set' />
<assign value='source.phonenumber' property='target.phonenumber' action='set' />
<assign value='..SubString(source.dob,1,4)_"-"_..SubString(source.dob,5,6)_"-"_..SubString(source.dob,7,8)' property='target.dob' action='set' />
<assign value='..Lookup("Prefix",source.prefixid)' property='target.title' action='set' />
<assign value='..Lookup("Gender",source.genderid)' property='target.gender' action='set' />
<assign value='source.system' property='target.Xref.System' action='set' />
<assign value='$System.Util.CreateGUID()' property='target.Xref.GUID' action='set' />
<code>
	<![CDATA[ 
		For i=1:1:source.addresses.Count(){
			set address=##class(ESB.Model.Address).%New()
			set address.type=source.addresses.GetAt(i).type
			set address.addressline1=source.addresses.GetAt(i).addressline1
			set address.postcode=source.addresses.GetAt(i).postcode
			set address.city=source.addresses.GetAt(i).city
			set address.country=source.addresses.GetAt(i).country
			do target.addresses.SetAt(address,i)
			
		}
	]]>
</code>
<!--foreach property='source.addresses()' key='k1' >
<assign value='source.addresses.(k1).type' property='target.addresses.(1).type' action='set' />
<assign value='source.addresses.(k1).addressline1' property='target.addresses.(1).addressline1' action='set' />
<assign value='source.addresses.(k1).postcode' property='target.addresses.(1).postcode' action='set' />
<assign value='source.addresses.(k1).city' property='target.addresses.(1).city' action='set' />
<assign value='source.addresses.(k1).country' property='target.addresses.(1).country' action='set' />
</foreach-->
</transform>
}

}
