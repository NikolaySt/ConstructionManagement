unit ToolsFunc;

interface

uses Classes, SysUtils, DBTables, DB;

const
	E_OpenTable = 'Не може да отвори таблицата %s';

type
	TMode = (tmBanka, tmKasa, tmTeglene);

  TStrDoc = String[20];

	PPersonPayment = ^TPersonPayment;
  TPersonPayment = record
  	Date: TDateTime;
    DocNo: TStrDoc;
    Sum: Single;
    Mode: TMode;
  end;

  TPayments = class(TList)
  private
    FListPlanVnoska: TList;
  public
  	constructor Create; virtual;
  	destructor Destroy; override;

    procedure DeletePlanVnoska(i: Integer);
		procedure AddPlanVnoska(Value: Integer);
    function CountPlanVnoska: Integer;
    function ItemsPlanVnoska(i: Integer): Integer;
  end;

function ExtractPersonPayment(Table: TTable): TPayments;
procedure EmptyTable(Table: TTable);
procedure AddPlanVnoska(TblKarton: TTable; KoefIdlChast: Real; AOt, ADo: Integer);
procedure TeglenePari(TblKarton: TTable; TeglInfo: PPersonPayment);

implementation

uses MyConst, Karton;

procedure IntAddPlanVnoska(TblKarton, TblStroitel: TTable; KoefIdlChast: Real); forward;

procedure AddPlanVnoska(TblKarton: TTable; KoefIdlChast: Real; AOt, ADo: Integer);
var
	TblStroitel: TTable;
  n: Integer;
  procedure AddVnoska;
  begin
		IntAddPlanVnoska(TblKarton, TblStroitel, KoefIdlChast);
  end;
begin
  TblStroitel := TTable.Create(nil);
  try
  	With TblStroitel Do Begin
			DataBaseName := DBaseName;
			TableName := '8.DB';
			Open;
  	End;{With}

		While Not(TblStroitel.Eof) Do Begin
      n := TblStroitel.Fields[0].AsInteger;
      if AOt = -1 then begin
				if ADo = -1 then AddVnoska
        else if n <= ADo then AddVnoska;       
      end
      else begin
				if n >= AOt then begin
					if ADo = -1 then AddVnoska
  	      else if n <= ADo then AddVnoska;
        end;
      end;
    	TblStroitel.Next;
  	End;
  finally
  	TblStroitel.Free;
  end;
End;

procedure IntAddPlanVnoska(TblKarton, TblStroitel: TTable; KoefIdlChast: Real);
Var
	n: Integer;
  SumaKoop: Real;
  CheckExit: Boolean;
  CheckEmpty: Boolean;
  Per: Integer;
  Nak_Lixva: Real;
  DokNom: String;
  Data: TDateTime;
  VnesenaSuma: Real;
  VidPl: String;
  Sal: String;
{----------------------}
  CheckLixvaExit: Boolean;
  SalLixva: String;
  SumaLihvaPl: Real;

  DocLixvaPl: String;
  DataLixvaPl: TDateTime;
  VidLixPl: String;
{----------------------}

	Move: Integer;
  i: Integer;

  NaData, DoData: TDateTime;
  Suma: Real;
