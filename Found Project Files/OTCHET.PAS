unit Otchet;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, DBTables, Db, DBCtrls, DBTextRegDim, StdCtrls,
  Grids, DBGrids, LabelRegDim;

type
  TDlgOtchet = class(TForm)
    TblOtchet: TTable;
    DtSOtchet: TDataSource;
    DGridOtchet: TDBGrid;
    QryRazrez: TQuery;
    QrySumaOtchet: TQuery;
    DtSSumaOtchet: TDataSource;
    DtSRazrez: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2Exit: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    PrintDialog1: TPrintDialog;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    N2: TMenuItem;
    QrySumaOtchetSUMofIdealnaChast: TFloatField;
    QrySumaOtchetSUMofPurvo_Vnoski: TFloatField;
    QrySumaOtchetSUMofLichniVniski: TFloatField;
    QrySumaOtchetSUMofZadulgenia: TFloatField;
    QrySumaOtchetSUMofNak_Lixvi: TFloatField;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N6: TMenuItem;
    D1: TMenuItem;
    N1111: TMenuItem;
    N8: TMenuItem;
    LblTitle: TLabelRec;
    Label6: TLabel;
    DBTextRec1: TDBTextRec;
    DBTextRec2: TDBTextRec;
    DBTextRec3: TDBTextRec;
    DBTextRec4: TDBTextRec;
    DBTextRec5: TDBTextRec;
    TblOtchetRedNom: TSmallintField;
    TblOtchetFullName: TStringField;
    TblOtchetIdealnaChast: TFloatField;
    TblOtchetPurvo_Vnoski: TFloatField;
    TblOtchetLichniVniski: TFloatField;
    TblOtchetNak_Lixvi: TFloatField;
    TblOtchetIztegl_Sumi: TFloatField;
    TblOtchetRealno_Postup: TFloatField;
    TblOtchetZadulgenia: TFloatField;
    TblOtchetUchast: TStringField;
    QryRazrezRedNom: TSmallintField;
    QryRazrezFullName: TStringField;
    QryRazrezIdealnaChast: TFloatField;
    QryRazrezPurvo_Vnoski: TFloatField;
    QryRazrezLichniVniski: TFloatField;
    QryRazrezNak_Lixvi: TFloatField;
    QryRazrezIztegl_Sumi: TFloatField;
    QryRazrezRealno_Postup: TFloatField;
    QryRazrezZadulgenia: TFloatField;
    QryRazrezUchast: TStringField;
    procedure FormShow(Sender: TObject);
    procedure N2ExitClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DGridOtchetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N6Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure DGridOtchetDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Procedure Sorting(Red2: String; Red8: String);
  public
    ExitForm: Boolean;
  end;

var
  DlgOtchet: TDlgOtchet;

implementation

{$R *.DFM}

Uses Progress, MyConst, SelectColumsPrint, PrtOtchet, SetupReg;

Procedure TDlgOtchet.Sorting(Red2: String; Red8: String);
Begin
	TblOtchet.Active := False;
  With QryRazrez Do Begin
  	Active := False;
    SQL.Strings[0] := 'SELECT *';
    SQL.Strings[1] := 'FROM "10.DB"';
    SQL.Strings[2] := Red2;
    Active := True;
    DGridOtchet.DataSource := DtSRazrez;
  End;
  With QrySumaOtchet Do Begin
  	Active := False;
    SQL.Strings[8] := Red8;
    Active := True;
  End;
End;

procedure TDlgOtchet.FormShow(Sender: TObject);
Var
  TblKoop: TTable;
  TblUchastie: TTable;
  QryLichVnos: TQuery;
  QryZadulg: TQuery;
  QryTeglene: TQuery;
  RealPost: Real;
