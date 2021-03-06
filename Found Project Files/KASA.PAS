unit Kasa;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  Mask, DBCtrls, Printers, Menus, DBTextRegDim, LabelRegDim;

type
  TDlgKasa = class(TForm)
    TblKasa: TTable;
    TblKasaPriOrderNom: TStringField;
    TblKasaRazOrderNom: TStringField;
    TblKasaData: TDateField;
    TblKasaFName: TStringField;
    TblKasaSName: TStringField;
    TblKasaLName: TStringField;
    TblKasaPrihod: TCurrencyField;
    TblKasaRazxod: TCurrencyField;
    PnlStatus: TPanel;
    DtSKasa: TDataSource;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label12: TLabel;
    DtSSumaKasa: TDataSource;
    QrySumaKasa: TQuery;
    QrySumaKasaSUMofPrihod: TCurrencyField;
    QrySumaKasaSUMofRazxod: TCurrencyField;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    PrintDialog1: TPrintDialog;
    N14: TMenuItem;
    N15: TMenuItem;
    DGrdKasa: TDBGrid;
    Label1: TLabel;
    N16: TMenuItem;
    N17: TMenuItem;
    QrySort: TQuery;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N22: TMenuItem;
    GBoxPeriod: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    TblPeriod: TTable;
    TblKasaRedNom: TIntegerField;
    QryPeriodSuma: TQuery;
    QryNSalSuma: TQuery;
    QryPeriodSumaSUMofPrihod: TCurrencyField;
    QryPeriodSumaSUMofRazxod: TCurrencyField;
    DtSPeriodSuma: TDataSource;
    Label5: TLabel;
    DBText1: TDBTextRec;
    DBText4: TDBTextRec;
    Label16: TLabelRec;
    Label14: TLabelRec;
    DBText2: TDBTextRec;
    DBText3: TDBTextRec;
    Label15: TLabelRec;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N21: TMenuItem;
    Label17: TLabel;
    QrySortRedNom: TIntegerField;
    QrySortPriOrderNom: TStringField;
    QrySortRazOrderNom: TStringField;
    QrySortData: TDateField;
    QrySortFName: TStringField;
    QrySortSName: TStringField;
    QrySortLName: TStringField;
    QrySortPrihod: TCurrencyField;
    QrySortRazxod: TCurrencyField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtPSNameKeyPress(Sender: TObject; var Key: Char);
    procedure N5Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure DGrdKasaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure TblKasaAfterDelete(DataSet: TDataset);
    procedure N28Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Procedure IzchisSaldo;
    Procedure Sorting(Red2: String);
    Procedure PrintHeader(Prt: TPrinter; PageNumber: Integer;
			CountPage: Integer);
    Procedure PeriodSelect(i: Integer);
    Procedure PeriodDelete(i: Integer);
  public
    { Public declarations }
    CheckKoop: Boolean;
    TblKoop: TTable;
    TblKarton: TTable;
  end;

Const
	READ_BUF = 125; {Buffers-Reads from File}

var
  DlgKasa: TDlgKasa;

implementation

{$R *.DFM}
Uses Karton, Otchet, Prihod, Chstotka, Teglene, KprStroi, FullOtk, MyConst,
	Period, PerSpis, SetupReg, PrintTables;

Procedure TDlgKasa.Sorting(Red2: String);
Begin
  QrySort.Active := False;
	QrySort.SQL.Strings[0] := 'SELECT *';
	QrySort.SQL.Strings[1] := 'FROM "7.DB"';
	QrySort.SQL.Strings[3] := Red2;
  DtsKasa.DataSet := QrySort;
  QrySort.Active := True;

  {QryPeriodSuma.Active := False;
  QryNSalSuma.Active := False;
  Label14.Caption := '0.00';
  Label15.Caption := '0.00';}
End;

