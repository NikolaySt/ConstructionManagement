unit KarPost;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask;

type
  TDlgKartonPost = class(TForm)
    GroupBox1: TGroupBox;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    EdtBnkSuma: TEdit;
    EdtBnkDok: TEdit;
    BtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    EdtBnkData: TMaskEdit;
    procedure EdtBnkDataExit(Sender: TObject);
    procedure EdtBnkDataChange(Sender: TObject);
    procedure EdtBnkSumaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBnkSumaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtBnkSumaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    CheckErrorData: Boolean;
  public
    { Public declarations }
    Function Execute(Var DocNom: String;
    	Var Data: String;
      Var Suma: String): Boolean;
  end;

var
  DlgKartonPost: TDlgKartonPost;

implementation

{$R *.DFM}

Function TDlgKartonPost.Execute(Var DocNom: String; Var Data:
	String; Var Suma: String): Boolean;
Begin
	Result := False;
  BtnOk.Enabled := False;
  EdtBnkDok.Text := '';
  EdtBnkData.Text := '';
  EdtBnkSuma.Text := '';
  EdtBnkDok.Focused;
	If DlgKartonPost.ShowModal = mrOK Then Begin
		Result := True;
    DocNom := EdtBnkDok.Text;
    Data := EdtBnkData.Text;
    Suma := EdtBnkSuma.Text;
  End;
End;

procedure TDlgKartonPost.EdtBnkDataExit(Sender: TObject);
begin
	If CheckErrorData Then Begin{Error}
  	(Sender as TCustomEdit).SetFocus;
    Raise EDBEditError.Create('');
	End;
end;

procedure TDlgKartonPost.EdtBnkDataChange(Sender: TObject);
Var
	Data: TDateTime;
begin
	CheckErrorData := True;
	Try
		Data := StrToDate(EdtBnkData.Text);
    CheckErrorData := False;
  Except
  	CheckErrorData := True;
  End;
end;

procedure TDlgKartonPost.EdtBnkSumaKeyPress(Sender: TObject;
  var Key: Char);
begin
	If Not((Ord(Key) In [48..57])Or(Ord(Key) = 44)Or
  	(Ord(Key) = 46)Or(Ord(Key) = 8)) Then
 		Key := Chr(1);
end;

procedure TDlgKartonPost.EdtBnkSumaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (EdtBnkDok.Text <> '')And(EdtBnkData.Text <> '  /  /    ')And
    (EdtBnkSuma.Text <> '') Then
  	BtnOk.Enabled := True
	Else
  	BtnOk.Enabled := False;
end;

procedure TDlgKartonPost.EdtBnkSumaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 45 Then Key := 0;
	If [ssShift, ssAlt, ssCtrl] = Shift Then Begin
  	Shift := [ssAlt];
  End;
end;

end.
