unit EmployeeForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TfrmKupacLista = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnCreate: TBitBtn;
    btnChange: TBitBtn;
    btnExi: TBitBtn;
    Label1: TLabel;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
    Panel3: TPanel;
    btnNoviUgovorZaKupca: TBitBtn;
    btnPlacanjeRate: TBitBtn;
    btnIzaberiratu: TBitBtn;
    btnIzvestaj: TBitBtn;
    aaa: TPanel;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    edtBojDanaKasnjenja: TEdit;
    edtBrojPlacenihRata: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnNoviUgovorZaKupcaClick(Sender: TObject);
    procedure btnPlacanjeRateClick(Sender: TObject);
    procedure btnIzaberiratuClick(Sender: TObject);
    procedure btnIzvestajClick(Sender: TObject);
    procedure btnExiClick(Sender: TObject);
    procedure IsRowSelected();
    procedure BitBtn1Click(Sender: TObject);
    procedure  showListOfRateForBuyer;
    procedure proveraKupcaIkreiranjeListeRata;
    procedure reopenForm;
    procedure hideDtaAbouBuyer;
   // procedure BitBtn2Click(Sender: TObject);//(id: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    forKupacDetalji: String;
    idForUpdateKupac: String;
  end;

var
  frmKupacLista: TfrmKupacLista;
  query: String;

implementation

{$R *.dfm}

uses DataModule, KupacDetalji, UplataRate, Izvestaj;

procedure TfrmKupacLista.hideDtaAbouBuyer;
begin
       Label2.Visible := False;
       Label3.Visible := False;
       edtBojDanaKasnjenja.Visible := false;
       edtBrojPlacenihRata.Visible := False;
end;

procedure TfrmKupacLista.reopenForm;
begin
  self.Caption := 'Lista kupaca';
  btnCreate.Visible := True;
  btnChange.Visible := True;
  btnNoviUgovorZaKupca.Visible := True;
  btnPlacanjeRate.Visible := True;
  btnIzvestaj.Visible := True;
  btnIzaberiratu.Visible := False;
  Label1.Visible := True;
  edtSearch.Visible := True;
  btnSearch.Visible := True;
   query := 'SELECT * FROM kupac ';
  DM.RefreshGrid(query);
  BitBtn1.Visible := False;
end;

procedure TfrmKupacLista.BitBtn1Click(Sender: TObject);
begin
  Self.hideDtaAbouBuyer;
   self.Caption := 'Lista kupaca';
  btnCreate.Visible := True;
  btnChange.Visible := True;
  btnNoviUgovorZaKupca.Visible := True;
  btnPlacanjeRate.Visible := True;
  btnIzvestaj.Visible := True;
  btnIzaberiratu.Visible := False;
  Label1.Visible := True;
  edtSearch.Visible := True;
  btnSearch.Visible := True;
   query := 'SELECT * FROM kupac ';
  DM.RefreshGrid(query);
  BitBtn1.Visible := False;
end;

procedure TfrmKupacLista.btnChangeClick(Sender: TObject);
begin
  frmNoviKupac.Caption := 'Izmena podataka o kupcu';
  self.idForUpdateKupac := DBGrid1.Fields[0].Text;
  self.forKupacDetalji := 'Izmena podataka o kupcu';

  frmNoviKupac.Show;

end;

procedure TfrmKupacLista.btnCreateClick(Sender: TObject);
begin
  frmNoviKupac.Caption := 'Novi kupac';
  self.forKupacDetalji := 'Novi kupac';
  frmNoviKupac.ShowModal;
end;

procedure TfrmKupacLista.btnExiClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmKupacLista.btnIzaberiratuClick(Sender: TObject);
begin
  frmUplataRate.ShowModal;
end;

procedure TfrmKupacLista.btnIzvestajClick(Sender: TObject);
begin
  DM.fdqSelect.Active := False;
  frmKupacLista.CloseModal;
  frmIzvestaj.ShowModal;
end;

procedure TfrmKupacLista.IsRowSelected();
begin
  while True do
  begin
    if DBGrid1.SelectedRows.Count = 0 then
    begin
      ShowMessage('Morate izabrati kupca');
      Exit
    end
    else
    begin
      Break
    end;
  end;
end;

