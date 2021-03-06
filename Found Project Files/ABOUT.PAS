unit About;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TDlgAbout = class(TForm)
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Image1: TImage;
  private
  end;

var
  DlgAbout: TDlgAbout;

implementation

{$R *.DFM}

end.