begin
	ExitForm := False;
	LblTitle.Caption := 'Œ“◊≈“ Õ¿ œŒ—“⁄œÀ≈Õ»ﬂ“¿ » «¿ƒ⁄À∆≈Õ»ﬂ“¿ Õ¿  ŒŒœ≈–¿“Œ–»“≈  ⁄Ã - ' +
  	FormatDateTime('dd/mm/yyyy', Date);

  QryZadulg := TQuery.Create(Self);{Karotn}
  With QryZadulg Do Begin
  	DataBaseName := DBaseName;
    SQL.Add('SELECT SUM(PlanVnoska)');
    SQL.Add('');
    SQL.Add('WHERE DocNom = ""');
	End;

  QryLichVnos := TQuery.Create(Self);
  With QryLichVnos Do Begin
  	DataBaseName := DBaseName;
  	SQL.Add('SELECT SUM(Plachane), SUM(NakazLixva)');
    SQL.Add('');
    SQL.Add('WHERE DocNom <> "—‡Î‰Ó."');
  End;

  QryTeglene := TQuery.Create(Self);
  With QryTeglene Do Begin
  	DataBaseName := DBaseName;
  	SQL.Add('SELECT SUM(IztOrder)');
    SQL.Add('');
  End;

  TblOtchet.Active := False;
  TblOtchet.EmptyTable;
  TblOtchet.Active := True;

	TblKoop := TTable.Create(Self);
  TblKoop.DataBaseName := DBaseName;
  TblKoop.TableName := '1.DB';
  TblKoop.Active := True;

  TblUchastie := TTable.Create(Self);
  TblUchastie.DataBaseName := DBaseName;
  TblUchastie.TableName := '5.DB';
  TblUchastie.Active := True;

  TblKoop.First;
  {}
  DlgProgress.Gauge1.MaxValue := TblKoop.RecordCount;
  DlgProgress.Show;
  {}
  While Not(TblKoop.Eof) Do Begin
    TblOtchet.Append;
  	TblOtchet.Fields[0].AsInteger := TblKoop.Fields[0].AsInteger;
    TblOtchet.Fields[1].AsString := TblKoop.Fields[1].AsString + ' ' +
    	{TblKoop.Fields[2].AsString + ' ' +}
      TblKoop.Fields[3].AsString;
		TblOtchet.Fields[2].AsFloat := TblKoop.Fields[6].AsFloat;

    QryZadulg.Active := False;
    QryZadulg.SQL.Strings[1] := 'From "' + TblKoop.Fields[5].AsString + '"';
    QryZadulg.Active := True;

    QryLichVnos.Active := False;
    QryLichVnos.SQL.Strings[1] := 'From "' + TblKoop.Fields[5].AsString + '"';
    QryLichVnos.Active := True;

    QryTeglene.Active := False;
    QryTeglene.SQL.Strings[1] := 'From "' + TblKoop.Fields[5].AsString + '"';
    QryTeglene.Active := True;

    TblOtchet.Fields[3].AsFloat := TblKoop.Fields[7].AsFloat;

    TblOtchet.Fields[4].AsFloat := QryLichVnos.Fields[0].AsFloat;

		TblOtchet.Fields[5].AsFloat := QryLichVnos.Fields[1].AsFloat;

    TblOtchet.Fields[6].AsFloat := QryTeglene.Fields[0].AsFloat;

    RealPost := QryLichVnos.Fields[0].AsFloat -
    	QryLichVnos.Fields[1].AsFloat -  QryTeglene.Fields[0].AsFloat;

    If RealPost < 0.009 Then TblOtchet.Fields[7].AsFloat := 0.00
    Else TblOtchet.Fields[7].AsFloat := RealPost;

    TblOtchet.Fields[8].AsFloat := QryZadulg.Fields[0].AsFloat;

    TblOtchet.Fields[9].AsString := TblUchastie.Fields[1].AsString +
    	TblUchastie.Fields[2].AsString + TblUchastie.Fields[3].AsString;

		TblKoop.Next;
    TblUchastie.Next;

    {}
    Application.ProcessMessages;
    DlgProgress.Gauge1.Progress := DlgProgress.Gauge1.Progress + 1;

    Application.ProcessMessages;
    If DlgProgress.ExitOtchet Then Begin
  		If TblOtchet.State in [dsInsert, dsEdit] Then TblOtchet.Post;

  		TblOtchet.Active := False;
      QryRazrez.Active := False;

      TblOtchet.EmptyTable;

  		TblKoop.Destroy;
  		TblUchastie.Destroy;
      QryLichVnos.Destroy;
  		QryZadulg.Destroy;
  		QryTeglene.Destroy;

      ExitForm := DlgProgress.ExitOtchet;

  		DlgProgress.Hide;
  		DlgProgress.Gauge1.Progress := 0;
      Exit;
    End;
    {}

  End;

  {}
  Application.ProcessMessages;
  DlgProgress.Hide;
  DlgProgress.Gauge1.Progress := 0;
  {}

  If TblOtchet.State in [dsInsert, dsEdit] Then TblOtchet.Post;
  TblOtchet.First;

  TblKoop.Destroy;
  TblUchastie.Destroy;
  QryLichVnos.Destroy;
  QryZadulg.Destroy;
  QryTeglene.Destroy;

	N9Click(Nil);
