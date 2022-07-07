unit Izvestaj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls, frxClass, frxDBSet;

type
  TfrmIzvestaj = class(TForm)
    dateIzvestaj: TDateTimePicker;
    btnStampaj: TBitBtn;
    btnPrikaziIzvestaj: TBitBtn;
    dbgIzvestaj: TDBGrid;
    DataSourceizvestaj: TDataSource;
    edtRAcun: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtKartica: TEdit;
    edtGotovina: TEdit;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    btnExi: TBitBtn;
    procedure btnPrikaziIzvestajClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnStampajClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure btnExiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIzvestaj: TfrmIzvestaj;
 got, kart, rac: Double;
implementation

{$R *.dfm}

uses DataModule;

procedure TfrmIzvestaj.btnExiClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TfrmIzvestaj.btnPrikaziIzvestajClick(Sender: TObject);
var temp: Double;
begin
     got := 0; kart := 0; rac := 0; temp := 0;
     DM.fdqSelect.SQL.Clear;
     DM.fdqSelect.SQL.Text := 'SELECT kupac.prezime AS PREZIME, kupac.ime AS IME, ' +
                             'ugovor.id_ugovor AS UGOVOR, rate.iznos_uplate AS UPLACENO, ' +
                             'rate.tip_uplate AS VRSTA_PLACANJA , rate.broj_rate AS RATA ' +
                             'FROM kupac INNER JOIN ugovor ON kupac.id_kupac = ugovor.id_kupac ' +
                             'INNER JOIN rate ON rate.id_ugovor = ugovor.id_ugovor WHERE ' +
                             'rate.datum_uplate = :datum_uplate';

     DM.fdqSelect.ParamByName('datum_uplate').AsDate :=  dateIzvestaj.Date;
     DM.fdqSelect.Active := True;
     btnStampaj.Visible := True;

     with DM do
     begin
      fdqSelect.First;
      while fdqSelect.Eof = False do
      begin
        temp := fdqSelect.FieldByName('UPLACENO').AsFloat;
        if fdqSelect.FieldByName('VRSTA_PLACANJA').AsString = 'GOTOVINA' then got := got + temp;
        if fdqSelect.FieldByName('VRSTA_PLACANJA').AsString = 'KARTICA' then  kart := kart + temp;
        if fdqSelect.FieldByName('VRSTA_PLACANJA').AsString = 'RACUN' then rac := rac + temp;
        fdqSelect.Next;
      end;
     end;
      edtGotovina.Text := FloatToStr(got);
      edtKartica.text := FloatToStr(kart);
      edtRAcun.text := FloatToStr(rac);
      btnStampaj.Visible := True;
end;

procedure TfrmIzvestaj.btnStampajClick(Sender: TObject);
begin
   if frxReport1.PrepareReport then
    frxReport1.ShowPreparedReport;
end;

procedure TfrmIzvestaj.FormShow(Sender: TObject);
begin
    dateIzvestaj.Date := Now;
end;

procedure TfrmIzvestaj.frxReport1GetValue(const VarName: string;
  var Value: Variant);
begin
     if VarName = 'GOTOVINA' then
    Value := edtGotovina.Text;
      if VarName = 'KARTICA' then
    Value := edtKartica.Text;
      if VarName = 'RACUN' then
    Value := edtRAcun.Text;
end;

end.
