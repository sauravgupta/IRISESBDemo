Class demo.Loan.BankEvenLoanAppTransform Extends Ens.DataTransformDTL [ DependsOn = (demo.Loan.Msg.Application, demo.Loan.Msg.Approval) ]
{

Parameter IGNOREMISSINGSOURCE = 0;

Parameter REPORTERRORS = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='demo.Loan.Msg.Application' targetClass='demo.Loan.Msg.Approval' create='new' language='objectscript' >
<assign value='process.BankName' property='target.BankName' action='set'  />
<assign value='(context.NameLength#2)=0' property='target.IsApproved' action='set'  />
</transform>
}

}

