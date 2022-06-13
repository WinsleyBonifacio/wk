unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, uPedido, Data.DB,
  Vcl.Grids, Vcl.DBGrids, uDM1;

type
  TForm1 = class(TForm)
    pedido_add: TSpeedButton;
    dsListaPedidos: TDataSource;
    GridPedidos: TDBGrid;
    procedure pedido_addClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GridPedidosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.GridPedidosDblClick(Sender: TObject);
begin
   fPedido.EdPedNum.Text     := IntToStr(dm1.qListaPedidosped_num.Value) ;
   fPedido.PedidoStatus      := 'cons';
   fPedido.ShowModal;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
    dm1.Connect_tst.Connected  := true;
    if dm1.qListaPedidos.Active = true then dm1.qListaPedidos.Active := false;
    dm1.qListaPedidos.Active   := true;
end;

procedure TForm1.pedido_addClick(Sender: TObject);
begin
   fpedido.PedidoStatus := 'add' ;
   fPedido.ShowModal;
end;

end.
