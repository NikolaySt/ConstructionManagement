unit Spisuk;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, Db, DBTables, DBCtrls, ExtCtrls, StdCtrls, Grids,
  DBGrids, Mask, Buttons, DBTextRegDim;

type
  TDlgSpisuk = class(TForm)
    GBoxPasp: TGroupBox;
    LblSeria: TLabel;
    LblPaspNom: TLabel;
    LblData: TLabel;
    LblIzdaden: TLabel;
    LblEGN: TLabel;
    GBoxAdres: TGroupBox;
    LblGrad: TLabel;
    LblUlica: TLabel;
    LblNo: TLabel;
    LblBlok: TLabel;
    LblVxod: TLabel;
    LblEtag: TLabel;
    LblApart: TLabel;
    LblPostKod: TLabel;
    GBoxCall: TGroupBox;
    LblTel: TLabel;
    DtSKoop: TDataSource;
    TblKoop: TTable;
    DBGridFull1: TDBGrid;
    DtSPasp: TDataSource;
    TblPasp: TTable;
    DtSAdres: TDataSource;
    DtSCall: TDataSource;
    DtSUchast: TDataSource;
    TblAdres: TTable;
    TblCall: TTable;
    TblUchast: TTable;
    DEdtEGN: TDBEdit;
    DEdtIzdaden: TDBEdit;
    DEdtData: TDBEdit;
    DEdtSeria: TDBEdit;
    DEdtNom: TDBEdit;
    DEdtGrad: TDBEdit;
    DEdtPostKod: TDBEdit;
    DEdtUlica: TDBEdit;
    DEdtUlicaNom: TDBEdit;
    DEdtBlok: TDBEdit;
    DEdtVxod: TDBEdit;
    DEdtEtag: TDBEdit;
    DEdtApart: TDBEdit;
    DMemoNotes: TDBMemo;
    PnlStatus: TPanel;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Bevel1: TBevel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label20: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    TblPaspID_PASPORT: TSmallintField;
    TblPaspSeria: TStringField;
    TblPaspPaspNom: TStringField;
    TblPaspData: TDateField;
    TblPaspIzdadenOt: TStringField;
    TblPaspEGN: TStringField;
    TblKoopID_NAME: TSmallintField;
    TblKoopFName: TStringField;
    TblKoopSName: TStringField;
    TblKoopLName: TStringField;
    TblKoopNotes: TMemoField;
    TblKoopFiles: TStringField;
    TblKoopKoef: TFloatField;
    TblUchastID_UCHASTIE: TSmallintField;
    TblUchastBlok: TStringField;
    TblUchastEtag: TStringField;
    TblUchastApart: TStringField;
    TblUchastMagazin: TStringField;
    TblUchastGarag: TStringField;
    TblUchastMaze: TStringField;
    TblUchastAtelie: TStringField;
    TblUchastTavan: TStringField;
    TblUchastIdealnaChast: TFloatField;
    N5: TMenuItem;
    N8: TMenuItem;
    PrintDialog1: TPrintDialog;
    DBNavigator1: TDBNavigator;
    DEdtTel: TDBEdit;
    N9: TMenuItem;
    DBTextRec1: TDBTextRec;
    N6: TMenuItem;
    procedure DMemoNotesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GBoxPaspMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GBoxAdresMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GBoxUchstieMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GBoxCallMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnCloseMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnHelpMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TblPaspAfterEdit(DataSet: TDataset);
    procedure GroupBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGridFull1MouseMove(Sender: TObject; X, Y: Integer);
    procedure DBNavMove1MouseMove(Sender: TObject; X, Y: Integer);
    procedure SpeedButton2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N3Click(Sender: TObject);
    procedure TblUchastAfterPost(DataSet: TDataset);
    procedure DBGridFull1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridFull1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridFull1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  	NewKoef: Single;
		procedure ApplyKoeficient; 
  public
    { Public declarations }
  end;

var
  DlgSpisuk: TDlgSpisuk;

implementation

{$R *.DFM}

Uses ListPrt, Informa, MyConst, ToolsFunc, Newkoop, Karton, ChangeKoef,
	DlgMess, SetupReg;

Const
	C_Status = ' ';

procedure TDlgSpisuk.DMemoNotesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status + 'Бележки за член кооператора';
end;

procedure TDlgSpisuk.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	PnlStatus.Caption := '';
end;

procedure TDlgSpisuk.GBoxPaspMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Данни за член кооператора от паспорта'
end;

procedure TDlgSpisuk.GBoxAdresMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Постоянен адрес на член кооператора';
end;

procedure TDlgSpisuk.GBoxUchstieMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Данни за претижаваната част от кооперацията'
end;

procedure TDlgSpisuk.GBoxCallMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Данни за пряка връзка'
end;

procedure TDlgSpisuk.BtnCloseMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Затваря прозореца и се връща към главното меню'
end;

