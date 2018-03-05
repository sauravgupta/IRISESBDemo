Class ESB.SAMLSecurity Extends %RegisteredObject
{

ClassMethod CreateSAMLToken() As %SAML.Assertion
{
	set alias="ServiceCredentials"
	set pwd="Montu789"
	set credset=##class(%SYS.X509Credentials).GetByAlias(alias,pwd)
	set bst=##class(%SOAP.Security.BinarySecurityToken).CreateX509Token(credset)
	set SAMLAsertion=##class(%SAML.Assertion).CreateX509(bst)
	quit SAMLAsertion
}

}