begin
	n := TblStroitel.FieldByName('RedNom').AsInteger;
  NaData := TblStroitel.FieldByName('DataBegin').AsDateTime;
  DoData := TblStroitel.FieldByName('DataEnd').AsDateTime;
  Suma := TblStroitel.FieldByName('IskanaSum').AsFloat;
  
	With TblKarton Do Begin
    Active := True;
    First;
    Move := 0;
    For i := 0 To RecordCount - 1 Do Begin
    	If Fields[10].AsString <> '' Then Move := i;
      Next;
    End;
    First;
    MoveBy(Move);
    SumaKoop := Suma * (KoefIdlChast/SumIdlChast);
    Sal := '';
    CheckExit := False;
    Repeat
    	CheckEmpty := False;
    	While Not(Eof) And Not(CheckEmpty) Do Begin
				If (Fields[2].AsString = '') And (Fields[0].AsString <> 'X') And
        	(Fields[9].AsString = '') Then CheckEmpty := True
        Else Next;
    	End;
      If CheckEmpty Then Begin{Намерен е паразен ред}
      	Edit;
        If Sal = 'Сал.' Then Fields[0].AsString := 'Сал.'
        Else Fields[0].AsString := IntToStr(n);
        Fields[1].AsFloat := SumaKoop;
        Fields[2].AsDateTime := DoData;
        If SumaKoop > Fields[5].AsFloat Then Begin
        	If DoData >= Fields[4].AsDateTime Then Begin
            SumaKoop := SumaKoop - Fields[5].AsFloat;
           End
          Else Begin {Data1 < Data2}
          	Per :=  Period(Fields[4].AsDateTime, DoData);
            Fields[7].AsInteger := Per;
            Nak_Lixva := ((Lixva/365)*Per)*SumaKoop;
            Fields[8].AsFloat := Nak_Lixva;
            Data := Fields[4].AsDateTime;{Error ------ }
            Post;
            SumaKoop := SumaKoop - Fields[5].AsFloat;
            {-------------Lixva----------------}
            CheckLixvaExit := False;
            SalLixva := 'Н.Л';
            SumaLihvaPl := 0;
            Repeat
            	Next;
            	If EOF Then Begin
            		Append;
             		Fields[0].AsString := SalLixva;
              	Fields[1].AsFloat := Nak_Lixva;
              	Fields[2].AsDateTime := Data;
                Post;
              	CheckLixvaExit := True
             	 End
            	Else Begin
            		Edit;
              	Fields[0].AsString := SalLixva;
              	Fields[1].AsFloat := Nak_Lixva;
              	Fields[2].AsDateTime := Data;
                Post;
              	If Nak_Lixva > Fields[5].AsFloat Then Begin
									Nak_Lixva := Nak_Lixva - Fields[5].AsFloat;
                  SalLixva := 'Сал.'
              	 End
                Else Begin
                	SumaLihvaPl := Fields[5].AsFloat - Nak_Lixva;
                  If SumaLihvaPl > 0.009 Then Begin
                  	Edit;
                    Fields[5].AsFloat := Nak_Lixva;
                    Post;
										DocLixvaPl := Fields[3].AsString;
                  	DataLixvaPl := Fields[4].AsDateTime;
                    VidLixPl := Fields[6].AsString;
                  	Next;
                    If EOF Then Append Else Insert;
                    Fields[3].AsString := DocLixvaPl;
              			Fields[4].AsDateTime := DataLixvaPl;
              			Fields[5].AsFloat := SumaLihvaPl;
                    Fields[6].AsString := VidLixPl;
                    Post;
                  End{If SumaLihvaVnski > 0.009 };
                 	CheckLixvaExit := True;
                End;{If Nak_Lixva ? Fields[5].AsFloat}
            	End;{If EOF}
            Until CheckLixvaExit = True;
            {-----------------------------}
          End;{Data1 ? Data2}
          Sal := 'Сал.';
          If State in [dsEdit, dsInsert] Then Post;
         End{if SumaKoop > Fields[5].AsFloat}
        Else Begin
      		If SumaKoop < Fields[5].AsFloat Then Begin
          	If DoData >= Fields[4].AsDateTime Then Begin
              DokNom := Fields[3].AsString;
              Data := Fields[4].AsDateTime;
              VnesenaSuma := Fields[5].AsFloat;
              Fields[5].AsFloat  := SumaKoop;
              VidPl := Fields[6].AsString;
            	Post; Next;
              If Eof Then Append
              Else Insert;
              Fields[3].AsString := DokNom;
              Fields[4].AsDateTime := Data;
              Fields[5].AsFloat := VnesenaSuma - SumaKoop;
              Fields[6].AsString := VidPl;
              Post;
              CheckExit := True;
             End{Data1 >= Data2}
            Else Begin{Data1 < Data2}
          		Per :=  Period(Fields[4].AsDateTime, DoData);
            	Fields[7].AsInteger := Per;
            	Nak_Lixva := ((Lixva/365)*Per)*SumaKoop;
            	Fields[8].AsFloat := Nak_Lixva;
              DokNom := Fields[3].AsString;
              Data := Fields[4].AsDateTime;
              VnesenaSuma := Fields[5].AsFloat;
              Fields[5].AsFloat := SumaKoop;
              VidPl := Fields[6].AsString;
            	Post;
              Next;
              If Eof Then Append
              Else Insert;
              Fields[3].AsString := DokNom;
              Fields[4].AsDateTime := Data;
              Fields[5].AsFloat := VnesenaSuma - SumaKoop;
              Fields[6].AsString := VidPl;
              Post;
         	{-------------Lixva----------------}
            	CheckLixvaExit := False;
            	SalLixva := 'Н.Л';
            	SumaLihvaPl := 0;
              Prior;
            	Repeat
            		Next;
            		If EOF Then Begin
            			Append;
             			Fields[0].AsString := SalLixva;
              		Fields[1].AsFloat := Nak_Lixva;
              		Fields[2].AsDateTime := DoData;
                	Post;
              		CheckLixvaExit := True
             	 	End
            		Else Begin
            			Edit;
              		Fields[0].AsString := SalLixva;
              		Fields[1].AsFloat := Nak_Lixva;
              		Fields[2].AsDateTime := DoData;
                	Post;
              		If Nak_Lixva > Fields[5].AsFloat Then Begin
										Nak_Lixva := Nak_Lixva - Fields[5].AsFloat;
                  	SalLixva := 'Сал.';
              	 	 End
                  Else Begin
                		SumaLihvaPl := Fields[5].AsFloat - Nak_Lixva;
                  	If SumaLihvaPl > 0.009 Then Begin
                  		Edit;
                    	Fields[5].AsFloat := Nak_Lixva;
                    	Post;
											DocLixvaPl := Fields[3].AsString;
                  		DataLixvaPl := Fields[4].AsDateTime;
                      VidLixPl := Fields[6].AsString;
                  		Next;
                    	If EOF Then Append Else Insert;
                    	Fields[3].AsString := DocLixvaPl;
              				Fields[4].AsDateTime := DataLixvaPl;
              				Fields[5].AsFloat := SumaLihvaPl;
                      Fields[6].AsString := VidLixPl;
                    	Post;
                  	End{If SumaLihvaVnski > 0.009 };
                 		CheckLixvaExit := True;
                	End;{If Nak_Lixva ? Fields[5].AsFloat}
            		End;{If EOF}
            	Until CheckLixvaExit = True;
            	{-----------------------------}
              CheckExit := True;
            End;{Data1 ? Data2}
           End{SumaKoop < Fields[5].AsFloat}
          Else Begin{If SumaKoop = Fields[5].AsFloat}
						If DoData >= Fields[4].AsDateTime Then Begin
              Post;
              CheckExit := True;
             End{Data1 >= Data2}
            Else Begin {Data1 < Data2}
          		Per :=  Period(Fields[4].AsDateTime, DoData);
            	Fields[7].AsInteger := Per;
            	Nak_Lixva := ((Lixva/365)*Per)*SumaKoop;
            	Fields[8].AsFloat := Nak_Lixva;
              Post;
         			{-------------Lixva----------------}
            	CheckLixvaExit := False;
            	SalLixva := 'Н.Л';
            	SumaLihvaPl := 0;
            	Repeat
            		Next;
            		If EOF Then Begin
            			Append;
             			Fields[0].AsString := SalLixva;
              		Fields[1].AsFloat := Nak_Lixva;
              		Fields[2].AsDateTime := DoData;
                	Post;
              		CheckLixvaExit := True
             	 	End
            		Else Begin
            			Edit;
              		Fields[0].AsString := SalLixva;
              		Fields[1].AsFloat := Nak_Lixva;
              		Fields[2].AsDateTime := DoData;
                	Post;
              		If Nak_Lixva > Fields[5].AsFloat Then Begin
										Nak_Lixva := Nak_Lixva - Fields[5].AsFloat;
                  	SalLixva := 'Сал.';
              	 	 End
                  Else Begin
                		SumaLihvaPl := Fields[5].AsFloat - Nak_Lixva;
                  	If SumaLihvaPl > 0.009 Then Begin
                  		Edit;
                    	Fields[5].AsFloat := Nak_Lixva;
                    	Post;
											DocLixvaPl := Fields[3].AsString;
                  		DataLixvaPl := Fields[4].AsDateTime;
                      VidLixPl := Fields[6].AsString;
                  		Next;
                    	If EOF Then Append Else Insert;
                    	Fields[3].AsString := DocLixvaPl;
              				Fields[4].AsDateTime := DataLixvaPl;
              				Fields[5].AsFloat := SumaLihvaPl;
                      Fields[6].AsString := VidLixPl;
                    	Post;
                  	End{If SumaLihvaVnski > 0.009 };
                 		CheckLixvaExit := True;
                	End;{If Nak_Lixva ? Fields[5].AsFloat}
            		End;{If EOF}
            	Until CheckLixvaExit = True;
            	{-----------------------------}
              CheckExit := True;
            End;{Data1 ? Data2}
          End;{If SumaKoop ? < Fields[5].AsFloat}
        End;{If SumaKoop ? Fields[5].AsFloat}
       End{Намерен е паразен ред}
      Else Begin{Не е намерен празен ред}
      	Append;
        If Sal = 'Сал.' Then Fields[0].AsString := 'Сал.'
        Else   Fields[0].AsString := IntToStr(n);
        Fields[1].AsFloat := SumaKoop;
        Fields[2].AsDateTime := DoData;
        Post;
        CheckExit := True;
      End;
    Until CheckExit = True;
  End;{With TblKarton}