procedure TDlgSpisuk.BtnHelpMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Предоставя помощна информация за програмата'
end;

procedure TDlgSpisuk.FormShow(Sender: TObject);
begin
	SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
	TblKoop.Active := True;
  If TblKoop.RecordCount = 0 Then Begin
  	TblKoop.Active := False;
  	TblPasp.Active := False;
  	TblAdres.Active := False;
  	TblCall.Active := False;
  	TblUchast.Active := False;
    N3.Enabled := False;
    N6.Enabled := False;
   End
  Else Begin
  	TblPasp.Active := True;
  	TblAdres.Active := True;
  	TblCall.Active := True;
  	TblUchast.Active := True;
    N3.Enabled := True;
    N6.Enabled := True;
	End;
end;

procedure TDlgSpisuk.N4Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgSpisuk.SpeedButton1Click(Sender: TObject);
begin
	If TblKoop.State In [dsEdit] Then TblKoop.Cancel;
  If TblPasp.State In [dsEdit] Then TblPasp.Cancel;
  If TblAdres.State In [dsEdit] Then TblAdres.Cancel;
  If TblCall.State In [dsEdit] Then TblCall.Cancel;
  If TblUchast.State In [dsEdit] Then TblUchast.Cancel;
 	SpeedButton2.Enabled := False;
  SpeedButton1.Enabled := False;
end;

procedure TDlgSpisuk.SpeedButton2Click(Sender: TObject);
begin
	If TblKoop.State In [dsEdit] Then TblKoop.Post;
  If TblPasp.State In [dsEdit] Then TblPasp.Post;
  If TblAdres.State In [dsEdit] Then TblAdres.Post;
  If TblCall.State In [dsEdit] Then TblCall.Post;
  If TblUchast.State In [dsEdit] Then TblUchast.Post;
 	SpeedButton2.Enabled := False;
  SpeedButton1.Enabled := False;
end;

procedure TDlgSpisuk.TblPaspAfterEdit(DataSet: TDataset);
begin
	SpeedButton2.Enabled := True;
  SpeedButton1.Enabled := True;
end;

procedure TDlgSpisuk.GroupBox1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Записано дялово участие в кооперацията'
end;

