unit MyConst;

interface

Uses Windows;

Const
  C_khRoot 	        = HKEY_CURRENT_USER;
    C_Procduct      = 'Software\Ariadna\Stroitel\2.0';
    	C_Help        = C_Procduct+'\Help\';
      C_Database    = C_Procduct+'\Database\';
    	C_Windows     = C_Procduct+'\Windows\';
      C_Arhiv       = C_Procduct+'\Arhiv';
      C_Tables      = C_Procduct+'\Tables\';
      C_Registry    = C_Procduct+'\Register\';

	cSerialPos   = $E5D0 + 1;
  cInfoPos     = cSerialPos + 36;
  cPassPos     = cInfoPos + 32;
  cHDDRegister    = $01;
  cFloppyRegister = $AD;
  cNoRegister     = $00;
  
  IntSystemTime: TSYSTEMTIME =
  	(
    wYear: 1999;
    wMonth: 04;
    wDayOfWeek: 4;
    wDay: 08;
    wHour: 01;
    wMinute: 01;
    wSecond: 01;
    wMilliseconds: 01;
    );

	DBaseName = 'Stroitel';
  SumIdlChast = 100;
  Lixva = 0.03;
  C_Status = ' ';    

  cSecRegistry = 'run /x %1 %2';
  cFileLIb     = 'ArdSinfo.dll';
  cSetupFile   = '_install.dll';
  cResourceName= 'TDlgShowDrive';

	cNoPassword       = #91+'|'+'%'+#92+'$'#93;
  cDBAliasName      = 'DBaseStroitel 2.0';

  DBPassword: String = 'nick';

  C_HelpFile        = 'Stroitel.hlp';

	LocalHideInfo1: Array[0..68] Of Byte =
		(66, 42, 66, 191, 157, 34, 95, 187, 125, 50, 92, 176, 143, 43, 87,
    171, 150, 204, 163, 95, 109, 194, 119, 95, 181, 7, 96, 146, 182, 16,
    120, 154, 174, 15, 121, 159, 189, 12, 99, 95, 188, 0, 96, 142, 184, 19,
    124, 146, 175, 2, 127, 95, 125, 50, 82, 93, 149, 47, 86, 191, 157, 44,
    178, 93, 147, 226, 188, 187, 93);
	LocalHideInfo2: Array[0..52] Of Byte =
		(50, 12, 98, 176, 185, 16, 120, 140, 167, 7, 178, 141, 125, 27, 114,
    152, 181, 15, 119, 141, 125, 194, 124, 144, 154, 12, 120, 159, 176, 5,
    178, 159, 189, 0, 114, 95, 175, 19, 98, 145, 183, 12, 96, 145, 125, 2,
    98, 144, 191, 226, 188, 145, 93);

Var
  G_V_SavePath: String = '';
  G_V_Serial: String = '';
  G_Lock_DB: Boolean = False;
  G_Ch_OneActive: Boolean = True;

implementation

end.