end;


procedure EmptyTable(Table: TTable);
begin
	with Table do begin
  	First;
  	while Not Eof do Delete;
  end;
end;

function ExtractPersonPayment(Table: TTable): TPayments;
var
	NewDate, OldDate, NewDateTeg, OldDateTeg: TDateTime;
  NewDoc, OldDoc, NewDocTeg, OldDocTeg: TStrDoc;
  NewSum, OldSum, NewSumTeg, OldSumTeg: Single;
  NewMode, OldMode: TMode;
  chOld, chOldTeg: Boolean;

  PPayment: PPersonPayment;

  OldVnoska, NewVnoska: Integer;

  procedure OldPaymentRead;
  begin
  	with Table do begin
	    OldDate := FieldByName('Data').AsDateTime;
  	  OldDoc := FieldByName('DocNom').AsString;
    	OldSum := FieldByName('Plachane').AsFloat;
	    if FieldByName('VidPl').AsString = 'Каса' then
  	  	OldMode := tmKasa
    	else
    		OldMode := tmBanka;
  	end;
  end;

  procedure NewPaymentRead;
  begin
  	with Table do begin
    	NewDate := FieldByName('Data').AsDateTime;
      NewDoc := FieldByName('DocNom').AsString;
      NewSum := FieldByName('Plachane').AsFloat;
      if FieldByName('VidPl').AsString = 'Каса' then
      	NewMode := tmKasa
      else
      	NewMode := tmBanka;
  	end;
  end;

  procedure AddPayment;
  begin
    if (OldDoc <> 'Салдо.') and (OldDoc <> '') then begin
			New(PPayment);
		  PPayment.DocNo := OldDoc;
			PPayment.Date := OldDate;
    	PPayment.Sum := OldSum;
			PPayment.Mode := OldMode;

      Result.Add(PPayment);
    end;

		OldDate := NewDate;
    OldDoc := NewDoc;
    OldSum := NewSum;
    OldMode := NewMode;
  end;

  procedure OldTeglene;
  begin
  	with Table do begin
    	OldDocTeg := FieldByName('IztDocNom').AsString;
  	  OldDateTeg := FieldByName('IztData').AsDateTime;
	  	OldSumTeg := FieldByName('IztOrder').AsFloat;
  	end;
  end;

  procedure NewTeglene;
  begin
  	with Table do begin
	  	NewDocTeg := FieldByName('IztDocNom').AsString;
  	  NewDateTeg := FieldByName('IztData').AsDateTime;
    	NewSumTeg := FieldByName('IztOrder').AsFloat;
    end;
  end;

  procedure AddTeglene;
  begin
  	if OldDocTeg <> '' then begin
			New(PPayment);
		  PPayment.DocNo := OldDocTeg;
			PPayment.Date := OldDateTeg;
    	PPayment.Sum := OldSumTeg;
			PPayment.Mode := tmTeglene;

      Result.Add(PPayment);
    end;

		OldDateTeg := NewDateTeg;
    OldDocTeg := NewDocTeg;
    OldSumTeg := NewSumTeg;
  end;

  procedure SaveRedNo;
  var
  	TmpStr, TmpDoc: String;
    I, Code: Integer;
  begin
		with Table do begin
    	TmpStr := FieldByName('RedNom').AsString;
      TmpDoc := FieldByName('IztDocNom').AsString;
      if (TmpDoc <> '')and(OldVnoska <> NewVnoska) then begin
      	if NewVnoska = -1 then Result.AddPlanVnoska(0)
        else Result.AddPlanVnoska(NewVnoska);
			end;
      OldVnoska := NewVnoska;
      Val(TmpStr, i, Code);
      if Code = 0 then NewVnoska := i;
    end;
  end;

