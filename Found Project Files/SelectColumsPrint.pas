unit SelectColumsPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst;

type
  TDlgSelPrint = class(TForm)
    CheckListBox1: TCheckListBox;
    BtnOK: TButton;
    BtnCancel: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function Execute: Boolean; 
  end;

var
  DlgSelPrint: TDlgSelPrint;

implementation

{$R *.DFM}

function TDlgSelPrint.Execute: Boolean;
begin
	if ShowModal = mrOK then Result := True
  else Result := False;
end;

procedure TDlgSelPrint.FormCreate(Sender: TObject);
var
	i: Integer;
begin
	for i := 0 to CheckListBox1.Items.Count - 1 do
  	CheckListBox1.Checked[i] := True;
end;

end.
