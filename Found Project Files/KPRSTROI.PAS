unit KprStroi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Menus, Db, DBTables, ExtCtrls, Mask, StdCtrls;

type
  TDlgKooperacia = class(TForm)
    Database1: TDatabase;
    PnlStatus: TPanel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    BtnOtchet: TSpeedButton;
    BtnKasKniga: TSpeedButton;
    BtnPlanVnos: TSpeedButton;
    BtnKarton: TSpeedButton;
    BtnSpis: TSpeedButton;
    BtnNewKoop: TSpeedButton;
    BtnExit: TSpeedButton;
    SBtnMail: TSpeedButton;
    SBtnArhiv: TSpeedButton;
    BtnPredKasa: TSpeedButton;
    N9: TMenuItem;
    TimerOut: TTimer;
    N10: TMenuItem;
    N11: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    PrtSetupDialog: TPrinterSetupDialog;
    procedure BtnNewKoopClick(Sender: TObject);
    procedure BtnNewKoopMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnKartonMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnPlanVnosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnKasKnigaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnOtchetMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnSpisMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnExitMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Pnl_BtnMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnSpisClick(Sender: TObject);
    procedure BtnKartonClick(Sender: TObject);
    procedure BtnPlanVnosClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnKasKnigaClick(Sender: TObject);
    procedure BtnOtchetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBtnMailMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SBtnMailClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure SBtnArhivMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnPredKasaClick(Sender: TObject);
    procedure BtnPredKasaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SBtnArhivClick(Sender: TObject);
    procedure TimerOutTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N17Click(Sender: TObject);
  private
  	FDBPath: String;
    FActiveTimer: Boolean;
    procedure SetActiveTimer(const Value: Boolean);
    procedure DataBaseAlias;
	public
  	Property DBPath: String Read FDBPath Write FDBPath;
		Procedure KoopExcept(Sender: TObject; E: Exception);
    Property ActiveTimer: Boolean Read FActiveTimer Write SetActiveTimer;     
  end;


var
  DlgKooperacia: TDlgKooperacia;

implementation

{$R *.DFM}
{$R InfoData.res}

Uses NewKoop, Spisuk, Karton, PlanVns, PredKasa,
	Kasa, Otchet, Mail, About, MyConst, Arhiv, SetupReg, FileCtrl, Passchg;

procedure TDlgKooperacia.BtnNewKoopClick(Sender: TObject);
begin
	DlgNewKoop.ShowModal;
end;

procedure TDlgKooperacia.BtnNewKoopMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Добавяне на нов член - кооператор';
end;

procedure TDlgKooperacia.BtnSpisMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Списък на всички членове в кооперацията';
end;

procedure TDlgKooperacia.BtnKartonMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Отчет на плащанията на всеки член кооператор';
end;

procedure TDlgKooperacia.BtnPlanVnosMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Разплащания със строителя';
end;

procedure TDlgKooperacia.BtnKasKnigaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Касова книга';
end;

procedure TDlgKooperacia.BtnOtchetMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);     
begin
	PnlStatus.Caption := C_Status+'Отчет на постъпленията и задълженията на член кооператорите';
end;

procedure TDlgKooperacia.BtnExitMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Изход от програмата';
end;

procedure TDlgKooperacia.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	PnlStatus.Caption := '';
end;

procedure TDlgKooperacia.Pnl_BtnMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
	PnlStatus.Caption := '';
end;

procedure TDlgKooperacia.BtnSpisClick(Sender: TObject);
begin
	DlgSpisuk.ShowModal;
end;

procedure TDlgKooperacia.BtnKartonClick(Sender: TObject);
begin
	DlgKarton.ShowModal;
end;

procedure TDlgKooperacia.BtnPlanVnosClick(Sender: TObject);
begin
	DlgPlanVns.ShowModal;
end;

procedure TDlgKooperacia.BtnExitClick(Sender: TObject);
begin
	Close;
end;

procedure TDlgKooperacia.BtnKasKnigaClick(Sender: TObject);
begin
	DlgKasa.ShowModal;
end;

procedure TDlgKooperacia.BtnOtchetClick(Sender: TObject);
begin
	DlgOtchet.ShowModal;
end;

Procedure TDlgKooperacia.KoopExcept(Sender: TObject; E: Exception);
Begin
	If (E is EDBEditError)And(Sender is TCustomEdit) Then
  	MessageDlg('Неправилна дата', mtInformation, [mbOk], 0)
  Else If (E is EConvertError)And(Sender is TCustomEdit) Then
  	MessageDlg('Неправилна дата', mtInformation, [mbOk], 0)
  Else If (E is EStringListError)And(Sender is TCustomEdit) Then
  	MessageDlg('Няма избран елемент', mtInformation, [mbOk], 0)
  Else
  	MessageDlg(E.Message +', ClassName: '+
    	(Sender As TObject).ClassName, mtError, [mbOk], 0);