begin
	Result := TPayments.Create;
  try
		if not Table.Active then Table.Open
  except
  	raise Exception.Create(Format(E_OpenTable, [Table.TableName]));
  end;
 	with Table do begin
	  First;
    chOld := False;
    chOldTeg := False;
    OldVnoska := -2;
    NewVnoska := -1;

    while not Eof do begin

      if Bof then	OldPaymentRead
      else begin
				NewPaymentRead;

      	if (OldDate = NewDate) and (OldDoc = NewDoc) then begin
        	OldSum := OldSum + NewSum;
          chOld := True;
        end
        else begin

        	AddPayment;
					if (NewDoc = 'Салдо.') or (NewDoc = '') then chOld := False;
          
        end;
      end;

			//-------------------------------------------------------------
			SaveRedNo;

	    if Bof then OldTeglene
    	else begin
      	NewTeglene;
        
      	if (OldDateTeg = NewDateTeg) and (OldDocTeg = NewDocTeg) then begin
      		OldSumTeg := OldSumTeg + NewSumTeg;
        	chOldTeg := True;
      	end
        else begin
        	AddTeglene;
					if NewDocTeg = '' then chOldTeg := False;
        end;
      end;
      //-------------------------------------------------------------
      Next;

    end;//while not Eof...
    if chOld then AddPayment;
    if chOldTeg then AddTeglene;
  end;//with Table do
