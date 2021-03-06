unit Mail;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Menus, DB, DBTables, Printers;

type
  TDlgMail = class(TForm)
    MemoMail: TMemo;
    DtSKoop: TDataSource;
    TblKoop: TTable;
    TblAddress: TTable;
    DtSAddress: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
    N10: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    FontDialog1: TFontDialog;
    N5: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N4: TMenuItem;
    QryPogas: TQuery;
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N10Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    Procedure PrintAll;
    Procedure PrintAddList(Select: String; Count1, Count2: String);
    Procedure PrintSelect(List: TStringList);
  public
    { Public declarations }
  end;

var
  DlgMail: TDlgMail;

implementation

{$R *.DFM}

Uses AlingT, MailPrn;

procedure TDlgMail.N6Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgMail.N8Click(Sender: TObject);
begin
	PrinterSetupDialog1.Execute;
end;

procedure TDlgMail.N9Click(Sender: TObject);
Var
  Select: String;
  All: Boolean;
  Count1, Count2: String;
begin
	If DlgMailPrint.Execute(Select, Count1, Count2, All) Then Begin
    If All Then PrintAll
    Else PrintAddList(Select, Count1, Count2);
  End;
end;

procedure TDlgMail.N2Click(Sender: TObject);
begin
	If OpenDialog1.Execute Then Begin
		MemoMail.Lines.LoadFromFile(OpenDialog1.FileName);
  End;
end;

procedure TDlgMail.FormShow(Sender: TObject);
begin
	TblKoop.Active := True;
  TblAddress.Active := True;
  If TblKoop.RecordCount = 0 Then N9.Enabled := False
  Else N9.Enabled := True;
end;

procedure TDlgMail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	TblKoop.Active := False;
  TblAddress.Active := False;
	QryPogas.Active := False;
  DlgAlign.Close;
end;

procedure TDlgMail.N10Click(Sender: TObject);
begin
	MemoMail.Lines.Clear;
end;

procedure TDlgMail.N3Click(Sender: TObject);
begin
	If SaveDialog1.Execute Then Begin
		MemoMail.Lines.SaveToFile(SaveDialog1.FileName);
  End;
end;

procedure TDlgMail.N11Click(Sender: TObject);
begin
	FontDialog1.Font := MemoMail.Font;
  If FontDialog1.Execute Then MemoMail.Font := FontDialog1.Font;
end;

procedure TDlgMail.N12Click(Sender: TObject);
begin
	Case MemoMail.Alignment Of
		taLeftJustify:  DlgAlign.GrpAlign.ItemIndex := 0;
		taCenter:       DlgAlign.GrpAlign.ItemIndex := 2;
		taRightJustify: DlgAlign.GrpAlign.ItemIndex := 1;
  End;
	DlgAlign.Show;
end;

Procedure TDlgMail.PrintAll;
Var
	PrintText: System.Text;
  Line: Integer;
  M: TMemo;
  S1, S2, S3: String;
  Page: Integer;
  Count: Integer;