End;

procedure TDlgKooperacia.FormCreate(Sender: TObject);
begin
	Application.OnException := KoopExcept;
  
	FActiveTimer := False;
  ProgOptions.OpenHelpFile;//Инциализира Help на програмата
  DBPassword := ProgOptions.DBPassword;

	DatabaseAlias;

  Top := -3;
  Left := -3;

  Session.AddPassword(DBPassword);
  Database1.Connected := True;

	ProgOptions.OpenWindowExt(Self, Self.Name);
end;

procedure TDlgKooperacia.SBtnMailMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Кореспонденция';
end;

procedure TDlgKooperacia.SBtnMailClick(Sender: TObject);
begin
	DlgMail.Show;
end;

procedure TDlgKooperacia.N12Click(Sender: TObject);
begin
	DlgAbout.ShowModal;
end;

procedure TDlgKooperacia.SBtnArhivMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Архивиране на данните';
end;

procedure TDlgKooperacia.BtnPredKasaClick(Sender: TObject);
begin
	DlgPredKasa.ShowModal;
end;

procedure TDlgKooperacia.BtnPredKasaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	PnlStatus.Caption := C_Status+'Приходни документи от кооператори '+
  	'за строителството чакащи обработка';
end;

procedure TDlgKooperacia.SBtnArhivClick(Sender: TObject);
begin
  If Not Assigned(DlgArhiv) Then
  	Application.CreateForm(TDlgArhiv, DlgArhiv);

  If Screen.Height - (Height + Top) < DlgArhiv.Height Then
	  DlgArhiv.Top := Top - DlgArhiv.Height - 2
  Else
	  DlgArhiv.Top := Top + Height + 2;

  If Screen.Width - (Width + Left) < 0 Then
   	DlgArhiv.Left := Screen.Width - DlgArhiv.Width
  Else
   	DlgArhiv.Left := Left + Width - DlgArhiv.Width;    
    
  DlgArhiv.Execute(DBPath);
end;

procedure TDlgKooperacia.SetActiveTimer(const Value: Boolean);
begin
  FActiveTimer := Value;
  If Value Then TimerOut.Enabled := True;
end;

procedure TDlgKooperacia.DataBaseAlias;
var
  AParams: TStringList;
  Dir: String;
begin
	If Not Session.IsAlias(cDBAliasName) Then Begin
		DBPath := ProgOptions.BackPath(ExtractFileDir(ParamStr(0)))+'\Database';
  	If Not DirectoryExists(DBPath) Then ForceDirectories(DBPath);
    Session.AddStandardAlias(cDBAliasName, DBPath, 'Paradox');
    Session.SaveConfigFile;
  End
  Else Begin
  	AParams := TStringList.Create;
    Try
	    Session.GetAliasParams(cDBAliasName, AParams);
  	  Dir := Copy(AParams.Strings[0],6,255);
      If Not DirectoryExists(Dir) Then Begin
     		DBPath := ProgOptions.BackPath(ExtractFileDir(ParamStr(0)))+'\Database';
      	ForceDirectories(DBPath);
	      AParams.Clear; AParams.Add('PATH=' + DBPath);
    	  Session.ModifyAlias(cDBAliasName, AParams);
        Session.SaveConfigFile; 
    	End
      Else DBPath := Dir;
    Finally
    	AParams.Free;
    End;
	End;
  DBPath := DBPath + '\';
  DataBase1.AliasName := cDBAliasName;
end;

procedure TDlgKooperacia.TimerOutTimer(Sender: TObject);
begin
	Close;
end;

procedure TDlgKooperacia.FormActivate(Sender: TObject);
begin
	if G_Ch_OneActive then begin
  	ProgOptions.StartProgram;
    G_Ch_OneActive := False;
  end;
end;

procedure TDlgKooperacia.N11Click(Sender: TObject);
begin
	DlgChangePass.ShowModal;
end;

procedure TDlgKooperacia.FormDestroy(Sender: TObject);
begin
  Application.HelpCommand(HELP_QUIT, 0);
	ProgOptions.SaveWindowExt(Self, Self.Name);
  ProgOptions.Free;
end;

procedure TDlgKooperacia.N17Click(Sender: TObject);
begin
	PrtSetupDialog.Execute;	
end;

end.
