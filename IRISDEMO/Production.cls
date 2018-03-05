Class IRISDEMO.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="IRISDEMO.Production" LogGeneralTraceEvents="false">
  <Description>Created by the Java Gateway Production Wizard</Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="EnsLib.JavaGateway.Initiator" Category="JavaHosts" ClassName="EnsLib.JavaGateway.Initiator" PoolSize="1" Enabled="true" Foreground="false" Comment="Created by the Java Gateway Production Wizard" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Address">127.0.0.1</Setting>
    <Setting Target="Host" Name="Port">55555</Setting>
    <Setting Target="Host" Name="JavaHome"></Setting>
  </Item>
  <Item Name="JBH.Javahosts.JavahostsOperation" Category="JavaHosts" ClassName="JBH.Javahosts.JavahostsOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="LogFile">c:\practice\javhostslog.txt</Setting>
  </Item>
  <Item Name="demo.RESTCoffeeMakerService" Category="CoffeeMakerREST" ClassName="demo.RESTCoffeeMakerService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="demo.CoffeeMakerBPL" Category="CoffeeMakerREST" ClassName="demo.CoffeeMakerBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Delimited.RecordMap.FileService" Category="RecordMap" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">demo.RecordMap.Map.Delimited</Setting>
    <Setting Target="Adapter" Name="ArchivePath">C:\practice\archive</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\practice\in</Setting>
    <Setting Target="Adapter" Name="FileSpec">RecordMap_Delimited_*</Setting>
    <Setting Target="Host" Name="TargetConfigNames">FixedWidth.RecordMap.FileOperation</Setting>
  </Item>
  <Item Name="FixedWidth.RecordMap.FileOperation" Category="RecordMap" ClassName="EnsLib.RecordMap.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Filename">RecordMap_FixedWidth_Output.txt</Setting>
    <Setting Target="Host" Name="RecordMap">demo.RecordMap.Map.FixedWidth</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\practice\out\</Setting>
  </Item>
  <Item Name="demo.Loan.BankMetrics" Category="ComplexBP" ClassName="demo.Loan.BankMetrics" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
  <Item Name="demo.Loan.FindRateFileService" Category="ComplexBP" ClassName="demo.Loan.FindRateFileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\Practice\loan\in</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.application</Setting>
    <Setting Target="Adapter" Name="ArchivePath">C:\Practice\loan\inarchive</Setting>
    <Setting Target="Host" Name="BusinessPartner">LoanTech Corporation</Setting>
  </Item>
  <Item Name="demo.Loan.FindRateFileOperation" Category="ComplexBP" ClassName="demo.Loan.FindRateFileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\Practice\loan\out</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
    <Setting Target="Host" Name="BusinessPartner">LoanTech Corporation</Setting>
  </Item>
  <Item Name="demo.Loan.FindRateCSPService" Category="ComplexBP" ClassName="demo.Loan.FindRateCSPService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="BusinessPartner">My Loans, Inc.</Setting>
  </Item>
  <Item Name="demo.Loan.FindRateDecisionProcessCustom" Category="ComplexBP" ClassName="demo.Loan.FindRateDecisionProcessCustom" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="demo.Loan.FindRateDecisionProcessBPL" Category="ComplexBP" ClassName="demo.Loan.FindRateDecisionProcessBPL" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="demo.Loan.BankSoprano" Category="ComplexBP" ClassName="demo.Loan.BankSoprano" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="demo.Loan.BankManana" Category="ComplexBP" ClassName="demo.Loan.BankManana" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="demo.Loan.BankUS" Category="ComplexBP" ClassName="demo.Loan.BankUS" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="demo.Loan.BankEven" Category="ComplexBP" ClassName="demo.Loan.BankEven" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="demo.Loan.FindRateEMailOperation" Category="ComplexBP" ClassName="demo.Loan.FindRateEMailOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="From">abc@acmebank.com</Setting>
    <Setting Target="Adapter" Name="Recipient">sgupta@intersystems.com</Setting>
    <Setting Target="Adapter" Name="SMTPPort">25</Setting>
    <Setting Target="Adapter" Name="SMTPServer">moon.iscinternal.com</Setting>
  </Item>
  <Item Name="demo.Loan.FindRateMQSeriesOperation" Category="ComplexBP" ClassName="demo.Loan.FindRateMQSeriesOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="demo.Loan.FindRateMSMQOperation" Category="ComplexBP" ClassName="demo.Loan.FindRateMSMQOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="demo.Loan.WebOperations" Category="ComplexBP" ClassName="demo.Loan.WebOperations" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Wikipedia BO" Category="ESB" ClassName="EnsLib.REST.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPServer">en.wikipedia.org</Setting>
    <Setting Target="Adapter" Name="URL">|</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Host" Name="WriteRawMode">0</Setting>
  </Item>
  <Item Name="Wikipedia" Category="ESB" ClassName="EnsLib.REST.GenericService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">Wikipedia BO</Setting>
    <Setting Target="Adapter" Name="Port"></Setting>
  </Item>
  <Item Name="Weather BO" Category="ESB" ClassName="EnsLib.SOAP.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPServer">www.webservicex.net</Setting>
    <Setting Target="Adapter" Name="URL">|</Setting>
  </Item>
  <Item Name="Weather" Category="ESB" ClassName="EnsLib.SOAP.GenericService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">Weather BO</Setting>
    <Setting Target="Adapter" Name="AdapterURL">/GlobalWeather.asmx</Setting>
    <Setting Target="Adapter" Name="EnableStandardRequests">1</Setting>
    <Setting Target="Adapter" Name="Port"></Setting>
  </Item>
  <Item Name="PersonService" Category="BasicREST" ClassName="ESB.REST.PersonService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">9981</Setting>
  </Item>
  <Item Name="EnrichProcess" Category="BasicREST" ClassName="ESB.BP.Enrich" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Router" Category="BasicREST" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">ESB.RouterRoutingRule</Setting>
  </Item>
  <Item Name="PeopleDirectory BO" Category="BasicREST" ClassName="ESB.BO.PeopleDirectory" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">57775</Setting>
    <Setting Target="Adapter" Name="HTTPServer">localhost</Setting>
    <Setting Target="Adapter" Name="URL">/csp/peopledirectory/people/CreatePerson</Setting>
    <Setting Target="Adapter" Name="Credentials">HTTPBasic</Setting>
  </Item>
  <Item Name="PeopleDirectory" Category="BasicREST" ClassName="ESB.BP.CallPeopleDIrectory" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="QueryProcess" Category="BasicREST" ClassName="ESB.BP.QueryProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="JSONFileOutput" Category="BasicREST" ClassName="ESB.BO.JSONFileOutput" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\practice\Out\JSON\</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
  </Item>
  <Item Name="XMLFileOutput" Category="BasicREST" ClassName="ESB.BO.XMLFileOutput" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\practice\Out\XML\</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
  </Item>
  <Item Name="JBH.Javahosts.JavahostsService" Category="JavaHosts" ClassName="JBH.Javahosts.JavahostsService" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">JBH.Javahosts.JavahostsOperation</Setting>
    <Setting Target="Host" Name="Credentials">javahostCredentials</Setting>
    <Setting Target="Host" Name="JarFile">C:\ISC\javahostsService.jar</Setting>
    <Setting Target="Host" Name="Max">100</Setting>
    <Setting Target="Host" Name="Min">1</Setting>
  </Item>
</Production>
}

}