Begin
	If PrintDialog1.Execute Then Begin
  	Try
  		M := TMemo.Create(Self);
      M.Parent := Self;
      M.WordWrap := False;
      M.SetBounds(0, 0, 1, 1);
    	M.Alignment := MemoMail.Alignment;
      M.Visible := False;
      M.Enabled := False;
      M.Font := MemoMail.Font;

 			AssignPrn(PrintText);
      ReWrite(PrintText);
      Printer.Canvas.Font := MemoMail.Font;
      TblKoop. First;
     	Page := MemoMail.Lines.Count + 4;
      Page := 35 div Page;
      Count := 0;
      With TblKoop Do
      	While Not(Eof) Do begin
        	S1 := 'До '+Fields[1].AsString+' '+
          	Fields[2].AsString+' '+Fields[3].AsString;

          If TblAddress.Fields[1].AsString <> '' Then
          	S2 := 'гр/с '+TblAddress.Fields[1].AsString
          Else
          	S2 := 'гр/с....................';

          If TblAddress.Fields[2].AsString <> '' Then
          	S2 := S2 +'   '+TblAddress.Fields[2].AsString
          Else
          	S2 := S2 +'   ул/бул.............................';

          If TblAddress.Fields[3].AsString <> '' Then
          	S2 := S2 +' No '+TblAddress.Fields[3].AsString;

          If TblAddress.Fields[4].AsString <> '' Then
          	S3 := 'бл.'+TblAddress.Fields[4].AsString
          Else
						S3 := 'бл....';

          If TblAddress.Fields[5].AsString <> '' Then
          	S3 := S3+'  вх.'+TblAddress.Fields[5].AsString
          Else
						S3 := S3+'  вх...';

          If TblAddress.Fields[6].AsString <> '' Then
          	S3 := S3+'  ет.'+TblAddress.Fields[6].AsString
          Else
						S3 := S3+'  ет...';

          If TblAddress.Fields[7].AsString <> '' Then
          	S3 := S3+'  ап.'+TblAddress.Fields[7].AsString
          Else
						S3 := S3+'  ап...';

          M.Lines := MemoMail.Lines;
          M.Lines.Insert(0, S3);
          M.Lines.Insert(0, S2);
          M.Lines.Insert(0, S1);

      		For Line := 0 To M.Lines.Count - 1 Do
      			WriteLn(PrintText, M.Lines[Line]);
          WriteLn(PrintText, '');
          Count := Count + 1;
          If Page = Count Then Begin
          	Printer.NewPage;
            Count := 0;
          End;
          While Not(M.Lines.Count = 0) Do M.Lines.Delete(0);
          Next;
        End;{While Not(Eof)}
      System.Close(PrintText);
    Finally
    	M.Destroy;
		End;
  End;
End;

Procedure TDlgMail.PrintAddList(Select: String; Count1, Count2: String);
Label Error;
Var
	List: TStringList;
  S: String;
  i: Integer;
  V: Real;
  Code: Integer;
Begin
	If Select = '' Then Begin
  	If Count1 = '' Then Goto Error;
		If Count2 = '' Then Goto Error;
  End;
	Try
  	List := TStringList.Create;
    While (i <> 0)And(S <> '') Do Begin
    	i := Pos(',', Select);
    	If i > 0 Then Begin
    		s := Copy(Select, 1, i - 1);
      	List.Add(s);
      	Delete(Select, 1, i);
      End;{If}
    End;{While}
    If Select <> '' Then List.Add(Select);
    If (Count1 <> '')And(Count2 <> '') Then
    	For i := StrToInt(Count1) To StrToInt(Count2) Do List.Add(IntToStr(i));
    For i := 0 To List.Count - 1 Do Begin
    	Val(List.Strings[i], V, Code);
      If Code <> 0 Then Begin
      	MessageDlg('Направилно са въведени данните!', mtInformation, [mbOK], 0);
        Exit;
      End{If Code}
    End;{For}
    PrintSelect(List);
  Finally
		If List <> nil Then List.Destroy;
	End;
	{---------------------------------}
  Exit;
Error:
	MessageDlg('Направилно са въведени данните!', mtInformation, [mbOK], 0);
End;

Procedure TDlgMail.PrintSelect(List: TStringList);
Var
	PrintText: System.Text;
  Line: Integer;
  M: TMemo;
  S1, S2, S3: String;
  Page: Integer;
  Count: Integer;
  i: Integer;

  Row: String;
  Zadul: Boolean;
  ZadRow: Integer;
  ZadPos: Byte;
  t: Byte;