end;

procedure TDlgOtchet.N2ExitClick(Sender: TObject);
begin
	Close;
end;

procedure TDlgOtchet.N7Click(Sender: TObject);
begin
	Sorting('WHERE Nak_Lixvi > 0', 'WHERE Nak_Lixvi > 0');
end;

procedure TDlgOtchet.N9Click(Sender: TObject);
begin
	QryRazrez.Active := False;
  TblOtchet.Active := True;
  DGridOtchet.DataSource := DtSOtchet;
  With QrySumaOtchet Do Begin
  	Active := False;
    SQL.Strings[8] := '';
    Active := True;
  End;
end;

procedure TDlgOtchet.N2Click(Sender: TObject);
begin
	Sorting('WHERE Iztegl_Sumi > 0', 'WHERE Iztegl_Sumi > 0');
end;
    
procedure TDlgOtchet.DGridOtchetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (Key = 46)And(Shift = [ssCtrl]) Then Key := 1;
end;

procedure TDlgOtchet.FormPaint(Sender: TObject);
begin
	If ExitForm Then Close;
end;

procedure TDlgOtchet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	QrySumaOtchet.Active := False;
  QryRazrez.Active := False;
end;

procedure TDlgOtchet.N6Click(Sender: TObject);
begin
	Sorting('WHERE Zadulgenia > 0.00', 'WHERE Zadulgenia > 0.00');
end;

procedure TDlgOtchet.N10Click(Sender: TObject);
begin
	Sorting('ORDER BY FullName', '');
end;

procedure TDlgOtchet.N11Click(Sender: TObject);
begin
	Sorting('WHERE Purvo_Vnoski < 0.09', 'WHERE Purvo_Vnoski < 0.09');
end;

procedure TDlgOtchet.N12Click(Sender: TObject);
begin
	Sorting('WHERE LichniVniski < 0.09', 'WHERE LichniVniski < 0.09');
end;

procedure TDlgOtchet.D1Click(Sender: TObject);
begin
	Sorting('ORDER BY Uchast', '');
end;

procedure TDlgOtchet.DGridOtchetDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
	i: Integer;
  S: String;
  A: Array[0..120] Of Char;
  R: TRect;
  Field: TField;
begin
	Field := Column.Field;	
	With (Sender as TDBGrid).Canvas Do Begin
  	If Field.FieldNo in [3..10] Then i := 3
    Else
    	If Field.FieldNo = 1 Then i := 1
      Else i := 2;
    FillRect(Rect);
    R := Rect;
    R.Top := R.Top + 1;
    Font.Style := [];
  	Case i of
    	1:Begin
      	S := Field.AsString;
        StrPCopy(A, S);
        DrawText(Handle, A, Length(S), R, DT_CENTER);
      End;
      2:Begin
      	S := Field.AsString;
        StrPCopy(A, S);
        R.Left := R.Left + 2;
        DrawText(Handle, A, Length(S), R, DT_LEFT);
      End;
      3:Begin
      	S := FormatFloat(TFloatField(Field).DisplayFormat, Field.AsFloat);
      	StrPCopy(A, S);
        R.Right := R.Right - 3;
        If (Field.AsFloat > 0)And(Field.FieldNo = 9) Then Begin
    			Font.Style := [fsBold];
        End;
        DrawText(Handle, A, Length(S), R, DT_RIGHT);
      End;
    End;{Case}
  End;
end;

procedure TDlgOtchet.N4Click(Sender: TObject);
begin
	if DlgSelPrint.Execute then
  	if PrintDialog1.Execute then DlgPrintOtchet.PrintOtchet;  
end;

procedure TDlgOtchet.FormCreate(Sender: TObject);
begin
	ProgOptions.OpenWindowExt(Self, Self.Name);
end;

procedure TDlgOtchet.FormDestroy(Sender: TObject);
begin
	ProgOptions.SaveWindowExt(Self, Self.Name);
end;

end.
