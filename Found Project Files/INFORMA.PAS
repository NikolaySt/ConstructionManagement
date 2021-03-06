unit Informa;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, DB, DBTables, ExtCtrls;

type
  TDlgInfo = class(TForm)
    QryCount: TQuery;
    BtnAdd: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Bevel1: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgInfo: TDlgInfo;

implementation

{$R *.DFM}

procedure TDlgInfo.FormShow(Sender: TObject);
begin
  With QryCount Do begin
	  SQL.Strings[2] := 'WHERE U.Blok = "Â1"';
    Active := True;
    Label8.Caption := Fields[0].AsString;

    Active := False;
    SQL.Strings[2] := 'WHERE U.Blok = "Â2"';
    Active := True;
    Label9.Caption := Fields[0].AsString;

    Active := False;
    SQL.Strings[2] := 'WHERE U.Blok = "Â3"';
    Active := True;
    Label10.Caption := Fields[0].AsString;

    Active := False;
    SQL.Strings[2] := 'WHERE U.Blok = "Â4"';
    Active := True;
    Label11.Caption := Fields[0].AsString;

    Active := False;
    SQL.Strings[2] := 'WHERE U.Blok = "Â5"';
    Active := True;
    Label12.Caption := Fields[0].AsString;

    Active := False;
    SQL.Strings[2] := 'WHERE U.Blok = "Â6"';
    Active := True;
    Label13.Caption := Fields[0].AsString;

    Active := False;
    SQL.Strings[2] := 'WHERE U.Blok = "Â7"';
    Active := True;
    Label14.Caption := Fields[0].AsString;

    Active := False;
    SQL.Strings[0] := 'SELECT Count(U.ID_UCHASTIE)';
    SQL.Strings[2] := '';
    Active := True;
    Label16.Caption := Fields[0].AsString;

    Active := False;
  End;
end;

end.
