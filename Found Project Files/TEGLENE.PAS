unit Teglene;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, DBTables, DB, Mask, DBCtrls, ExtCtrls,
  CBoxInd;

type
  TDlgTeglene = class(TForm)
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DEdtInfo: TDBEdit;
    EdtTegelene: TEdit;
    LblRazxod: TLabel;
    EdtDokNom: TEdit;
    LblData: TLabel;
    Image1: TImage;
    EdtData: TMaskEdit;
    Bevel1: TBevel;
    CBoxSpisuk: TCBoxIndex;
    procedure FormShow(Sender: TObject);
    procedure CBoxSpisukChange(Sender: TObject);
    procedure EdtTegeleneKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTegeleneKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDataChange(Sender: TObject);
    procedure EdtDataExit(Sender: TObject);
    procedure EdtTegeleneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    TblKoop: TTable;
    TblKarton: TTable;
    QryTegle: TQuery;
    FieldTeg: TFloatField;
    DtSTegle: TDataSource;
  	TeglSuma: Real;
    CheckErrorData: Boolean;
  public
    { Public declarations }
    Function Execute: Boolean;
  end;

var
  DlgTeglene: TDlgTeglene;

implementation

{$R *.DFM}

Uses Kasa, MyConst;

procedure TDlgTeglene.FormShow(Sender: TObject);
begin
	CBoxSpisuk.ItemIndex := -1;
  EdtData.Text := '';
  EdtDokNom.Text := '';
  EdtTegelene.Text := '';
  BtnOk.Enabled := False;
  Image1.Visible := False;
  TeglSuma := 0;


	TblKoop := TTable.Create(Self);
  With TblKoop Do Begin
		DataBaseName := DBaseName;
    TableName := '1.DB';
    Active := True;
  End;

	TblKarton := TTable.Create(Self);
  With TblKarton Do Begin
		DataBaseName := DBaseName;
  End;

  QryTegle := TQuery.Create(Self);
  With QryTegle Do Begin
  	DataBaseName := DBaseName;
    SQl.Add('SELECT Sum(Plachane)');
    SQl.Add('');
    SQl.Add('WHERE ' + '(RedNom = "")And(IztDocNom = "")');
  End;

  FieldTeg := TFloatField.Create(Self);
  With FieldTeg Do Begin
  	DisplayFormat := '# ### ##0.00';
    FieldName := 'Sum Of Plachane';
    DataSet := QryTegle;
  End;

  DtSTegle := TDataSource.Create(Self);
  DtSTegle.DataSet := QryTegle;
  DEdtInfo.DataSource := DtSTegle;
  DEdtInfo.DataField := 'SUM of Plachane';
end;

procedure TDlgTeglene.CBoxSpisukChange(Sender: TObject);
Var
	Key: Word;
begin
	If TblKoop.FindKey([StrToInt(CBoxSpisuk.StringsIndex[CBoxSpisuk.ItemIndex].Index)]) Then Begin
  	With QryTegle Do Begin
			Active := False;
	   	SQl.Strings[1] := 'FROM "' + TblKoop.Fields[5].AsString + '.DB"';
      Active := True;
			If Fields[0].AsFloat > 0.00 Then Begin
      	Key := 0;
        Image1.Visible := True;
      	EdtTegeleneKeyUp(DEdtInfo, Key, [ssShift]);
       End
    	Else Begin
      	BtnOk.Enabled := False;
        Image1.Visible := False;
      End;{If Fields > 0.00}
  	End;
  End;{If FindKey}
end;

Function TDlgTeglene.Execute: Boolean;
Var
	CheckExit: Boolean;
  CheckRepeat: Boolean;
  DataSave: TDateTime;
  SaveSuma: Real;
  Ostatuk: Real;
  n: Integer;
