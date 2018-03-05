/// Business Activity Dashboard for demo.Loan application.
Class demo.Loan.Dashboard Extends Ens.Dashboard
{

XData Dashboard
{
<Dashboard RefreshRate="2000" Metric="demo.Loan.BankMetrics">
<Speedometer Label="Requests" Property="LoansRequested" />
<Speedometer Label="Approvals" Property="LoansApproved" />
</Dashboard>
}

}

