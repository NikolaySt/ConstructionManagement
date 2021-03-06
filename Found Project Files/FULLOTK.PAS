unit Fullotk;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, ExtCtrls, Buttons, DBTables, CBoxInd;

type
  TDlgFullOtkaz = class(TForm)
    GBoxStroitel: TGroupBox;
    LblLName: TLabel;
    LblSName: TLabel;
    LblFName: TLabel;
    LblRazxod: TLabel;
    LblSuma: TLabel;
    Lbllv: TLabel;
    LblData: TLabel;
    LblSpisuk: TLabel;
    EdtFName: TEdit;
    EdtSName: TEdit;
    EdtLName: TEdit;
    EdtDokNom: TEdit;
    EdtSuma: TEdit;
    EdtData: TMaskEdit;
    Bevel1: TBevel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    CBoxSpisuk: TCBoxIndex;
    procedure CBoxSpisukChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtDataKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDataChange(Sender: TObject);
    procedure EdtDataExit(Sender: TObject);
  private
    { Private declarations }
  	QrySuma: TQuery;
    CheckErrorData: Boolean;
    RealPost: Single;
  public
    { Public declarations }
		Function ExecuteOtkazSobst(Var i: Integer; Var DocNom,
			Data: String; Var Suma: Single): Boolean;
  end;

var
  DlgFullOtkaz: TDlgFullOtkaz;

implementation

{$R *.DFM}

Uses MyConst, Kasa;

Function TDlgFullOtkaz.ExecuteOtkazSobst(Var i: Integer; Var DocNom,
	Data: String; Var Suma: Single): Boolean;
Begin
	Self.Caption := 'Пълно отказване от участие';
  BtnOk.Caption := 'Разход';
	Result := False;
  EdtFName.Text := '';
  EdtSName.Text := '';
	EdtLName.Text := '';
  EdtSuma.Text := '';
  EdtFName.Enabled := False;
  EdtSName.Enabled := False;
	EdtLName.Enabled := False;
  EdtSuma.Enabled := False;
  CBoxSpisuk.Visible := True;
  LblSpisuk.Visible := True;

  QrySuma := TQuery.Create(Self);
  With QrySuma Do Begin
  	DataBaseName := DBaseName;
    SQL.Add('');
		SQL.Add('');
    SQL.Add('');
  End;

  Try
  	If ShowModal = mrOk Then Begin
  		i := StrToInt(CBoxSpisuk.StringsIndex[CBoxSpisuk.ItemIndex].Index);
    	DocNom := EdtDokNom.Text;
    	Data := EdtData.Text;
    	Suma := RealPost;
    	Result := True;
  	End;
  Finally
  	QrySuma.Destroy;
  End;
End;

procedure TDlgFullOtkaz.CBoxSpisukChange(Sender: TObject);
begin
	With DlgKasa.TblKoop Do Begin
  	If FindKey([StrToInt(CBoxSpisuk.StringsIndex[CBoxSpisuk.ItemIndex].Index)]) Then Begin
    	EdtFName.Text := Fields[1].AsString;
  		EdtSName.Text := Fields[2].AsString;
			EdtLName.Text := Fields[3].AsString;

      	RealPost := 0;
      	QrySuma.SQL.Strings[1] := 'FROM "' + Fields[5].AsString +'.DB"';

        QrySuma.Active := False;
    		QrySuma.SQL.Strings[0] := 'Select Sum(Plachane), Sum(NakazLixva)';
				QrySuma.SQL.Strings[2] := 'WHERE DocNom <> "Салдо."';
        QrySuma.Active := True;
        RealPost := QrySuma.Fields[0].AsFloat - QrySuma.Fields[1].AsFloat;

        QrySuma.Active := False;
    		QrySuma.SQL.Strings[0] := 'SELECT SUM(IztOrder)';
				QrySuma.SQL.Strings[2] := '';
        QrySuma.Active := True;
        RealPost := RealPost - QrySuma.Fields[0].AsFloat;

        EdtSuma.Text := Format('%n', [RealPost]);
        Edit1.Text := Format('%n', [Fields[7].AsFloat]);
        RealPost := Fields[7].AsFloat+RealPost;
        Edit2.Text := Format('%n', [RealPost]);
    End;{If FindKey}
  End;{With TblKoop}
end;

procedure TDlgFullOtkaz.FormShow(Sender: TObject);
begin
	BtnOk.Enabled := False;
	EdtSuma.Text := '';
  EdtData.Text := '';
  EdtDokNom.Text := '';
  EdtFName.Text := '';
  EdtSName.Text := '';
  EdtLName.Text := '';
  Edit1.Text := '';
  Edit2.Text := '';
	CBoxSpisuk.ItemIndex := 0;
  CBoxSpisukChange(Sender);
end;

procedure TDlgFullOtkaz.EdtDataKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (EdtData.Text <> '  /  /    ')And
    (EdtDokNom.Text <> '')And(EdtfName.Text <> '')And
    (EdtSName.Text <> '') Then
  	BtnOk.Enabled := True
	Else
  	BtnOk.Enabled := False;
end;

procedure TDlgFullOtkaz.EdtDataChange(Sender: TObject);
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

procedure TDlgFullOtkaz.EdtDataExit(Sender: TObject);
begin
	If CheckErrorData Then Begin{Error}
  	(Sender as TCustomEdit).SetFocus;
    Raise EDBEditError.Create('');
	End;
end;

end.