Begin
	Try
		Result := False;
		If ShowModal = mrOK Then Begin
  		If TeglSuma > (DlgKasa.QrySumaKasa.Fields[0].AsFloat -
  			DlgKasa.QrySumaKasa.Fields[1].AsFloat) Then Begin
      	MessageDlg('Наличните пари в касата недостигат!', mtInformation, [mbOK], 0);
      	Exit;
    	End;

  		With TblKarton Do Begin
    		TableName := TblKoop.Fields[5].AsString + '.DB';
      	Active := True;
    		First;
      	CheckRepeat := False;
      	SaveSuma := TeglSuma;
      	Repeat
      		CheckExit := False;
      		While (Not(EOF))And(Not(CheckExit)) Do Begin
      			If (Fields[5].AsFloat > 0.00)And
        			(Fields[9].AsString = '')And
          		(Fields[0].AsString = '') Then CheckExit := True Else Next;
      		End;{While}
      		If Fields[5].AsFloat > TeglSuma Then Begin {Fields[5].AsFloat > TeglSuma}
      			DataSave := Fields[4].AsDateTime;
      			Edit;
      			Fields[9].AsString := EdtDokNom.Text;
						Fields[10].AsString := EdtData.Text;
      			Fields[11].AsFloat := TeglSuma;
          	Fields[0].AsString := 'Тег.';
      			Post;
          	Ostatuk := Fields[5].AsFloat - TeglSuma;
          	If Ostatuk > 0.009 Then Begin
      				Next;
            	If Eof Then Append Else Insert;
      				Fields[3].AsString := 'Салдо.';
        			Fields[4].AsDateTime := DataSave;
							Fields[5].AsFloat := Ostatuk;
      				Post;
      			End;{If TeglSuma > 0.009}
          	CheckRepeat := True;
         	 End
        	Else Begin{Fields[5].AsFloat < TeglSuma}
      			Edit;
      			Fields[9].AsString := EdtDokNom.Text;
						Fields[10].AsString := EdtData.Text;
      			Fields[11].AsFloat := Fields[5].AsFloat;
          	Fields[0].AsString := 'Тег.';
      			Post;
          	TeglSuma := TeglSuma - Fields[5].AsFloat;
          	If TeglSuma < 0.009 Then CheckRepeat := True;
      		End;
      	Until CheckRepeat;
    	End;{With TblKarton}

    	With DlgKasa.TblKasa Do Begin
      	If RecordCount = 0 Then n := 1
      	Else Begin
      		Last;
					n := Fields[0].AsInteger;
      		n := n + 1;
      	End;
      	Append;
      	Fields[0].AsInteger := n;
      	Fields[2].AsString := EdtDokNom.Text;
      	Fields[3].AsString := EdtData.Text;
      	Fields[4].AsString := TblKoop.Fields[1].AsString;
      	Fields[5].AsString := TblKoop.Fields[2].AsString;
      	Fields[6].AsString := TblKoop.Fields[3].AsString;
      	Fields[8].AsFloat := 	SaveSuma;
      	Post;
			End;
			Result := True;
		End;{If ShowModal}
  Finally
		FieldTeg.Destroy;
		TblKoop.Destroy;
  	TblKarton.Destroy;
  	QryTegle.Destroy;
	 	DtSTegle.Destroy;
  End;
End;

procedure TDlgTeglene.EdtTegeleneKeyPress(Sender: TObject; var Key: Char);
begin
	If Not((Ord(Key) In [48..57])Or(Ord(Key) = 44)Or
  	(Ord(Key) = 46)Or(Ord(Key) = 8)) Then
 		Key := Chr(1);
end;

procedure TDlgTeglene.EdtTegeleneKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
  InfoSuma: Real;
  Code: Integer;
  Str: String;
begin
	If (EdtTegelene.Text <> '')And(EdtData.Text <> '  /  /    ')And
    (EdtDokNom.Text <> '')And(DEdtInfo.Text <> '') Then Begin

    Str := EdtTegelene.Text;
    Val(Str, TeglSuma, Code);
    If Code <> 0 Then Begin
    	Str := Copy(Str, 1, Code - 1) + '.' + Copy(Str, Code + 1, Length(Str));
      Val(Str, TeglSuma, Code);
      If Code <> 0 Then Begin BtnOk.Enabled := False; Exit; End;
    End;

    InfoSuma := QryTegle.Fields[0].AsFloat;
    If TeglSuma <= InfoSuma Then BtnOk.Enabled := True
    Else BtnOk.Enabled := False;

   End
	Else
  	BtnOk.Enabled := False;
end;

procedure TDlgTeglene.EdtDataChange(Sender: TObject);
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

procedure TDlgTeglene.EdtDataExit(Sender: TObject);
begin
	If CheckErrorData Then Begin{Error}
  	(Sender as TCustomEdit).SetFocus;
    Raise EDBEditError.Create('');
	End;
end;

procedure TDlgTeglene.EdtTegeleneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 45 Then Key := 0;
	If [ssShift, ssAlt, ssCtrl] = Shift Then Begin
  	Shift := [ssAlt];
  End;
end;

end.
