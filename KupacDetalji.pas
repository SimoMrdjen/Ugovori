unit KupacDetalji;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmNoviKupac = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtBrojLK: TEdit;
    edtPU: TEdit;
    edtAdresa: TEdit;
    edtTelefon: TEdit;
    edtPrezime: TEdit;
    edtIme: TEdit;
    edtEmail: TEdit;
    edtJMBG: TEdit;
    btnSnimi: TBitBtn;
    btnOdustani: TBitBtn;
    edtGmail: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    edtGrad: TEdit;
    procedure btnSnimiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOdustaniClick(Sender: TObject);
    procedure GetFieldsValues;
    procedure AssignParamsValues;
    procedure FillEdtFields;
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNoviKupac: TfrmNoviKupac;
  query, msg: String;
  prezime, ime, jmbg, broj_lk, policijska_uprava, gradKupca, ulica_broj,
    telefon, email: String;

implementation

{$R *.dfm}

uses DataModule, EmployeeForm, ugovorDetalji, UplataRate, CodePageConv, LatCyrConv,
  modul;

procedure TfrmNoviKupac.BitBtn1Click(Sender: TObject);
begin
  query := 'SELECT * FROM kupac ';
  DM.RefreshGrid(query);
  Close;
end;

procedure TfrmNoviKupac.btnOdustaniClick(Sender: TObject);
begin
  DM.RefreshGrid(query);
  Close;
end;

procedure TfrmNoviKupac.btnSnimiClick(Sender: TObject);
begin
  if (self.Caption = 'Novi kupac') then
  begin
    DM.fdqSelect.SQL.Clear;
    DM.fdqSelect.SQL.Text :=
      ' insert into kupac( prezime, ime, jmbg, broj_lk, policijska_uprava, grad, ulica_broj, telefon, email)'
      + ' VALUES (:prezime, :ime, :jmbg, :broj_lk, :policijska_uprava , :grad, :ulica_broj , :telefon, :email) ';

    GetFieldsValues;
    AssignParamsValues;
    DM.fdqSelect.ExecSQL;
    query := 'SELECT * FROM kupac ORDER BY id_kupac DESC LIMIT 0,1 ';

  end
  else if (self.Caption = 'Izmena podataka o kupcu') then
  begin

    DM.fdqSelect.SQL.Clear;
    DM.fdqSelect.SQL.Text :=
      'UPDATE kupac SET prezime = :prezime, ime = :ime, jmbg = :jmbg, broj_lk = :broj_lk,'
      + ' policijska_uprava = :policijska_uprava, grad = :grad, ulica_broj = :ulica_broj,'
      + ' telefon = :telefon, email = :email WHERE id_kupac =  :id_kupac ';

    DM.fdqSelect.ParamByName('id_kupac').AsInteger :=
      StrToInt(frmKupacLista.idForUpdateKupac);
    GetFieldsValues;
    AssignParamsValues;
    DM.fdqSelect.ExecSQL;
    query := 'SELECT * FROM kupac WHERE id_kupac = ' +
      frmKupacLista.idForUpdateKupac;
  end
  else if (self.Caption = 'Novi ugovor za kupca') then
  begin
    query := 'SELECT * FROM kupac WHERE id_kupac = ' +
      frmKupacLista.idForUpdateKupac;
  end;

  DM.RefreshGrid(query);

  ShowMessage('Da li ste proverili podatke o kupcu');
   self.Close;
  frmUgovorDetalji.ShowModal;

end;

procedure TfrmNoviKupac.FormShow(Sender: TObject);
begin

  if (self.Caption = 'Novi kupac') then
  begin
    btnSnimi.Caption := 'Snimi novog kupca';
    edtPU.Text := '';
    edtBrojLK.Text := '';
    edtGrad.Text := '';
    edtAdresa.Text := '';
    edtTelefon.Text := '';
    edtPrezime.Text := '';
    edtIme.Text := '';
    edtEmail.Text := '';
    edtJMBG.Text := '';

  end

  else if (self.Caption = 'Izmena podataka o kupcu') then
  begin
    btnSnimi.Caption := 'Snimi izmene';
    query := 'SELECT * FROM kupac WHERE id_kupac = ' +
      frmKupacLista.idForUpdateKupac;
    DM.RefreshGrid(query);
    FillEdtFields;
    Label4.Visible := False;
    edtGmail.Visible := False;
  end

  else if (self.Caption = 'Novi ugovor za kupca') then
  begin
       edtPU.Enabled := False;
    edtBrojLK.Enabled := False;
    edtGrad.Enabled := False;
    edtAdresa.Enabled := False;
    edtTelefon.Enabled := False;
    edtPrezime.Enabled := False;
    edtIme.Enabled := False;
    edtEmail.Enabled := False;
    edtJMBG.Enabled := False;
    btnSnimi.Caption := 'Novi ugovor za kupca';
    query := 'SELECT * FROM kupac WHERE id_kupac = ' +
      frmKupacLista.idForUpdateKupac;
    DM.RefreshGrid(query);
    FillEdtFields;
      Label4.Visible := False;
    edtGmail.Visible := False;
  end;
end;

procedure TfrmNoviKupac.GetFieldsValues;
begin
  prezime := CyrToLat(edtPrezime.Text);
  ime := CyrToLat(edtIme.Text);
  jmbg := edtJMBG.Text;
  broj_lk := edtBrojLK.Text;
  policijska_uprava := CyrToLat(edtPU.Text);
  gradKupca := edtGrad.Text;
  ulica_broj := CyrToLat(edtAdresa.Text);
  telefon := edtTelefon.Text;
  if (self.Caption = 'Izmena podataka o kupcu') then
  begin
       email := edtEmail.Text;
  end
  else
  begin
      email := edtEmail.Text + '@' + edtGmail.Text;
  end;

end;

procedure TfrmNoviKupac.AssignParamsValues;
begin
  DM.fdqSelect.ParamByName('prezime').AsString := prezime;
  DM.fdqSelect.ParamByName('ime').AsString := ime;
  DM.fdqSelect.ParamByName('jmbg').AsString := jmbg;
  DM.fdqSelect.ParamByName('broj_lk').AsString := broj_lk;
  DM.fdqSelect.ParamByName('policijska_uprava').AsString := policijska_uprava;
  DM.fdqSelect.ParamByName('grad').AsString := gradKupca;
  DM.fdqSelect.ParamByName('ulica_broj').AsString := ulica_broj;
  DM.fdqSelect.ParamByName('telefon').AsString := telefon;
  DM.fdqSelect.ParamByName('prezime').AsString := prezime;
  DM.fdqSelect.ParamByName('email').AsString := email;
end;

procedure TfrmNoviKupac.FillEdtFields;
begin
  edtPrezime.Text := DM.fdqSelect.FieldByName('prezime').AsString;
  edtIme.Text := DM.fdqSelect.FieldByName('ime').AsString;
  edtJMBG.Text := DM.fdqSelect.FieldByName('jmbg').AsString;
  edtBrojLK.Text := DM.fdqSelect.FieldByName('broj_lk').AsString;
  edtPU.Text := DM.fdqSelect.FieldByName('policijska_uprava').AsString;
  edtGrad.Text := DM.fdqSelect.FieldByName('grad').AsString;
  edtAdresa.Text := DM.fdqSelect.FieldByName('ulica_broj').AsString;
  edtTelefon.Text := DM.fdqSelect.FieldByName('telefon').AsString;
  edtEmail.Text := DM.fdqSelect.FieldByName('email').AsString;
end;

end.