procedure TDlgSpisuk.DBGridFull1MouseMove(Sender: TObject; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Списък на кооператорите';
end;

procedure TDlgSpisuk.DBNavMove1MouseMove(Sender: TObject; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status + 'Режим на търсене';
end;

procedure TDlgSpisuk.SpeedButton2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status + 'Режим на редактиране';
end;

procedure TDlgSpisuk.N3Click(Sender: TObject);
begin
	DlgListPrint.Execute;
end;

procedure TDlgSpisuk.TblUchastAfterPost(DataSet: TDataset);
begin
	SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
end;

procedure TDlgSpisuk.DBGridFull1KeyPress(Sender: TObject; var Key: Char);
//Var
	//Up: Array[0..0] Of Char;
  //S: String;
begin
{
	If (Ord(Key) In [192..255])Or
  	(Ord(Key) In [65..90])Or
    (Ord(Key) In [97..122])Or(Ord(Key) = 8) Then Begin

		If Ord(Key) In [224..255] Then Key := Chr(Ord(Key) - 32)
  	Else Begin
			S := UpperCase(Key);
  		StrPCopy(Up, S);
  		Key := Up[0];
  	End;

   End
  Else Begin }
  	If (Ord(Key) = 13)And(TblKoop.State in [dsEdit]) Then TblKoop.Post
//		Else Key := Chr(1);
  //End;
end;

procedure TDlgSpisuk.DBGridFull1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	Exit;
	If Key = 45 Then Key := 1;
  If (Key = 46)And(Shift = [ssCtrl]) Then Key := 1;
end;

procedure TDlgSpisuk.DBGridFull1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	If Key = 40 Then
		If TblKoop.State in [dsInsert] Then TblKoop.Cancel;
  If Key = 27 Then
  	If TblKoop.State in [dsEdit] Then Begin
    	TblKoop.Cancel;
      SpeedButton1.Enabled := False;
      SpeedButton2.Enabled := False;
    End;
end;

procedure TDlgSpisuk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	TblKoop.Active := False;
  TblPasp.Active := False;
  TblAdres.Active := False;
  TblCall.Active := False;
  TblUchast.Active := False;
end;

procedure TDlgSpisuk.N6Click(Sender: TObject);
Var
	i: Integer;
  QrySuma: TQuery;
begin
	Exit;
//Пълно изтриване от списъка...

	If MessageDlg1('Изтриването на кооператора е невъзтановимо!'+#13+
  	'(Така премахнат кооператора, е все едно,'+#13+
    'че никога не е бил въвеждан.)', mtWarning, [mbYes, mbNo], 0) = mrYes Then
  	If MessageDlg1('Потвърдете за изтриване', mtInformation, [mbYes, mbNo], 0) = mrYes Then
    begin
			QrySuma := TQuery.Create(Self);
    	Try
        With QrySuma Do Begin
        	DataBaseName := DBaseName; 
					SQL.Add('SELECT Sum(K.Plachane)');
          SQL.Add('FROM "'+TblKoop.Fields[5].AsString+'.DB" K');
          Active := True;
          If Fields[0].AsFloat > 0.009 Then Begin
            MessageDlg1('Кооператора има внсени пари, неможе да бъде изтрит!', mtInformation, [mbAbort], 0);
          	Exit;
          End;
        End;
    		//Sysutils.DeleteFile('C:\Stroitel\DataBase\'+TblKoop.Fields[5].AsString + '.DB');
      	i := TblKoop.Fields[0].AsInteger;
    		TblKoop.Delete;
      	TblKoop.Active := False;
      	If TblPasp.FindKey([i])   Then TblPasp.Delete;
      	If TblAdres.FindKey([i])  Then TblAdres.Delete;
      	If TblCall.FindKey([i])   Then TblCall.Delete;
      	If TblUchast.FindKey([i]) Then TblUchast.Delete;
      Finally
      	TblKoop.Active := True;
        If QrySuma <> nil Then Begin
        	QrySuma.Active := False;
        	QrySuma.Free;
        End;
      End;{Try}
    End;{If 2}
end;

procedure TDlgSpisuk.N8Click(Sender: TObject);
begin
	DlgInfo.ShowModal;
end;

procedure TDlgSpisuk.N9Click(Sender: TObject);
begin
	if DlgChangeKoef.Execute(TblKoop.FieldByName('Koef').AsFloat, NewKoef) then
   	ApplyKoeficient;
end;

procedure TDlgSpisuk.ApplyKoeficient;
var
	Payments: TPayments;
  TblKarton: TTable;
  PPay: PPersonPayment;
  i, SaveDo: Integer;
  TmpStr: String;
  ChAddVnaski: Boolean;

  procedure AddDoPlanVnoska;
  begin
		if Payments.CountPlanVnoska > 0 then begin
    	if Payments.ItemsPlanVnoska(0) > 0 then begin
	      AddPlanVnoska(TblKarton, NewKoef,	1, Payments.ItemsPlanVnoska(0));
    		SaveDo := Payments.ItemsPlanVnoska(0);
      end;
      Payments.DeletePlanVnoska(0);
		end
    else begin
    	if ChAddVnaski then Exit;
    	if SaveDo = -1 then
	      AddPlanVnoska(TblKarton, NewKoef, -1, -1)// всички планови вноски
      else
	      AddPlanVnoska(TblKarton, NewKoef, SaveDo + 1, -1);
          	// всички планови вноски от SaveDo + 1 до края;
    	ChAddVnaski := True;
    end;
  end;    
begin
  TblKarton := TTable.Create(Self);
  try
    TblKarton.DataBaseName := DBaseName;
    TblKarton.TableName := TblKoop.FieldByName('Files').AsString;
    TblKarton.Open;
    Payments := ExtractPersonPayment(TBlKarton);
    if (NewKoef = 0)and(Payments.Count > 0) then begin
    	MessageDlg1('Не може да въвеждате коефициент 0.000 когато '+#13+
      	'има постъпления от кооператорите', mtInformation, [mbOK], 0);
      Exit;
    end;
    with TblKoop do begin
    	Edit;
      FieldByName('Koef').AsFloat := NewKoef;
      Post;
    end;    
    try
    	EmptyTable(TblKarton);
      SaveDo := -1;
      ChAddVnaski := False;
      
			AddDoPlanVnoska;

      if Payments.Count > 0 then
	      for i := 0 to Payments.Count - 1 do begin
  	   		PPay := Payments.Items[i];
          TmpStr := FormatFloat('#0.#0' ,PPay.Sum);
    	    case PPay.Mode of
      	  	tmBanka: AddPlachane(TblKarton, 'Банка', PPay.DocNo, TmpStr, PPay.Date);
        	  tmKasa: AddPlachane(TblKarton, 'Каса', PPay.DocNo, TmpStr, PPay.Date);
          	tmTeglene:
            	begin
              	TeglenePari(TblKarton, PPay);
     						AddDoPlanVnoska;
            	end;
	        end;
  	    end;
    finally
	  	Payments.Free;
    end;
  finally
    TblKarton.Free;
  end;
end;

procedure TDlgSpisuk.FormDestroy(Sender: TObject);
begin
	ProgOptions.SaveWindowExt(Self, Self.Name);
end;

procedure TDlgSpisuk.FormCreate(Sender: TObject);
begin
	ProgOptions.OpenWindowExt(Self, Self.Name);
end;

end.


