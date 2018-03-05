/// Loan Approval Business Process for Bank Manana.
/// Bank Manana simulates a bank with unreliable service;
/// sometimes it responds quickly, other times not.
Class demo.Loan.BankManana Extends Ens.BusinessProcessBPL [ ClassType = persistent ]
{

/// 2 modes: Queue, InProc
Parameter INVOCATION = "Queue";

XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process request="demo.Loan.Msg.Application" response="demo.Loan.Msg.Approval">

	<context>
		<property name="CreditRating" type="%Integer"/>
		<property name="PrimeRate" type="%Numeric"/>
	</context>

	<sequence>

	<trace value='"received application for "_request.Name'/>
	<assign name='Init Response' property="response.BankName" value='"BankManana"'>
	<annotation><![CDATA[Initialize the response object.]]></annotation>
	</assign>

	<call name="PrimeRate" target="demo.Loan.WebOperations" async="0">
	<annotation><![CDATA[Make a synchronous request for the Prime Rate.]]></annotation>
	<request type="demo.Loan.Msg.PrimeRateRequest">
	</request>
	<response type="demo.Loan.Msg.PrimeRateResponse">
	<assign property="context.PrimeRate" value="callresponse.PrimeRate"/>
	</response>
	</call>

	<call name="CreditRating" target="demo.Loan.WebOperations" async="0">
	<annotation><![CDATA[Make a synchronous request	for the Credit Rating.]]></annotation>
	<request type="demo.Loan.Msg.CreditRatingRequest">
	<assign property="callrequest.TaxID" value='request.TaxID'/>
	</request>
	<response type="demo.Loan.Msg.CreditRatingResponse">
	<assign property="context.CreditRating" value="callresponse.CreditRating"/>
	</response>
	</call>

	<assign name='IsApproved' property="response.IsApproved" value="1">
		<annotation><![CDATA[Copy IsApproved into the response object.]]></annotation>
	</assign>

	<assign name='InterestRate' property="response.InterestRate" value="context.PrimeRate+1+(2*(1-(context.CreditRating/100)))">	
		<annotation><![CDATA[Copy InterestRate into the response object.]]></annotation>
	</assign>
	
	<delay name="Delay" duration="&quot;PT&quot;_(2+($zcrc(request.Name,3)#7))_&quot;S&quot;">
		<annotation><![CDATA[Wait for a random duration.
This simulates the poor service offered by this bank.]]></annotation>
	</delay>
	
	<trace value='"application is "_$s(response.IsApproved:"approved for "_response.InterestRate_"%",1:"denied")'/>
	</sequence>
</process>
}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}

