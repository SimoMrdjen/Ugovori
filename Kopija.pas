unit Kopija;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ugovorDetalji;

type
  TForm3 = class(TfrmUgovorDetalji)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses ugovorDetalji, DataModule, EmployeeForm, KupacDetalji, UplataRate;

end.
