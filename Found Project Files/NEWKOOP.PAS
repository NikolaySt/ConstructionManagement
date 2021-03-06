unit NewKoop;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, DB, DBTables, Edtvalue;

type
  StrFile = String[10];

  TDlgNewKoop = class(TForm)
    GBoxPasp: TGroupBox;
    LblSeria: TLabel;
    EdtSeria: TEdit;
    LblPaspNom: TLabel;
    EdtPaspNom: TEdit;
    LblData: TLabel;
    EdtData: TMaskEdit;
    LblIzdaden: TLabel;
    EdtIzdaden: TEdit;
    EdtEGN: TEdit;
    LblEGN: TLabel;
    EdtFName: TEdit;
    EdtSName: TEdit;
    EdtLName: TEdit;
    LblFName: TLabel;
    LblSName: TLabel;
    LblLName: TLabel;
    GBoxAdres: TGroupBox;
    LblGrad: TLabel;
    LblUlica: TLabel;
    LblNo: TLabel;
    LblBlok: TLabel;
    LblVxod: TLabel;
    LblEtag: TLabel;
    LblApart: TLabel;
    LblPostKod: TLabel;
    EdtGrad: TEdit;
    EdtUlica: TEdit;
    EdtUlicaNom: TEdit;
    EdtBlok: TEdit;
    EdtVxod: TEdit;
    EdtEtag: TEdit;
    EdtApart: TEdit;
    EdtPostKod: TEdit;
    GBoxCall: TGroupBox;
    EdtTel: TEdit;
    LblTel: TLabel;
    GBoxUchstie: TGroupBox;
    EdtUBlok: TEdit;
    EdtUEtag: TEdit;
    EdtUApart: TEdit;
    EdtUMagazin: TEdit;
    EdtUGarag: TEdit;
    EdtUMaze: TEdit;
    EdtUAtelie: TEdit;
    EdtUTavan: TEdit;
    LblUBlock: TLabel;
    LblUEtag: TLabel;
    LblUApart: TLabel;
    LblUMag: TLabel;
    LblUGarag: TLabel;
    LblUMaze: TLabel;
    LblUAtelie: TLabel;
    LblUTavan: TLabel;
    BtnAdd: TBitBtn;
    BtnCancel: TBitBtn;
    LblUIdlChast: TLabel;
    Bevel1: TBevel;
    EdtUIdealnaChast: TValueEdit;
    procedure BtnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtDataChange(Sender: TObject);
    procedure EdtDataExit(Sender: TObject);
    procedure EdtFNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    CheckErrorData: Boolean;
  public
    TblAll: TTable;
    Procedure AddInformation(Var FileName: StrFile;	Var KoefIdlChast: Real);
		Procedure CreateNewFile(FileName: StrFile);
    Procedure AddPlanVnoska(FileName: StrFile; KoefIdlChast: Real);
  end;

var
  DlgNewKoop: TDlgNewKoop;

implementation

{$R *.DFM}

Uses MyConst;

procedure TDlgNewKoop.BtnAddClick(Sender: TObject);
Var
  FileName: StrFile;
  KoefIdlChast: Real;
  i: Integer;
