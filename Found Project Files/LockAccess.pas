unit LockAccess;

interface

procedure LockAccessProgram;

implementation

uses MyConst, KprStroi, Spisuk, Karton, PlanVns, Kasa;

procedure LockAccessProgram;
begin
	with DlgKooperacia do begin
		SBtnArhiv.Enabled := not G_Lock_DB;
		BtnNewKoop.Enabled := not G_Lock_DB;
	  N2.Enabled := not G_Lock_DB;
  	N9.Enabled := not G_Lock_DB;
    N10.Enabled := not G_Lock_DB;
  end;
  with DlgSpisuk do begin
		TblKoop.ReadOnly := G_Lock_DB;
		TblPasp.ReadOnly := G_Lock_DB;
		TblAdres.ReadOnly := G_Lock_DB;
		TblCall.ReadOnly := G_Lock_DB;
		TblUchast.ReadOnly := G_Lock_DB;

    //изключване на промяната на коефициента
    N9.Enabled := not G_Lock_DB;
  end;
  with DlgKarton do begin
		TblKoopProect.ReadOnly := G_Lock_DB;
		TblKarton.ReadOnly := G_Lock_DB;
  	N1.Enabled := not G_Lock_DB;
	  N2.Enabled := not G_Lock_DB;
  end;
	with DlgPlanVns do begin
		N1.Enabled := not G_Lock_DB;
	  N2.Enabled := not G_Lock_DB;
	end;
	with DlgKasa do begin
		TblKasa.ReadOnly := G_Lock_DB;
  	N26.Enabled := not G_Lock_DB;
	  N21.Enabled := not G_Lock_DB;
  	N7.Enabled := not G_Lock_DB;
	  N4.Enabled := not G_Lock_DB;
  	N1.Enabled := not G_Lock_DB;
  end;
end;

end.
 