procedure TfrmKupacLista.proveraKupcaIkreiranjeListeRata;
begin
  btnCreate.Visible := False;
  btnChange.Visible := False;
  Label2.Visible := True;
  Label3.Visible := True;
  edtBojDanaKasnjenja.Visible := True;
  edtBrojPlacenihRata.Visible := True;
  btnNoviUgovorZaKupca.Visible := False;
  btnPlacanjeRate.Visible := False;
  btnIzvestaj.Visible := False;
  btnIzaberiratu.Visible := True;
  Label1.Visible := False;
  edtSearch.Visible := False;
  btnSearch.Visible := False;
  BitBtn1.Visible := true;

  self.idForUpdateKupac := DBGrid1.Fields[0].Text;
  DM.fdqSelect.SQL.Clear;
  DM.fdqSelect.Active := False;
  DM.fdqSelect.SQL.Text :=
    'SELECT kupac.prezime as PREZIME, kupac.ime as IME, ugovor.id_ugovor as BROJ_UGOVORA,'
    + ' ugovor.datum_ugovora as DATUM_UGOVORA, rate.broj_rate as RATA_BROJ, rate.datum_rate as DATUM_DOSPECA,'
    + 'rate.iznos_rate as IZNOS , rate.id_rate as ID FROM kupac INNER JOIN ugovor ON kupac.id_kupac = ugovor.id_kupac '
    + 'INNER JOIN rate ON ugovor.id_ugovor = rate.id_ugovor WHERE ( kupac.id_kupac = :id_kupac AND (rate.iznos_uplate IS null)) '
    + 'ORDER BY DATUM_DOSPECA';
  DM.fdqSelect.ParamByName('id_kupac').AsInteger :=
    StrToInt(self.idForUpdateKupac);
  DM.fdqSelect.Active := True;

  DM.FDQuery1.SQL.Clear;
  DM.FDQuery1.SQL.Text := 'SELECT avg(DATEDIFF(r.datum_uplate,  r.datum_rate)) as bonitet,' +
                              'count(iznos_rate) as broj_rata from rate r ' +
                              'join ugovor u USING(id_ugovor)' +
                              'join kupac k Using(id_kupac) ' +
                              'where k.id_kupac = :id_kupac and r.iznos_uplate is not null' ;
    DM.FDQuery1.ParamByName('id_kupac').AsInteger :=
                        StrToInt(self.idForUpdateKupac);
    DM.FDQuery1.Active := true;
    if (DM.FDQuery1.FieldByName('bonitet').Text = '') then
    begin
         edtBojDanaKasnjenja.Text := '0';
    end
    else
    begin
         edtBojDanaKasnjenja.Text := Format('%6.2f', [StrToFloat (DM.FDQuery1.FieldByName('bonitet').Text)]);
    end;

   // edtBojDanaKasnjenja.Text := Format('%6.2f', [StrToFloat (DM.FDQuery1.FieldByName('bonitet').Text)]);
    edtBrojPlacenihRata.Text := DM.FDQuery1.FieldByName('broj_rata').Text;
end;

procedure TfrmKupacLista.btnNoviUgovorZaKupcaClick(Sender: TObject);
var i :Integer;
begin


  if self.Caption = 'Lista kupaca' then
  begin
      DBGrid1.SelectedRows.CurrentRowSelected := True;
      frmKupacLista.Caption := 'Novi ugovor za kupca';

      self.idForUpdateKupac := DBGrid1.Fields[0].Text;
      self.forKupacDetalji := 'Novi ugovor za kupca';
      proveraKupcaIkreiranjeListeRata;
       btnNoviUgovorZaKupca.Visible := true;
       btnIzaberiratu.Visible := False;
  end
  else
  begin
       frmNoviKupac.Caption := 'Novi ugovor za kupca';
       self.hideDtaAbouBuyer;
       frmNoviKupac.ShowModal;
  end;


end;