Begin
	If PrintDialog1.Execute Then Begin
  	Try
  		M := TMemo.Create(Self);
      M.Name := 'MailTemp';
      M.Parent := Self;
      M.WordWrap := False;
      M.SetBounds(0, 0, 1, 1);
    	M.Alignment := MemoMail.Alignment;
      M.Visible := False;
      M.Enabled := False;
      M.Font := MemoMail.Font;

 			AssignPrn(PrintText);
      ReWrite(PrintText);
      Printer.Canvas.Font := MemoMail.Font;

      TblKoop. First;
     	Page := MemoMail.Lines.Count + 2;
      Page := 35 div Page;
      Count := 0;
      List.Sorted := True;

      Zadul := False;
      For Line := 0 To MemoMail.Lines.Count - 1 Do Begin
      	t := Pos('@Z', MemoMail.Lines.Strings[Line]);
        If (t > 0)And(Zadul <> True) Then Begin
        	ZadRow := Line;
          ZadPos := t;
        	Zadul := True;
        End;
      End;

      With TblKoop Do
      	For i := 0 To List.Count - 1 Do Begin
      		If FindKey([StrToInt(List.Strings[i])]) Then begin
        		S1 := 'До '+Fields[1].AsString+' '+
          		Fields[2].AsString+' '+Fields[3].AsString;

          	If TblAddress.Fields[1].AsString <> '' Then
          		S2 := 'гр/с '+TblAddress.Fields[1].AsString
          	Else
          		S2 := 'гр/с....................';

          	If TblAddress.Fields[2].AsString <> '' Then
          		S2 := S2 +'   '+TblAddress.Fields[2].AsString
          	Else
          		S2 := S2 +'   ул/бул.............................';

          	If TblAddress.Fields[3].AsString <> '' Then
          		S2 := S2 +' No '+TblAddress.Fields[3].AsString;

          	If TblAddress.Fields[4].AsString <> '' Then
          		S3 := 'бл.'+TblAddress.Fields[4].AsString
          	Else
							S3 := 'бл....';

          	If TblAddress.Fields[5].AsString <> '' Then
          		S3 := S3+'  вх.'+TblAddress.Fields[5].AsString
            Else
							S3 := S3+'  вх...';

          	If TblAddress.Fields[6].AsString <> '' Then
          		S3 := S3+'  ет.'+TblAddress.Fields[6].AsString
          	Else
							S3 := S3+'  ет...';

         	 	If TblAddress.Fields[7].AsString <> '' Then
          		S3 := S3+'  ап.'+TblAddress.Fields[7].AsString
          	Else
							S3 := S3+'  ап...';

						M.Lines := MemoMail.Lines;

						If Zadul Then Begin
            	Row := M.Lines.Strings[ZadRow];
            	System.Delete(Row, ZadPos, 2);

              QryPogas.SQL.Strings[1] := 'FROM "'+Fields[5].AsString+'.DB"';
              QryPogas.Active := True;
              If QryPogas.Fields[0].AsFloat > 0.009 Then
              	System.Insert(Format('%n', [QryPogas.Fields[0].AsFloat]), Row, ZadPos)
              Else
								System.Insert('НЯМА ЗАДЪЛЖЕНИЯ', Row, ZadPos);

              M.Lines.Strings[ZadRow] := Row;

							QryPogas.Active := False;

              M.Lines.Insert(0, S3);
          		M.Lines.Insert(0, S2);
          		M.Lines.Insert(0, S1);
      				For Line := 0 To M.Lines.Count - 1 Do
      					WriteLn(PrintText, M.Lines[Line]);
          		WriteLn(PrintText, '');
             End

            Else Begin
          		M.Lines.Insert(0, S3);
          		M.Lines.Insert(0, S2);
          		M.Lines.Insert(0, S1);
      				For Line := 0 To M.Lines.Count - 1 Do
      					WriteLn(PrintText, M.Lines[Line]);
          		WriteLn(PrintText, '');
            End;{If Zadul}

            Count := Count + 1;
          	If Page = Count Then Begin
{          		Printer.NewPage;}
            	Count := 0;
          	End;

          	While Not(M.Lines.Count = 0) Do M.Lines.Delete(0);

          End;{If FindKey}
        End;{For i:= 0}
      System.Close(PrintText);
    Finally
    	M.Destroy;
      QryPogas.Active := False;
		End;
  End;
End;

procedure TDlgMail.N4Click(Sender: TObject);
Var
	PrintText: System.Text;
  Line: Integer;
begin
	If PrintDialog1.Execute Then Begin
  	AssignPrn(PrintText);
    ReWrite(PrintText);
    Printer.Canvas.Font := MemoMail.Font;
   	For Line := 0 To MemoMail.Lines.Count - 1 Do
    	WriteLn(PrintText, MemoMail.Lines[Line]);
    System.Close(PrintText);     
  End;
end;

end.
