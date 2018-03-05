/// 
Class ESB.BP.PeopleDirectoryQuery Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<sequence xend='215' yend='482' >
<call name='Call People Directory BO' target='PeopleDirectory BO' async='1' xpos='520' ypos='321' >
<request type='ESB.Messages.PeopleDirectoryRequest' />
<response type='Ens.Response' />
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}
