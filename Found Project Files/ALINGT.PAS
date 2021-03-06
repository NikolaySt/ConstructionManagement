unit Alingt;

interface

uses           
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TDlgAlign = class(TForm)
    GrpAlign: TRadioGroup;
    BtnOk: TBitBtn;
    procedure GrpAlignClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgAlign: TDlgAlign;

implementation

{$R *.DFM}

Uses Mail;

procedure TDlgAlign.GrpAlignClick(Sender: TObject);
begin
	Case GrpAlign.ItemIndex Of
  	0: DlgMail.MemoMail.Alignment := taLeftJustify;
    1: DlgMail.MemoMail.Alignment := taRightJustify;
    2: DlgMail.MemoMail.Alignment := taCenter;
  End;
end;

procedure TDlgAlign.BtnOkClick(Sender: TObject);
begin
	Close
end;

end.
