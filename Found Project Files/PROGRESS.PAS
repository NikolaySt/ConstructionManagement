unit Progress;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Gauges, ExtCtrls, StdCtrls;

type
  TDlgProgress = class(TForm)
    Panel1: TPanel;
    Gauge1: TGauge;
    Label1: TLabel;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    ExitOtchet: Boolean;
  end;

var
  DlgProgress: TDlgProgress;

implementation

{$R *.DFM}

procedure TDlgProgress.FormShow(Sender: TObject);
begin
	ExitOtchet := False;
end;

procedure TDlgProgress.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 27 Then ExitOtchet := True;
end;

end.
