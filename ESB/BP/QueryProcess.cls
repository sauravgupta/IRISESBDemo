/// 
Class ESB.BP.QueryProcess Extends Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='ESB.Messages.QueryRequest' response='ESB.Messages.QueryResponse' height='2000' width='2000' >
<sequence xend='184' yend='355' >
<call name='Call People Directory BO' target='PeopleDirectory BO' async='0' xpos='413' ypos='241' >
<request type='ESB.Messages.QueryRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='ESB.Messages.QueryResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}
