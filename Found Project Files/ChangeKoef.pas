unit ChangeKoef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LabelRegDim, StdCtrls, Edtvalue;

type
  TDlgChangeKoef = class(TForm)
    BtnOK: TButton;
    BtnCancel: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdtKoef: TValueEdit;
    LblKoef: TLabelRec;
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
		function Execute(OldKoef: Single; Var NewKoef: Single): Boolean;
  end;

var
  DlgChangeKoef: TDlgChangeKoef;

implementation

{$R *.DFM}

uses DlgMess;

{ TDlgChangeKoef }

function TDlgChangeKoef.Execute(OldKoef: Single; Var NewKoef: Single): Boolean;
begin
	LblKoef.Caption := FormatFloat('#0.##0', OldKoef);
  EdtKoef.AsFloat := 0;
	if ShowModal = mrOK then Result := True
  else Result := False;
  NewKoef := EdtKoef.AsFloat;
end;

procedure TDlgChangeKoef.BtnOKClick(Sender: TObject);
begin
 	ModalResult := mrOK;
end;

end.
