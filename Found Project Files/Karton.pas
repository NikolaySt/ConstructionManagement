unit Karton;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Db, Menus, DBTables, Grids, DBGrids, StdCtrls, Mask,
  DBCtrls, LabelRegDim, DBTextRegDim, ExtCtrls, Printers;

type
	StrFile = String[10];

  TDlgKarton = class(TForm)
    DtSKarton: TDataSource;
    TblKarton: TTable;
    TblKartonRedNom: TStringField;
    TblKartonPlanVnoska: TCurrencyField;
    TblKartonKraenSrok: TDateField;
    TblKartonDocNom: TStringField;
    TblKartonData: TDateField;
    TblKartonProsrDni: TSmallintField;
    TblKartonNakazLixva: TCurrencyField;
    TblKartonIztDocNom: TStringField;
    TblKartonIztData: TDateField;
    TblKartonIztOrder: TCurrencyField;
    DtSKoop: TDataSource;
    TblPasp: TTable;
    DtSPasp: TDataSource;
    TblUchast: TTable;
    DtSUchast: TDataSource;
    DtSPostupl: TDataSource;
    QryPostuplQryPostuplSUMofNakazLixva: TCurrencyField;
    TblKartonPlachane: TCurrencyField;
    TblKartonVidPl: TStringField;
    QryPostuplQryPostuplSUMofPlachane: TCurrencyField;
    QryBanka: TQuery;
    DtSBanka: TDataSource;
    DtSOrder: TDataSource;
    QryOrder: TQuery;
    QryOrderSUMofPlachane: TCurrencyField;
    QryBankaSUMofPlachane: TCurrencyField;
    PrintDialog1: TPrintDialog;
    QryPogas: TQuery;
    DtSPogas: TDataSource;
    QryPogasSUMofPlanVnoska: TCurrencyField;
    MenuKarton: TMainMenu;
    N1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N9: TMenuItem;
    QryTegleSuma: TQuery;
    DtSTegleSuma: TDataSource;
    QryTegleSumaSUMofIztOrder: TCurrencyField;
    N2: TMenuItem;
    N3: TMenuItem;
    TblUchastID_UCHASTIE: TSmallintField;
    TblUchastBlok: TStringField;
    TblUchastEtag: TStringField;
    TblUchastApart: TStringField;
    TblUchastMagazin: TStringField;
    TblUchastGarag: TStringField;
    TblUchastMaze: TStringField;
    TblUchastAtelie: TStringField;
    TblUchastTavan: TStringField;
    TblUchastIdealnaChast: TFloatField;
    PnlStatus: TPanel;
    QrySortKoop: TQuery;
    QrySortKoopID_NAME: TSmallintField;
    QrySortKoopFName: TStringField;
    QrySortKoopSName: TStringField;
    QrySortKoopLName: TStringField;
    QrySortKoopNotes: TMemoField;
    QrySortKoopFiles: TStringField;
    QrySortKoopKoef: TFloatField;
    QrySortKoopPurVns: TFloatField;
    QrySortKoopProectVns: TFloatField;
    TblKoopProect: TTable;
    TblKoopProectProectVns: TFloatField;
    TblKoopProectID_NAME: TSmallintField;
    TblKoopProectPurVns: TFloatField;
    NewDBGrid1: TDBGrid;
    Panel1: TPanel;
    GBoxPasp: TGroupBox;
    LblEGN: TLabel;
    LblFName: TLabel;
    LblSName: TLabel;
    LblLName: TLabel;
    Label10: TLabel;
    GBoxPostupl: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label12: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Bevel3: TBevel;
    DBEdit4: TDBTextRec;
    DBEdit7: TDBTextRec;
    DBEdit5: TDBTextRec;
    DBEdit3: TDBTextRec;
    DBEdit1: TDBTextRec;
    DBEdit2: TDBTextRec;
    LblRealPost: TLabelRec;
    Label11: TLabel;
    DBEdit6: TDBTextRec;
    DEdtName: TDBTextRec;
    DEdtSName: TDBTextRec;
    DEdtLName: TDBTextRec;
    DEdtEGN: TDBTextRec;
    Panel2: TPanel;
    GBoxUchstie: TGroupBox;
    LblUBlock: TLabel;
    LblUEtag: TLabel;
    LblUApart: TLabel;
    LblUMag: TLabel;
    LblUGarag: TLabel;
    LblUMaze: TLabel;
    LblUAtelie: TLabel;
    LblUTavan: TLabel;
    LblUIdealnaChast: TLabel;
    Bevel1: TBevel;
    DEdtUBlock: TDBTextRec;
    DEdtUEtag: TDBTextRec;
    DEdtUApart: TDBTextRec;
    DEdtUMaze: TDBTextRec;
    DEdtUGarag: TDBTextRec;
    DEdtUTavan: TDBTextRec;
    DEdtUMag: TDBTextRec;
    DEdtUAtelie: TDBTextRec;
    DEdtUIdealnaChast: TDBTextRec;
    GBoxPredVns: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label14: TLabel;
    CBoxKoop: TComboBox;
    QryPostupl: TQuery;
    N10: TMenuItem;
    DtSKoopProect: TDataSource;
    N8: TMenuItem;
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure CBoxKoopChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridFull1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N3Click(Sender: TObject);
    procedure DBEdit8KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridFull1MouseMove(Sender: TObject; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GBoxPaspMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GBoxUchstieMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GBoxPostuplMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Memo4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GBoxPredVnsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEdit9KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Procedure RealPostupl;
    Procedure AddPlanVnoska(NaData, DoData: TDateTime; Suma: Real);
  public
    { Public declarations }
  end;

Function Period(NewData, OldData: TDateTime): Integer;
Procedure AddPlachane(TblKarton: TTable; VidPl: String; Dok: String;
	  Str: String; Data: TDateTime);
Procedure KartonDanni(Prt: TPrinter; Tblk, TblU: TDBDataSet;
	Const Suma: Array Of String);

var
  DlgKarton: TDlgKarton;

implementation

{$R *.DFM}

Uses KprStroi, Otchet, KarPost, StrBank, MyConst, PrtKarton, ToolsFunc, SetupReg,
	PrintTables;

Label CheckSum_Exit;

Procedure PrintTblTitle(
	Prt: TPrinter;
	X1: Integer;
  Y1: Integer;
	TitleSize:Integer;
  RowCount: Integer;
  Const ColSize1: Array Of Integer;
  Const TextType1: Array Of Byte; {1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  Const TitleText: Array Of String;
  TblFont: TFont); Forward;

Procedure TDlgKarton.RealPostupl;
Var
	RealPost: Real;
Begin
	RealPost := QryPostupl.Fields[0].AsFloat -
  	QryPostupl.Fields[1].AsFloat - QryTegleSuma.Fields[0].AsFloat;
  LblRealPost.Caption := FormatFloat('### ### ##0.#0', RealPost);
End;

Function Period(NewData, OldData: TDateTime): Integer;
Var
	Per: Real;
  S: String;
Begin
	Per := NewData- OldData;
	Str(Per:1:0, S);
  Result := StrToInt(S);
End;


procedure TDlgKarton.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
Var
	FileName: StrFile;
begin
	If QrySortKoop.Fields[5].AsString <> '' Then Begin
    TblKarton.DisableControls;
		TblKarton.Active := False;
    FileName := QrySortKoop.Fields[5].AsString + '.db';
  	TblKarton.TableName := FileName;
    TblKarton.Active := True;

    QryPostupl.Active := False;
		QryPostupl.SQL.Strings[1] := 'From "' + FileName + '"';
    QryPostupl.Active := True;

    QryBanka.Active := False;
		QryBanka.SQL.Strings[1] := 'From "' + FileName + '"';
    QryBanka.Active := True;

    QryOrder.Active := False;
		QryOrder.SQL.Strings[1] := 'From "' + FileName + '"';
    QryOrder.Active := True;

    QryPogas.Active := False;
		QryPogas.SQL.Strings[1] := 'From "' + FileName + '"';
    QryPogas.Active := True;

    QryTegleSuma.Active := False;
		QryTegleSuma.SQL.Strings[1] := 'From "' + FileName + '"';
    QryTegleSuma.Active := True;

    TblKarton.EnableControls;

    CBoxKoop.ItemIndex := QrySortKoop.Fields[0].AsInteger - 1;

		RealPostupl;
  End;
end;

procedure TDlgKarton.FormShow(Sender: TObject);
Var
  FileName: StrFile;
begin
	GBoxPostupl.Caption := 'Плащания към - ' + FormatDateTime('dd/mm/yyyy', Date);
  TblKoopProect.Active := True;
	QrySortKoop.Active := True;
  If QrySortKoop.RecordCount > 0 Then Begin
  	CBoxKoop.Items.Clear;
  	With QrySortKoop Do Begin
    	First;
    	While Not(Eof) Do Begin
    		CBoxKoop.Items.Add(
      		Fields[1].AsString +'   '+
     			Fields[2].AsString +'   '+
          Fields[3].AsString);
     		Next;
    	End;{While}
  	End;{With}
    CBoxKoop.ItemIndex := 0;
  	QrySortKoop.First;
  	FileName := QrySortKoop.Fields[5].AsString + '.DB';

  	TblKarton.TableName := FileName;
  	TblKarton.Active := True;

    TblPasp.Active := True;
  	TblUchast.Active := True;

		QryPostupl.SQL.Strings[1] := 'From "' + FileName + '"';
  	QryPostupl.Active := True;

  	QryBanka.SQL.Strings[1] := 'From "' + FileName + '"';
  	QryBanka.Active := True;

  	QryOrder.SQL.Strings[1] := 'From "' + FileName + '"';
  	QryOrder.Active := True;

  	QryPogas.SQL.Strings[1] := 'From "' + FileName + '"';
  	QryPogas.Active := True;

    QryTegleSuma.SQL.Strings[1] := 'From "' + FileName + '"';
    QryTegleSuma.Active := True;

    RealPostupl;
    N3.Enabled := True;
    N5.Enabled := True;
    N8.Enabled := True;
    DBEdit8.Enabled := True;
   End{If RecordCount}
  Else Begin
  	N3.Enabled := False;
    N5.Enabled := False;
    N8.Enabled := False;
    DBEdit8.Enabled := False;
  End;
end;

Procedure AddPlachane(TblKarton: TTable; VidPl: String; Dok: String;
	  Str: String; Data: TDateTime);
Var
	CheckEmpty: Boolean;
  CheckExit: Boolean;

  Sum: Real;
  Code: Integer;
  Nak_Lixva: Real;
  Per: Integer;

  Vnoska: Real;
  VnoskaData: TDateTime;

	Label CheckSum_Exit;

Begin

  Val(Str, Sum, Code);
  If Code <> 0 Then Begin
  	Str := Copy(Str, 1, Code - 1) + '.' + Copy(Str, Code + 1, Length(Str));
    Val(Str, Sum, Code);
  End;
  CheckExit := False;
  CheckEmpty := False;
  With TblKarton Do Begin
  	First;
  	Repeat
    	While Not(Eof) And Not(CheckEmpty) Do Begin
    		If (Fields[5].AsFloat = 0)Or
        	(Fields[5].AsString = '') Then CheckEmpty := True
      	Else Next;
    	End;{While}
			If CheckEmpty Then Begin {Намерен е празен ред}

      	If Fields[0].AsString = 'Н.Л' Then Begin
        	If Fields[1].AsFloat > Sum Then Begin
          	Edit;
          	Fields[3].AsString := Dok;
            Fields[4].AsDateTime := Data;
            Fields[5].AsFloat := Sum;
            Fields[6].AsString := VidPl;
            Post;
            CheckExit := True;
           End
          Else Begin
						Vnoska := Fields[1].AsFloat;
//          	VnoskaData := Fields[2].AsDateTime;
          	Edit;
          	Fields[3].AsString := Dok;
            Fields[4].AsDateTime := Data;
            Fields[5].AsFloat := Vnoska;
            Sum  := Sum - Vnoska;
            Fields[6].AsString := VidPl;
            Post;
            Goto CheckSum_Exit;
          End;
        End;{If Н.Л}

      	If Fields[1].AsFloat > Sum Then Begin
          Vnoska := Fields[1].AsFloat;
          VnoskaData := Fields[2].AsDateTime;
{------------------------------------------------------------------------------}
        	If Fields[2].AsDateTime >= Data Then Begin
          	Edit;
          	Fields[3].AsString := Dok;
            Fields[4].AsDateTime := Data;
            Fields[5].AsFloat := Sum;
            Fields[6].AsString := VidPl;
            Post;
            If (Vnoska - Sum) <> 0 Then Begin
            	Next;
            	If Eof Then Append
							Else Insert;
            	Fields[0].AsString := 'Сал.';
            	Fields[1].AsFloat := Vnoska - Sum;
            	Fields[2].AsDateTime := VnoskaData;
              Post;
            End;
            CheckExit := True;
           End
          Else Begin{Fields[2].AsTDateTime < Data}
            Edit;
          	Fields[3].AsString := Dok;
            Fields[4].AsDateTime := Data;
            Fields[5].AsFloat := Sum;
            Fields[6].AsString := VidPl;
            Per := Period(Data, Fields[2].AsDateTime);
            Fields[7].AsInteger := Per;
            Nak_Lixva := ((Lixva/365)*Per)*Vnoska;
            Fields[8].AsFloat := Nak_Lixva;
            Post;

            Next;
            If Eof Then Append
            Else Insert;
            Fields[0].AsString := 'Н.Л';
            Fields[1].AsFloat := Nak_Lixva;
            Fields[2].AsDateTime := Data;
            Post;
            Prior;

            If (Vnoska - Sum) <> 0 Then Begin
            	Next;
            	If Eof Then Append
							Else Insert;
            	Fields[0].AsString := 'Сал.';
            	Fields[1].AsFloat := Vnoska - Sum;
            	Fields[2].AsDateTime := Data;
              Post;
            End;
            CheckExit := True;
          End;{If Fields[2].AsDateTime (?) ata}
          Goto CheckSum_Exit;
        End;{If Fields[1].AsFloat > Sum}
{------------------------------------------------------------------------------}
        If Fields[1].AsFloat < Sum Then Begin
          Vnoska := Fields[1].AsFloat;
//          VnoskaData := Fields[2].AsDateTime;
        	If Fields[2].AsDateTime >= Data Then Begin
          	Edit;
          	Fields[3].AsString := Dok;
            Fields[4].AsDateTime := Data;
            Fields[5].AsFloat := Vnoska;
            Sum  := Sum - Vnoska;
            Fields[6].AsString := VidPl;
            Post;
           End
          Else Begin{Fields[2].AsTDateTime < Data}
          	Edit;
          	Fields[3].AsString := Dok;
            Fields[4].AsDateTime := Data;
            Fields[5].AsFloat := Vnoska;
            Sum  := Sum - Vnoska;
            Fields[6].AsString := VidPl;
            Per := Period(Data, Fields[2].AsDateTime);
            Fields[7].AsInteger := Per;
            Nak_Lixva := ((Lixva/365)*Per)*Vnoska;
            Fields[8].AsFloat := Nak_Lixva;
            Post;

            Next;
            If Eof Then Append
            Else Insert;
            Fields[0].AsString := 'Н.Л';
            Fields[1].AsFloat := Nak_Lixva;
            Fields[2].AsDateTime := Data;
            Post;
            Prior;

          End;{If Fields[2].AsDateTime (?) ata}
          Goto CheckSum_Exit;
        End;{If Fields[1].AsFloat < Sum}
{------------------------------------------------------------------------------}
        If Fields[1].AsFloat = Sum Then Begin
          Vnoska := Fields[1].AsFloat;
//          VnoskaData := Fields[2].AsDateTime;
        	If Fields[2].AsDateTime >= Data Then Begin
          	Edit;
          	Fields[3].AsString := Dok;
            Fields[4].AsDateTime := Data;
            Fields[5].AsFloat := Sum;
            Fields[6].AsString := VidPl;
            CheckExit := True;
            Post;
           End
          Else Begin{Fields[2].AsTDateTime < Data}
          	Edit;
          	Fields[3].AsString := Dok;
            Fields[4].AsDateTime := Data;
            Fields[5].AsFloat := Sum;
            Fields[6].AsString := VidPl;
            Per := Period(Data, Fields[2].AsDateTime);
            Fields[7].AsInteger := Per;
            Nak_Lixva := ((Lixva/365)*Per)*Vnoska;
            Fields[8].AsFloat := Nak_Lixva;
            CheckExit := True;
            Post;

            Next;
            If Eof Then Append
            Else Insert;
            Fields[0].AsString := 'Н.Л';
            Fields[1].AsFloat := Nak_Lixva;
            Fields[2].AsDateTime := Data;
            Post;
            Prior;

          End;{If Fields[2].AsDateTime (?) ata}
        End;{If Fields[1].AsFloat = Sum}
CheckSum_Exit:
{------------------------------------------------------------------------------}
       End{ Нмерен е празен ред}
      Else Begin{Не е намерен празен ред}
      	Append;
        Fields[3].AsString := Dok;
        Fields[4].AsDateTime := Data;
        Fields[5].AsFloat := Sum;
        Fields[6].AsString := VidPl;
        CheckExit := True;
        Post;
      End;
      CheckEmpty := False;
    Until CheckExit = True;
  End;{With TblKarton Do}
End;

procedure TDlgKarton.BtnCloseClick(Sender: TObject);
begin
	Close;
end;

Procedure KartonDanni(Prt: TPrinter; TblK, TblU: TDBDataSet;
	Const Suma: Array Of String);
Const
  Incs: Real = 2.53;{mm}
Var
	DpiX, DpiY, X1, Y1: Integer;
  RowSize: Integer;
  Rect, Rect1: TRect;
  n: Integer;
  S: String;
	A: Array[0..50] Of Char;
  CaptionIme: Array[0..3] Of String;
  CaptionUchas1: Array[1..4] Of String;
  CaptionUchas2: Array[5..9] Of String;
  CaptionPost: Array[0..6] Of String;

Begin
  DpiX := GetDeviceCaps(Prt.Handle, LOGPIXELSX);
  DpiY := GetDeviceCaps(Prt.Handle, LOGPIXELSY);

	CaptionIme[0] := 'No:';
  CaptionIme[1] := 'Име:';
  CaptionIme[2] := 'Презиме:';
  CaptionIme[3] := 'Фамилия:';

  CaptionUchas1[1] := 'Блок:';
  CaptionUchas1[2] := 'Етаж:';
  CaptionUchas1[3] := 'Ап.:';
  CaptionUchas1[4] := 'Магазин:';

  CaptionUchas2[5] := 'Гараж:';
  CaptionUchas2[6] := 'Мазе:';
  CaptionUchas2[7] := 'Ателие:';
  CaptionUchas2[8] := 'Таван:';
  CaptionUchas2[9] := 'Коефициент:';

  CaptionPost[0] := 'Банка:';
  CaptionPost[1] := 'Каса:';
  CaptionPost[2] := 'Общо:';
  CaptionPost[3] := 'Нак. лихви:';
	CaptionPost[4] := 'Изтегл. суми:';
  CaptionPost[5] := 'Реал. постъп.:';
  CaptionPost[6] := 'Задължения:';

  X1 := Round(((25/10)/Incs)*DpiX);
  Y1 := Round(((7/10)/Incs)*DpiY);
  RowSize := Round(((6/10)/Incs)*DpiY);
	With Prt.Canvas Do Begin
  	{---------------TITLE------------------------}
    Rect1.Top := Round(((0/10)/Incs)*DpiY);;
    Rect1.Bottom := Round(((7/10)/Incs)*DpiY);
    Rect1.Right := Round(((210/10)/Incs)*DpiX);
    Rect1.left := Round(((25/10)/Incs)*DpiX);
    S := 'ОТЧЕТ НА ПЛАЩАНИЯТА НА КОПЕРАТОРА';
    StrPCopy(A, S);
 		Font.Style := [fsBold];
    DrawText(Prt.Canvas.Handle, A, Length(S), Rect1, DT_CENTER);
    Font.Style := [];

  	{------Ime-----------------------------------}
  	Rect.Top := Y1;
    Rect.Bottom := Y1 + RowSize;
    Rect.Right := X1 + Round(((25/10)/Incs)*DpiX);;
    Rect.left := X1;

    Rect1.Right := Rect.Right + Round(((25/10)/Incs)*DpiX);
    Rect1.left := Rect.Right;
    For n := 0 To 3 Do Begin {Ime}
      S := CaptionIme[n];
      StrPCopy(A, S);
      DrawText(Prt.Canvas.Handle, A, Length(S), Rect, DT_RIGHT);
      {-----------}
      S := TblK.Fields[n].AsString;
      StrPCopy(A, S);
			Rect1.Top := Rect.Top;
      Rect1.Bottom := Rect.Bottom;
      Font.Style := [fsBold];
      DrawText(Prt.Canvas.Handle, A, Length(S), Rect1, DT_LEFT);
      Font.Style := [];
      {----------}
    	Rect.Top := Rect.Bottom;
    	Rect.Bottom := Rect.Bottom + RowSize;
    End;
  	{------Uchastie-1-----------------------------}
  	Rect.Top := Y1;
    Rect.Bottom := Y1 + RowSize;
    Rect.Right := Round(((105/10)/Incs)*DpiX);
    Rect.left := Round(((80/10)/Incs)*DpiX);;

    Rect1.Right := Rect.Right + Round(((30/10)/Incs)*DpiX);
    Rect1.left := Rect.Right;
    For n := 1 To 4 Do Begin {Uchastie}
      S := CaptionUchas1[n];
      StrPCopy(A, S);
      DrawText(Prt.Canvas.Handle, A, Length(S), Rect, DT_RIGHT);
      {----------}
      S := TblU.Fields[n].AsString;
      StrPCopy(A, S);

			Rect1.Top := Rect.Top;
      Rect1.Bottom := Rect.Bottom;
      Font.Style := [fsBold];
      DrawText(Prt.Canvas.Handle, A, Length(S), Rect1, DT_LEFT);
      Font.Style := [];
      {----------}
    	Rect.Top := Rect.Bottom;
    	Rect.Bottom := Rect.Bottom + RowSize;
    End;
    {------------Purvonachalni vnoski-------------}
   	Rect.Top := Rect.Bottom;
   	Rect.Bottom := Rect.Bottom + RowSize;
    Rect.Left := Rect.Left - Round(((40/10)/Incs)*DpiX);
    Rect.Right := Rect.Right + Round(((15/10)/Incs)*DpiX);

    S := 'Първоначална вноска:';
    StrPCopy(A, S);
    DrawText(Prt.Canvas.Handle, A, Length(S), Rect, DT_RIGHT);

    S := Suma[7];
    If (S = '0.00')Or(S = '')Or(S = '0') Then S := '0.00 лв'
    Else S := S + ' лв';
    StrPCopy(A, S);
    Rect1.Top := Rect.Top;
    Rect1.Bottom := Rect.Bottom;
    Rect1.Left := Rect.Right;
    Rect1.Right := Rect1.Left + Round(((30/10)/Incs)*DpiX);;

    Font.Style := [fsBold];
    DrawText(Prt.Canvas.Handle, A, Length(S), Rect1, DT_RIGHT);
    Font.Style := [];

    Rect.Top := Rect.Bottom;
    Rect.Bottom := Rect.Bottom + RowSize;
          {-----------------------}
    S := 'Вноска за проект:';
    StrPCopy(A, S);
    DrawText(Prt.Canvas.Handle, A, Length(S), Rect, DT_RIGHT);

    S := Suma[8];
    If (S = '0.00')Or(S = '')Or(S = '0') Then S := '0.00  $'
    Else S := S + '  $';
    StrPCopy(A, S);
    Rect1.Top := Rect.Top;
    Rect1.Bottom := Rect.Bottom;
    Font.Style := [fsBold];
    DrawText(Prt.Canvas.Handle, A, Length(S), Rect1, DT_RIGHT);
    Font.Style := [];

  	{------Uchastie-2-----------------------------}
  	Rect.Top := Y1;
    Rect.Bottom := Y1 + RowSize;
    Rect.Right := Round(((155/10)/Incs)*DpiX);
    Rect.left := Round(((125/10)/Incs)*DpiX);

    Rect1.Right := Rect.Right + Round(((30/10)/Incs)*DpiX);
    Rect1.left := Rect.Right;
    For n := 5 To 9 Do Begin{Uchastie}
      S := CaptionUchas2[n];
      StrPCopy(A, S);
      DrawText(Prt.Canvas.Handle, A, Length(S), Rect, DT_RIGHT);
      {----------}
      If n = 9 Then S := FormatFloat(TFloatField(TblK.Fields[6]).DisplayFormat, TblK.Fields[6].AsFloat)
      Else S := TblU.Fields[n].AsString;
      StrPCopy(A, S);

			Rect1.Top := Rect.Top;
      Rect1.Bottom := Rect.Bottom;
      Font.Style := [fsBold];
      DrawText(Prt.Canvas.Handle, A, Length(S), Rect1, DT_LEFT);
      Font.Style := [];
      {----------}
    	Rect.Top := Rect.Bottom;
    	Rect.Bottom := Rect.Bottom + RowSize;
    End;
    {---------------Postuplenia---------------------}
  	Rect.Top := Y1;
    Rect.Bottom := Y1 + RowSize;
    Rect.Right := Round(((220/10)/Incs)*DpiX);
    Rect.left := Round(((170/10)/Incs)*DpiX);;

    Rect1.Right := Rect.Right + Round(((30/10)/Incs)*DpiX);
    Rect1.left := Rect.Right;
    For n := 0 To High(CaptionPost) Do Begin{Uchastie}
      S := CaptionPost[n];
      StrPCopy(A, S);
      DrawText(Prt.Canvas.Handle, A, Length(S), Rect, DT_RIGHT);
      {----------}
      S := Suma[n] + ' лв.';
      StrPCopy(A, S);

			Rect1.Top := Rect.Top;
      Rect1.Bottom := Rect.Bottom;
      Font.Style := [fsBold];
      DrawText(Prt.Canvas.Handle, A, Length(S), Rect1, DT_RIGHT);
      Font.Style := [];
      {----------}
    	Rect.Top := Rect.Bottom;
    	Rect.Bottom := Rect.Bottom + RowSize;
    End;
	End;{With Prt.Canvas}
End;

procedure TDlgKarton.N5Click(Sender: TObject);
Var
	DocNom: String;
  Suma: String;
  Data: String;
begin
  If DlgKartonPost.Execute(DocNom, Data, Suma) Then Begin

  	TblKarton.DisableControls;
  	QryPostupl.Active := False;
  	QryBanka.Active := False;
  	QryOrder.Active := False;
  	QryPogas.Active := False;
  	QryTegleSuma.Active := False;

		AddPlachane(TblKarton, 'Банка', DocNom, Suma, StrToDate(Data));

    TblKarton.First;
		TblKarton.EnableControls;
  	QryTegleSuma.Active := True;
  	QryPogas.Active := True;
  	QryPostupl.Active := True;
  	QryBanka.Active := True;
  	QryOrder.Active := True;

		RealPostupl;
	End;
end;

procedure TDlgKarton.N8Click(Sender: TObject);
Const
	ColSize: Array[0..11] of Integer = (9, 20, 23, 16, 23, 20, 15, 15, 22, 17, 22, 21);
	TextType: Array[0..11] of Byte = (1, 3, 1, 1, 1, 3, 1, 1, 3, 1, 1, 3);
	TitleText: Array[0..11] of String = (
  					'No',
  					'Лева',
  				  'Краен'+#13+'срок',
            'Док. No',
            'Дата',
          	'Сума'+#13+'(лв)',
          	'Вид',
            'Проср.'+#13+'в дни',
            'Наказат.'+#13+'лихва(лв)',
            'Док. No',
            'Дата',
            'Сума'+#13+'(лв)');
Var
	Prt: TPrinter;
  TblFont: TFont;
  RowCount: Integer;
  i, Tmp_i: Integer;
  Tbl: TDBDataSet;
  RowPrint: Integer;
  Check: Boolean;
begin
	If PrintDialog1.Execute Then Begin
		Prt := Printer;
  	TblFont := TFont.Create;
 		Tbl := TblKarton;
  	Tbl.First;
  	With TblFont Do Begin
  		Name := 'Hebar';
    	Size := 12;
    	Color := clBlack
  	End;
  	RowCount := Tbl.RecordCount;
  	If RowCount = 0 Then Exit;
  	Tbl.DisableControls;
  	Try
  		Prt.BeginDoc;
      Prt.Canvas.Font := TblFont;
      {------Данни--------}
			KartonDanni(Prt, QrySortKoop, TblUchast,
      		[DBEdit2.Text,{Банка}
						DBEdit1.Text,{Каса}
						DBEdit3.Text,{Общо}
						DBEdit5.Text,{Нак. лихви:}
						DBedit7.Text,{Изтегл. суми:}
          	LblRealPost.Caption,{Реал. постъп.:}
						DBEdit4.Text,{Задължения}
            DBEdit9.Text,{Първоначална вноска}
            DBEdit8.Text{Вноска за проецт}]);
      {-------------------}
      If Printer.Orientation = poLandscape Then RowPrint := 20
      Else RowPrint := 31;
    	If (RowCount Div RowPrint) = 0 Then Begin
				{Prt.Canvas.TextOut(0, 0, '1 # 1 ДАТА: ' + FormatDateTime('dd/mm/yyyy', Date));}
				PrintTblTitle(
					Prt,
					25,{X1}
  				50,{Y1}
					5,{TitleSize}
  				0,{RowCount}
  				[52, 74, 37, 60],
  				[1, 1, 1, 1],
          	{1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  				['ЗАДЪЛЖЕНИЯ', 'ЛИЧНИ ВНОСКИ', '', 'ИЗТЕГЛЕНИ СУМИ'],
  				TblFont);
				PrintTbl(
					Tbl,
					Prt,
					25,{X1}
  				55,{Y1}
					11,{TitleSize}
					7,{RowSize}
    			RowCount,
  				ColSize,
					TextType,
					TitleText,
  				TblFont);
    		End
    	Else Begin
      	Check := False;
        Tmp_i := 1;
    		For i := 1 To RowCount Div RowPrint Do Begin

        	If (RowCount - (RowCount Div RowPrint)*RowPrint) <> 0 Then
        		Prt.Canvas.TextOut(0, 0,
            	IntToStr(i) +' # ' + IntToStr(RowCount Div RowPrint +1) + ' ' +
              	'ДАТА: ' + FormatDateTime('dd/mm/yyyy', Date))
          Else
          	Prt.Canvas.TextOut(0, 0,
            	IntToStr(i) +' # ' + IntToStr(RowCount Div RowPrint) + ' ' +
              	'ДАТА: ' + FormatDateTime('dd/mm/yyyy', Date));
        	If i = 1 Then Begin
						PrintTblTitle(
							Prt,
							25,{X1}
  						50,{Y1}
							5,{TitleSize}
  						0,{RowCount}
  						[52, 74, 37, 60],
  						[1, 1, 1, 1],
          		{1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  						['ЗАДЪЛЖЕНИЯ', 'ЛИЧНИ ВНОСКИ', '', 'ИЗТЕГЛЕНИ СУМИ'],
  						TblFont);
						PrintTbl(
							Tbl,
							Prt,
							25,{X1}
  						55,{Y1}
							11,{TitleSize}
							7,{RowSize}
    					RowPrint,{RowCount}
              ColSize,
              TextType,
              TitleText,
  						TblFont);
           End
          Else Begin
          	Check := True;
						PrintTblTitle(
							Prt,
							25,{X1}
  						7,{Y1}
							5,{TitleSize}
  						0,{RowCount}
  						[52, 74, 37, 60],
  						[1, 1, 1, 1],
          		{1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  						['ЗАДЪЛЖЕНИЯ', 'ЛИЧНИ ВНОСКИ', '', 'ИЗТЕГЛЕНИ СУМИ'],
  						TblFont);
						PrintTbl(
							Tbl,
							Prt,
							25,{X1}
  						13,{Y1}
							11,{TitleSize}
							7,{RowSize}
    					RowPrint + 6,{RowCount}
  						ColSize,
              TextType,
              TitleText,
              TblFont);
          End;
         	If i <> (RowCount Div RowPrint) Then Prt.NewPage;
          Tmp_i := i;
      	End;
        i := Tmp_i;
      	If (RowCount - (RowCount Div RowPrint)*RowPrint) <> 0 Then Begin
        	If Check Then RowPrint := RowPrint - 6
          Else RowPrint := (RowCount - (RowCount Div RowPrint)*RowPrint);
      		Prt.NewPage;
          Prt.Canvas.TextOut(0, 0, IntToStr(i + 1)+' # '+IntToStr(i + 1) + ' ' +
              	'ДАТА: ' + FormatDateTime('dd/mm/yyyy', Date));
          PrintTblTitle(
          	Prt,
						25,{X1}
  					7,{Y1}
						5,{TitleSize}
  					0,{RowCount}
  					[52, 74, 37, 60],
  					[1, 1, 1, 1],
          	{1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  					['ЗАДЪЛЖЕНИЯ', 'ЛИЧНИ ВНОСКИ', '', 'ИЗТЕГЛЕНИ СУМИ'],
  					TblFont);
					PrintTbl(
						Tbl,
						Prt,
						25 ,{X1}
  					13,{Y1}
						11,{TitleSize}
						7,{RowSize}
    				RowPrint,
            ColSize,
            TextType,
            TitleText,
  					TblFont);
				End;
    	End;{If (RowCount Div 35) = 0 }
  		Prt.EndDoc;
  	Finally
  		TblFont.Destroy;
    	Tbl.EnableControls;
  	End;{Try}
  End;{If PrintDilaog1.Execute}
end;

procedure TDlgKarton.N9Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgKarton.CBoxKoopChange(Sender: TObject);
Var
	FileName: StrFile;
begin
	With QrySortKoop Do Begin
  	{If FindKey([CBoxKoop.ItemIndex + 1]) Then Begin}
    	First;
      MoveBy(CBoxKoop.ItemIndex);
    	TblKarton.DisableControls;
			TblKarton.Active := False;
    	FileName := QrySortKoop.Fields[5].AsString + '.db';
  		TblKarton.TableName := FileName;
    	TblKarton.Active := True;

    	QryPostupl.Active := False;
			QryPostupl.SQL.Strings[1] := 'From "' + FileName + '"';
    	QryPostupl.Active := True;

    	QryBanka.Active := False;
			QryBanka.SQL.Strings[1] := 'From "' + FileName + '"';
    	QryBanka.Active := True;

    	QryOrder.Active := False;
			QryOrder.SQL.Strings[1] := 'From "' + FileName + '"';
    	QryOrder.Active := True;

    	QryPogas.Active := False;
			QryPogas.SQL.Strings[1] := 'From "' + FileName + '"';
    	QryPogas.Active := True;

      QryTegleSuma.Active := False;
      QryTegleSuma.SQL.Strings[1] := 'From "' + FileName + '"';
    	QryTegleSuma.Active := True;

    	TblKarton.EnableControls;

  		RealPostupl;
{    End;}{If }
	End;{With TblKarton}
end;

procedure TDlgKarton.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	TblKarton.Active := False;
  TblPasp.Active := False;
  TblUchast.Active := False;
  TblKoopProect.Active := False;

  QrySortKoop.Active := False;
  QryPostupl.Active := False;
  QryBanka.Active := False;
  QryOrder.Active := False;
  QryPogas.Active := False;
  QryTegleSuma.Active := False;
end;

procedure TDlgKarton.DBGridFull1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	Exit;
	If (Key = 46)And(Shift = [ssCtrl]) Then Key := 1;
end;

procedure TDlgKarton.N3Click(Sender: TObject);
Var
	NaData: TDateTime;
  DoData: TDateTime;
  Suma: Real;
begin
	if DlgStrBank.ExecutePlanVnoska(NaData, DoData, Suma) Then Begin
  	AddPlanVnoska(NaData, DoData, Suma);
  End;
end;

Procedure TDlgKarton.AddPlanVnoska(NaData, DoData: TDateTime; Suma: Real);
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
	n := 0;
	With TblKarton Do Begin
  		DisableControls;
      First;
      Move := 0;
      For i := 0 To RecordCount - 1 Do Begin
      	If Fields[10].AsString <> '' Then Move := i;
        Next;
      End;
      First;
      MoveBy(Move);
      SumaKoop := Suma;
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
              Data := Fields[4].AsDateTime;
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
      EnableControls;
  End;{With TblKarton}
end;

Procedure PrintTblTitle(
	Prt: TPrinter;
	X1: Integer;
  Y1: Integer;
	TitleSize:Integer;
  RowCount: Integer;
  Const ColSize1: Array Of Integer;
  Const TextType1: Array Of Byte; {1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  Const TitleText: Array Of String;
  TblFont: TFont);
Const
	TextTop: Integer = 1;{mm}
  Incs: Real = 2.53;{mm}
Var
  IC: THandle;
  DpiX, DpiY: Integer;

  i, n, Sum: Integer;
  TblHeight: Integer;
  Rect: TRect;
  S: String;
  ColSize: Array[0..100] of Integer;
  A: Array[0..100] of Char;

begin
  IC := Prt.Handle;

  DpiX := GetDeviceCaps(IC, LOGPIXELSX);
  DpiY := GetDeviceCaps(IC, LOGPIXELSY);

  X1 := Round(((X1/10)/Incs)*DpiX);
  Y1 := Round(((Y1/10)/Incs)*DpiY);

  For i := 0 To High(ColSize1) Do Begin
  	ColSize[i] := Round(((ColSize1[i]/10)/Incs)*DpiX);
	End;
  TitleSize := Round(((TitleSize/10)/Incs)*DpiY);
  TextTop := 5;

  TblHeight := 0*RowCount + TitleSize;

	With Prt.Canvas Do Begin
    Sum := Y1 + TitleSize;
    Font := TblFont;
	{---------Title Text -----------}
  	Rect.Top := Y1;
    Rect.Bottom := Sum;
    Rect.Right := X1;
    Rect.left := X1;
    Font.Style := [fsBold];
    For n := 0 To High(ColSize1) Do Begin {Text}
	  	Rect.Right := Rect.Right + ColSize[n];
      S := TitleText[n];
      StrPCopy(A, S);
      DrawText(Prt.Canvas.Handle, A, Length(S), Rect, DT_CENTER);
      Rect.left := Rect.left + ColSize[n];
    End;{Text}
    Font.Style := [];
    {---------Columns--------}
  	MoveTo(X1, Y1);
  	LineTo(X1, TblHeight + Y1);
  	Sum := X1;
  	For i := 0 To High(ColSize1) Do Begin
    	Sum := Sum + ColSize[i];
  		MoveTo(Sum, Y1);
  		LineTo(Sum, TblHeight + Y1);
    End;
    {------Title------------}
		MoveTo(X1, Y1);
    LineTo(Sum, Y1);
    MoveTo(X1, Y1 + TitleSize);
    LineTo(Sum, Y1 + TitleSize);
  End;{With Prt.Canvas Do}
End;


procedure TDlgKarton.DBEdit8KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 13 Then
  	If TblKoopProect.State in [dsEdit] Then Begin
    	TblKoopProect.Post;
      CBoxKoop.SetFocus
    End;
end;

procedure TDlgKarton.DBGridFull1MouseMove(Sender: TObject; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Таблица на плащанията на кооператора';
end;

procedure TDlgKarton.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	PnlStatus.Caption := C_Status+'';
end;

procedure TDlgKarton.GBoxPaspMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Член кооператор';
end;

procedure TDlgKarton.GBoxUchstieMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Записано дялово участие в кооперацията'
end;

procedure TDlgKarton.GBoxPostuplMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Суми на плащанията на кооператора'
end;

procedure TDlgKarton.Memo4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Таблица на плащанията на кооператора';
end;

procedure TDlgKarton.GBoxPredVnsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Внесени първоначални вноски';
end;

procedure TDlgKarton.DBEdit9KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 13 Then
  	If TblKoopProect.State in [dsEdit] Then Begin
    	TblKoopProect.Post;
      CBoxKoop.SetFocus
    End;
end;

procedure TDlgKarton.N10Click(Sender: TObject);
begin
	if PrintDialog1.Execute then DlgPrintKarton.PrintKarton;
end;

procedure TDlgKarton.FormCreate(Sender: TObject);
begin
	ProgOptions.OpenWindowExt(Self, Self.Name);		
end;

procedure TDlgKarton.FormDestroy(Sender: TObject);
begin
	ProgOptions.SaveWindowExt(Self, Self.Name);
end;

end.