Procedure TDlgKasa.PeriodSelect(i: Integer);
Begin
		TblPeriod.First;
    TblPeriod.MoveBy(i);
    With QrySort Do Begin
    	Active := False;
			SQL.Strings[0] := 'SELECT *';
			SQL.Strings[1] := 'FROM "7.DB" A';
			SQL.Strings[2] := 'WHERE RedNom >= ' + TblPeriod.Fields[1].AsString
      	+ 'And' + ' RedNom <= ' + TblPeriod.Fields[2].AsString;
      SQL.Strings[3] := 'ORDER BY A.RedNom';
     	DtsKasa.DataSet := QrySort;
  		Active := True;
    End;{With}

    With QryPeriodSuma Do Begin
    	Active := False;
			SQL.Strings[0] := 'SELECT Sum(Prihod), Sum(Razxod)';
			SQL.Strings[1] := 'FROM "7.DB"';
			SQL.Strings[2] := 'WHERE RedNom >= ' + TblPeriod.Fields[1].AsString
      	+ 'And' + ' RedNom <= ' + TblPeriod.Fields[2].AsString;
      Active := True;
    End;

    With QryNSalSuma Do Begin
    	Active := False;
			SQL.Strings[0] := 'SELECT Sum(Prihod), Sum(Razxod)';
			SQL.Strings[1] := 'FROM "7.DB"';
			SQL.Strings[2] := 'WHERE RedNom < ' + TblPeriod.Fields[1].AsString;
      Active := True;
    End;

    Label14.Caption := FormatFloat('### ### ##0.#0',
    	QryNSalSuma.Fields[0].AsFloat -
      	QryNSalSuma.Fields[1].AsFloat);

    Label15.Caption := FormatFloat('### ### ##0.#0',
    	QryNSalSuma.Fields[0].AsFloat -
    	QryNSalSuma.Fields[1].AsFloat +
      QryPeriodSuma.Fields[0].AsFloat -
      QryPeriodSuma.Fields[1].AsFloat);

    GBoxPeriod.Caption := 'Рекапитулация за период: от '
    	+ TblPeriod.Fields[1].AsString + ' до '
      + TblPeriod.Fields[2].AsString;
End;

Procedure TDlgKasa.PeriodDelete(i: Integer);
Begin
	With TblPeriod Do Begin
  	First;
  	MoveBy(i);
    Delete;
  End;
End;

Procedure TDlgKasa.IzchisSaldo;
Begin
	Label16.Caption :=
  	FormatFloat('### ### ##0.#0', QrySumaKasa.Fields[0].AsFloat -
	  	QrySumaKasa.Fields[1].AsFloat);
End;

procedure TDlgKasa.FormShow(Sender: TObject);
Var
  n: Integer;
  Max: Integer;
  QryKoop: TQuery;
  FullName: String;
  Ind: String;
begin
	TblPeriod.Active := True;
	TblKasa.Active := True;
  QrySumaKasa.Active := True;

  IzchisSaldo;
	GroupBox2.Caption := 'Наличност в касата към - ' +
  	FormatDateTime('dd/mm/yyyy', Date);
	TblKoop := TTable.Create(Self);
  DlgPrixRaz.CBoxSpisuk.ClearInd;
  CheckKoop := False;
  With TblKoop Do Begin
   	DataBaseName := DBaseName;
    TableName := '1.DB';
    Active := True;
    First;
  End;
  QryKoop := TQuery.Create(Self);
  With QryKoop Do Begin
    DataBaseName := DBaseName;
    SQL.Add('SELECT *');
    SQL.Add('FROM "1.DB"');
    SQL.Add('ORDER BY FName, SName, LName');
    Active := True;
    First;
    While Not(Eof) Do Begin
    	FullName := Fields[1].AsString + ' ' +Fields[2].AsString + ' ' +Fields[3].AsString;
      Ind := Fields[0].AsString;
    	DlgPrixRaz.CBoxSpisuk.AddInd(FullName, Ind);
      DlgChastOtkaz.CBoxSpisuk1.AddInd(FullName, Ind);
      DlgChastOtkaz.CBoxSpisuk2.AddInd(FullName, Ind);
			DlgTeglene.CBoxSpisuk.AddInd(FullName, Ind);
      DlgFullOtkaz.CBoxSpisuk.AddInd(FullName, Ind);
     	Next;
    End;{While}
    Active := False;
  End;{With}
  QryKoop.Destroy;
  TblKarton := TTable.Create(Self);
 	TblKarton.DataBaseName := DBaseName;

  DlgPeriodSpisuk.LBoxPeriod.Items.Clear;
  With TblPeriod Do Begin
  	First;
    Max := 0;
  	For n := 0 To RecordCount - 1 Do Begin
      If Max < Fields[2].AsInteger Then Max := Fields[2].AsInteger;
  		DlgPeriodSpisuk.LBoxPeriod.Items.Add(Fields[3].AsString);
      Next;
    End; {For}
  End;

  QrySort.Active := False;
  QrySort.SQL.Strings[2] := 'WHERE RedNom > ' + IntToStr(Max);
  DtSKasa.DataSet := QrySort;
  QrySort.Active := True;

  Label14.Caption := '';
  Label15.Caption := '';
  GBoxPeriod.Caption := 'Рекапитулация за период:';

  If TblKoop.RecordCount <= 0 Then Begin
  	N2.Enabled := False;
  	N3.Enabled := False;
  	N15.Enabled := False;
  	N5.Enabled := False;
   End
  Else Begin
  	N2.Enabled := True;
  	N3.Enabled := True;
  	N15.Enabled := True;
  	N5.Enabled := True;
  End;

