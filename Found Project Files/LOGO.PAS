unit Logo;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TDlgLogo = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgLogo: TDlgLogo;

implementation

{$R *.DFM}

end.
