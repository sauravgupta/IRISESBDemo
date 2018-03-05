/// 
Class ESB.BP.Enrich Extends Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='ESB.Model.Person' response='ESB.Messages.PeopleDirectoryResponse' height='2000' width='2000' >
<context>
<property name='EnrichedPerson' type='ESB.Model.EnrichedPerson' instantiate='0' />
<property name='PDResponse' type='ESB.Messages.PeopleDirectoryResponse' instantiate='0' />
</context>
<sequence xend='200' yend='650' >
<transform name='Enrich Message' class='ESB.DTL.EnrichPerson' source='request' target='context.EnrichedPerson' xpos='200' ypos='250' />
<call name='Publish' target='Router' async='1' xpos='200' ypos='350' >
<request type='ESB.Model.EnrichedPerson' >
<assign property="callrequest" value="context.EnrichedPerson" action="set" />
</request>
<response type='Ens.Response' />
</call>
<call name='Call People Directory BP' target='PeopleDirectory' async='0' xpos='200' ypos='450' >
<request type='ESB.Messages.PeopleDirectoryRequest' >
<assign property="callrequest.EnrichedPerson" value="context.EnrichedPerson" action="set" />
<assign property="callrequest.Command" value="&quot;POST&quot;" action="set" />
</request>
<response type='ESB.Messages.PeopleDirectoryResponse' >
<assign property="context.PDResponse" value="callresponse" action="set" />
</response>
</call>
<assign name="Response Sync" property="response" value="context.PDResponse" action="set" xpos='200' ypos='550' />
</sequence>
</process>
}

}
