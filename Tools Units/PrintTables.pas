unit PrintTables;

interface

uses Windows, DBTables, Printers, Graphics, SysUtils, DB;

Procedure PrintTbl(
	Tbl: TDBDataSet;
	Prt: TPrinter;
	X1: Integer;
  Y1: Integer;
	TitleSize:Integer;
  RowSize: Integer;
  RowCount: Integer;
  Const ColSize1: Array Of Integer;
  Const TextType1: Array Of Byte; {1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  Const TitleText: Array Of String;
  TblFont: TFont);

implementation

Procedure PrintTbl(
	Tbl: TDBDataSet;
	Prt: TPrinter;
	X1: Integer;
  Y1: Integer;
	TitleSize:Integer;
  RowSize: Integer;
  RowCount: Integer;
  Const ColSize1: Array Of Integer;
  Const TextType1: Array Of Byte; {1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
  Const TitleText: Array Of String;
  TblFont: TFont);
Const
	TextTop: Integer = 1;{mm}
  Incs: Real = 2.54;{mm}
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

  For i := 0 To High(ColSize1) Do Begin
  	ColSize[i] := Round(((ColSize1[i]/10)/Incs)*DpiX);
	End;
	RowSize := Round(((RowSize/10)/Incs)*DpiY);
  TitleSize := Round(((TitleSize/10)/Incs)*DpiY);
  TextTop := 5;

  TblHeight := RowSize*RowCount + TitleSize;
  TblWidth := 0;

  For i := 0 To High(ColSize1) Do TblWidth := TblWidth + ColSize[i];

	With Prt.Canvas Do Begin
    Sum := Y1 + TitleSize;
    Font := TblFont;
	{---------Title Text -----------}
  	Rect.Top := Y1;
    Rect.Bottom := Sum;
    Rect.Right := X1;
    Rect.left := X1;
    Font.Style := [fsBold];
    For n := 0 To High(ColSize1) Do Begin {Text}
	  	Rect.Right := Rect.Right + ColSize[n];
      S := TitleText[n];
      DrawText(Prt.Canvas.Handle, PChar(S), Length(S), Rect, DT_CENTER);
      Rect.left := Rect.left + ColSize[n];
    End;{Text}
    Font.Style := [];
     {-------Rows + Text-----}
    For i := 1 To RowCount Do Begin;
      Rect.Top := Sum + (i - 1)*RowSize + TextTop;
      Rect.Bottom := Sum + i*RowSize;
      Rect.Right := X1;
      Rect.left := X1;
      For n := 0 To High(ColSize1) Do Begin {Text}
	      Rect.Right := Rect.Right + ColSize[n];
      	With Tbl Do Begin
					{1 - DT_CENTER, 2 - DT_LEFT, 3 - DT_RIGHT }
          TextType := TextType1[n];
        	Case TextType of
          	1:Begin
            	S := Fields[n].AsString;
              DrawText(Prt.Canvas.Handle, PChar(S), Length(S), Rect, DT_CENTER);
            End;
            2:Begin
            	S := Fields[n].AsString;
              DrawText(Prt.Canvas.Handle, PChar(S), Length(S), Rect, DT_LEFT);
            End;
         		3:Begin
            	If Fields[n].AsFloat > 0.0000001 Then Begin
            		S := FormatFloat((TFloatField(Fields[n])).DisplayFormat, Fields[n].AsFloat);
              	DrawText(Prt.Canvas.Handle, PChar(S), Length(S), Rect, DT_RIGHT);
              End;
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
  	For i := 0 To High(ColSize1) Do Begin
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
