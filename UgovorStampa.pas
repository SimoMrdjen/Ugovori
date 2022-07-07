unit UgovorStampa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmUgovorStampa = class(TForm)
    grdStampaUgovor: TDBGrid;
    btnStampaj: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUgovorStampa: TfrmUgovorStampa;

implementation

{$R *.dfm}

uses DataModule;

procedure TfrmUgovorStampa.FormShow(Sender: TObject);

begin
    //DM.RefreshGrid('SELECT * FROM ugovor');
end;

end.
