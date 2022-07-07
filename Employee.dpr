program Employee;

uses
  Vcl.Forms,
  EmployeeForm in 'EmployeeForm.pas' {frmKupacLista},
  KupacDetalji in 'KupacDetalji.pas' {frmNoviKupac},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  ugovorDetalji in 'ugovorDetalji.pas' {frmUgovorDetalji},
  UgovorStampa in 'UgovorStampa.pas' {frmUgovorStampa},
  modul in 'K:\BIS Trezor\PAVEL\Simo\modul.pas' {ModulF},
  LatCyrConv in '..\..\..\..\..\Desktop\SIMO\63 najnovije\LatCyrConv.pas',
  CodePageConv in 'K:\BIS Trezor\PAVEL\Ljiljana_M\Ostalo\INDIREKTNI\CodePageConv.pas',
  UplataRate in 'UplataRate.pas' {frmUplataRate},
  Izvestaj in 'Izvestaj.pas' {frmIzvestaj};

//Kopija in 'Kopija.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmKupacLista, frmKupacLista);
  Application.CreateForm(TfrmNoviKupac, frmNoviKupac);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmUgovorDetalji, frmUgovorDetalji);
  Application.CreateForm(TfrmIzvestaj, frmIzvestaj);
  //Application.CreateForm(TfrmObrisati, frmObrisati);
  //Application.CreateForm(TfrmUgovorStampa, frmUgovorStampa);
  Application.CreateForm(TModulF, ModulF);
  Application.CreateForm(TfrmUplataRate, frmUplataRate);
//  Application.CreateForm(TOKHelpRightDlg1, OKHelpRightDlg1);
//  Application.CreateForm(TOKHelpRightDlg2, OKHelpRightDlg2);
 // Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
