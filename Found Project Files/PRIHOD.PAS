unit Prihod;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask, CBoxInd;

type
  TDlgPrixRaz = class(TForm)
    GBoxStroitel: TGroupBox;
    LblLName: TLabel;
    LblSName: TLabel;
    LblFName: TLabel;
    LblRazxod: TLabel;
    LblSuma: TLabel;
    Lbllv: TLabel;
    LblData: TLabel;
    EdtFName: TEdit;
    EdtSName: TEdit;
    EdtLName: TEdit;
    EdtDokNom: TEdit;
    EdtSuma: TEdit;
    LblSpisuk: TLabel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    EdtData: TMaskEdit;
    CheckBox1: TCheckBox;
    CBoxSpisuk: TCBoxIndex;
    procedure CBoxSpisukChange(Sender: TObject);
    procedure EdtDataChange(Sender: TObject);
    procedure EdtDataExit(Sender: TObject);
    procedure EdtSumaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSumaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure EdtSumaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    CheckErrorData: Boolean;
    CheckKoop: Boolean;
    CheckPredKasa: Boolean;
  public
    { Public declarations }
    Function ExecutePrihodKoop(Var i: Integer; Var DocNom,
    	Data, Suma: String; Var Check: Boolean): Boolean;

		Function ExecutePrihodDrugo(Var FName, SName, LName, DocNom,
    	Data, Suma: String): Boolean;

    Function ExecuteRazxodStro(Var FName, SName, LName, DocNom,
    	Data, Suma: String): Boolean;

    Function ExecuteRazxodDrugo(Var FName, SName, LName, DocNom,
    	Data, Suma: String): Boolean;

    Function ExecutePrihodPredKasa(Vid: String; Var FName, SName, LName, DocNom,
    	Data, Suma: String; Var i: Integer): Boolean;

  end;

var
  DlgPrixRaz: TDlgPrixRaz;

implementation

{$R *.DFM}

Uses PredKasa, Kasa, MyConst;

Function TDlgPrixRaz.ExecutePrihodKoop(Var i: Integer; Var DocNom,
	Data, Suma: String; Var Check: Boolean): Boolean;
Begin
	Self.Caption := 'Приход от кооператорите';
  BtnOk.Caption := 'Приход';
	Result := False;
  EdtFName.Text := '';
  EdtSName.Text := '';
	EdtLName.Text := '';
  EdtFName.Enabled := False;
  EdtSName.Enabled := False;
	EdtLName.Enabled := False;
  CBoxSpisuk.Visible := True;
  LblSpisuk.Visible := True;
  CheckKoop := True;
  CheckPredKasa := False;

  CheckBox1.Visible := True;
  CheckBox1.Checked := False;

  If ShowModal = mrOk Then Begin
  	i := StrToInt(CBoxSpisuk.StringsIndex[CBoxSpisuk.ItemIndex].Index);
    DocNom := EdtDokNom.Text;
    Data := EdtData.Text;
    Suma := EdtSuma.Text;
    Check := CheckBox1.Checked;
    Result := True;
  End;
End;

Function TDlgPrixRaz.ExecuteRazxodStro(Var FName, SName, LName,
	DocNom, Data, Suma: String): Boolean;
Begin
	Self.Caption := 'Разход за строителя';
  BtnOk.Caption := 'Разход';
  EdtFName.Enabled := True;
  EdtSName.Enabled := True;
	EdtLName.Enabled := True;
  CBoxSpisuk.Visible := False;
  LblSpisuk.Visible := False;
	Result := False;
  CheckKoop := False;
  CheckPredKasa := False;

  CheckBox1.Visible := False;
  If ShowModal = mrOk Then Begin
  	FName := EdtFName.Text;
    SName := EdtSName.Text;
    LName := EdtLName.Text;
    DocNom := EdtDokNom.Text;
    Data := EdtData.Text;
    Suma := EdtSuma.Text;
    Result := True;
  End;
End;

Function TDlgPrixRaz.ExecutePrihodDrugo(Var FName, SName, LName, DocNom,
	Data, Suma: String): Boolean;
Begin
	Self.Caption := 'Други приходи';
  BtnOk.Caption := 'Приход';
  EdtFName.Enabled := True;
  EdtSName.Enabled := True;
	EdtLName.Enabled := True;
  CBoxSpisuk.Visible := False;
  LblSpisuk.Visible := False;
	Result := False;
  CheckKoop := False;
  CheckPredKasa := False;

  CheckBox1.Visible := False;
  If ShowModal = mrOk Then Begin
  	FName := EdtFName.Text;
    SName := EdtSName.Text;
    LName := EdtLName.Text;
    DocNom := EdtDokNom.Text;
    Data := EdtData.Text;
    Suma := EdtSuma.Text;
    Result := True;
  End;
