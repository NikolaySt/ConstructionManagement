unit PrtStPl;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TDlgPrintPlanStr = class(TForm)
    RadioGroup1: TRadioGroup;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
  private
  public
    Function Execute(Var i: Integer): Boolean;
  end;

var
  DlgPrintPlanStr: TDlgPrintPlanStr;

implementation

{$R *.DFM}

Function TDlgPrintPlanStr.Execute(Var i: Integer): Boolean;
Var
	PrintDialog1: TPrintDialog;
Begin
	Result := False;
	If ShowModal = mrOk Then Begin
  	i := RadioGroup1.ItemIndex;
    If i = -1 Then Result := False
    Else Begin
    	PrintDialog1 := TPrintDialog.Create(Self);
    	Try
      	If PrintDialog1.Execute Then Result := True;
      Finally
      	PrintDialog1.Free;
      End;{Try}
    End;{If i = -1}
  End;{If ShowModal = mrOk}
End;

end.
