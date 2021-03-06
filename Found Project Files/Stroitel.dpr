program Stroitel;

uses
  Forms,
  WinProcs,
  Dialogs,
  KprStroi in 'KPRSTROI.PAS' {DlgKooperacia},
  Newkoop in 'NEWKOOP.PAS' {DlgNewKoop},
  Spisuk in 'SPISUK.PAS' {DlgSpisuk},
  Karton in 'KARTON.PAS' {DlgKarton},
  Planvns in 'PLANVNS.PAS' {DlgPlanVns},
  Kasa in 'KASA.PAS' {DlgKasa},
  Otchet in 'OTCHET.PAS' {DlgOtchet},
  Karpost in 'KARPOST.PAS' {DlgKartonPost},
  Prihod in 'PRIHOD.PAS' {DlgPrixRaz},
  Chstotka in 'CHSTOTKA.PAS' {DlgChastOtkaz},
  Logo in 'LOGO.PAS' {DlgLogo},
  Teglene in 'TEGLENE.PAS' {DlgTeglene},
  Strbank in 'STRBANK.PAS' {DlgStrBank},
  Listprt in 'LISTPRT.PAS' {DlgListPrint},
  Prtstpl in 'PRTSTPL.PAS' {DlgPrintPlanStr},
  Progress in 'PROGRESS.PAS' {DlgProgress},
  Password in 'PASSWORD.PAS' {DlgPass},
  Mail in 'MAIL.PAS' {DlgMail},
  Alingt in 'ALINGT.PAS' {DlgAlign},
  Mailprn in 'MAILPRN.PAS' {DlgMailPrint},
  Fullotk in 'FULLOTK.PAS' {DlgFullOtkaz},
  About in 'ABOUT.PAS' {DlgAbout},
  Informa in 'INFORMA.PAS' {DlgInfo},
  Period in 'PERIOD.PAS' {DlgNewPeriod},
  Perspis in 'PERSPIS.PAS' {DlgPeriodSpisuk},
  Predkasa in 'PREDKASA.PAS' {DlgPredKasa},
  MyConst in '..\Tools Units\Myconst.pas',
  ToolsFunc in '..\Tools Units\ToolsFunc.pas',
  ChangeKoef in 'ChangeKoef.pas' {DlgChangeKoef},
  PrtKarton in 'PrtKarton.pas' {DlgPrintKarton},
  ArhivPr in 'Arhivpr.pas' {DlgArhivProgres},
  Arhiv in 'Arhiv.pas' {DlgArhiv},
  PrtOtchet in 'PrtOtchet.pas' {DlgPrintOtchet},
  SelectColumsPrint in 'SelectColumsPrint.pas' {DlgSelPrint},
  SetupReg in '..\Tools Units\Setupreg.pas',
  ConstMessage in 'ConstMessage.pas',
  Passchg in 'Passchg.pas' {DlgChangePass},
  RegisterProgram in 'RegisterProgram.pas' {DlgRegProgram},
  DlgDiskDrive in 'DlgDiskDrive.pas' {DlgDrive},
  LockAccess in 'LockAccess.pas',
  PrintTables in '..\Tools Units\PrintTables.pas';

{$R *.RES}

Procedure RunProgram;
Begin

  DlgLogo := TDlgLogo.Create(Application);
  DlgLogo.Show;
  DlgLogo.Update;

  Application.CreateForm(TDlgKooperacia, DlgKooperacia);
  Application.CreateForm(TDlgPass, DlgPass);
  Application.CreateForm(TDlgNewKoop, DlgNewKoop);
  Application.CreateForm(TDlgKartonPost, DlgKartonPost);
  Application.CreateForm(TDlgPrixRaz, DlgPrixRaz);
  Application.CreateForm(TDlgChastOtkaz, DlgChastOtkaz);
  Application.CreateForm(TDlgSpisuk, DlgSpisuk);
  Application.CreateForm(TDlgKarton, DlgKarton);
  Application.CreateForm(TDlgPlanVns, DlgPlanVns);
  Application.CreateForm(TDlgKasa, DlgKasa);
  Application.CreateForm(TDlgOtchet, DlgOtchet);
  Application.CreateForm(TDlgTeglene, DlgTeglene);
  Application.CreateForm(TDlgStrBank, DlgStrBank);
  Application.CreateForm(TDlgListPrint, DlgListPrint);
  Application.CreateForm(TDlgPrintPlanStr, DlgPrintPlanStr);
  Application.CreateForm(TDlgProgress, DlgProgress);
  Application.CreateForm(TDlgMail, DlgMail);
  Application.CreateForm(TDlgAlign, DlgAlign);
  Application.CreateForm(TDlgMailPrint, DlgMailPrint);
  Application.CreateForm(TDlgFullOtkaz, DlgFullOtkaz);
  Application.CreateForm(TDlgAbout, DlgAbout);
  Application.CreateForm(TDlgInfo, DlgInfo);
  Application.CreateForm(TDlgNewPeriod, DlgNewPeriod);
  Application.CreateForm(TDlgPeriodSpisuk, DlgPeriodSpisuk);
  Application.CreateForm(TDlgPredKasa, DlgPredKasa);
  Application.CreateForm(TDlgChangeKoef, DlgChangeKoef);
  Application.CreateForm(TDlgPrintKarton, DlgPrintKarton);
  Application.CreateForm(TDlgPrintOtchet, DlgPrintOtchet);
  Application.CreateForm(TDlgSelPrint, DlgSelPrint);
  Application.CreateForm(TDlgChangePass, DlgChangePass);
  Application.CreateForm(TDlgRegProgram, DlgRegProgram);
  Application.CreateForm(TDlgDrive, DlgDrive);
  DlgLogo.Hide;
  DlgLogo.Free;

 	//If Not DlgKooperacia.ActiveTimer Then
  Application.Run;
End;

Begin
	Application.Title := 'Кооперация';
	RunProgram;
end.