end;

procedure TDlgKasa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	TblKasa.Active := False;
  QrySumaKasa.Active := False;
  QryPeriodSuma.Active := False;
  TblPeriod.Active := False;

	TblKoop.Active := False;
	TblKoop.Destroy;

  TblKarton.Active := False;
  TblKarton.Destroy;
end;

procedure TDlgKasa.EdtPSNameKeyPress(Sender: TObject; var Key: Char);
begin
	CheckKoop := False;
end;

procedure TDlgKasa.N5Click(Sender: TObject);
Var
	n: Integer;
  i: Integer;
  DocNom: String;
  Data: String;
  Suma: String;
  Check: Boolean;
begin
	If DlgPrixRaz.ExecutePrihodKoop(i,DocNom,Data,Suma, Check) = True Then Begin

  	TblKoop.FindKey([i]);
    If Not(Check) Then Begin
    	TblKarton.TableName := TblKoop.Fields[5].AsString + '.DB';
    	TblKarton.Active := True;
  		AddPlachane(TblKarton, 'Каса', DocNom, Suma, StrToDate(Data));
     End
    Else Begin
    	TblKoop.Edit;
    	TblKoop.Fields[7].AsFloat := StrToFloat(Suma) + TblKoop.Fields[7].AsFloat;
      TblKoop.Post
    End;

    With TblKasa Do Begin
    	Last;
			If Fields[0].AsString = '' Then n := 1
    	Else n := StrToInt(Fields[0].AsString) + 1;
    	Append;
    	Fields[0].AsString := IntToStr(n);
    	Fields[1].AsString := DocNom;
    	Fields[3].AsString := Data;
    	Fields[4].AsString := TblKoop.Fields[1].AsString;
    	Fields[5].AsString := TblKoop.Fields[2].AsString;
    	Fields[6].AsString := TblKoop.Fields[3].AsString;
    	Fields[7].AsString := Suma;
    	Post;
    End;{With TblKasa}

  	TblKarton.Active := False;
  	QrySumaKasa.Active := False;
  	QrySumaKasa.Active := True;
    QrySort.Active := False;
    QrySort.Active := True;
    IzchisSaldo;
	End;{If}
end;

procedure TDlgKasa.N8Click(Sender: TObject);
Var
	n: Integer;
  TblPla: TTable;
  FName, SName, LName, DocNom,	Data, Suma: String;
begin
	If DlgPrixRaz.ExecuteRazxodStro(FName, SName, LName,
  	DocNom,	Data, Suma) = True Then Begin
    If StrToFloat(Suma) > (QrySumaKasa.Fields[0].AsFloat -
  		QrySumaKasa.Fields[1].AsFloat) Then Begin
      MessageDlg('Наличните пари в касата недостигат!', mtInformation, [mbOK], 0);
      Exit;
    End;
    With TblKasa Do Begin
  		Last;
    	If Fields[0].AsString = '' Then n := 1
    	Else n := StrToInt(Fields[0].AsString) + 1;
    	Append;
    	Fields[0].AsString := IntToStr(n);
    	Fields[2].AsString := DocNom;
    	Fields[3].AsString := Data;
    	Fields[4].AsString := FName;
    	Fields[5].AsString := SName;
    	Fields[6].AsString := LName;
    	Fields[8].AsString := Suma;
    	Post;
  	End;
  	TblPla := TTable.Create(Self);
  	TblPla.DataBaseName := DBaseName;
  	TblPla.TableName := '9.DB';
  	TblPla.Active := True;
  	With TblPla Do Begin
  		Last;
    	If Fields[0].AsString = '' Then n := 1
    	Else n := StrToInt(Fields[0].AsString) + 1;
    	Append;
    	Fields[0].AsString := IntToStr(n);
    	Fields[1].AsString := TblKasa.Fields[2].AsString;{Док No}
    	Fields[2].AsDateTime := TblKasa.Fields[3].AsDateTime;{Дата}
    	Fields[3].AsFloat := TblKasa.Fields[8].AsFloat;{Стоиност}
    	Fields[4].AsString := 'Каса';
    	Post;
		End;
  	TblPla.Active := False;
  	TblPla.Destroy;
  	QrySumaKasa.Active := False;
  	QrySumaKasa.Active := True;
    QrySort.Active := False;
    QrySort.Active := True;
    IzchisSaldo;
  End;
