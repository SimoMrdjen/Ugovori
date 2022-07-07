unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr, FireDAC.Phys.MySQL,
  Datasnap.DBClient, SimpleDS, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  IdCustomTCPServer, IdTCPServer, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, Data.Win.ADODB, IdContext, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Data.Bind.EngExt ;

type
  TDM = class(TDataModule)
    fdqSelect: TFDQuery;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDQuery1: TFDQuery;

    procedure RefreshGrid(query: String);
    procedure ExecuteQuery(query: String; datumUgovora: TDate);
   procedure GetLastUgovor(query: String);
   procedure ExecuteQueryKupac(query: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses KupacDetalji, EmployeeForm;

{$R *.dfm}

procedure TDM.RefreshGrid(query: String);
begin
      fdqSelect.Active := False;
      fdqSelect.SQL.Clear;
      fdqSelect.SQL.Text := query;
      fdqSelect.Active := True;

end;

procedure TDM.ExecuteQuery(query: String; datumUgovora: TDate);
begin
      fdqSelect.SQL.Clear;
      fdqSelect.SQL.Text := query;
      fdqSelect.ParamByName('datumUgovora');
      fdqSelect.ExecSQL;
end;

procedure TDM.ExecuteQueryKupac(query: String);
begin
      fdqSelect.SQL.Clear;
      fdqSelect.SQL.Text := query;
      fdqSelect.ExecSQL;
end;

 procedure TDM.GetLastUgovor(query: String);
 begin
   fdqSelect.Active := False;
   fdqSelect.SQL.Clear;
   fdqSelect.SQL.Text := query;
   fdqSelect.Active := true;
   //QyUgovorZaStampu.Close;
 end;

end.