End;

Function TDlgPrixRaz.ExecuteRazxodDrugo(Var FName, SName, LName, DocNom,
	Data, Suma: String): Boolean;
Begin
	Self.Caption := 'Други разходи';
  BtnOk.Caption := 'Разход';
  EdtFName.Enabled := True;
  EdtSName.Enabled := True;
	EdtLName.Enabled := True;
  CBoxSpisuk.Visible := False;
  LblSpisuk.Visible := False;
	Result := False;
  CheckKoop := False;
  CheckPredKasa := False;

  CheckBox1.Visible := False;
  If ShowModal = mrOk Then Begin
  	FName := EdtFName.Text;
    SName := EdtSName.Text;
    LName := EdtLName.Text;
    DocNom := EdtDokNom.Text;
    Data := EdtData.Text;
    Suma := EdtSuma.Text;
    Result := True;
  End;
End;

Function TDlgPrixRaz.ExecutePrihodPredKasa(Vid: String; Var FName, SName, LName, DocNom,
 	Data, Suma: String; Var i: Integer): Boolean;
Begin
	Self.Caption := Vid;
  BtnOk.Caption := 'Приход';
  EdtFName.Enabled := False;
  EdtSName.Enabled := False;
	EdtLName.Enabled := False;
  CBoxSpisuk.Visible := True;
  LblSpisuk.Visible := True;
	Result := False;
  CheckKoop := False;
  CheckPredKasa := True;
  CheckBox1.Visible := False;
  If ShowModal = mrOk Then Begin
  	FName := EdtFName.Text;
    SName := EdtSName.Text;
    LName := EdtLName.Text;
    DocNom := EdtDokNom.Text;
    Data := EdtData.Text;
    Suma := EdtSuma.Text;
		i := StrToInt(CBoxSpisuk.StringsIndex[CBoxSpisuk.ItemIndex].Index);
    Result := True;
  End;
End;

procedure TDlgPrixRaz.CBoxSpisukChange(Sender: TObject);
begin
	If CheckKoop Then
		With DlgKasa.TblKoop Do Begin
  		If FindKey([StrToInt(CBoxSpisuk.StringsIndex[CBoxSpisuk.ItemIndex].Index)]) Then Begin
    		EdtFName.Text := Fields[1].AsString;
  			EdtSName.Text := Fields[2].AsString;
				EdtLName.Text := Fields[3].AsString;
    	End;{If FindKey}
  	End;{With TblKoop}
 	If CheckPredKasa Then
		With DlgPredKasa.TblKoop Do Begin
  		If FindKey([StrToInt(CBoxSpisuk.StringsIndex[CBoxSpisuk.ItemIndex].Index)]) Then Begin
    		EdtFName.Text := Fields[1].AsString;
  			EdtSName.Text := Fields[2].AsString;
				EdtLName.Text := Fields[3].AsString;
    	End;{If FindKey}
  End;{With TblKoop}
end;

procedure TDlgPrixRaz.EdtDataChange(Sender: TObject);
Var
	Data: TDateTime;
begin
	CheckErrorData := True;
	Try
		Data := StrToDate((Sender as TCustomEdit).Text);
    CheckErrorData := False;
  Except
  	CheckErrorData := True;
  End;
end;

procedure TDlgPrixRaz.EdtDataExit(Sender: TObject);
begin
	If CheckErrorData Then Begin{Error}
  	(Sender as TCustomEdit).SetFocus;
    Raise EDBEditError.Create('');
	End;
end;

procedure TDlgPrixRaz.EdtSumaKeyPress(Sender: TObject; var Key: Char);
begin
	If Not((Ord(Key) In [48..57])Or(Ord(Key) = 46)Or(Ord(Key) = 8)) Then
 		Key := Chr(1);
end;

procedure TDlgPrixRaz.EdtSumaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (EdtSuma.Text <> '')And(EdtData.Text <> '  /  /    ')And
    (EdtDokNom.Text <> '')And(EdtFName.Text <> '') Then
  	BtnOk.Enabled := True
	Else
  	BtnOk.Enabled := False;
end;

procedure TDlgPrixRaz.FormShow(Sender: TObject);
begin
	BtnOk.Enabled := False;
	EdtSuma.Text := '';
  EdtData.Text := '';
  EdtDokNom.Text := '';
  EdtFName.Text := '';
  EdtSName.Text := '';
  EdtLName.Text := '';
	CBoxSpisuk.ItemIndex := 0;
  CBoxSpisukChange(Sender);
End;

procedure TDlgPrixRaz.EdtSumaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 45 Then Key := 0;
	If [ssShift, ssAlt, ssCtrl] = Shift Then Begin
  	Shift := [ssAlt];
  End;
end;

end.


