unit Period;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TDlgNewPeriod = class(TForm)
    EdtOt: TEdit;
    EdtDo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Edit1: TEdit;
    Label3: TLabel;
    procedure EdtOtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtOtKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOtKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function Execute(Var Per_Ot, Per_Do: Word; Var Zaglav: String): Boolean;
  end;

var
  DlgNewPeriod: TDlgNewPeriod;

implementation

{$R *.DFM}

Function TDlgNewPeriod.Execute(Var Per_Ot, Per_Do: Word; Var Zaglav: String): Boolean;
Begin
  Per_Ot := 0;
  Per_Do := 0;
	if Self.ShowModal = mrOk Then Begin
  	Result := True;
    Per_Ot := StrToInt(EdtOt.Text);
    Per_Do := StrToInt(EdtDo.Text);
    Zaglav := Edit1.Text; 
   End
  Else Result := False;
End;

procedure TDlgNewPeriod.EdtOtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 45 Then Key := 0;
	If [ssShift, ssAlt, ssCtrl] = Shift Then Begin
  	Shift := [ssAlt];
  End;
end;

procedure TDlgNewPeriod.EdtOtKeyPress(Sender: TObject; var Key: Char);
begin
	If Not((Ord(Key) In [48..57])Or(Ord(Key) = 8)) Then
 		Key := Chr(1);
end;

procedure TDlgNewPeriod.EdtOtKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (EdtOt.Text <> '')And(EdtDo.Text <> '') Then
  	BtnOk.Enabled := True
	Else
  	BtnOk.Enabled := False;
end;

procedure TDlgNewPeriod.FormShow(Sender: TObject);
begin
	EdtOt.Text := '';
  EdtDo.Text := '';
  BtnOk.Enabled := False;
end;

end.
