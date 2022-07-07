unit ugovorDetalji;
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  frxClass, Vcl.Buttons, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, frxDBSet,
  kbmMemTable, Bde.DBTables, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TfrmUgovorDetalji = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    edtAdresa: TEdit;
    edtGrad: TEdit;
    edtPU: TEdit;
    edtBrojLK: TEdit;
    edtJMBG: TEdit;
    edtIme: TEdit;
    edtPrezime: TEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    btnSnimiUgovor: TBitBtn;
    dtsUgovorZaStampu: TDataSource;
    btnStampaj: TBitBtn;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    BindingsList1: TBindingsList;
    kbmFromForma: TkbmMemTable;
    kbmFromFormaIznosUgovora: TStringField;
    kbmFromFormaIznosUcesca: TCurrencyField;
    kbmFromFormaField1rata: TCurrencyField;
    kbmFromFormaField2rata: TCurrencyField;
    kbmFromFormaField3rata: TCurrencyField;
    kbmFromFormaDatum1: TDateField;
    kbmFromFormaDatum2: TDateField;
    kbmFromFormaDatum3: TDateField;
    kbmFromFormaBrojUgovora: TStringField;
    kbmFromFormaImePrezime: TStringField;
    kbmFromFormaLK: TStringField;
    kbmFromFormaAdresa: TStringField;
    kbmFromFormaJMBG: TStringField;
    lblSnimljenUgovorPoruka: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    edtIznos1Rata: TEdit;
    edtIznosUgovora: TEdit;
    edtIznosUcesca: TEdit;
    dateUgovor: TDateTimePicker;
    date1Rata: TDateTimePicker;
    date2Rata: TDateTimePicker;
    date3Rata: TDateTimePicker;
    edtIznos2Rata: TEdit;
    edtIznos3Rata: TEdit;
    Panel5: TPanel;
    frxReport1: TfrxReport;
    btnExit: TBitBtn;
    procedure date1RataChange(Sender: TObject);
    procedure kalkulacijaIznosaRate;
    procedure edtIznosUcescaChange(Sender: TObject);
    procedure btnSnimiUgovorClick(Sender: TObject);
    procedure formatingDate;
    procedure btnStampajClick(Sender: TObject);
    procedure FillKbm;
    procedure PersistantDetailsForUgovor(iznos_rate: String; datum_rate: TDate;
      broj_rate: Integer);
    procedure edtIznosUgovoraExit(Sender: TObject);
    function getIdKupca(jmbg:String):Integer;
    procedure FormShow(Sender: TObject);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure btnExitClick(Sender: TObject);
    //procedure frxReport1GetValue(const VarName: string; var Value: Variant);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUgovorDetalji: TfrmUgovorDetalji;
  iznosUgovora, iznosUcesca, iznosRata: double;
  query, brojUgovora: String;
  datumUgovora, datum1Rate, datum2Rate, datum3rate: String;
  IdUgovor: Integer;

implementation

{$R *.dfm}

uses EmployeeForm, UgovorStampa, DataModule, modul;

function TfrmUgovorDetalji.getIdKupca(jmbg:String):Integer;
begin
  DM.fdqSelect.Active := False;
  DM.fdqSelect.SQL.Clear;
  DM.fdqSelect.SQL.Text := 'SELECT id_kupac AS id FROM kupac WHERE jmbg = :jmbg';
  DM.fdqSelect.ParamByName('jmbg').AsString := jmbg;
  DM.fdqSelect.Active := True;
  Result:= DM.fdqSelect.FieldByName('id').AsInteger;
end;

procedure TfrmUgovorDetalji.btnExitClick(Sender: TObject);
begin
  Close;
  frmKupacLista.hideDtaAbouBuyer;
  frmKupacLista.reopenForm;
end;

procedure TfrmUgovorDetalji.btnSnimiUgovorClick(Sender: TObject);
var
  id: Integer;
  listKupacData, listUgovorData: String;
begin
   id := getIdKupca(edtJMBG.Text) ;
  DM.fdqSelect.SQL.Clear;
  DM.fdqSelect.SQL.Text :=
    'INSERT INTO ugovor(id_kupac, iznos_ugovora, datum_ugovora, ucesce_iznos) '
    + ' VALUES ( :id_kupac , :iznos_ugovora, :datum_ugovora, :ucesce_iznos )';

  DM.fdqSelect.ParamByName('id_kupac').AsInteger := id ;
  DM.fdqSelect.ParamByName('iznos_ugovora').AsFloat :=
    StrToFloat(edtIznosUgovora.Text);
      DM.fdqSelect.ParamByName('datum_ugovora').AsDate := dateUgovor.Date;
  DM.fdqSelect.ParamByName('ucesce_iznos').AsFloat :=
    StrToFloat(edtIznosUcesca.Text);
  DM.fdqSelect.ExecSQL;

  DM.GetLastUgovor
    ('SELECT id_ugovor FROM ugovor ORDER BY id_ugovor DESC LIMIT 0,1 ');
  IdUgovor := DM.fdqSelect.FieldByName('id_ugovor').AsInteger;
  PersistantDetailsForUgovor(edtIznos1Rata.Text, date1Rata.Date, 1);
  PersistantDetailsForUgovor(edtIznos2Rata.Text, date2Rata.Date, 2);
  PersistantDetailsForUgovor(edtIznos3Rata.Text, date3Rata.Date, 3);
  btnSnimiUgovor.Visible := False;
  lblSnimljenUgovorPoruka.Caption := 'Uspešno je snimljen ugovor broj ' +
    IntToStr(IdUgovor);
  lblSnimljenUgovorPoruka.Visible := True;
  btnStampaj.Visible := True;
  btnStampaj.SetFocus;