end;

procedure TeglenePari(TblKarton: TTable; TeglInfo: PPersonPayment);
Var
	CheckExit: Boolean;
  CheckRepeat: Boolean;
  DataSave: TDateTime;
  TeglSuma: Real;
  Ostatuk: Real;
begin
	TeglSuma := TeglInfo.Sum;
  With TblKarton Do Begin
  	First;
  	CheckRepeat := False;
  	Repeat
  		CheckExit := False;
  		While (Not(EOF))And(Not(CheckExit)) Do Begin
  			If (Fields[5].AsFloat > 0.00)And
    			(Fields[9].AsString = '')And
      		(Fields[0].AsString = '') Then CheckExit := True
        Else begin
        	if FieldByName('DocNom').AsString = '' then CheckExit := True
          else Next;
        end;
  		End;{While}
  		If Fields[5].AsFloat > TeglSuma Then Begin
  			DataSave := Fields[4].AsDateTime;
  			Edit;
  			Fields[9].AsString := TeglInfo.DocNo;
				Fields[10].AsDateTime := TeglInfo.Date;
  			Fields[11].AsFloat := TeglSuma;
      	Fields[0].AsString := 'Тег.';
  			Post;
      	Ostatuk := Fields[5].AsFloat - TeglSuma;
      	If Ostatuk > 0.009 Then Begin
  				Next;
        	If Eof Then Append Else Insert;
  				Fields[3].AsString := 'Салдо.';
    			Fields[4].AsDateTime := DataSave;
					Fields[5].AsFloat := Ostatuk;
  				Post;
  			End;{If TeglSuma > 0.009}
      	CheckRepeat := True;
     	 End
    	Else Begin{Fields[5].AsFloat < TeglSuma}
        if FieldByName('DocNom').AsString = '' then begin
        	Insert;
	      	Fields[0].AsString := 'Сал.';          
  				Fields[1].AsFLoat := TeglSuma;
					Fields[2].AsDateTime := TeglInfo.Date;

  				Fields[9].AsString := TeglInfo.DocNo;          
					Fields[10].AsDateTime := TeglInfo.Date;
  				Fields[11].AsFloat := TeglSuma;
          Post;
          CheckRepeat := True;
        end
        else begin
      		Edit;
  				Fields[9].AsString := TeglInfo.DocNo;
					Fields[10].AsDateTime := TeglInfo.Date;
  				Fields[11].AsFloat := Fields[5].AsFloat;
      		Fields[0].AsString := 'Тег.';
  				Post;
  	    	TeglSuma := TeglSuma - Fields[5].AsFloat;
	      	If TeglSuma < 0.009 Then CheckRepeat := True;
        end;
  		End;
  	Until CheckRepeat;
  End;{With TblKarton}
end;

procedure TPayments.AddPlanVnoska(Value: Integer);
var
  Pint: ^Integer;
begin
	New(Pint);
  PInt^ := Value;
	FListPlanVnoska.Add(PInt);
end;

function TPayments.CountPlanVnoska: Integer;
begin
	Result := FListPlanVnoska.Count;
end;

constructor TPayments.Create;
begin
  inherited;
  FListPlanVnoska := TList.Create;
end;

procedure FreeList(List: TList);
begin
	with List do
		while Count <> 0 do begin
  		if Items[0] <> nil then begin
	  		Dispose(Items[0]);
      	Items[0] := nil;
	    end;
  	  Delete(0);
  	end;
end;

procedure TPayments.DeletePlanVnoska(i: Integer);
begin
	Dispose(FListPlanVnoska.Items[i]);
	FListPlanVnoska.Delete(i);	
end;

destructor TPayments.Destroy;
begin
	FreeList(FListPlanVnoska);
  FreeList(Self);
  inherited;
end;

function TPayments.ItemsPlanVnoska(i: Integer): Integer;
var
	Pint: ^Integer;
begin
	Pint := FListPlanVnoska.Items[i];
  Result := PInt^;
end;

end.


