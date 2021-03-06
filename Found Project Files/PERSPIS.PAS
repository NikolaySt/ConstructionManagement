unit Perspis;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TDlgPeriodSpisuk = class(TForm)
    LBoxPeriod: TListBox;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    procedure LBoxPeriodClick(Sender: TObject);
  private
    { Private declarations }
    Per: Integer;
  public
		Function ExecuteListDelete(Var i: Integer; Oper: Boolean): Boolean;
  end;

var
  DlgPeriodSpisuk: TDlgPeriodSpisuk;

implementation

{$R *.DFM}

Function TDlgPeriodSpisuk.ExecuteListDelete(Var i: Integer; Oper: Boolean): Boolean;
Begin
	If Oper Then Begin 
		BtnOk.Caption := 'Период';
  	Self.Caption := 'Избор на период'
   End
  Else Begin
 		BtnOk.Caption := 'Изтрий';
  	Self.Caption := 'Изтриване на период'
  End;

  Per := -1;
  LBoxPeriod.ItemIndex := -1;

	If ShowModal = mrOk Then Begin
  	Result := (True) And (Per <> -1);
    i := Per;
    End
  Else Result := False;
End;

procedure TDlgPeriodSpisuk.LBoxPeriodClick(Sender: TObject);
begin
	Per := LBoxPeriod.ItemIndex;
end;

end.