end;

procedure TDlgKasa.N13Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgKasa.N12Click(Sender: TObject);
Const
  ColSize: Array[0..8] of Integer = (10, 23, 23, 22, 22, 25, 25, 25, 25);
	TextType: Array[0..8] of Byte = (1, 2, 2, 1, 2, 2, 2, 3, 3);
  	{TextType 1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
	TitleText: Array[0..8] of String = ('No', 'Приходен'+#13+'Ордер',
  	'Разходен'+#13+'Ордер' ,'Дата', 'Име', 'Презиме', 'Фамилия',
   	'Приход'+#13+'лв.', 'Разход'+#13+'лв.');
Var
	Prt: TPrinter;
  TblFont: TFont;
  RowCount: Integer;
  RowPage: Integer;
  i: Integer;
  Tbl: TDBDataSet;
  X1, Y1, TempRowPage: Integer;
begin
	If PrintDialog1.Execute Then Begin
		Prt := Printer;
  	TblFont := TFont.Create;

    If QrySort.Active = True Then Tbl := QrySort
    Else Tbl := TblKasa;

  	Tbl.First;
  	With TblFont Do Begin
  		Name := 'Hebar';
    	Size := 12;
    	Color := clBlack
  	End;
  	RowCount := Tbl.RecordCount;
  	If RowCount = 0 Then Exit;
  	Tbl.DisableControls;

   	If Prt.Orientation = poPortrait Then RowPage := 35
  	Else RowPage := 20;

    X1 := 0;

  	Try
  		Prt.BeginDoc;
      Prt.Canvas.Font := TblFont;
    	If (RowCount Div (RowPage - 7)) = 0 Then Begin

      	PrintHeader(Prt, 1, 1);

				PrintTbl(
					Tbl,
					Prt,
					X1,{X1}
  				40,{Y1}
					11,{TitleSize}
					7,{RowSize}
    			RowCount,
  				ColSize,
  				TextType,
          TitleText,
        	TblFont);
    		End
    	Else Begin
				TempRowPage := RowPage;
    		For i := 1 To RowCount Div RowPage Do Begin

        	If i = 1 Then Begin
          	Y1 := 40;
            TempRowPage := TempRowPage - 7;
           End
          Else Begin
          	Y1 := 5;
          	TempRowPage := RowPage;
          End;

          If (RowCount - (RowCount Div RowPage)*RowPage) <> 0 Then
            	PrintHeader(Prt, i, RowCount Div RowPage +1 )
          Else PrintHeader(Prt, i, RowCount Div RowPage);

					PrintTbl(
						Tbl,
						Prt,
						X1,{X1}
  					Y1,{Y1}
						11,{TitleSize}
						7,{RowSize}
    				TempRowPage,{RowCount}
  					ColSize,
  					TextType,
  					TitleText,
  					TblFont);
          	If i <> (RowCount Div TempRowPage) Then Prt.NewPage;
      	End;{FOR i := 1 To RowCount Div RowPage }
      	If (RowCount - (RowCount Div TempRowPage)*TempRowPage) <> 0 Then Begin
      		Prt.NewPage;
          Y1 := 7;
          PrintHeader(Prt, i + 1, i + 1);

          If i = 1 Then TempRowPage := (RowCount - (RowCount Div TempRowPage)*TempRowPage)
          Else TempRowPage := (RowCount - (RowCount Div TempRowPage)*TempRowPage) + 7;

					PrintTbl(
						Tbl,
						Prt,
					 	X1,{X1}
  					Y1,{Y1}
						11,{TitleSize}
						7,{RowSize}
    				TempRowPage,
            ColSize,
  					TextType,
  					TitleText,
  					TblFont);
				End;
    	End;
  	Finally
  		TblFont.Destroy;
    	Tbl.EnableControls;
  	End;{Try}
	End{If PrintDialog.Execute }
end;

procedure TDlgKasa.N6Click(Sender: TObject);
Var
	FName, SName, LName, DocNom, Data, Suma: String;
  n: Integer;
begin
	If DlgPrixRaz.ExecutePrihodDrugo(FName, SName, LName, DocNom,
		Data, Suma) = True Then Begin
    With TblKasa Do Begin
  		Last;
    	If Fields[0].AsString = '' Then n := 1
    	Else n := StrToInt(Fields[0].AsString) + 1;
    	Append;
    	Fields[0].AsString := IntToStr(n);
    	Fields[1].AsString := DocNom;
    	Fields[3].AsString := Data;
    	Fields[4].AsString := FName;
    	Fields[5].AsString := SName;
    	Fields[6].AsString := LName;
    	Fields[7].AsString := Suma;
    	Post;
  	End;
  	QrySumaKasa.Active := False;
  	QrySumaKasa.Active := True;
    QrySort.Active := False;
    QrySort.Active := True;
    IzchisSaldo;
  End;
end;

procedure TDlgKasa.N9Click(Sender: TObject);
Var
	FName, SName, LName, DocNom, Data, Suma: String;
  n: Integer;
begin
	If DlgPrixRaz.ExecuteRazxodDrugo(FName, SName, LName, DocNom,
		Data, Suma) = True Then Begin
    If StrToFloat(Suma) > (QrySumaKasa.Fields[0].AsFloat -
  		QrySumaKasa.Fields[1].AsFloat) Then Begin
      MessageDlg('Наличните пари в касата недостигат!', mtInformation, [mbOK], 0);
      Exit;
    End;
    With TblKasa Do Begin
  		Last;
    	If Fields[0].AsString = '' Then n := 1
    	Else n := StrToInt(Fields[0].AsString) + 1;
    	Append;
    	Fields[0].AsString := IntToStr(n);
    	Fields[2].AsString := DocNom;
    	Fields[3].AsString := Data;
    	Fields[4].AsString := FName;
    	Fields[5].AsString := SName;
    	Fields[6].AsString := LName;
    	Fields[8].AsString := Suma;
    	Post;
  	End;
   	QrySumaKasa.Active := False;
  	QrySumaKasa.Active := True;
    QrySort.Active := False;
    QrySort.Active := True;
    IzchisSaldo;
  End;
end;

procedure TDlgKasa.N2Click(Sender: TObject);
Label
	JumpSuma;
Var
	DocNom,	Data: String;
  Suma: Single;
	i, n: Integer;
  TblAll: TTable;
  Code: Integer;
  PlVnoska: Real;
  v: Integer;
begin
	If DlgFullOtkaz.ExecuteOtkazSobst(i,DocNom,Data,Suma) = True Then Begin
    If Suma > (QrySumaKasa.Fields[0].AsFloat -
  		QrySumaKasa.Fields[1].AsFloat) Then Begin
      MessageDlg('Наличните пари в касата недостигат!', mtInformation, [mbOK], 0);
      Exit;
    End;
  	TblKoop.FindKey([i]);
    TblKarton.TableName := TblKoop.Fields[5].AsString + '.DB';
    TblKarton.Active := True;
    TblKarton.First;

    If TblKarton.RecordCount > 0 Then
			With TblKarton Do Begin
    		Repeat
    			Val(Fields[0].AsString, PlVnoska, Code);
        	If Code = 0 Then Begin
          	Edit;
          	For v := 3 To 11 Do	Fields[v].AsString := '';
            Post;
            Next;
           End
          Else Delete;
      	Until EOF = True;
        Active := False;
 			End;{With TblKoop}


		If Suma > 0.009 Then
    	With TblKasa Do Begin
    		Last;
				If Fields[0].AsString = '' Then n := 1
    		Else n := StrToInt(Fields[0].AsString) + 1;
    		Append;
    		Fields[0].AsString := IntToStr(n);
    		Fields[2].AsString := DocNom;
    		Fields[3].AsString := Data;
    		Fields[4].AsString := TblKoop.Fields[1].AsString;
    		Fields[5].AsString := TblKoop.Fields[2].AsString;
    		Fields[6].AsString := TblKoop.Fields[3].AsString;
    		Fields[8].AsFloat := Suma;
    		Post;
    	End;{With TblKasa}

    {Изчиства всички данни за кооператора}
    TblAll := TTable.Create(Self);
    With TblAll Do Begin
			DataBaseName := DBaseName;

      TableName := '1.DB';
      Active := True;
      FindKey([i]);
      Edit;
      For n := 1 To 3 Do Fields[n].AsString := 'XXXXX';
      Fields[7].AsString := '';
      Post;
      Active := False;

      TableName := '2.DB';
      Active := True;
      FindKey([i]);
      Edit;
      For n := 1 To FieldCount - 1 Do Fields[n].AsString := '';
      Post;
      Active := False;

      TableName := '3.DB';
      Active := True;
      FindKey([i]);
      Edit;
      For n := 1 To FieldCount - 1 Do Fields[n].AsString := '';
      Post;
      Active := False;

      TableName := '4.DB';
      Active := True;
      FindKey([i]);
      Edit;
      For n := 1 To FieldCount - 1 Do Fields[n].AsString := '';
      Post;
      Active := False;

    End;{With TblAll}
    TblAll.Destroy;
    {------------------------------------}
  	TblKarton.Active := False;
		QrySumaKasa.Active := False;
  	QrySumaKasa.Active := True;
    QrySort.Active := False;
    QrySort.Active := True;
    IzchisSaldo;
	End;{If}
end;

procedure TDlgKasa.N3Click(Sender: TObject);
begin
	DlgChastOtkaz.Execute;
end;

procedure TDlgKasa.N15Click(Sender: TObject);
begin
	If DlgTeglene.Execute Then Begin
  	QrySumaKasa.Active := False;
  	QrySumaKasa.Active := True;
    QrySort.Active := False;
    QrySort.Active := True;
    IzchisSaldo;
  End;
end;

procedure TDlgKasa.DGrdKasaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	Exit;
	If (Key = 46)And(Shift = [ssCtrl]) Then Key := 1;
end;

procedure TDlgKasa.N17Click(Sender: TObject);
begin
	Sorting('ORDER BY Data');
end;

procedure TDlgKasa.N18Click(Sender: TObject);
begin
	Sorting('ORDER BY FName, SName, LName');
end;

procedure TDlgKasa.N20Click(Sender: TObject);
begin
	QrySort.Active := False;
	QrySort.SQL.Strings[3] := 'ORDER BY RedNom';
  QrySort.Active := True;
end;

procedure TDlgKasa.N22Click(Sender: TObject);
begin
	Sorting('ORDER BY RazOrderNom');
end;

procedure TDlgKasa.N26Click(Sender: TObject);
Var
	Per_Ot, Per_Do: Word;
  n: Integer;
  Zaglav: String;
begin
	If DlgNewPeriod.Execute(Per_Ot, Per_Do, Zaglav) Then Begin
  	With TblPeriod Do Begin
    	Last;
      n := Fields[0].AsInteger + 1;
			Append;
      Fields[0].AsInteger := n;
      Fields[1].AsInteger := Per_Ot;
      Fields[2].AsInteger := Per_Do;

      If (Zaglav = '') or (Zaglav = ' ') Then 
      	Fields[3].AsString := 'от '+IntToStr(Per_Ot) +' до ' + IntToStr(Per_Do)
      Else
				Fields[3].AsString := 'от '+IntToStr(Per_Ot) +
      	 ' до ' + IntToStr(Per_Do)+ ' - ' + Zaglav;
      If State in [dsInsert] Then Post;
      DlgPeriodSpisuk.LBoxPeriod.Items.Add(Fields[3].AsString);
      PeriodSelect(DlgPeriodSpisuk.LBoxPeriod.Items.Count - 1);
    End;{With}
  End;{If}
end;

procedure TDlgKasa.N27Click(Sender: TObject);
Var
	i: Integer;
begin
	If DlgPeriodSpisuk.ExecuteListDelete(i, True) Then Begin
  	PeriodSelect(i);
  end;{If }
end;

Procedure TDlgKasa.PrintHeader(Prt: TPrinter; PageNumber: Integer;
	CountPage: Integer);
Const
  Incs: Real = 2.53;{mm}
Var
  DpiX, DpiY: Integer;
  S: String;
  A: Array[0..400] Of Char;
  Rect: TRect;
  DX, DY: Real;
begin

  DpiX := GetDeviceCaps(Prt.Handle, LOGPIXELSX);
  DpiY := GetDeviceCaps(Prt.Handle, LOGPIXELSY);

  DX := ((1/10)/Incs)*DpiX;
  DY := ((1/10)/Incs)*DpiY;

	With Prt.Canvas Do Begin
  	{------Pages--------------}
    If PageNumber > 1 Then Begin
    	TextOut(0 ,0, IntToStr(PageNumber)+' # ' + IntToStr(CountPage) +' - '+
    		FormatDateTime('dd/mm/yyyy', Date));
    	Exit;
     End
    Else TextOut(0 ,0, IntToStr(PageNumber)+' # ' + IntToStr(CountPage));
    {----------Title----------}
    Font.Size := 14;
    Font.Style := [fsBold, fsUnderLine];

    Rect.Top :=0;
    Rect.Bottom := Round(14*DY);
    Rect.left := 0;
    Rect.Right := Round(GetDeviceCaps(Prt.Handle, HORZSIZE)*DX);

    S := 'КАСОВА КНИГА - ' + FormatDateTime('dd/mm/yyyy', Date);
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_CENTER);
         {--------------------------------}
    Font.Style := [fsBold];

    Rect.Top :=Round(7*DY);
    Rect.Bottom := Rect.Top + Round(7*DY);
    Rect.left := 0;
    Rect.Right := Round(100*DX);

    S := GBoxPeriod.Caption;
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_CENTER);
         {--------------------------------}

    Rect.left := Rect.Right;
    Rect.Right := Round(GetDeviceCaps(Prt.Handle, HORZSIZE)*DX);;

    S := 'Наличност в касата';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_CENTER);

			{---Inicialize---}
    Font.Size := 12;
    Font.Style := [];
    Rect.Top :=0;
    Rect.Bottom := 0;
    Rect.left := 0;
    Rect.Right := 0;
    {-------------------Начално салдо-------------------------------}
    Rect.Top := Round(15*DY);
  	Rect.Bottom := Rect.Top + Round(7*DY);
		{----------------------------------------}
  	Rect.left := 0;
  	Rect.Right := Rect.Left + Round(35*DX);

    Font.Style := [fsBold];
    S := 'Начално салдо:';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);

    Font.Style := [];
  	Rect.left := Rect.Right;
  	Rect.Right := Rect.Left + Round(30*DX);

    S := Label14.Caption + 'лв';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);
    {-------------------Приход/Разход--------------------------}
    Rect.Top := Rect.Top + Round(7*DY);
  	Rect.Bottom := Rect.Top + Round(7*DY);
    {-------------------------------------}
  	Rect.left := 0;
  	Rect.Right := Rect.Left + Round(35*DX);

    Font.Style := [fsBold];
    S := 'Приход/Разход:';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);

    Font.Style := [];
    Rect.left := Rect.Right;
  	Rect.Right := Rect.Left + Round(50*DX);

    S := Format('%n' ,[QryPeriodSuma.Fields[0].AsFloat]) + 'лв.  / '+
    	Format('%n' ,[QryPeriodSuma.Fields[1].AsFloat]) + 'лв.';

    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);
    {-------------------Крайно салдо---------------------------}
    Rect.Top := Rect.Top + Round(7*DY);
  	Rect.Bottom := Rect.Top + Round(7*DY);
    {-------------------------------------}
  	Rect.left := 0;
  	Rect.Right := Rect.Left + Round(35*DX);

    Font.Style := [fsBold];
    S := 'Крайно салдо:';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);

    Font.Style := [];
    Rect.left := Rect.Right;
  	Rect.Right := Rect.Left + Round(30*DX);

    S := Label15.Caption + 'лв.';

    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);

    {-------------------Приход-------------------------------}
    Rect.Top := Round(15*DY);
  	Rect.Bottom := Rect.Top + Round(7*DY);
		{----------------------------------------}
  	Rect.left := Round(110*DX);
  	Rect.Right := Rect.Left + Round(35*DX);

    Font.Style := [fsBold];
    S := 'Приход:';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);

    Font.Style := [];
  	Rect.left := Rect.Right;
  	Rect.Right := Rect.Left + Round(30*DX);

    S := Format('%n' ,[QrySumaKasa.Fields[0].AsFloat]) + 'лв';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);
    {-------------------Разход-------------------------------}
    Rect.Top := Rect.Bottom;
  	Rect.Bottom := Rect.Top + Round(7*DY);
		{----------------------------------------}
  	Rect.left := Round(110*DX);
  	Rect.Right := Rect.Left + Round(35*DX);

    Font.Style := [fsBold];
    S := 'Разход:';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);

    Font.Style := [];
  	Rect.left := Rect.Right;
  	Rect.Right := Rect.Left + Round(30*DX);

    S := Format('%n' ,[QrySumaKasa.Fields[1].AsFloat]) + 'лв.';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);
    {-------------------Общо крайно салдо-------------------------}
    Rect.Top := Rect.Bottom;
  	Rect.Bottom := Rect.Top + Round(7*DY);
		{----------------------------------------}
  	Rect.left := Round(110*DX);
  	Rect.Right := Rect.Left + Round(35*DX);

    Font.Style := [fsBold];
    S := 'Крайно салдо:';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);

    Font.Style := [];
  	Rect.left := Rect.Right;
  	Rect.Right := Rect.Left + Round(30*DX);

    S :=  Label16.Caption + 'лв.';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);
  End;