procedure TfrmKupacLista.btnPlacanjeRateClick(Sender: TObject);
begin
  self.Caption := 'Placanje rate';
  btnCreate.Visible := False;
  btnChange.Visible := False;
  Label2.Visible := True;
  Label3.Visible := True;
  edtBojDanaKasnjenja.Visible := True;
  edtBrojPlacenihRata.Visible := True;
  btnNoviUgovorZaKupca.Visible := False;
  btnPlacanjeRate.Visible := False;
  btnIzvestaj.Visible := False;
  btnIzaberiratu.Visible := True;
  Label1.Visible := False;
  edtSearch.Visible := False;
  btnSearch.Visible := False;
  BitBtn1.Visible := true;

  self.idForUpdateKupac := DBGrid1.Fields[0].Text;
  DM.fdqSelect.SQL.Clear;
  DM.fdqSelect.Active := False;
  DM.fdqSelect.SQL.Text :=
    'SELECT kupac.prezime as PREZIME, kupac.ime as IME, ugovor.id_ugovor as BROJ_UGOVORA,'
    + ' ugovor.datum_ugovora as DATUM_UGOVORA, rate.broj_rate as RATA_BROJ, rate.datum_rate as DATUM_DOSPECA,'
    + 'rate.iznos_rate as IZNOS , rate.id_rate as ID FROM kupac INNER JOIN ugovor ON kupac.id_kupac = ugovor.id_kupac '
    + 'INNER JOIN rate ON ugovor.id_ugovor = rate.id_ugovor WHERE ( kupac.id_kupac = :id_kupac AND (rate.iznos_uplate IS null)) '
    + 'ORDER BY DATUM_DOSPECA';
  DM.fdqSelect.ParamByName('id_kupac').AsInteger :=
    StrToInt(self.idForUpdateKupac);
  DM.fdqSelect.Active := True;

  DM.FDQuery1.SQL.Clear;
  DM.FDQuery1.SQL.Text := 'SELECT avg(DATEDIFF(r.datum_uplate,  r.datum_rate)) as bonitet,' +
                              'count(iznos_rate) as broj_rata from rate r ' +
                              'join ugovor u USING(id_ugovor)' +
                              'join kupac k Using(id_kupac) ' +
                              'where k.id_kupac = :id_kupac and r.iznos_uplate is not null' ;
    DM.FDQuery1.ParamByName('id_kupac').AsInteger :=
                        StrToInt(self.idForUpdateKupac);
    DM.FDQuery1.Active := true;
    if (DM.FDQuery1.FieldByName('bonitet').Text = '') then
    begin
         edtBojDanaKasnjenja.Text := '0';
    end
    else
    begin
         edtBojDanaKasnjenja.Text := Format('%6.2f', [StrToFloat (DM.FDQuery1.FieldByName('bonitet').Text)]);
    end;

   // edtBojDanaKasnjenja.Text := Format('%6.2f', [StrToFloat (DM.FDQuery1.FieldByName('bonitet').Text)]);
    edtBrojPlacenihRata.Text := DM.FDQuery1.FieldByName('broj_rata').Text;

end;

procedure TfrmKupacLista.btnSearchClick(Sender: TObject);

begin
  query := 'SELECT * FROM kupac WHERE prezime LIKE ' +
    QuotedStr(edtSearch.Text + '%');
  DM.RefreshGrid(query);
end;

procedure TfrmKupacLista.FormShow(Sender: TObject);

begin
  query := 'SELECT * FROM kupac ';
  DM.RefreshGrid(query);
end;

procedure  TfrmKupacLista.showListOfRateForBuyer;//(id: Integer);
  begin
     self.Caption := 'Placanje rate';
  btnCreate.Visible := False;
  btnChange.Visible := False;
  btnNoviUgovorZaKupca.Visible := False;
  btnPlacanjeRate.Visible := False;
  btnIzvestaj.Visible := False;
  btnIzaberiratu.Visible := True;
  Label1.Visible := False;
  edtSearch.Visible := False;
  btnSearch.Visible := False;
  BitBtn1.Visible := true;

  //self.idForUpdateKupac := DBGrid1.Fields[0].Text;
  DM.fdqSelect.SQL.Clear;
  DM.fdqSelect.Active := False;
  DM.fdqSelect.SQL.Text :=
    'SELECT kupac.prezime as PREZIME, kupac.ime as IME, ugovor.id_ugovor as BROJ_UGOVORA,'
    + ' ugovor.datum_ugovora as DATUM_UGOVORA, rate.broj_rate as RATA_BROJ, rate.datum_rate as DATUM_DOSPECA,'
    + 'rate.iznos_rate as IZNOS , rate.id_rate as ID FROM kupac INNER JOIN ugovor ON kupac.id_kupac = ugovor.id_kupac '
    + 'INNER JOIN rate ON ugovor.id_ugovor = rate.id_ugovor WHERE ( kupac.id_kupac = :id_kupac AND (rate.iznos_uplate IS null)) '
    + 'ORDER BY DATUM_DOSPECA';
  DM.fdqSelect.ParamByName('id_kupac').AsInteger :=
    StrToInt(self.idForUpdateKupac);
  DM.fdqSelect.Active := True;
  end;

  //  ALTER TABLE `ugovori_aplikacija`.`kupac`
//CHANGE COLUMN `grad` `grad` VARCHAR(5) NULL DEFAULT NULL ;
  end.
