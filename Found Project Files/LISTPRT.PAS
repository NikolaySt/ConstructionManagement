unit Listprt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DBTables, DB, Buttons, Printers, ExtCtrls;

type
  TDlgListPrint = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    BtnPrint: TBitBtn;
    BtnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    BtnAdd: TBitBtn;
    BtnRemove: TBitBtn;
    SortCheck: TRadioGroup;
    procedure ListBox2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBox2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
  private
    { Private declarations }
    QryAll: TQuery;
    Procedure PrintSpisuk;
  public
    { Public declarations }
    Function Execute: Boolean;
  end;

Procedure PrintTbl(
			Tbl: TDBDataSet;
			Prt: TPrinter;
			X1: Integer;
  		Y1: Integer;
			TitleSize:Integer;
  		RowSize: Integer;
  		RowCount: Integer;
      SizeArray: Integer;
  		Const ColSize1: Array Of Integer;
  		Const TextType1: Array Of Byte; {1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  		Const TitleText: Array Of String;
  		TblFont: TFont);

var
  DlgListPrint: TDlgListPrint;

implementation

{$R *.DFM}

Uses MyConst;

procedure TDlgListPrint.ListBox2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
	If ListBox2.Items.Count = 2 Then Exit;
	ListBox2.Items.Add(ListBox1.Items.Strings[ListBox1.ItemIndex]);
  ListBox1.Items.Delete(ListBox1.ItemIndex);
	If ListBox2.Items.Count = 2 Then Begin
  	BtnAdd.Enabled := False;
    BtnRemove.Enabled := True;
   End
  Else BtnAdd.Enabled := True;
end;

procedure TDlgListPrint.ListBox2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
	Accept := (Source As TListBox).Name = 'ListBox1';
end;

procedure TDlgListPrint.ListBox1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
	ListBox1.Items.Add(ListBox2.Items.Strings[ListBox2.ItemIndex]);
  ListBox2.Items.Delete(ListBox2.ItemIndex);
  BtnRemove.Enabled := True;
	If ListBox2.Items.Count = 0 Then BtnRemove.Enabled := False
  Else Begin
  	BtnRemove.Enabled := True;
    BtnAdd.Enabled := True;
  End;
end;

procedure TDlgListPrint.ListBox1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
	Accept := (Source As TListBox).Name = 'ListBox2';
end;

procedure TDlgListPrint.ListBox2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	If ListBox2.Items.Count <> 0 Then Begin
  	ListBox1.DragMode := dmManual;
  	ListBox2.DragMode := dmAutomatic;
   End
  Else Begin
  	ListBox2.DragMode := dmManual;
  	ListBox1.DragMode := dmAutomatic;
  End;
end;

procedure TDlgListPrint.ListBox1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
	If ListBox1.Items.Count <> 0 Then Begin
  	ListBox2.DragMode := dmManual;
  	ListBox1.DragMode := dmAutomatic;
   End
  Else Begin
  	ListBox1.DragMode := dmManual;
  	ListBox2.DragMode := dmAutomatic;
  End;
end;

procedure TDlgListPrint.FormShow(Sender: TObject);
begin
  QryAll := TQuery.Create(Self);
  QryAll.DataBaseName := DBaseName;
  SortCheck.ItemIndex := -1;
end;

procedure TDlgListPrint.BtnAddClick(Sender: TObject);
Var
	OldIndex: Integer;
begin
	ListBox2.Items.Add(ListBox1.Items.Strings[ListBox1.ItemIndex]);
  OldIndex := ListBox1.ItemIndex;
  ListBox1.Items.Delete(ListBox1.ItemIndex);
  ListBox1.SetFocus;
  If ListBox1.Items.Count <> 0 Then Begin
  	ListBox1.ItemIndex := OldIndex - 1;
    BtnRemove.Enabled := True;
   End;
	If ListBox2.Items.Count = 2 Then  BtnAdd.Enabled := False;
  If OldIndex = 0 Then ListBox1.ItemIndex := 0;
end;

procedure TDlgListPrint.BtnRemoveClick(Sender: TObject);
Var
	OldIndex: Integer;
begin
	ListBox1.Items.Add(ListBox2.Items.Strings[ListBox2.ItemIndex]);
  OldIndex := ListBox2.ItemIndex;
  ListBox2.Items.Delete(ListBox2.ItemIndex);
  ListBox2.SetFocus;
  If ListBox2.Items.Count <> 0 Then Begin
  	ListBox2.ItemIndex := OldIndex - 1;
    BtnAdd.Enabled := True;
   End
  Else BtnRemove.Enabled := False;
  If OldIndex = 0 Then ListBox2.ItemIndex := 0;
end;

Function TDlgListPrint.Execute: Boolean;
Begin
	Result := False;
	If ShowModal = mrOK Then Begin
  	Result := True;
  	QryAll.Destroy;
  End;
End;

Procedure TDlgListPrint.PrintSpisuk;
Var
	Prt: TPrinter;
  TblFont: TFont;
  Tbl: TDBDataSet;
  RowCount: Integer;
  i, n: Integer;
  ColSize: Array[0..18] of Integer;
  TextType: Array[0..18] Of Byte;
  TitleText: Array[0..18] Of String;
  SizeArray: Integer;
  Sel1: String;
  Sel2: String;
  Sel3: String;
  RowPage: Integer;
Begin
	{-------------------------------------}
  For i := 0 To ListBox2.Items.Count - 1 Do Begin
  	Case i Of
    	0: Begin
      	If ListBox2.Items.Strings[i] = 'Трите имена' Then Begin
        	ColSize[0] := 7;  TextType[0] := 1; TitleText[0] := 'No';
          ColSize[1] := 25; TextType[1] := 2; TitleText[1] := 'Име';
          ColSize[2] := 25; TextType[2] := 2; TitleText[2] := 'Презиме';
          ColSize[3] := 25; TextType[3] := 2; TitleText[3] := 'Фамилия';
          SizeArray := 3;
          Sel1 := 'SELECT A.ID_Name, A.FName, A.SName, A.LName';
          Sel2 := 'FROM "1.DB" A';
        End;
      	If ListBox2.Items.Strings[i] = 'Местоживеене' Then Begin
        	ColSize[0] := 7;  TextType[0] := 1; TitleText[0] := 'No';
          ColSize[1] := 25; TextType[1] := 2; TitleText[1] := 'Град';
          ColSize[2] := 45; TextType[2] := 2; TitleText[2] := 'Улица';
          ColSize[3] := 7;  TextType[3] := 1; TitleText[3] := 'No';
          ColSize[4] := 10; TextType[4] := 1; TitleText[4] := 'Бл.';
          ColSize[5] := 7;  TextType[5] := 1; TitleText[5] := 'Вх.';
          ColSize[6] := 7;  TextType[6] := 1; TitleText[6] := 'Ет.';
          ColSize[7] := 7; 	TextType[7] := 1; TitleText[7] := 'Ап.';
          ColSize[8] := 10; TextType[8] := 1; TitleText[8] := 'Код';
          SizeArray := 8;
          Sel1 := 'SELECT B.ID_Adres, B.Grad, B.Ulica, B.UlicaNom, B.Blok,' +
          	' B.Vhod, B.Etag, B.Apart, B.PostKod';
          Sel2 := 'FROM "3.DB" B';
        End;
      	If ListBox2.Items.Strings[i] = 'Паспортни данни' Then Begin
        	ColSize[0] := 7;  TextType[0] := 1; TitleText[0] := 'No';
          ColSize[1] := 10;	TextType[1] := 1; TitleText[1] := 'Сер.';
          ColSize[2] := 20; TextType[2] := 1; TitleText[2] := 'Пасп.No:';
          ColSize[3] := 20; TextType[3] := 1; TitleText[3] := 'Дата';
          ColSize[4] := 40; TextType[4] := 1; TitleText[4] := 'Издаден от';
          ColSize[5] := 25; TextType[5] := 1; TitleText[5] := 'ЕГН';
          SizeArray := 5;
          Sel1 := 'SELECT C.ID_Pasport, C.Seria, C.PaspNom, ' +
          	' C.Data, C.IzdadenOt, C.EGN';
          Sel2 := 'FROM "2.DB" C';
        End;
      	If ListBox2.Items.Strings[i] = 'Данни за свръзка' Then Begin
        	ColSize[0] := 7;  TextType[0] := 1; TitleText[0] := 'No';
          ColSize[1] := 70; TextType[1] := 2; TitleText[2] := 'Тел.';
          SizeArray := 1;
          Sel1 := 'SELECT D.ID_Call, D.TelCod, D.Tel, D.Email';
          Sel2 := 'FROM "4.DB" D';
        End;
      	If ListBox2.Items.Strings[i] = 'Участие в кооперацията' Then Begin
        	ColSize[0] := 7;  TextType[0] := 1; TitleText[0] := 'No';
          ColSize[1] := 8;  TextType[1] := 1; TitleText[1] := 'Бл.';
          ColSize[2] := 8;  TextType[2] := 1; TitleText[2] := 'Ет.';
          ColSize[3] := 12; TextType[3] := 1; TitleText[3] := 'Ап.';
          ColSize[4] := 16; TextType[4] := 1; TitleText[4] := 'Маг.';
          ColSize[5] := 16; TextType[5] := 1; TitleText[5] := 'Гараж';
          ColSize[6] := 16; TextType[6] := 1; TitleText[6] := 'Мазе';
          ColSize[7] := 16; TextType[7] := 1; TitleText[7] := 'Ателие';
          ColSize[8] := 20; TextType[8] := 1; TitleText[8] := 'Таван';
          SizeArray := 8;
          Sel1 := 'SELECT E.ID_Uchastie, E.Blok, E.Etag, E.Apart, E.Magazin, E.Garag, E.Maze,' +
          	' E.Atelie, E.Tavan';
          Sel2 := 'FROM "5.DB" E';
        End;
      End;{0:}
      1: Begin
      	n := SizeArray;
      	If ListBox2.Items.Strings[i] = 'Трите имена' Then Begin
          ColSize[n + 1] := 25; TextType[n + 1] := 2; TitleText[n + 1] := 'Име';
          ColSize[n + 2] := 25; TextType[n + 2] := 2; TitleText[n + 2] := 'Презиме';
          ColSize[n + 3] := 25; TextType[n + 3] := 2; TitleText[n + 3] := 'Фамилия';
          SizeArray := n + 3;
          Sel1 := Sel1 + ', A.FName, A.SName, A.LName';
          Sel2 := Sel2 + ', "1.DB" A';
        End;
      	If ListBox2.Items.Strings[i] = 'Местоживеене' Then Begin
          ColSize[n + 1] := 25; TextType[n + 1] := 2; TitleText[n + 1] := 'Град';
          ColSize[n + 2] := 45; TextType[n + 2] := 2; TitleText[n + 2] := 'Улица';
          ColSize[n + 3] := 7;  TextType[n + 3] := 1; TitleText[n + 3] := 'No';
          ColSize[n + 4] := 10; TextType[n + 4] := 1; TitleText[n + 4] := 'Бл.';
          ColSize[n + 5] := 7;  TextType[n + 5] := 1; TitleText[n + 5] := 'Вх.';
          ColSize[n + 6] := 7;  TextType[n + 6] := 1; TitleText[n + 6] := 'Ет.';
          ColSize[n + 7] := 7;  TextType[n + 7] := 1; TitleText[n + 7] := 'Ап.';
          ColSize[n + 8] := 10; TextType[n + 8] := 1; TitleText[n + 8] := 'Код';
          SizeArray := n + 8;
          Sel1 := Sel1 + ', B.Grad, B.Ulica, B.UlicaNom, B.Blok,' +
          	' B.Vhod, B.Etag, B.Apart, B.PostKod';
          Sel2 := Sel2 + ', "3.DB" B';
        End;
      	If ListBox2.Items.Strings[i] = 'Паспортни данни' Then Begin
          ColSize[n + 1] := 10; TextType[n + 1] := 1; TitleText[n + 1] := 'Сер.';
          ColSize[n + 2] := 20; TextType[n + 2] := 1; TitleText[n + 2] := 'Пасп. No:';
          ColSize[n + 3] := 20; TextType[n + 3] := 1; TitleText[n + 3] := 'Дата';
          ColSize[n + 4] := 40; TextType[n + 4] := 1; TitleText[n + 4] := 'Издаден от';
          ColSize[n + 5] := 25; TextType[n + 5] := 1; TitleText[n + 5] := 'ЕГН';
          SizeArray := n + 5;
          Sel1 := Sel1 + ', C.Seria, C.PaspNom, ' +
          	'C.Data, C.IzdadenOt, C.EGN';
          Sel2 := Sel2 + ', "2.DB" C';
        End;
      	If ListBox2.Items.Strings[i] = 'Данни за свръзка' Then Begin
          ColSize[n + 1] := 70; TextType[n + 1] := 2; TitleText[n + 1] := 'Тел.';
          SizeArray := n + 1;
          Sel1 := Sel1 + ', D.TelCod, D.Tel, D.Email';
          Sel2 := Sel2 + ', "4.DB" D';
        End;
      	If ListBox2.Items.Strings[i] = 'Участие в кооперацията' Then Begin
          ColSize[n + 1] := 8;  TextType[n + 1] := 1; TitleText[n + 1] := 'Бл.';
          ColSize[n + 2] := 8;  TextType[n + 2] := 1; TitleText[n + 2] := 'Ет.';
          ColSize[n + 3] := 12; TextType[n + 3] := 1; TitleText[n + 3] := 'Ап.';
          ColSize[n + 4] := 16; TextType[n + 4] := 1; TitleText[n + 4] := 'Маг.';
          ColSize[n + 5] := 16; TextType[n + 5] := 1; TitleText[n + 5] := 'Гараж';
          ColSize[n + 6] := 16; TextType[n + 6] := 1; TitleText[n + 6] := 'Мазе';
          ColSize[n + 7] := 16;	TextType[n + 7] := 1; TitleText[n + 7] := 'Ателие';
          ColSize[n + 8] := 20; TextType[n + 8] := 1; TitleText[n + 8] := 'Таван';
          SizeArray := n + 8;
          Sel1 := Sel1 + ', E.Blok, E.Etag, E.Apart, E.Magazin, E.Garag, E.Maze,' +
          	' E.Atelie, E.Tavan';
          Sel2 := Sel2 + ', "5.DB" E';
        End;
      End;{1:}
    End;{Case}
    If ListBox2.Items.Count > 1 Then Begin
			Case i Of
      	0:Begin
        	Sel3 := 'WHERE ';
        	If ListBox2.Items.Strings[i] = 'Трите имена' Then
          	Sel3 := Sel3 + 'A.ID_Name = ';
          If ListBox2.Items.Strings[i] = 'Местоживеене' Then
          	Sel3 := Sel3 + 'B.ID_Adres = ';
          If ListBox2.Items.Strings[i] = 'Паспортни данни' Then
          	Sel3 := Sel3 + 'C.ID_Pasport = ';
          If ListBox2.Items.Strings[i] = 'Данни за свръзка' Then
          	Sel3 := Sel3 + 'D.ID_Call = ';
          If ListBox2.Items.Strings[i] = 'Участие в кооперацията' Then
	          Sel3 := Sel3 + 'E.ID_Uchastie = ';
        End;
        1:Begin
        	If ListBox2.Items.Strings[i] = 'Трите имена' Then
          	Sel3 := Sel3 + 'A.ID_Name';
          If ListBox2.Items.Strings[i] = 'Местоживеене' Then
          	Sel3 := Sel3 + 'B.ID_Adres';
          If ListBox2.Items.Strings[i] = 'Паспортни данни' Then
          	Sel3 := Sel3 + 'C.ID_Pasport';
          If ListBox2.Items.Strings[i] = 'Данни за свръзка' Then
          	Sel3 := Sel3 + 'D.ID_Call';
          If ListBox2.Items.Strings[i] = 'Участие в кооперацията' Then Begin
	          Sel3 := Sel3 + 'E.ID_Uchastie';
          End;{If Участие в кооперацията}
        End;
      End{Case i //Sel3 := 'Where'}
    End;{ListBox2.Items.Count > 1}
  End;{For i := 0}
	{--------------------------------------}

  If SortCheck.ItemIndex = 0 Then
  	With QryAll Do Begin
  		SQL.Add(Sel1);
  		SQL.Add(Sel2);
  		SQL.Add(Sel3);
    	SQL.Add('ORDER BY E.Blok, E.Etag, E.Apart');
  		Active := True;
  	End
  Else
  	With QryAll Do Begin
  		SQL.Add(Sel1);
  		SQL.Add(Sel2);
  		SQL.Add(Sel3);
    	SQL.Add('ORDER BY A.FName, A.SName, A.LName');
  		Active := True;
  	End;
	Prt := Printer;
  TblFont := TFont.Create;
  Tbl := QryAll;
  Tbl.First;
  With TblFont Do Begin
  	Name := 'Hebar';
    Size := 12;
    Color := clBlack
  End;
  RowCount := Tbl.RecordCount;
  If RowCount = 0 Then Exit;
  Try
  	Prt.BeginDoc;
    With Prt.Canvas Do Begin
      Font := TblFont;
      Font.Size := 14;
      IF ListBox2.Items.Count = 1 Then
      	TextOut(50, 0, ListBox2.Items.Strings[0]+': '+DateToStr(Date))
      Else TextOut(50, 0, ListBox2.Items.Strings[0]+' - '+ListBox2.Items.Strings[1] +
      	':'+DateToStr(Date));
      Font.Size := 12;
    End;
  	If Prt.Orientation = poPortrait Then RowPage := 35
  	Else RowPage := 20;
    If (RowCount Div RowPage) = 0 Then Begin
			PrintTbl(
				Tbl,
				Prt,
				0,{X1}
  			10,{Y1}
				10,{TitleSize}
				7,{RowSize}
    		RowCount,
        SizeArray,
  			ColSize,{ColSize}
  			TextType,{TextType 1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  			TitleText,{TitleText}
  			TblFont);
    	End
    Else Begin
    	For i := 1 To RowCount Div RowPage Do Begin
				PrintTbl(
					Tbl,
					Prt,
					0,{X1}
  				10,{Y1}
					10,{TitleSize}
					7,{RowSize}
    			RowPage,{RowCount}
          SizeArray,
  				ColSize,{ColSize}
  				TextType,{TextType 1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  				TitleText,{TitleText}
  				TblFont);
          If i <> (RowCount Div RowPage) Then Prt.NewPage;
      End;
      If (RowCount - (RowCount Div RowPage)*RowPage) <> 0 Then Begin
      	Prt.NewPage;
				PrintTbl(
					Tbl,
					Prt,
					0,{X1}
  				10,{Y1}
					10,{TitleSize}
					7,{RowSize}
    			(RowCount - (RowCount Div RowPage)*RowPage),
          SizeArray,
  				ColSize,{ColSize}
  				TextType,{TextType 1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  				TitleText,{TitleText}
  				TblFont);
			End;
    End;
  	Prt.EndDoc;
  Finally
  	QryAll.Active := False;
  	TblFont.Destroy;
  End;
End;

procedure TDlgListPrint.BtnPrintClick(Sender: TObject);
begin
	If ListBox2.Items.Count = 0 Then Begin
  	MessageDlg('Не сте избрали таблица', mtInformation, [mbOK], 0);
  	Exit;
  End;
	PrintSpisuk;
end;

Procedure PrintTbl(
	Tbl: TDBDataSet;
	Prt: TPrinter;
	X1: Integer;
  Y1: Integer;
	TitleSize:Integer;
  RowSize: Integer;
  RowCount: Integer;
  SizeArray: Integer;
  Const ColSize1: Array Of Integer;
  Const TextType1: Array Of Byte; {1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  Const TitleText: Array Of String;
  TblFont: TFont);
Const
	TextTop: Integer = 1;{mm}
  Incs: Real = 2.53;{mm}
Var
  IC: THandle;
  ResX, ResY: Integer;
  PageWidth, PageHeight: Integer;
  DpiX, DpiY: Integer;

  i, n, Sum: Integer;
  TblHeight: Integer;
  TblWidth: Integer;
  Rect: TRect;
  TextType: Byte;
  S: String;
  ColSize: Array[0..100] of Integer;
  A: Array[0..100] of Char;

begin
  IC := Prt.Handle;

  ResX := GetDeviceCaps(IC, HORZRES);
  ResY := GetDeviceCaps(IC, VERTRES);
  PageWidth := GetDeviceCaps(IC, HORZSIZE);
  PageHeight := GetDeviceCaps(IC, VERTSIZE);
  DpiX := GetDeviceCaps(IC, LOGPIXELSX);
  DpiY := GetDeviceCaps(IC, LOGPIXELSY);

  X1 := Round(((X1/10)/Incs)*DpiX);
  Y1 := Round(((Y1/10)/Incs)*DpiY);

  For i := 0 To SizeArray Do Begin
  	ColSize[i] := Round(((ColSize1[i]/10)/Incs)*DpiX);
	End;
	RowSize := Round(((RowSize/10)/Incs)*DpiY);
  TitleSize := Round(((TitleSize/10)/Incs)*DpiY);
  TextTop := Round(((1/10)/Incs)*DpiY);

  TblHeight := RowSize*RowCount + TitleSize;
  TblWidth := 0;

  For i := 0 To SizeArray Do TblWidth := TblWidth + ColSize[i];

	With Prt.Canvas Do Begin
    Sum := Y1 + TitleSize;
    Font := TblFont;
	{---------Title Text -----------}
  	Rect.Top := Y1;
    Rect.Bottom := Sum;
    Rect.Right := X1;
    Rect.left := X1;
    Font.Style := [fsBold];
    For n := 0 To SizeArray Do Begin {Text}
	  	Rect.Right := Rect.Right + ColSize[n];
      S := TitleText[n];
      StrPCopy(A, S);
      DrawText(Prt.Canvas.Handle, A, Length(S), Rect, DT_CENTER + DT_VCENTER);
      Rect.left := Rect.left + ColSize[n];
    End;{Text}
    Font.Style := [];
     {-------Rows + Text-----}
    For i := 1 To RowCount Do Begin;
      Rect.Top := Sum + (i - 1)*RowSize + TextTop;
      Rect.Bottom := Sum + i*RowSize;
      Rect.Right := X1;
      Rect.left := X1;
      For n := 0 To SizeArray Do Begin {Text}
	      Rect.Right := Rect.Right + ColSize[n];
      	With Tbl Do Begin
					{1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
          TextType := TextType1[n];
        	Case TextType of
          	1:Begin
            	S := Fields[n].AsString;
              StrPCopy(A, S);
              DrawText(Prt.Canvas.Handle, A, Length(S), Rect, DT_CENTER);
            End;
            2:Begin
            	S := Fields[n].AsString;
              StrPCopy(A, S);
              DrawText(Prt.Canvas.Handle, A, Length(S), Rect, DT_LEFT);
            End;
         		3:Begin
            	S := FormatFloat((TFloatField(Fields[n])).DisplayFormat, Fields[n].AsFloat);
              StrPCopy(A, S);
              DrawText(Prt.Canvas.Handle, A, Length(S), Rect, DT_RIGHT);
            End;
          End;
        End;
        Rect.left := Rect.left + ColSize[n];
      End;{Text}
    	MoveTo(X1, Sum + i*RowSize);
    	LineTo(TblWidth + X1, Sum + i*RowSize);
      Tbl.Next;
    End;
    {---------Columns--------}
  	MoveTo(X1, Y1);
  	LineTo(X1, TblHeight + Y1);
  	Sum := X1;
  	For i := 0 To SizeArray Do Begin
    	Sum := Sum + ColSize[i];
  		MoveTo(Sum, Y1);
  		LineTo(Sum, TblHeight + Y1);
    End;
    {------Title------------}
		MoveTo(X1, Y1);
    LineTo(Sum, Y1);
    MoveTo(X1, Y1 + TitleSize);
    LineTo(Sum, Y1 + TitleSize);
  End;{With Prt.Canvas Do}
End;

end.