begin
	KoefIdlChast := 0;
  AddInformation(FileName, KoefIdlChast);{Add to tbl# 1,2,3,4,5}
  CreateNewFile(FileName);{Create Karton.File}
  AddPlanVnoska(FileName, KoefIdlChast);{Добавя плановите вноски}

	For i := 0 To ComponentCount -1 Do
  	If Components[i].ClassType = TEdit Then (Components[i] As TEdit).Text := '';
    
  EdtUIdealnaChast.AsFloat := 0;
	EdtData.Text := '';
  BtnAdd.Enabled := False;
end;

procedure TDlgNewKoop.FormShow(Sender: TObject);
Var
	i: Integer;
begin
	TblAll := TTable.Create(Self);
  With TblAll Do Begin
  	DataBaseName := DBaseName
  End;
	For i := 0 To ComponentCount -1 Do Begin
  	If Components[i].ClassType = TEdit Then Begin
    	(Components[i] As TEdit).Text := '';
    End;
  End;{For}
  EdtData.Text := '';
  BtnAdd.Enabled := False;
end;

Procedure TDlgNewKoop.CreateNewFile(FileName: StrFile);
Const
	Rqrd: Boolean = False;
Var
  TblKarton: TTable;
Begin
	TblKarton := TTable.Create(Self);
  try
		with TblKarton do begin
  		TableType := ttParadox;
    	DatabaseName := DBaseName;
	    TableName := FileName;
  	end;
		TFieldDef.Create(TblKarton.FieldDefs, 'RedNom', ftString, 4 ,Rqrd, 0);
    TFieldDef.Create(TblKarton.FieldDefs, 'PlanVnoska', ftCurrency, 0 ,Rqrd, 1);
    TFieldDef.Create(TblKarton.FieldDefs,	'KraenSrok', ftDate, 0,Rqrd, 2);
    TFieldDef.Create(TblKarton.FieldDefs,	'DocNom', ftString, 20 ,Rqrd, 3);
    TFieldDef.Create(TblKarton.FieldDefs,	'Data', ftDate, 0 ,Rqrd, 4);
    TFieldDef.Create(TblKarton.FieldDefs,	'Plachane', ftCurrency, 0 ,Rqrd, 5);
    TFieldDef.Create(TblKarton.FieldDefs,	'VidPl', ftString, 10 ,Rqrd, 6);
    TFieldDef.Create(TblKarton.FieldDefs, 'ProsrDni', ftSmallInt, 0 ,Rqrd, 7);
    TFieldDef.Create(TblKarton.FieldDefs,	'NakazLixva', ftCurrency, 0 ,Rqrd, 8);
    TFieldDef.Create(TblKarton.FieldDefs,	'IztDocNom', ftString, 20 ,Rqrd, 10);
		TFieldDef.Create(TblKarton.FieldDefs,	'IztData', ftDate, 0 ,Rqrd, 11);
    TFieldDef.Create(TblKarton.FieldDefs,	'IztOrder', ftCurrency, 0 ,Rqrd, 12);
    TblKarton.CreateTable;
  finally
  	TblKarton.Free;
  end;
End;

Procedure TDlgNewKoop.AddInformation(Var FileName: StrFile;
	Var KoefIdlChast: Real);
Var
	n: Integer;
  Str: String;
Begin
	With TblAll Do Begin
  	{----------------------------------}
    TableName := '1.DB'; {Член коопеартор}
    Active := True;
    Last;
    n := Fields[0].AsInteger;
    n := n + 1;

    KoefIdlChast := EdtUIdealnaChast.AsFloat;

    {-----------------------------------}
    Str := UpperCase(Copy(EdtFName.Text,1,1)) +
    	UpperCase(Copy(EdtSName.Text,1,1)) +
    	UpperCase(Copy(EdtLName.Text,1,1));

    If Ord(Str[1]) > 128 Then Begin
    	If (Ord(Str[1]) - 127) > 90 Then Str[1] := 'Z'
      Else Str[1] := Chr(Ord(Str[1]) - 127);
    End;
        If Ord(Str[2]) > 128 Then Begin
    	If (Ord(Str[2]) - 127) > 90 Then Str[2] := 'Z'
      Else Str[2] := Chr(Ord(Str[2]) - 127);
    End;
        If Ord(Str[3]) > 128 Then Begin
    	If (Ord(Str[3]) - 127) > 90 Then Str[3] := 'Z'
      Else Str[3] := Chr(Ord(Str[3]) - 127);
    End;
    FileName := Str[1] + Str[2] + Str[3] + IntToStr(n);

    Insert;
    Fields[0].AsInteger := n;
    Fields[1].AsString := EdtFName.Text;
    Fields[2].AsString := EdtSName.Text;
    Fields[3].AsString := EdtLName.Text;
    Fields[5].AsString := FileName;
    Fields[6].AsFloat := KoefIdlChast;
    Post;
    Active := False;
    {----------------------------------}
    TableName := '2.DB';{Паспортни данни}
    Active := True;
    Last; Insert;
    Fields[0].AsInteger := n;
    Fields[1].AsString := EdtSeria.Text;
    Fields[2].AsString := EdtPaspNom.Text;
    If EdtData.Text <> '  /  /    ' Then Fields[3].AsString := EdtData.Text
    Else Fields[3].AsString := '';
    Fields[4].AsString := EdtIzdaden.Text;
    Fields[5].AsString := EdtEGN.Text;
    Post;
    Active := False;
    {----------------------------------}
    TableName := '3.DB'; {Местоживеене}
    Active := True;
    Last; Insert;
    Fields[0].AsInteger := n;
    Fields[1].AsString := EdtGrad.Text;
    Fields[2].AsString := EdtUlica.Text;
    Fields[3].AsString := EdtUlicaNom.Text;
    Fields[4].AsString := EdtBlok.Text;
    Fields[5].AsString := EdtVxod.Text;
    Fields[6].AsString := EdtEtag.Text;
    Fields[7].AsString := EdtApart.Text;
    Fields[8].AsString := EdtPostKod.Text;
    Post;
    Active := False;
    {----------------------------------}
    TableName := '4.DB'; {Данни за свръзка}
    Active := True;
    Last; Insert;
    Fields[0].AsInteger := n;
    Fields[1].AsString := EdtTel.Text;
    Post;
    Active := False;
    {----------------------------------}
    TableName := '5.DB'; {Участие в кооперацията}
    Active := True;
    Last; Insert;
    Fields[0].AsInteger := n;
    Fields[1].AsString := EdtUBlok.Text;
    Fields[2].AsString := EdtUEtag.Text;
    Fields[3].AsString := EdtUApart.Text;
    Fields[4].AsString := EdtUMagazin.Text;
    Fields[5].AsString := EdtUGarag.Text;
    Fields[6].AsString := EdtUMaze.Text;
    Fields[7].AsString := EdtUAtelie.Text;
    Fields[8].AsString := EdtUTavan.Text;
    Post;
    Active := False;
    {----------------------------------}
  End;{With}
End;

Procedure TDlgNewKoop.AddPlanVnoska(FileName: StrFile; KoefIdlChast: Real);
Var
	TblStroitel: TTable;
Begin
	With TblAll Do Begin
  	TableName := FileName;
    Active := True;
    First;
  End;{With}

	TblStroitel := TTable.Create(Self);
  With TblStroitel Do Begin
		DataBaseName := DBaseName;
		TableName := '8.DB';
    Active := True;
    First;
  End;{With}

	While Not(TblStroitel.Eof) Do Begin
    TblAll.Append;
    TblAll.Fields[0].AsString := TblStroitel.Fields[0].AsString;
    TblAll.Fields[1].AsFloat := (KoefIdlChast/SumIdlChast)*TblStroitel.Fields[2].AsFloat;
    TblAll.Fields[2].AsDateTime := TblStroitel.Fields[3].AsDateTime;
    TblAll.Post;
    TblStroitel.Next;
  End;
  TblAll.Active := False;
  TblStroitel.Free;
End;
     
procedure TDlgNewKoop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	TblAll.Active := False;
	TblAll.Destroy;
end;

procedure TDlgNewKoop.EdtDataChange(Sender: TObject);
Var
	Data: TDateTime;
begin
	CheckErrorData := True;
	try
		Data := StrToDate((Sender As TCustomEdit).Text);
    CheckErrorData := False;
  except
  	CheckErrorData := True;
    If (Sender As TCustomEdit).Text = '__/__/____' Then
    	CheckErrorData := False;
  end;
end;

procedure TDlgNewKoop.EdtDataExit(Sender: TObject);
begin
	If CheckErrorData Then Begin{Error}
  	(Sender as TCustomEdit).SetFocus;
    Raise EDBEditError.Create('');
	End;
end;

procedure TDlgNewKoop.EdtFNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (EdtFName.Text <> '')And(EdtSName.Text <> '')And
    (EdtLName.Text <> '')And(EdtUIdealnaChast.Text <> '') Then
			BtnAdd.Enabled := True
	Else
  	BtnAdd.Enabled := False;
end;

end.


