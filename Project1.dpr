program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uPedido in 'uPedido.pas' {fPedido},
  uDM1 in 'uDM1.pas' {dm1: TDataModule},
  uPedidoProduto in 'uPedidoProduto.pas' {fPedidoProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfPedido, fPedido);
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(TfPedidoProduto, fPedidoProduto);
  Application.Run;
end.
