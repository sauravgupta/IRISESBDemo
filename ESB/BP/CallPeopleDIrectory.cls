/// 
Class ESB.BP.CallPeopleDIrectory Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='ESB.Model.EnrichedPerson' response='ESB.Messages.PeopleDirectoryResponse' height='2000' width='2000' >
<sequence xend='200' yend='350' >
<call name='Call People Directory BO' target='PeopleDirectory BO' async='0' xpos='200' ypos='250' >
<request type='ESB.Model.EnrichedPerson' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='ESB.Messages.PeopleDirectoryResponse' >
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
