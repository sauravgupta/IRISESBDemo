/// 
Class ESB.RouterRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="ESB.Production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="" disabled="false">
<constraint name="source" value="Delimited.RecordMap.FileService"></constraint>
<when condition="1">
<send transform="" target="JSONFileOutput"></send>
<send transform="" target="XMLFileOutput"></send>
<return></return>
</when>
</rule>
<rule name="">
<constraint name="source" value="EnrichProcess"></constraint>
<when condition="1">
<send transform="" target="XMLFileOutput"></send>
<send transform="" target="JSONFileOutput"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
