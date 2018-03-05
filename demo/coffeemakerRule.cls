/// Use or operation of this code is subject to acceptance of the license available in the code repository for this code.
/// 
Class demo.coffeemakerRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="demo.CoffeeMakerBPL.Context" production="">
<variable name=""></variable>
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="GetOne" disabled="false">
<when condition="(genRequest.Method=&quot;GET&quot;)&amp;&amp;(genRequest.URL=&quot;/coffeemaker/:id/int&quot;)">
<return>ToJSON(genRequest.Argument1)</return>
</when>
</rule>
<rule name="GetAll" disabled="false">
<when condition="(genRequest.Method=&quot;GET&quot;)&amp;&amp;(genRequest.URL=&quot;/coffeemakers/int&quot;)">
<return>GetAllCoffeemakers()</return>
</when>
</rule>
<rule name="DeleteOne" disabled="false">
<when condition="(genRequest.Method=&quot;DELETE&quot;)&amp;&amp;(genRequest.URL=&quot;/coffeemaker/:id/int&quot;)">
<return>DeleteMaker(genRequest.Argument1)</return>
</when>
</rule>
<rule name="NewMaker" disabled="false">
<when condition="(genRequest.Method=&quot;POST&quot;)&amp;&amp;(genRequest.URL=&quot;/newcoffeemaker/int&quot;)">
<return>NewMaker(genRequest.Payload)</return>
</when>
</rule>
<rule name="EditMaker" disabled="false">
<when condition="(genRequest.Method=&quot;PUT&quot;)&amp;&amp;(genRequest.URL=&quot;/coffeemaker/:id/int&quot;)">
<return>EditMaker(genRequest.Argument1,genRequest.Payload)</return>
</when>
</rule>
<rule name="" disabled="false">
<when condition="(genRequest.Method=&quot;GET&quot;)&amp;&amp;(genRequest.URL=&quot;/coffeemakers/brand/:brand/int&quot;)">
<return>FindCoffeeMakerByBrand(genRequest.Argument1)</return>
</when>
</rule>
<rule name="No Rule" disabled="false">
<when condition="1">
<return>"No rule for: "_genRequest.Method_":"_genRequest.URL</return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
