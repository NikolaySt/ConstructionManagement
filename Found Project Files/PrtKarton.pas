unit PrtKarton;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, PrtDesignLabel, PrtDesignDBLabel, PrtDesignFigure, ExtCtrls,
  PrtDesignPage, PrtDesignMemo, Karton, Db, DBTables, PrtDesignDBGrid;

type
  TDlgPrintKarton = class(TForm)
    PrintPage: TPrintDesignPage;
    PrintDesignFigure1: TPrintDesignFigure;
    PrintDesignDBLabelDim1: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim2: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim3: TPrintDesignDBLabelDim;
    PrintDesignLabel1: TPrintDesignLabel;
    PrintDesignLabel2: TPrintDesignLabel;
    PrintDesignLabel3: TPrintDesignLabel;
    PrintDesignDBLabelDim4: TPrintDesignDBLabelDim;
    PrintDesignLabel4: TPrintDesignLabel;
    PrintDesignLabel5: TPrintDesignLabel;
    PrintDesignLabel6: TPrintDesignLabel;
    PrintDesignLabel7: TPrintDesignLabel;
    PrintDesignLabel8: TPrintDesignLabel;
    PrintDesignLabel9: TPrintDesignLabel;
    PrintDesignFigure2: TPrintDesignFigure;
    PrintDesignLabel10: TPrintDesignLabel;
    PrintDesignLabel11: TPrintDesignLabel;
    PrintDesignLabel12: TPrintDesignLabel;
    PrintDesignLabel13: TPrintDesignLabel;
    PrintDesignLabel14: TPrintDesignLabel;
    PrintDesignLabel15: TPrintDesignLabel;
    PrintDesignLabel16: TPrintDesignLabel;
    PrintDesignLabel17: TPrintDesignLabel;
    PrintDesignLabel18: TPrintDesignLabel;
    PrintDesignDBLabelDim5: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim7: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim8: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim6: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim9: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim10: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim11: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim12: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim13: TPrintDesignDBLabelDim;
    PrintDesignFigure3: TPrintDesignFigure;
    PrintDesignLabel19: TPrintDesignLabel;
    PrintDesignLabel20: TPrintDesignLabel;
    PrintDesignLabel21: TPrintDesignLabel;
    PrintDesignDBLabelDim14: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim15: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim16: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim17: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim18: TPrintDesignDBLabelDim;
    LblRealPost: TPrintDesignDBLabelDim;
    PrintDesignLabel22: TPrintDesignLabel;
    PrintDesignLabel23: TPrintDesignLabel;
    PrintDesignLabel24: TPrintDesignLabel;
    PrintDesignLabel25: TPrintDesignLabel;
    PrintDesignDBLabelDim20: TPrintDesignDBLabelDim;
    PrintDesignFigure4: TPrintDesignFigure;
    PrintDesignLabel26: TPrintDesignLabel;
    PrintDesignLabel27: TPrintDesignLabel;
    PrintDesignDBLabelDim21: TPrintDesignDBLabelDim;
    PrintDesignDBLabelDim22: TPrintDesignDBLabelDim;
    PrintDesignLabel28: TPrintDesignLabel;
    LblDate: TPrintDesignLabel;
    PrintDesignLabel30: TPrintDesignLabel;
    TblVnoski: TTable;
    DtSVnoski: TDataSource;
    TblVnoskiDocNo: TStringField;
    TblVnoskiDocDate: TDateField;
    TblVnoskiSum: TFloatField;
    TblVnoskiDocVid: TStringField;
    PrintDesignDBGrid1: TPrintDesignDBGrid;
    DtSTeglene: TDataSource;
    TblTeglene: TTable;
    StringField1: TStringField;
    DateField1: TDateField;
    FloatField1: TFloatField;
    PrintDesignDBGrid2: TPrintDesignDBGrid;
    PrintDesignFigure5: TPrintDesignFigure;
    PrintDesignFigure6: TPrintDesignFigure;
  private
		procedure PrintVnoski;
  public
		procedure PrintKarton;
  end;

var
  DlgPrintKarton: TDlgPrintKarton;

implementation

{$R *.DFM}

uses ToolsFunc;

procedure TDlgPrintKarton.PrintVnoski;
var
  i: Integer;
	Payments: TPayments;
  PPay: PPersonPayment;
  SBook: TBookMark;
begin
	with TblVnoski do begin
	 	if not Exists then CreateTable
  	else begin
  		Close;
      EmptyTable;
  	end;
    Open;
  end;
  
	with TblTeglene do begin
	 	if not Exists then CreateTable
  	else begin
  		Close;
      EmptyTable;
  	end;
    Open;
  end;
  SBook := DlgKarton.TblKarton.GetBookMark;
  try
  	DlgKarton.TblKarton.DisableControls;
		Payments := ExtractPersonPayment(DlgKarton.TblKarton);
  finally
  	try
  		DlgKarton.TblKarton.GotoBookMark(SBook);
  		DlgKarton.TblKarton.FreeBookMark(SBook);
    finally
    	DlgKarton.TblKarton.EnableControls;
    end;
  end;

  if Payments.Count > 0 then
    for i := 0 to Payments.Count - 1 do begin
	 		PPay := Payments.Items[i];
  	  if PPay.Mode in [tmBanka, tmKasa] then
				with TblVnoski do begin
        	Append;
					FieldByName('DocNo').AsString := PPay.DocNo;
					FieldByName('DocDate').AsDateTime := PPay.Date;
          FieldByName('Sum').AsFloat := PPay.Sum;
          if PPay.Mode = tmBanka then
          	FieldByName('DocVid').AsString := 'Банка'
          else
          	FieldByName('DocVid').AsString := 'Каса';
          Post;
        end
      else
				with TblTeglene do begin
        	Append;
					FieldByName('DocNo').AsString := PPay.DocNo;
					FieldByName('DocDate').AsDateTime := PPay.Date;
          FieldByName('Sum').AsFloat := PPay.Sum;
          Post;
        end
    end;
end;

procedure TDlgPrintKarton.PrintKarton;
begin
	PrintVnoski;

 	LblRealPost.Caption := DlgKarton.LblRealPost.Caption;
	LblDate.Caption := 'Дата: '+FormatDateTime('dd/mm/yyyy', Date);
  
  PrintPage.Refresh;
 	PrintPage.Print('Картон '+
  	PrintDesignDBLabelDim1.Caption+' '+
    PrintDesignDBLabelDim2.Caption+' '+
    PrintDesignDBLabelDim3.Caption);
end;

end.
