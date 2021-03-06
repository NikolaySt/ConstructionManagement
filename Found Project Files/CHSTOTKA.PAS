unit Chstotka;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DBTables,
  DB, CBoxInd;

type

  TDlgChastOtkaz = class(TForm)
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
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
    DEdtUBlock1: TDBEdit;
    DEdtUEtag1: TDBEdit;
    DEdtUApart1: TDBEdit;
    DEdtUMag1: TDBEdit;
    DEdtUGarag1: TDBEdit;
    DEdtUMaze1: TDBEdit;
    DEdtUAtelie1: TDBEdit;
    DEdtUTavan1: TDBEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel2: TBevel;
    Label11: TLabel;
    DEdtUBlock2: TDBEdit;
    DEdtUEtag2: TDBEdit;
    DEdtUApart2: TDBEdit;
    DEdtUMag2: TDBEdit;
    DEdtUGarag2: TDBEdit;
    DEdtUMaze2: TDBEdit;
    DEdtUAtelie2: TDBEdit;
    DEdtUTavan2: TDBEdit;
    DataSource1: TDataSource;
    TblUchast1: TTable;
    TblUchast2: TTable;
    DataSource2: TDataSource;
    TblKoop1: TTable;
    TblKoop2: TTable;
    TblKoop2Koef: TFloatField;
    TblKoop2ID_NAME: TSmallintField;
    TblKoop1ID_NAME: TSmallintField;
    TblKoop1Koef: TFloatField;
    DEdtKoef1: TDBEdit;
    DEdtKoef2: TDBEdit;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    CBoxSpisuk1: TCBoxIndex;
    CBoxSpisuk2: TCBoxIndex;
    procedure FormShow(Sender: TObject);
    procedure CBoxSpisuk1Change(Sender: TObject);
    procedure CBoxSpisuk2Change(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  public
    Function Execute: Boolean;
  end;

var
  DlgChastOtkaz: TDlgChastOtkaz;

implementation

{$R *.DFM}

Uses KprStroi, Kasa, NewKoop;

procedure TDlgChastOtkaz.FormShow(Sender: TObject);
begin
	TblUchast1.Active := True;
	TblKoop1.Active := True;

  TblUchast2.Active := True;
	TblKoop2.Active := True;

  CBoxSpisuk1.ItemIndex := 0;
  CBoxSpisuk1Change(Sender);

  CBoxSpisuk2.ItemIndex := 0;
  CBoxSpisuk2Change(Sender);
end;

procedure TDlgChastOtkaz.CBoxSpisuk1Change(Sender: TObject);
begin
	TblUchast1.Cancel;
  TblKoop1.Cancel;
	TblUchast1.FindKey([StrToInt(CBoxSpisuk1.StringsIndex[CBoxSpisuk1.ItemIndex].Index)]);
  TblKoop1.FindKey([StrToInt(CBoxSpisuk1.StringsIndex[CBoxSpisuk1.ItemIndex].Index)]);
end;

procedure TDlgChastOtkaz.CBoxSpisuk2Change(Sender: TObject);
begin
	TblUchast2.Cancel;
  TblKoop2.Cancel;
	TblUchast2.FindKey([StrToInt(CBoxSpisuk2.StringsIndex[CBoxSpisuk2.ItemIndex].Index)]);
	TblKoop2.FindKey([StrToInt(CBoxSpisuk2.StringsIndex[CBoxSpisuk2.ItemIndex].Index)]);
end;

Function TDlgChastOtkaz.Execute: Boolean;
Begin
	Result := False;
	If ShowModal = mrOK Then Begin
		Result := True;
  End;{If ShowModal = mrOK }
End;

procedure TDlgChastOtkaz.FormHide(Sender: TObject);
begin
	TblUchast1.Active := False;
	TblKoop1.Active := False;
  TblUchast2.Active := False;
	TblKoop2.Active := False;
end;

procedure TDlgChastOtkaz.BtnOkClick(Sender: TObject);
begin
	If TblUchast1.State in [dsEdit] Then TblUchast1.Post;
	If TblKoop1.State in [dsEdit] Then TblKoop1.Post;
  If TblUchast2.State in [dsEdit] Then TblUchast2.Post;
	If TblKoop2.State in [dsEdit] Then TblKoop2.Post;
end;

end.
