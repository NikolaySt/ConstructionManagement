unit StrBank;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask;

type
  TDlgStrBank = class(TForm)
    GBoxVnoska: TGroupBox;
    Label12: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    EdtStSuma: TEdit;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    EdtStdoData: TMaskEdit;
    EdtStnaData: TMaskEdit;
    procedure EdtStSumaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtStSumaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtStdoDataExit(Sender: TObject);
    procedure EdtStdoDataChange(Sender: TObject);
    procedure EdtStSumaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    CheckErrorData: Boolean;
    StroiBank: Boolean;
  public
    { Public declarations }
    Function ExecutePlanVnoska(Var NaData, DoData: TDateTime;
    	Var Suma: Real): Boolean;
    Function ExecuteStroiBanka(Var DokNom: String;
    	Var Data: TDateTime; Var Suma: Real): Boolean;
  end;

var
  DlgStrBank: TDlgStrBank;

implementation

{$R *.DFM}

Function TDlgStrBank.ExecutePlanVnoska(Var NaData, DoData: TDateTime;
	Var Suma: Real): Boolean;
Var
	Code: Integer;
  Str: String;
Begin
	Result := False;
  Self.Caption := 'Планови вноски';
	EdtStnaData.Text := '';
  EdtStdoData.Text := '';
	EdtStSuma.Text := '';
  BtnOk.Enabled := False;
  EdtStnaData.EditMask := '!90/90/0000;1;_';
  StroiBank := True;
  Label1.Caption := 'Дата:';
  Label2.Caption := 'Краен срок:';
  Label3.Caption := 'Искана сума:';
  If ShowModal = mrOK Then Begin
    NaData := StrToDate(EdtStnaData.Text);
    DoData := StrToDate(EdtStdoData.Text);

    Str := EdtStSuma.Text;
 	 	Val(Str, Suma, Code);
  	If Code <> 0 Then Begin
  		Str := Copy(Str, 1, Code - 1) + '.' + Copy(Str, Code + 1, Length(Str));
    	Val(Str, Suma, Code);
  	End;

  	Result := True;
  End;
End;

Function TDlgStrBank.ExecuteStroiBanka(Var DokNom: String;
	Var Data: TDateTime; Var Suma: Real): Boolean;
Var
	Code: Integer;
  Str: String;
Begin
	Result := False;
  Self.Caption := 'Плащане по банков път';
	EdtStnaData.Text := '';
  EdtStdoData.Text := '';
	EdtStSuma.Text := '';
  BtnOk.Enabled := False;
  EdtStnaData.EditMask := '';
  StroiBank := False;
  Label1.Caption := 'Док. No:';
  Label2.Caption := 'Дата:';
  Label3.Caption := 'Платена сума:';
  If ShowModal = mrOK Then Begin
  	DokNom := EdtStnaData.Text;
    Data := StrToDate(EdtStdoData.Text);

    Str := EdtStSuma.Text;
 	 	Val(Str, Suma, Code);
  	If Code <> 0 Then Begin
  		Str := Copy(Str, 1, Code - 1) + '.' + Copy(Str, Code + 1, Length(Str));
    	Val(Str, Suma, Code);
  	End;

  	Result := True;
  End;
End;

procedure TDlgStrBank.EdtStSumaKeyPress(Sender: TObject; var Key: Char);
begin
	If Not((Ord(Key) In [48..57])Or(Ord(Key) = 44)Or
  	(Ord(Key) = 46)Or(Ord(Key) = 8)) Then
 		Key := Chr(1);
end;

procedure TDlgStrBank.EdtStSumaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (EdtStnaData.Text <> '  /  /    ')And
  	(EdtStdoData.Text <> '  /  /    ')And
    (EdtStSuma.Text <> '') Then
  	BtnOk.Enabled := True
	Else
  	BtnOk.Enabled := False;
end;

procedure TDlgStrBank.EdtStdoDataExit(Sender: TObject);
begin
  If Not(StroiBank)And((Sender as TCustomEdit).Name = 'EdtStnaData') Then Exit;
	If CheckErrorData Then Begin{Error}
  	(Sender as TCustomEdit).SetFocus;
    Raise EDBEditError.Create('');
	End;
end;

procedure TDlgStrBank.EdtStdoDataChange(Sender: TObject);
Var
	Data: TDateTime;
begin
	Exit;
	If Not(StroiBank)And((Sender as TCustomEdit).Name = 'EdtStnaData') Then Exit;
	CheckErrorData := True;
	Try
		Data := StrToDate((Sender as TCustomEdit).Text);
    CheckErrorData := False;
  Except
  	CheckErrorData := True;
  End;
end;

procedure TDlgStrBank.EdtStSumaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 45 Then Key := 0;
	If [ssShift, ssAlt, ssCtrl] = Shift Then Begin
  	Shift := [ssAlt];
  End;
end;

end.
