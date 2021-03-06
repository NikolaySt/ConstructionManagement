unit Predkasa;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, Grids, DBGrids, Menus, ExtCtrls, StdCtrls,
  LabelRegDim;

type
  TDlgPredKasa = class(TForm)
    QryPredKasa: TQuery;
    DrSQryPredKasa: TDataSource;
    TblPredKasa: TTable;
    DrSTblPredKasa: TDataSource;
    MenuPredKasa: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    PnlStatus: TPanel;
    LabelRec1: TLabelRec;
    LabelRec2: TLabelRec;
    LabelRec3: TLabelRec;
    LabelRec4: TLabelRec;
    LabelRec5: TLabelRec;
    QryPredKasaRedNom: TSmallintField;
    QryPredKasaPrixode_Order: TStringField;
    QryPredKasaData_Order: TDateField;
    QryPredKasaIme: TStringField;
    QryPredKasaPrixod: TFloatField;
    QryPredKasaID_NAME: TSmallintField;
    LabelRec6: TLabelRec;
    TblKoop: TTable;
    QryPredKasaVid: TStringField;
    LabelRec7: TLabelRec;
    DBGrid1: TDBGrid;
    procedure N6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
		Procedure ObrabotkaDoc;
  public
    { Public declarations }
  end;

var
  DlgPredKasa: TDlgPredKasa;

implementation

Uses MyConst, Prihod, Karton;

{$R *.DFM}

Procedure TDlgPredKasa.ObrabotkaDoc;
Var
	TblKarton: TTable;
  TblKasa: TTable;
  n: Integer;
Begin
	Try
		TblKarton := TTable.Create(Self);
  	With TblKarton Do Begin
  		DataBaseName := DBaseName;
  	End;

  	TblKasa := TTable.Create(Self);
  	With TblKasa Do Begin
  		DataBaseName := DBaseName;
    	TableName := '7.DB';
    	Active := True;
  	End;


		With QryPredKasa Do Begin
  		DisableControls;
    	First;
    	While Not(Eof) Do Begin
				TblKoop.FindKey([Fields[5].AsInteger]);

        TblKarton.Active := False;
    		TblKarton.TableName := TblKoop.Fields[5].AsString + '.DB';
     		TblKarton.Active := True;

  			AddPlachane(TblKarton,
      		Fields[6].AsString,{Банка/Каса}
      		Fields[1].AsString,{Документ No}
        	Fields[4].AsString,{Платена сума}
        	Fields[2].AsDateTime);{Дата на документа}

      	If Fields[6].AsString = 'Каса' Then Begin
      		TblKasa.Last;
					If TblKasa.Fields[0].AsString = '' Then n := 1
    			Else n := StrToInt(TblKasa.Fields[0].AsString) + 1;
    			TblKasa.Append;
    			TblKasa.Fields[0].AsString := IntToStr(n);
    			TblKasa.Fields[1].AsString := Fields[1].AsString;
    			TblKasa.Fields[3].AsString := Fields[2].AsString;
    			TblKasa.Fields[4].AsString := TblKoop.Fields[1].AsString;
    			TblKasa.Fields[5].AsString := TblKoop.Fields[2].AsString;
    			TblKasa.Fields[6].AsString := TblKoop.Fields[3].AsString;
    			TblKasa.Fields[7].AsString := Fields[4].AsString;
    			TblKasa.Post;
      	End;{If Kaса}
    		Next;
    	End;{While Not(Eof)}
  	End;{With QryPredKasa}
  Finally
    TblPredKasa.Active := False;
    TblPredKasa.EmptyTable;
    TblPredKasa.Active := True;

    QryPredKasa.Active := False;
    QryPredKasa.Active := True;
    QryPredKasa.EnableControls;
		TblKarton.Destroy;
  	TblKasa.Destroy;
  End;
End;

procedure TDlgPredKasa.N6Click(Sender: TObject);
begin
	Close;
end;

procedure TDlgPredKasa.FormShow(Sender: TObject);
Var
	QryKoop: TQuery;
begin
  TblPredKasa.Active := True;
  QryPredKasa.Active := True;
  TblKoop.Active := True;

  DlgPrixRaz.CBoxSpisuk.ClearInd;

  QryKoop := TQuery.Create(Self);
  With QryKoop Do Begin
		DataBaseName := DBaseName;
    SQL.Add('SELECT *');
    SQL.Add('FROM "1.DB" A');
		SQL.Add('ORDER BY A.FName, A.SName, A.LName');
    Try
    	Active := True;
      First;
    	While Not(Eof) Do Begin
    		DlgPrixRaz.CBoxSpisuk.AddInd(Fields[1].AsString + ' ' +
        	Fields[2].AsString + ' ' +
          Fields[3].AsString, Fields[0].AsString);
     		Next;
    	End;{While}
    Finally
    	Active := False;
    	Destroy;
    End;
  End;
end;

procedure TDlgPredKasa.N2Click(Sender: TObject);
Var
	FName, SName, LName, DocNom, Data, Suma: String;
  n, i: Integer;
begin
	If DlgPrixRaz.ExecutePrihodPredKasa('Плащане по банков път',FName, SName, LName, DocNom,
		Data, Suma, i) Then Begin
    With TblPredKasa Do Begin
  		Last;
    	If Fields[0].AsString = '' Then n := 1
    	Else n := StrToInt(Fields[0].AsString) + 1;
    	Append;
    	Fields[0].AsString := IntToStr(n);
    	Fields[1].AsString := DocNom;
    	Fields[2].AsString := Data;
    	Fields[3].AsString := FName+' '+SName+' '+LName;
    	Fields[4].AsString := Suma;
      Fields[5].AsInteger := i;
      Fields[6].AsString := 'Банка';
    	Post;
  	End;
    QryPredKasa.Active := False;
    QryPredKasa.Active := True;
  End;
end;

procedure TDlgPredKasa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TblPredKasa.Active := False;
  QryPredKasa.Active := False;
  TblKoop.Active := False;
end;

procedure TDlgPredKasa.N3Click(Sender: TObject);
Var
	FName, SName, LName, DocNom, Data, Suma: String;
  n, i: Integer;
begin
	If DlgPrixRaz.ExecutePrihodPredKasa('Приход - каса', FName, SName, LName, DocNom,
		Data, Suma, i) Then Begin
    With TblPredKasa Do Begin
  		Last;
    	If Fields[0].AsString = '' Then n := 1
    	Else n := StrToInt(Fields[0].AsString) + 1;
    	Append;
    	Fields[0].AsString := IntToStr(n);
    	Fields[1].AsString := DocNom;
    	Fields[2].AsString := Data;
    	Fields[3].AsString := FName+' '+SName+' '+LName;
    	Fields[4].AsString := Suma;
      Fields[5].AsInteger := i;
      Fields[6].AsString := 'Каса';
    	Post;
  	End;
    QryPredKasa.Active := False;
    QryPredKasa.Active := True;
  End;
end;

procedure TDlgPredKasa.N5Click(Sender: TObject);
Var
	Res: Word;
begin
	Res := MessageDlg('Потвърдете за разнясяне на документите', mtInformation, [mbOk, mbCancel], 0);
	If Res = mrOK Then ObrabotkaDoc;
end;

end.