End;

procedure TDlgKasa.TblKasaAfterDelete(DataSet: TDataset);
begin
  QrySumaKasa.Active := False;
  QrySumaKasa.Active := True;
  IzchisSaldo;
end;

procedure TDlgKasa.N28Click(Sender: TObject);
Var
	Max, n: Integer;
begin
  With TblPeriod Do Begin
  	First;
    Max := 0;
  	For n := 0 To RecordCount - 1 Do Begin
      If Max < Fields[2].AsInteger Then Max := Fields[2].AsInteger;
      Next;
    End; {For}
  End;
   
  QryPeriodSuma.Active := False;
  QryNSalSuma.Active := False;
  Label14.Caption := '0.00';
  Label15.Caption := '0.00';
  GBoxPeriod.Caption := 'Рекапитулация за период:';

  QrySort.Active := False;
  QrySort.SQL.Strings[2] := 'WHERE RedNom > ' + IntToStr(Max);
  DtSKasa.DataSet := QrySort;
  QrySort.Active := True;
end;

procedure TDlgKasa.N30Click(Sender: TObject);
Var
	QryInfo: TQuery;
  CPrihod: String;
  CRazhod: String;
  Sum: Word;
begin
	QryInfo := TQuery.Create(Self);
 	Try
  	With QryInfo Do Begin
  		DataBaseName := DBaseName;
    	SQL.Add('Select Count(A.PriOrderNom) FROM "7.DB" A WHERE A.PriOrderNom <> ""');
    	Active := True;
    	CPrihod := Fields[0].AsString;
      Sum := Fields[0].AsInteger;
    	Active := False;
 	 	End;
  	With QryInfo Do Begin
    	SQL.Strings[0] := 'Select Count(A.RazOrderNom) FROM "7.DB" A WHERE A.RazOrderNom <> ""';
    	Active := True;
    	CRazhod := Fields[0].AsString;
      Sum := Sum + Fields[0].AsInteger;
      Active := False;
  	End;
    MessageDlg('Брой приходни документи: '+CPrihod+#13+
    	'Брой разходни документи: '+CRazhod+#13+
      'Общо въведени документи: '+IntToStr(Sum),
       mtInformation, [mbOK], 0);
 	Finally
  	QryInfo.Destroy;
 	End;
end;

procedure TDlgKasa.N31Click(Sender: TObject);
begin
	QrySort.Active := False;

  TblKasa.Active := True;
  DtsKasa.DataSet := TblKasa;
  QrySort.SQL.Strings[2] := '';

  QryPeriodSuma.Active := False;
  QryNSalSuma.Active := False;
  Label14.Caption := '0.00';
  Label15.Caption := '0.00';
  GBoxPeriod.Caption := 'Рекапитулация за период:';
end;

procedure TDlgKasa.N21Click(Sender: TObject);
Var
	i: Integer;
begin
	If DlgPeriodSpisuk.ExecuteListDelete(i, False) Then Begin
    DlgPeriodSpisuk.LBoxPeriod.Items.Delete(i);
  	PeriodDelete(i);
  end;{If }
end;

procedure TDlgKasa.FormCreate(Sender: TObject);
begin
	ProgOptions.OpenWindowExt(Self, Self.Name);
end;

procedure TDlgKasa.FormDestroy(Sender: TObject);
begin
	ProgOptions.SaveWindowExt(Self, Self.Name);
end;

end.

