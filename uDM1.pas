unit uDM1;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tdm1 = class(TDataModule)
    Connect_tst: TFDConnection;
    qListaPedidos: TFDQuery;
    q1: TFDQuery;
    qPedDetalhes: TFDQuery;
    qPedDetalhesautoincrem: TFDAutoIncField;
    qPedDetalhesped_num: TIntegerField;
    qPedDetalhesprod_id: TIntegerField;
    qPedDetalhesprod_descricao: TStringField;
    qPedDetalhesqtd: TFloatField;
    qPedDetalhesvlr_unit: TFloatField;
    qPedDetalhesvlr_total: TFloatField;
    qListaPedidosped_num: TIntegerField;
    qListaPedidosped_data: TDateField;
    qListaPedidosped_cliid: TIntegerField;
    qListaPedidosped_valor: TFloatField;
    qListaPedidoscli_nome: TStringField;
    qListaPedidoscli_cidade: TStringField;
    qBuscaPedido: TFDQuery;
    qBuscaProduto: TFDQuery;
    qBuscaProdutoprod_id: TIntegerField;
    qBuscaProdutoprod_descricao: TStringField;
    qBuscaProdutoprod_precovenda: TFloatField;
    qBuscaPedidoped_num: TIntegerField;
    qBuscaPedidoped_data: TDateField;
    qBuscaPedidoped_cliid: TIntegerField;
    qBuscaPedidocli_nome: TStringField;
    qBuscaPedidoped_valor: TFloatField;
    qBuscaCliente: TFDQuery;
    qBuscaClientecli_id: TIntegerField;
    qBuscaClientecli_nome: TStringField;
    qBuscaClientecli_cidade: TStringField;
    qBuscaClientecli_UF: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm1: Tdm1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
