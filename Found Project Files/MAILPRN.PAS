unit MailPrn;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids, Buttons;

type
  TDlgMailPrint = class(TForm)
    DBGridFull1: TDBGrid;
    TblKoop: TTable;
    TblKoopID_NAME: TSmallintField;
    TblKoopFName: TStringField;
    TblKoopSName: TStringField;
    TblKoopLName: TStringField;
    TblKoopNotes: TMemoField;
    TblKoopFiles: TStringField;
    TblKoopKoef: TFloatField;
    DtSKoop: TDataSource;
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    ChkBoxAll: TCheckBox;
    BtnOK: TBitBtn;
    BtnCancel: TBitBtn;
    EdtCount1: TEdit;
    EdtCount2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChkBoxAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function Execute(Var Select: String; Var Count1, Count2: String;
			Var All: Boolean): Boolean;
  end;

var
  DlgMailPrint: TDlgMailPrint;

implementation

{$R *.DFM}

Function TDlgMailPrint.Execute(Var Select: String; Var Count1, Count2: String;
	Var All: Boolean): Boolean;
Begin
	If ShowModal = mrOK Then Begin
  	Result := True;
    If ChkBoxAll.Checked Then Begin
    	All := True;
      Select := '';
     End
    Else Begin
    	All := False;
      Select := Edit1.Text;
      Count1 := EdtCount1.Text;
      Count2 := EdtCount2.Text;
    End;{If ChkBoxAll.Checked}
   End
  Else Result := False;
End;
    
procedure TDlgMailPrint.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If (Sender as TEdit).Text = '' Then BtnOk.Enabled := False
  Else BtnOk.Enabled := True;
end;

procedure TDlgMailPrint.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
	If ChkBoxAll.Checked Then ChkBoxAll.Checked := False;
  If ((Sender as TEdit).Name = 'EdtCount1')Or
  	((Sender as TEdit).Name = 'EdtCount2') Then Begin
		If Not((Ord(Key) In [48..57])Or(Ord(Key) = 8)) Then	Key := Chr(1);
   End
  Else
		If Not((Ord(Key) In [48..57])Or
  		((Ord(Key) = 8)Or(Ord(key) = 44))) Then	Key := Chr(1);
end;

procedure TDlgMailPrint.FormShow(Sender: TObject);
begin
	TblKoop.Active := True;
end;

procedure TDlgMailPrint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	TblKoop.Active := False;
end;

procedure TDlgMailPrint.ChkBoxAllClick(Sender: TObject);
begin
	If ChkBoxAll.Checked Then BtnOK.Enabled := True
  Else Begin
  	If Edit1.Text = '' Then BtnOK.Enabled := False;
  End;
end;

end.
