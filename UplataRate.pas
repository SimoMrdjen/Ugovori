unit UplataRate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TfrmUplataRate = class(TForm)
    Label8: TLabel;
    lblIznosRate: TLabel;
    lblkupac: TLabel;
    edtUplata: TEdit;
    btnSnimiUplatu: TBitBtn;
    dtDatumRate: TDateTimePicker;
    Label1: TLabel;
    cmbVrstaPlacanja: TComboBox;
    edtIznosRAteIzUgovora: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSnimiUplatuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUplataRate: TfrmUplataRate;
   id:Integer;
implementation

{$R *.dfm}

uses EmployeeForm, DataModule;

procedure TfrmUplataRate.btnSnimiUplatuClick(Sender: TObject);

begin
   id := DM.fdqSelect.FieldByName('ID').AsInteger;
  DM.fdqSelect.SQL.Clear;
  DM.fdqSelect.SQL.Text :='UPDATE rate SET iznos_uplate = :iznos_uplate , ' +
                          'datum_uplate = :datum_uplate, tip_uplate = :tip_uplate ' +
                          'WHERE id_rate = :id_rate';

  DM.fdqSelect.ParamByName('iznos_uplate').AsFloat := StrToFloat(edtUplata.Text);
  DM.fdqSelect.ParamByName('datum_uplate').AsDate := dtDatumRate.Date;
  DM.fdqSelect.ParamByName('tip_uplate').AsString := cmbVrstaPlacanja.Text;
//  DM.fdqSelect.ParamByName('id_rate').AsInteger := frmKupacLista.DBGrid1.Fields[7].AsInteger;
DM.fdqSelect.ParamByName('id_rate').AsInteger := id;


  DM.fdqSelect.ExecSQL;
  ShowMessage('Uplata je uspesno snimljena');

  self.Close;
  frmKupacLista.showListOfRateForBuyer;//(id);

end;

procedure TfrmUplataRate.FormShow(Sender: TObject);
var ime, prezime, ugovor, datum_ugovora, rata,
    datum_rate, iznos: String;
begin
  dtDatumRate.Date := Now;

 with frmKupacLista do
 begin
    prezime := DBGrid1.Fields[0].AsString;
    ime := DBGrid1.Fields[1].AsString;
    ugovor := DBGrid1.Fields[2].AsString;
    datum_ugovora := DBGrid1.Fields[3].AsString;
    rata := DBGrid1.Fields[4].AsString;
    datum_rate := DBGrid1.Fields[5].AsString;
    iznos := //DBGrid1.Fields[6].AsString;
           Format('%6.2f', [StrToFloat (DBGrid1.Fields[6].AsString)]);
 end;

  lblkupac.Caption :='Za kupca: ' + prezime + '   ' + ime + '  broj ugovora: ' +
                      ugovor + '  od: ' + datum_ugovora + ',  rata broj:' + rata +
                      '  sa danоm dospeća  ' + datum_rate + '  i iznosom: ';
   edtIznosRAteIzUgovora.Text := iznos;
   edtUplata.Text := iznos;
   edtUplata.SetFocus;

end;

end.
