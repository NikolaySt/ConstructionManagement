unit PrtOtchet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, PrtDesignPage, StdCtrls, PrtDesignLabel, PrtDesignFigure,
  PrtDesignDBLabel, DBCtrls, DBTextRegDim, Otchet, PrtDesignDBGrid;

type
  TDlgPrintOtchet = class(TForm)
    PrintPage: TPrintDesignPage;
    LblTitle: TPrintDesignLabel;
    PrintDesignLabel2: TPrintDesignLabel;
    PrintDesignLabel3: TPrintDesignLabel;
    PrintDesignLabel4: TPrintDesignLabel;
    PrintDesignLabel5: TPrintDesignLabel;
    PrintDesignFigure1: TPrintDesignFigure;
    PrintDesignDBLabelDim1: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim2: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim3: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim4: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim5: TPrintDesignDBLabelDim;
    PrintDesignLabel6: TPrintDesignLabel;
    PrintDesignLabel7: TPrintDesignLabel;
    PrintDesignLabel8: TPrintDesignLabel;
    PrintDesignLabel9: TPrintDesignLabel;
    PrintDesignLabel10: TPrintDesignLabel;
    PrintGrid: TPrintDesignDBGrid;
  private
    { Private declarations }
  public
    procedure PrintOtchet;
  end;

var
  DlgPrintOtchet: TDlgPrintOtchet;

implementation

{$R *.DFM}

uses DBTables, SelectColumsPrint;

const
	Title = 'Œ“◊≈“ Õ¿ œŒ—“⁄œÀ≈Õ»ﬂ“¿ » «¿ƒ⁄À∆≈Õ»ﬂ“¿ Õ¿  ŒŒœ≈–¿“Œ–»“≈  ⁄Ã - ';

{ TForm1 }

procedure TDlgPrintOtchet.PrintOtchet;
var
	TmpTable: TDBDataSet;
begin
	LblTitle.Caption := Title + FormatDateTime('dd/mm/yyyy', Date);
	PrintGrid.DataSource := DlgOtchet.DGridOtchet.DataSource;
  with DlgOtchet, DlgSelPrint do begin

  	if QryRazrez.Active then TmpTable := TDBDataSet(QryRazrez)
    else TmpTable := TDBDataSet(TblOtchet);

    with TmpTable do begin
      DisableControls;
    	try
        FieldByName('IdealnaChast').Visible := CheckListBox1.Checked[0];
				FieldByName('Purvo_Vnoski').Visible := CheckListBox1.Checked[1];
        FieldByName('LichniVniski').Visible := CheckListBox1.Checked[2];
				FieldByName('Nak_Lixvi').Visible := CheckListBox1.Checked[3];
				FieldByName('Iztegl_Sumi').Visible := CheckListBox1.Checked[4];
				FieldByName('Realno_Postup').Visible := CheckListBox1.Checked[5];
				FieldByName('Zadulgenia').Visible := CheckListBox1.Checked[6];

			  PrintPage.Refresh;
			  PrintPage.Print('ŒÚ˜ÂÚ Ì‡ ÍÓÓÔÂ‡ÚÓËÚÂ');
      finally
        FieldByName('IdealnaChast').Visible := CheckListBox1.Checked[0] or True;
				FieldByName('Purvo_Vnoski').Visible := CheckListBox1.Checked[1] or True;
        FieldByName('LichniVniski').Visible := CheckListBox1.Checked[2] or True;
				FieldByName('Nak_Lixvi').Visible := CheckListBox1.Checked[3] or True;
				FieldByName('Iztegl_Sumi').Visible := CheckListBox1.Checked[4] or True;
				FieldByName('Realno_Postup').Visible := CheckListBox1.Checked[5] or True;
				FieldByName('Zadulgenia').Visible := CheckListBox1.Checked[6] or True;

				EnableControls;
    	end;
    end;// with TmpTable
	end;
end;

end.


