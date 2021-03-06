unit Otkazva;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls;

type
  TDlgChangeSobst = class(TForm)
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    BtnHelp: TBitBtn;
    CBoxSpisuk: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgChangeSobst: TDlgChangeSobst;

implementation

{$R *.DFM}

end.
