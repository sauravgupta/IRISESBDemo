/// Business Metric Class for demo Loan Production
Class demo.Loan.BankMetrics Extends Ens.BusinessMetric
{

/// Total number of loan requests to date.
Property LoansRequested As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 10000, UNITS = "Applications");

/// Total number of loans approved to date.
Property LoansApproved As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 10000, UNITS = "Applications");

/// Calculate and update the set of metrics for this class
Method OnCalculateMetrics() As %Status
{
	// Note: these calculations are not accurate, they 
	// are demonstrative.
	
	// set the values of our metrics
	&sql(SELECT COUNT(*) INTO :count
		 FROM demo_Loan_Msg.Application)

	Set ..LoansRequested = count
	
	// set the values of our metrics
	&sql(SELECT COUNT(*) INTO :count 
		 FROM demo_Loan_Msg.Approval
		 WHERE IsApproved = 1)

	Set ..LoansApproved = count

	Quit $$$OK
}

}