end;

procedure TfrmUgovorDetalji.formatingDate;
begin
  // formatdatetime('yyyy-mm-dd', dateUgovor.DateTime);
end;

procedure TfrmUgovorDetalji.FormShow(Sender: TObject);
begin
     btnStampaj.Visible := False;
     btnSnimiUgovor.Visible := True;
     lblSnimljenUgovorPoruka.Caption := '';
     edtIznosUgovora.Text := '0';
     edtIznosUcesca.Text := '0';
  edtPrezime.Text := DM.fdqSelect.FieldByName('prezime').AsString;
  edtIme.Text := DM.fdqSelect.FieldByName('ime').AsString;
  edtJMBG.Text := DM.fdqSelect.FieldByName('jmbg').AsString;
  edtBrojLK.Text := DM.fdqSelect.FieldByName('broj_lk').AsString;
  edtPU.Text := DM.fdqSelect.FieldByName('policijska_uprava').AsString;
  edtGrad.Text := DM.fdqSelect.FieldByName('grad').AsString;
  edtAdresa.Text := DM.fdqSelect.FieldByName('ulica_broj').AsString;

  date1Rata.Date := dateUgovor.Date + 30;
  date2Rata.Date := date1Rata.Date + 30;
  date3Rata.Date := date1Rata.Date + 60;
  edtIznosUgovora.SetFocus;
end;

procedure TfrmUgovorDetalji.frxReport1GetValue(const VarName: string;
  var Value: Variant);
begin
   if VarName = 'ID' then
     Value := IdUgovor;
   if VarName = 'KUPAC' then
     Value := '2. ' + edtPrezime.Text + ' ' + edtIme.Text + ' JMBG: ' + edtJMBG.Text + ' iz ' + //+ edtGrad.Text +  ', ' +
              edtAdresa.Text + ', broj l.k.: ' + edtBrojLK.Text + ' izdate od ' +
               edtPU.Text + ' u daljem tekstu KUPAC.';
   if VarName = 'IZNOS' then
     Value := edtIznosUgovora.Text;
   if VarName = 'UCESCE' then
     Value := edtIznosUcesca.Text;
   if VarName = 'RATA' then
     Value := edtIznos1Rata.Text;
   if VarName = 'DATUM_1_RATE' then
     Value := date1Rata.Date;
   if VarName = 'DATUM_2_RATE' then
     Value := date2Rata.Date;
   if VarName = 'DATUM_3_RATE' then
     Value := date3Rata.Date;

end;

procedure TfrmUgovorDetalji.btnStampajClick(Sender: TObject);
begin
  if frxReport1.PrepareReport then
    frxReport1.ShowPreparedReport;

end;

procedure TfrmUgovorDetalji.date1RataChange(Sender: TObject);
begin
  date2Rata.Date := date1Rata.Date + 30;
  date3Rata.Date := date1Rata.Date + 60;
end;

procedure TfrmUgovorDetalji.kalkulacijaIznosaRate;
begin
  iznosRata := (iznosUgovora - iznosUcesca) / 3;
  edtIznos1Rata.Text := iznosRata.ToString;
  edtIznos2Rata.Text := iznosRata.ToString;
  edtIznos3Rata.Text := iznosRata.ToString;
end;

procedure TfrmUgovorDetalji.edtIznosUcescaChange(Sender: TObject);
begin
  iznosUgovora := StrToFloat(edtIznosUgovora.Text);
  iznosUcesca := StrToFloat(edtIznosUcesca.Text);
  kalkulacijaIznosaRate;
end;

procedure TfrmUgovorDetalji.edtIznosUgovoraExit(Sender: TObject);
begin
  edtIznosUcesca.SetFocus;
end;

procedure TfrmUgovorDetalji.FillKbm;
begin
  // kbmFromForma.Open;
  // kbmFromForma.Append;
  // kbmFromFormaImePrezime.Value := edtPrezime.Text + ' ' + edtIme.Text;
  // kbmFromFormaAdresa.Value := ' iz ' + edtAdresa.Text;
  // kbmFromFormaJMBG.Value := ' JMBG: ' + edtJMBG.Text;
  // kbmFromFormaLK.Value := ' lièna karta broj ' + edtBrojLK.Text + ' izdata od ' + edtPU.Text;
  // kbmFromFormaBrojUgovora.Value := edtLastOne.Text;
  // kbmFromFormaIznosUgovora.Value := StrToCurr(edtIznosUgovora.Text);
  // kbmFromFormaIznosUcesca.Value := StrToCurr(edtIznosUcesca.Text);
  // kbmFromForma.Post;
end;

procedure TfrmUgovorDetalji.PersistantDetailsForUgovor(iznos_rate: String;
  datum_rate: TDate; broj_rate: Integer);
begin
  DM.fdqSelect.SQL.Clear;
  DM.fdqSelect.SQL.Text :=
    'INSERT INTO rate (id_ugovor, iznos_rate, datum_rate, broj_rate)' +
    'VALUES ( :id_ugovor, :iznos_rate, :datum_rate, :broj_rate)';
  DM.fdqSelect.ParamByName('id_ugovor').AsInteger := IdUgovor;
  DM.fdqSelect.ParamByName('iznos_rate').AsFloat := StrToFloat(iznos_rate);
  DM.fdqSelect.ParamByName('datum_rate').AsDate := datum_rate;
  DM.fdqSelect.ParamByName('broj_rate').AsInteger := broj_rate;
  DM.fdqSelect.ExecSQL;
end;


end.
