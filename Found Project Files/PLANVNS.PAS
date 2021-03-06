unit PlanVns;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, DBTables, DB, StdCtrls, Mask,
  DBCtrls, ExtCtrls, Buttons, Menus, Printers, LabelRegDim, DBTextRegDim;

type
  TDlgPlanVns = class(TForm)
    DtSStroitel: TDataSource;
    TblStroitel: TTable;
    TblPlachane: TTable;
    DtSPlachane: TDataSource;
    TblStroitelRedNom: TStringField;
    TblStroitelDataBegin: TDateField;
    TblStroitelIskanaSum: TCurrencyField;
    TblStroitelDataEnd: TDateField;
    DGrdStroitel: TDBGrid;
    PnlStatus: TPanel;
    GBoxPlachane: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    QryPlachane: TQuery;
    DtSQryPlachane: TDataSource;
    QryPlachaneSUMofStoinost: TCurrencyField;
    QryStroitel: TQuery;
    DtSQryStroitel: TDataSource;
    QryStroitelSUMofIskanaSum: TCurrencyField;
    QrySumaOrder: TQuery;
    DtSSumaOrder: TDataSource;
    QrySumaBanka: TQuery;
    DtSSumaBanka: TDataSource;
    QrySumaOrderSUMofStoinost: TCurrencyField;
    QrySumaBankaSUMofStoinost: TCurrencyField;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    DBTextRec1: TDBTextRec;
    DBTextRec2: TDBTextRec;
    DBTextRec3: TDBTextRec;
    DBTextRec4: TDBTextRec;
    QrySortPlachane: TQuery;
    QrySortPlachaneRedNom: TStringField;
    QrySortPlachaneDocNom: TStringField;
    QrySortPlachaneData: TDateField;
    QrySortPlachaneStoinost: TCurrencyField;
    QrySortPlachaneVidPl: TStringField;
    N9: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    DGrdPlachane: TDBGrid;
    LabelRec1: TLabelRec;
    LabelRec6: TLabelRec;
    Bevel1: TBevel;
    TblPlachaneRedNom: TStringField;
    TblPlachaneDocNom: TStringField;
    TblPlachaneData: TDateField;
    TblPlachaneStoinost: TCurrencyField;
    TblPlachaneVidPl: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure GBoxPlachaneMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DGrdStroitelMouseMove(Sender: TObject; X, Y: Integer);
    procedure DGrdPlachaneMouseMove(Sender: TObject; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  	TblKarton: TTable;
  	TblKoop: TTable;
		Procedure AddPlanVnoska(NaData, DoData: TDateTime; Suma: Real);
		Procedure PrintHeader(Prt: TPrinter; PageNumber: Integer;
    	CountPage: Integer; Vid: String);
  public
    { Public declarations }
  end;

var
  DlgPlanVns: TDlgPlanVns;

implementation

{$R *.DFM}

Uses Karton, KprStroi, StrBank, Listprt, PrtStPl, MyConst, SetupReg;

procedure TDlgPlanVns.FormShow(Sender: TObject);
begin
	GBoxPlachane.Caption := 'Плащания към - ' +
  	FormatDateTime('dd/mm/yyyy',	Date);

	TblPlachane.Active := True;
  DtsPlachane.DataSet := TblPlachane;

  TblStroitel.Active := True;

  QryPlachane.Active := True;
  QryStroitel.Active := True;
  QrySumaOrder.Active := True;
  QrySumaBanka.Active := True;

  TblKarton := TTable.Create(Self);
	With TblKarton Do Begin
  	DataBaseName := DBaseName;
  End;

  TblKoop := TTable.Create(Self);
  With TblKoop Do Begin
  	DataBaseName := DBaseName;
  	TableName := '1.DB';
    Active := True
  End;

  If TblKoop.RecordCount = 0 Then Begin
  	N4.Enabled := False;
    N8.Enabled := False;
   End
  Else Begin
  	N4.Enabled := True;
    N8.Enabled := True;
  End;
  TblKoop.Active := False
end;

procedure TDlgPlanVns.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	TblKarton.Active := False;
  TblKoop.Active := False;

  TblKarton.Destroy;
  TblKoop.Destroy;

	TblPlachane.Active := False;
  TblStroitel.Active := False;

  QryPlachane.Active := False;
  QryStroitel.Active := False;
  QrySumaOrder.Active := False;
  QrySumaBanka.Active := False;
  QrySortPlachane.Active := False;
end;

procedure TDlgPlanVns.N4Click(Sender: TObject);
Var
	NaData: TDateTime;
  DoData: TDateTime;
  Suma: Real;
begin
	if DlgStrBank.ExecutePlanVnoska(NaData, DoData, Suma) Then Begin
  	AddPlanVnoska(NaData, DoData, Suma);
  End;
end;

procedure TDlgPlanVns.N3Click(Sender: TObject);
Var
	DokNom: String;
  Data: TDateTime;
  Suma: Real;
  n: Integer;
begin
	If DlgStrBank.ExecuteStroiBanka(DokNom, Data, Suma) Then begin
  	QryPlachane.Active := False;
  	QrySumaOrder.Active := False;
  	QrySumaBanka.Active := False;
		With TblPlachane Do Begin
  		Last;
    	If Fields[0].AsString = '' Then n := 1
    	Else n := StrToInt(Fields[0].AsString) + 1;
    	Append;
			Fields[0].AsString := IntToStr(n);
    	Fields[1].AsString := DokNom;
    	Fields[2].AsDateTime := Data;
    	Fields[3].AsFloat := Suma;
    	Fields[4].AsString := 'Банка';
    	Post;
  	End;
  	QryPlachane.Active := True;
  	QrySumaOrder.Active := True;
  	QrySumaBanka.Active := True;;
	End;{If Execute}
end;

procedure TDlgPlanVns.N5Click(Sender: TObject);
begin
	Close;
end;

Procedure TDlgPlanVns.AddPlanVnoska(NaData, DoData: TDateTime; Suma: Real);
Var
	n: Integer;
  SumaKoop: Real;
  CheckExit: Boolean;
  CheckEmpty: Boolean;
  Per: Integer;
  Nak_Lixva: Real;
  DokNom: String;
  Data: TDateTime;
  VnesenaSuma: Real;
  VidPl: String;
  Sal: String;
{----------------------}
  CheckLixvaExit: Boolean;
  SalLixva: String;
  SumaLihvaPl: Real;

  DocLixvaPl: String;
  DataLixvaPl: TDateTime;
  VidLixPl: String;
{----------------------}

	Move: Integer;
  i: Integer;
begin
  QryStroitel.Active := False;
  With TblStroitel Do Begin
  	If RecordCount = 0 Then n := 1
    Else Begin
  		Last;
  		n := Fields[0].AsInteger + 1;
    End;
    Append;
    Fields[0].AsInteger := n;
    Fields[1].AsDateTime := NaData;
    Fields[2].AsFloat := Suma;
    Fields[3].AsDateTime := DoData;
    Post;
  End;{With}
  QryStroitel.Active := True;
	With TblKarton Do Begin
  	TblKoop.Active := True;
    TblKoop.First;
  	While Not(TblKoop.Eof) Do Begin
    	TableName := TblKoop.Fields[5].AsString + '.DB';

      Active := True;
      First;
      Move := 0;
      For i := 0 To RecordCount - 1 Do Begin
      	If Fields[10].AsString <> '' Then Move := i;
        Next;
      End;
      First;
      MoveBy(Move);
      SumaKoop := Suma * (TblKoop.Fields[6].AsFloat/SumIdlChast);
      Sal := '';
      CheckExit := False;
      Repeat
      	CheckEmpty := False;
      	While Not(Eof) And Not(CheckEmpty) Do Begin
					If (Fields[2].AsString = '') And (Fields[0].AsString <> 'X') And
          	(Fields[9].AsString = '') Then CheckEmpty := True
          Else Next;
      	End;
        If CheckEmpty Then Begin{Намерен е паразен ред}
        	Edit;
          If Sal = 'Сал.' Then Fields[0].AsString := 'Сал.'
          Else Fields[0].AsString := IntToStr(n);
          Fields[1].AsFloat := SumaKoop;
          Fields[2].AsDateTime := DoData;
          If SumaKoop > Fields[5].AsFloat Then Begin
          	If DoData >= Fields[4].AsDateTime Then Begin
              SumaKoop := SumaKoop - Fields[5].AsFloat;
             End
            Else Begin {Data1 < Data2}
            	Per :=  Period(Fields[4].AsDateTime, DoData);
              Fields[7].AsInteger := Per;
              Nak_Lixva := ((Lixva/365)*Per)*SumaKoop;
              Fields[8].AsFloat := Nak_Lixva;
              Data := Fields[4].AsDateTime;{Error ------ }
              Post;
              SumaKoop := SumaKoop - Fields[5].AsFloat;
              {-------------Lixva----------------}
              CheckLixvaExit := False;
              SalLixva := 'Н.Л';
//              SumaLihvaPl := 0;
              Repeat
              	Next;
              	If EOF Then Begin
              		Append;
               		Fields[0].AsString := SalLixva;
                	Fields[1].AsFloat := Nak_Lixva;
                	Fields[2].AsDateTime := Data;
                  Post;
                	CheckLixvaExit := True
               	 End
              	Else Begin
              		Edit;
                	Fields[0].AsString := SalLixva;
                	Fields[1].AsFloat := Nak_Lixva;
                	Fields[2].AsDateTime := Data;
                  Post;
                	If Nak_Lixva > Fields[5].AsFloat Then Begin
										Nak_Lixva := Nak_Lixva - Fields[5].AsFloat;
                    SalLixva := 'Сал.'
                	 End
                  Else Begin
                  	SumaLihvaPl := Fields[5].AsFloat - Nak_Lixva;
                    If SumaLihvaPl > 0.009 Then Begin
                    	Edit;
                      Fields[5].AsFloat := Nak_Lixva;
                      Post;
											DocLixvaPl := Fields[3].AsString;
                    	DataLixvaPl := Fields[4].AsDateTime;
                      VidLixPl := Fields[6].AsString;
                    	Next;
                      If EOF Then Append Else Insert;
                      Fields[3].AsString := DocLixvaPl;
                			Fields[4].AsDateTime := DataLixvaPl;
                			Fields[5].AsFloat := SumaLihvaPl;
                      Fields[6].AsString := VidLixPl;
                      Post;
                    End{If SumaLihvaVnski > 0.009 };
                   	CheckLixvaExit := True;
                  End;{If Nak_Lixva ? Fields[5].AsFloat}
              	End;{If EOF}
              Until CheckLixvaExit = True;
              {-----------------------------}
            End;{Data1 ? Data2}
            Sal := 'Сал.';
            If State in [dsEdit, dsInsert] Then Post;
           End{if SumaKoop > Fields[5].AsFloat}
          Else Begin
        		If SumaKoop < Fields[5].AsFloat Then Begin
            	If DoData >= Fields[4].AsDateTime Then Begin
                DokNom := Fields[3].AsString;
                Data := Fields[4].AsDateTime;
                VnesenaSuma := Fields[5].AsFloat;
                Fields[5].AsFloat  := SumaKoop;
                VidPl := Fields[6].AsString;
              	Post; Next;
                If Eof Then Append
                Else Insert;
                Fields[3].AsString := DokNom;
                Fields[4].AsDateTime := Data;
                Fields[5].AsFloat := VnesenaSuma - SumaKoop;
                Fields[6].AsString := VidPl;
                Post;
                CheckExit := True;
               End{Data1 >= Data2}
              Else Begin{Data1 < Data2}
            		Per :=  Period(Fields[4].AsDateTime, DoData);
              	Fields[7].AsInteger := Per;
              	Nak_Lixva := ((Lixva/365)*Per)*SumaKoop;
              	Fields[8].AsFloat := Nak_Lixva;
                DokNom := Fields[3].AsString;
                Data := Fields[4].AsDateTime;
                VnesenaSuma := Fields[5].AsFloat;
                Fields[5].AsFloat := SumaKoop;
                VidPl := Fields[6].AsString;
              	Post;
                Next;
                If Eof Then Append
                Else Insert;
                Fields[3].AsString := DokNom;
                Fields[4].AsDateTime := Data;
                Fields[5].AsFloat := VnesenaSuma - SumaKoop;
                Fields[6].AsString := VidPl;
                Post;
           	{-------------Lixva----------------}
              	CheckLixvaExit := False;
              	SalLixva := 'Н.Л';
//              	SumaLihvaPl := 0;
                Prior;
              	Repeat
              		Next;
              		If EOF Then Begin
              			Append;
               			Fields[0].AsString := SalLixva;
                		Fields[1].AsFloat := Nak_Lixva;
                		Fields[2].AsDateTime := DoData;
                  	Post;
                		CheckLixvaExit := True
               	 	End
              		Else Begin
              			Edit;
                		Fields[0].AsString := SalLixva;
                		Fields[1].AsFloat := Nak_Lixva;
                		Fields[2].AsDateTime := DoData;
                  	Post;
                		If Nak_Lixva > Fields[5].AsFloat Then Begin
											Nak_Lixva := Nak_Lixva - Fields[5].AsFloat;
                    	SalLixva := 'Сал.';
                	 	 End
                    Else Begin
                  		SumaLihvaPl := Fields[5].AsFloat - Nak_Lixva;
                    	If SumaLihvaPl > 0.009 Then Begin
                    		Edit;
                      	Fields[5].AsFloat := Nak_Lixva;
                      	Post;
												DocLixvaPl := Fields[3].AsString;
                    		DataLixvaPl := Fields[4].AsDateTime;
                        VidLixPl := Fields[6].AsString;
                    		Next;
                      	If EOF Then Append Else Insert;
                      	Fields[3].AsString := DocLixvaPl;
                				Fields[4].AsDateTime := DataLixvaPl;
                				Fields[5].AsFloat := SumaLihvaPl;
                        Fields[6].AsString := VidLixPl;
                      	Post;
                    	End{If SumaLihvaVnski > 0.009 };
                   		CheckLixvaExit := True;
                  	End;{If Nak_Lixva ? Fields[5].AsFloat}
              		End;{If EOF}
              	Until CheckLixvaExit = True;
              	{-----------------------------}
                CheckExit := True;
              End;{Data1 ? Data2}
             End{SumaKoop < Fields[5].AsFloat}
            Else Begin{If SumaKoop = Fields[5].AsFloat}
							If DoData >= Fields[4].AsDateTime Then Begin
                Post;
                CheckExit := True;
               End{Data1 >= Data2}
              Else Begin {Data1 < Data2}
            		Per :=  Period(Fields[4].AsDateTime, DoData);
              	Fields[7].AsInteger := Per;
              	Nak_Lixva := ((Lixva/365)*Per)*SumaKoop;
              	Fields[8].AsFloat := Nak_Lixva;
                Post;
           			{-------------Lixva----------------}
              	CheckLixvaExit := False;
              	SalLixva := 'Н.Л';
//              	SumaLihvaPl := 0;
              	Repeat
              		Next;
              		If EOF Then Begin
              			Append;
               			Fields[0].AsString := SalLixva;
                		Fields[1].AsFloat := Nak_Lixva;
                		Fields[2].AsDateTime := DoData;
                  	Post;
                		CheckLixvaExit := True
               	 	End
              		Else Begin
              			Edit;
                		Fields[0].AsString := SalLixva;
                		Fields[1].AsFloat := Nak_Lixva;
                		Fields[2].AsDateTime := DoData;
                  	Post;
                		If Nak_Lixva > Fields[5].AsFloat Then Begin
											Nak_Lixva := Nak_Lixva - Fields[5].AsFloat;
                    	SalLixva := 'Сал.';
                	 	 End
                    Else Begin
                  		SumaLihvaPl := Fields[5].AsFloat - Nak_Lixva;
                    	If SumaLihvaPl > 0.009 Then Begin
                    		Edit;
                      	Fields[5].AsFloat := Nak_Lixva;
                      	Post;
												DocLixvaPl := Fields[3].AsString;
                    		DataLixvaPl := Fields[4].AsDateTime;
                        VidLixPl := Fields[6].AsString;
                    		Next;
                      	If EOF Then Append Else Insert;
                      	Fields[3].AsString := DocLixvaPl;
                				Fields[4].AsDateTime := DataLixvaPl;
                				Fields[5].AsFloat := SumaLihvaPl;
                        Fields[6].AsString := VidLixPl;
                      	Post;
                    	End{If SumaLihvaVnski > 0.009 };
                   		CheckLixvaExit := True;
                  	End;{If Nak_Lixva ? Fields[5].AsFloat}
              		End;{If EOF}
              	Until CheckLixvaExit = True;
              	{-----------------------------}
                CheckExit := True;
              End;{Data1 ? Data2}
            End;{If SumaKoop ? < Fields[5].AsFloat}
          End;{If SumaKoop ? Fields[5].AsFloat}
         End{Намерен е паразен ред}
        Else Begin{Не е намерен празен ред}
        	Append;
          If Sal = 'Сал.' Then Fields[0].AsString := 'Сал.'
          Else   Fields[0].AsString := IntToStr(n);
          Fields[1].AsFloat := SumaKoop;
          Fields[2].AsDateTime := DoData;
          Post;
          CheckExit := True;
        End;
      Until CheckExit = True;
      TblKoop.Next;
      TblKarton.Active := False;
    End;{While Not(TblKoop.Eof)}
  End;{With TblKarton}
end;

procedure TDlgPlanVns.N8Click(Sender: TObject);
Var
	i: Integer;
  Tbl: TDBDataSet;
	Prt: TPrinter;
  TblFont: TFont;
  RowCount: Integer;
	RowPage: Integer;
  TempRowPage: Integer;
  X1, Y1: Integer;

  ColSize: Array[0..4] of Integer;
  TextType: Array[0..4] Of Byte;
  TitleText: Array[0..4] Of String;
  SizeArray: Integer;

  Vid: String;
begin
	If Not(DlgPrintPlanStr.Execute(i)) Then Exit;
  Case i Of
  	0: Begin
    	Tbl := TblStroitel;
      ColSize[0] := 7;  TextType[0] := 1; TitleText[0] := 'No';
      ColSize[1] := 22; TextType[1] := 1; TitleText[1] := 'Дата';
      ColSize[2] := 33; TextType[2] := 3; TitleText[2] := 'Искана'+#13+'Сума(лв)';
      ColSize[3] := 22; TextType[3] := 1; TitleText[3] := 'Краен'+#13+'Срок';
      Vid := 'УСЛОВИЯ НА СТРОИТЕЛЯ';
      SizeArray := 3;
    End;{0}
    1: Begin

    	If TblPlachane.Active Then Tbl := TblPlachane
      Else Tbl := QrySortPlachane;

      ColSize[0] := 7;  TextType[0] := 1; TitleText[0] := 'No';
      ColSize[1] := 25; TextType[1] := 2; TitleText[1] := 'Документ'+#13+'No';
      ColSize[2] := 22; TextType[2] := 1; TitleText[2] := 'Дата';
      ColSize[3] := 33; TextType[3] := 3; TitleText[3] := 'Сума'+#13+'(лв)';
      ColSize[4] := 15; TextType[4] := 1; TitleText[4] := 'Вид';
      Vid := 'ПЛАЩАНИЯ ЗА СТРОИТЕЛСТВОТО';
      SizeArray := 4;
    End;{1}
  End;{Case i}
	Prt := Printer;
  TblFont := TFont.Create;
  Tbl.First;
  With TblFont Do Begin
  	Name := 'Hebar';
    Size := 12;
    Color := clBlack
  End;
  RowCount := Tbl.RecordCount;
  If RowCount = 0 Then Begin
  	MessageDlg('Таблицата е празна',  mtInformation, [mbOk], 0);
  	Exit;
  End;

  If Prt.Orientation = poPortrait Then RowPage := 35
  Else RowPage := 20;

  X1 := 0;

  Try
  	Prt.BeginDoc;
    Prt.Canvas.Font := TblFont;


		If (RowCount Div (RowPage - 5)) = 0 Then Begin

    	PrintHeader(Prt, 1, 1, Vid);

			PrintTbl(
				Tbl,
				Prt,
				X1,{X1}
  			30,{Y1}
				11,{TitleSize}
				7,{RowSize}
    		RowCount,
        SizeArray,
  			ColSize,
  			TextType,
  			TitleText,
  			TblFont);
    	End
    Else Begin
			TempRowPage := RowPage;
    	For i := 1 To RowCount Div RowPage Do Begin

        	If i = 1 Then Begin
          	Y1 := 30;
            TempRowPage := TempRowPage - 5;
           End
          Else Begin
          	Y1 := 5;
          	TempRowPage := RowPage;
          End;

          If (RowCount - (RowCount Div RowPage)*RowPage) <> 0 Then
            	PrintHeader(Prt, i, RowCount Div RowPage +1, Vid)
          Else PrintHeader(Prt, i, RowCount Div RowPage, Vid);

					PrintTbl(
						Tbl,
						Prt,
						X1,{X1}
  					Y1,{Y1}
						11,{TitleSize}
						7,{RowSize}
    				TempRowPage,{RowCount}
        		SizeArray,
  					ColSize,
  					TextType,
  					TitleText,
  					TblFont);
          	If i <> (RowCount Div TempRowPage) Then Prt.NewPage;

    	End;{FOR i := 1 To RowCount Div RowPage }

			If (RowCount - (RowCount Div TempRowPage)*TempRowPage) <> 0 Then Begin
      		Prt.NewPage;
          Y1 := 7;
          PrintHeader(Prt, i + 1, i + 1, Vid);

          If i = 1 Then TempRowPage := (RowCount - (RowCount Div TempRowPage)*TempRowPage)
          Else TempRowPage := (RowCount - (RowCount Div TempRowPage)*TempRowPage) + 5;

					PrintTbl(
						Tbl,
						Prt,
					 	X1,{X1}
  					Y1,{Y1}
						11,{TitleSize}
						7,{RowSize}
    				TempRowPage,
        		SizeArray,
  					ColSize,
  					TextType,
  					TitleText,
  					TblFont);
				End;
    End;
  	Prt.EndDoc;
  Finally
  	TblFont.Destroy;
  End;
end;

Procedure TDlgPlanVns.PrintHeader(Prt: TPrinter; PageNumber: Integer;
	CountPage: Integer; Vid: String);
Const
  Incs: Real = 2.54;{mm}
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

    S := Vid + ' - ' + FormatDateTime('dd/mm/yyyy', Date);
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_CENTER);
			{---Inicialize---}
    Font.Size := 12;
    Font.Style := [];
    Rect.Top :=0;
    Rect.Bottom := 0;
    Rect.left := 0;
    Rect.Right := 0;
    {-------------------Банка-------------------------------}
    Rect.Top := Round(15*DY);
  	Rect.Bottom := Rect.Top + Round(7*DY);
		{----------------------------------------}
  	Rect.left := 0;
  	Rect.Right := Rect.Left + Round(20*DX);

    Font.Style := [fsBold];
    S := 'Банка:';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);

    Font.Style := [];
  	Rect.left := Rect.Right;
  	Rect.Right := Rect.Left + Round(30*DX);

    S := Format('%n' ,[QrySumaBanka.Fields[0].AsFloat]) + 'лв';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);
    {-------------------Kaсa-------------------------------}
  	Rect.left := Rect.Right + Round(3*DX);
  	Rect.Right := Rect.Left + Round(13*DX);

    Font.Style := [fsBold];
    S := 'Каса:';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);

    Font.Style := [];
  	Rect.left := Rect.Right;
  	Rect.Right := Rect.Left + Round(30*DX);

    S := Format('%n' ,[QrySumaOrder.Fields[0].AsFloat]) + 'лв';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);
    {-------------------Общо-------------------------------}
  	Rect.left := Rect.Right + Round(3*DX);
  	Rect.Right := Rect.Left + Round(15*DX);

    Font.Style := [fsBold];
    S := 'Общо:';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);

    Font.Style := [];
  	Rect.left := Rect.Right;
  	Rect.Right := Rect.Left + Round(30*DX);

    S := Format('%n' ,[QryPlachane.Fields[0].AsFloat]) + 'лв';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);
    {-------------------Искана сума-------------------------}
    Rect.Right := Rect.Left;
   	Rect.left := Rect.left - Round(30*DX);

    Rect.Top := Rect.Bottom;
  	Rect.Bottom := Rect.Top + Round(7*DY);

    Font.Style := [fsBold];
    S := 'Искана сума:';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);

    Font.Style := [];
  	Rect.left := Rect.Right;
  	Rect.Right := Rect.Left + Round(30*DX);

    S :=  Format('%n' ,[QryStroitel.Fields[0].AsFloat]) + 'лв';
    StrPCopy(A, S);
    DrawText(Handle, A, Length(S), Rect, DT_RIGHT);
	End;
End;

procedure TDlgPlanVns.N12Click(Sender: TObject);
begin
	DtSPlachane.DataSet := QrySortPlachane;
  QrySortPlachane.Active := True;
  TblPlachane.Active := False;
end;

procedure TDlgPlanVns.N13Click(Sender: TObject);
begin
	DtSPlachane.DataSet := TblPlachane;
  TblPlachane.Active := True;
  QrySortPlachane.Active := False;
end;

procedure TDlgPlanVns.GBoxPlachaneMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Суми на плащанията за строителство на всички кооператори';
end;

procedure TDlgPlanVns.DGrdStroitelMouseMove(Sender: TObject; X,
  Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Суми на искани от строителя в срок';
end;

procedure TDlgPlanVns.DGrdPlachaneMouseMove(Sender: TObject; X,
  Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Платени суми на строителя';
end;

procedure TDlgPlanVns.FormCreate(Sender: TObject);
begin
	ProgOptions.OpenWindowExt(Self, Self.Name);
end;

procedure TDlgPlanVns.FormDestroy(Sender: TObject);
begin
	ProgOptions.SaveWindowExt(Self, Self.Name);
end;

end.
