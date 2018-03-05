Class ESB.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="ESB.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Wikipedia BO" Category="" ClassName="EnsLib.REST.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPServer">en.wikipedia.org</Setting>
    <Setting Target="Adapter" Name="URL">|</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Host" Name="WriteRawMode">0</Setting>
  </Item>
  <Item Name="Wikipedia" Category="" ClassName="EnsLib.REST.GenericService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">Wikipedia BO</Setting>
    <Setting Target="Adapter" Name="Port"></Setting>
  </Item>
  <Item Name="Weather BO" Category="" ClassName="EnsLib.SOAP.GenericOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPServer">www.webservicex.net</Setting>
    <Setting Target="Adapter" Name="URL">|</Setting>
  </Item>
  <Item Name="Weather" Category="" ClassName="EnsLib.SOAP.GenericService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">Weather BO</Setting>
    <Setting Target="Adapter" Name="AdapterURL">/GlobalWeather.asmx</Setting>
    <Setting Target="Adapter" Name="EnableStandardRequests">1</Setting>
    <Setting Target="Adapter" Name="Port"></Setting>
  </Item>
  <Item Name="WeatherSAML" Category="" ClassName="EnsLib.SOAP.SAMLGenericService" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">Weather BO</Setting>
    <Setting Target="Adapter" Name="EnableStandardRequests">1</Setting>
    <Setting Target="Adapter" Name="Port"></Setting>
    <Setting Target="Host" Name="TrustedX509File">C:\InterSystems\Demo\Certificates\finenameroot.cer</Setting>
  </Item>
  <Item Name="MathService" Category="" ClassName="ESB.REST.MathService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">9940</Setting>
  </Item>
  <Item Name="PersonService" Category="" ClassName="ESB.REST.PersonService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">9981</Setting>
  </Item>
  <Item Name="EnrichProcess" Category="" ClassName="ESB.BP.Enrich" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Router" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">ESB.RouterRoutingRule</Setting>
  </Item>
  <Item Name="PeopleDirectory BO" Category="" ClassName="ESB.BO.PeopleDirectory" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">57777</Setting>
    <Setting Target="Adapter" Name="HTTPServer">localhost</Setting>
    <Setting Target="Adapter" Name="URL">/csp/peopledirectory/people/CreatePerson</Setting>
  </Item>
  <Item Name="PeopleDirectory" Category="" ClassName="ESB.BP.CallPeopleDIrectory" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="QueryProcess" Category="" ClassName="ESB.BP.QueryProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Delimited.RecordMap.FileService" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="File service to process files containing delimited records" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ESB.RecordMap.Map.Delimited</Setting>
    <Setting Target="Host" Name="TargetConfigNames">FixedWidth.RecordMap.FileOperation,Delimited.RecordMap.BatchOperation,Router</Setting>
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\Demo\in\</Setting>
    <Setting Target="Adapter" Name="FileSpec">RecordMap_Delimited_*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">C:\Demo\inarchive</Setting>
  </Item>
  <Item Name="FixedWidth.RecordMap.FileOperation" Category="" ClassName="EnsLib.RecordMap.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="File operation to write data out into fixed width records" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Filename">RecordMap_FixedWidth_Output.txt</Setting>
    <Setting Target="Host" Name="RecordMap">ESB.RecordMap.Map.FixedWidth</Setting>
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\Demo\out\</Setting>
  </Item>
  <Item Name="Delimited.RecordMap.BatchOperation" Category="" ClassName="EnsLib.RecordMap.Operation.BatchFileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Filename">RecordMap_DelimitedBatch_%Q</Setting>
    <Setting Target="Host" Name="UseDefaultBatch">1</Setting>
    <Setting Target="Host" Name="DefaultBatchClass">ESB.RecordMap.Map.Delimited.Batch</Setting>
    <Setting Target="Host" Name="RolloverSchedule">START:*-*-*T*:*:00</Setting>
    <Setting Target="Host" Name="RolloverLimit">6</Setting>
    <Setting Target="Host" Name="RecordMap">ESB.RecordMap.Map.Delimited</Setting>
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\Demo\out\</Setting>
  </Item>
  <Item Name="JSONFileOutput" Category="" ClassName="ESB.BO.JSONFileOutput" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\Demo\Out\JSON\</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
  </Item>
  <Item Name="XMLFileOutput" Category="" ClassName="ESB.BO.XMLFileOutput" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\Demo\Out\XML\</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
  </Item>
</Production>
}

}
