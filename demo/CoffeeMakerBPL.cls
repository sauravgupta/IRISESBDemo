/// Use or operation of this code is subject to acceptance of the license available in the code repository for this code.
/// 
Class demo.CoffeeMakerBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='demo.GenericCoffeeMakerRequest' response='demo.GenericCoffeeMakerResponse' height='2000' width='2000' >
<context>
<property name='coffeemaker' type='demo.coffeemaker' instantiate='1' />
<property name='genRequest' type='demo.GenericCoffeeMakerRequest' instantiate='0' />
</context>
<sequence xend='200' yend='550' >
<assign name="Set context" property="context.genRequest" value="request" action="set" xpos='200' ypos='250' />
<rule name='RESTRules' rule='demo.coffeemakerRule'  resultLocation='response.JSONResponse' ruleContext='context' xpos='200' ypos='350' >
</rule>
<assign name="Get maker and set response" property="response.JSONResponse" value="##class(demo.coffeemaker).%OpenId(request.Argument1).ToJSON()" action="set" xpos='200' ypos='450' disabled="true"/>
</sequence>
</process>
}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}
