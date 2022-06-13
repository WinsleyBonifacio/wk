unit uPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, uDM1,
  Data.DB, Vcl.Grids, Vcl.DBGrids, uPedidoProduto;

type
  TfPedido = class(TForm)
    EdPedNum: TEdit;
    Label1: TLabel;
    EdPedData: TEdit;
    Label2: TLabel;
    EdPedCliId: TEdit;
    EdValorTotal: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    GridPedDetalhes: TDBGrid;
    dsPedDetalhes: TDataSource;
    btnAddProd: TBitBtn;
    EdPedidocliNome: TEdit;
    btn1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure status_acoes;
    procedure btnAddProdClick(Sender: TObject);
    procedure GridPedDetalhesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RefreshPedido ;
    procedure GridPedDetalhesDblClick(Sender: TObject);
    procedure EdPedCliIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdPedDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
     PedidoStatus : string ; //add, cons, up, del, ...
  end;

var
  fPedido: TfPedido;

implementation

{$R *.dfm}

procedure TfPedido.btn1Click(Sender: TObject);
begin

  if (PedidoStatus = 'add') and (btn1.Caption = 'Salvar') then
  begin
    dm1.q1.sql.clear;
    dm1.q1.sql.add('insert into pedido (Ped_Num,  Ped_Data,  Ped_CliId,  Ped_Valor) ');
    dm1.q1.sql.add('         values   (:xPedNum, :xPedData, :xPedCliId, :xValorTotal) ');
    dm1.q1.parambyname('xPedNum').value     := StrToInt(EdPedNum.Text) ;
    dm1.q1.parambyname('xPedData').value    := StrToDate(EdPedData.Text);
    dm1.q1.parambyname('xPedCliId').value   := StrToInt(EdPedCliId.Text);
    dm1.q1.parambyname('xValorTotal').value := 0;
    dm1.q1.ExecSQL ;
    dm1.Connect_TST.Commit;

    if dm1.qListaPedidos.Active = true then dm1.qListaPedidos.Active := false;
    dm1.qListaPedidos.Active   := true;
    dm1.qListaPedidos.Last;

    PedidoStatus            := 'cons' ;
    btnAddProd.Visible      := true;
    GridPedDetalhes.Visible := true;
  end;

  if  (PedidoStatus = 'up') and  (btn1.Caption = 'Salvar') then
  begin
    dm1.q1.sql.clear;
    dm1.q1.sql.add('update pedido set ');
    dm1.q1.sql.add(' Ped_Data  = :xPedData, ');
    dm1.q1.sql.add(' Ped_CliId = :xPedCliId, ');
    dm1.q1.sql.add(' Ped_Valor = :xValorTotal ');
    dm1.q1.sql.add(' where Ped_Num = :xPedNum ');
    dm1.q1.parambyname('xPedNum').value     := StrToInt(EdPedNum.Text) ;
    dm1.q1.parambyname('xPedData').value    := StrToDate(EdPedData.Text);
    dm1.q1.parambyname('xPedCliId').value   := StrToInt(EdPedCliId.Text);
    dm1.q1.parambyname('xValorTotal').value := StrToFloat(EdValorTotal.Text);
    dm1.q1.ExecSQL ;
    dm1.Connect_TST.Commit;

    PedidoStatus := 'cons' ;
  end;

  if  (PedidoStatus = 'cons') and  (btn1.Caption = 'Alterar') then
  begin
    PedidoStatus := 'up' ;
  end;

  status_acoes ;
end;

procedure TfPedido.status_acoes;
begin
    if (PedidoStatus = 'cons') then
    begin
      if length(EdPedNum.Text) >=1 then
      begin
         if dm1.qBuscaPedido.active = true then dm1.qBuscaPedido.active := false ;
         dm1.qBuscaPedido.parambyname('xPedNum').value := StrToInt(EdPedNum.Text);
         dm1.qBuscaPedido.active := true ;
      end;
      EdPedData.text          := DateToStr(dm1.qBuscaPedidoped_data.value)  ;
      EdPedCliId.text         := IntToStr(dm1.qBuscaPedidoped_cliid.value)  ;
      EdPedidocliNome.Text    := dm1.qBuscaPedidocli_nome.value ;
      EdValorTotal.text       := FloatToStr(dm1.qBuscaPedidoped_valor.value)  ;
      btn1.Caption            := 'Alterar';
      EdPedNum.enabled        := false;
      EdPedData.enabled       := false;
      EdPedCliId.enabled      := false;
      EdValorTotal.enabled    := false;
      btnAddProd.Visible      := true;
      GridPedDetalhes.Visible := true;

      if dm1.qListaPedidos.Active = true then dm1.qListaPedidos.Active := false;
      dm1.qListaPedidos.Active   := true;
      dm1.qListaPedidos.Last;

    end;

    if (PedidoStatus = 'add') or (PedidoStatus = 'up')  then
    begin
      btn1.Caption         := 'Salvar';
      if (PedidoStatus = 'add') then
      begin
        EdPedNum.enabled     := false;
        if dm1.q1.Active = true then dm1.q1.Active := false;
        dm1.q1.sql.clear;
        dm1.q1.sql.add('SELECT Max(pedido.ped_num) AS MaxPedNum FROM pedido');
        dm1.q1.Active           := true ;
        EdPedNum.Text           := IntToStr(dm1.q1.FieldByName('MaxPedNum').Value + 1);
        EdPedData.Text          := datetostr(date);
        EdPedCliId.Text         := '';
        EdPedidocliNome.Text    := '';
        EdValorTotal.Text       := '0';
        dm1.q1.Active           := false;
      end;
      btnAddProd.Visible      := false;
      GridPedDetalhes.Visible := false;
      EdPedData.enabled    := true;
      EdPedCliId.enabled   := true;
      EdValorTotal.enabled := false;
    end;

end;


procedure TfPedido.btnAddProdClick(Sender: TObject);
begin
     fPedidoProduto.PedidoStatus := 'add';
     fPedidoProduto.ShowModal;
end;

procedure TfPedido.EdPedCliIdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
  begin
      if (EdPedCliId.Text = '')  then
      begin
         showmessage('Informe o Código do Cliente!');
         exit;
      end;

      if dm1.qbuscaCliente.Active = true then dm1.qbuscaCliente.Active := false ;
      dm1.qbuscaCliente.ParamByName('xCliID').Value := StrToInt(EdPedCliId.Text) ;
      dm1.qbuscaCliente.Active := true;

      if (dm1.qbuscaCliente.RecordCount = 0) then
      begin
         showmessage('Cliente não cadastrado! Código de Cliente "'+EdPedCliId.Text+'" inválido!' );
         EdPedCliId.Text := '' ;
      end else
      begin
        EdPedidocliNome.Text := dm1.qBuscaClientecli_nome.Value;
        perform(wm_nextdlgctl,0,0);
      end;

  end;

  if key=38 then perform(wm_nextdlgctl,1,0);
end;

procedure TfPedido.EdPedDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then perform(wm_nextdlgctl,0,0);
  if key=38 then perform(wm_nextdlgctl,1,0);
end;

procedure TfPedido.FormActivate(Sender: TObject);
begin
    status_acoes ;
//    if dm1.qPedDetalhes.active = true then dm1.qPedDetalhes.active := false;
//    dm1.qPedDetalhes.parambyname('XPEDNUM').value := fPedido.EdPedNum.Text;
//    dm1.qPedDetalhes.active := true;
end;

procedure TfPedido.GridPedDetalhesDblClick(Sender: TObject);
begin
          fPedidoProduto.EdPedNum.Text     := EdPedNum.Text ;
          fPedidoProduto.EdAutoIncrem.Text := IntToStr(dm1.qPedDetalhesautoincrem.Value);
          fPedidoProduto.PedidoStatus      := 'cons';
          fPedidoProduto.ShowModal;
end;

procedure TfPedido.GridPedDetalhesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=VK_DELETE then
    begin
          If MessageBox(Handle, 'Confirma retirada do item ???', 'Favor confirmar...', MB_YESNO+MB_SYSTEMMODAL+MB_ICONQUESTION+MB_DEFBUTTON1) = ID_YES Then
          begin
              dm1.qPedDetalhes.Delete;
              RefreshPedido;
          end;
    end;

    if Key=VK_RETURN then
    begin
          fPedidoProduto.EdPedNum.Text     := EdPedNum.Text ;
          fPedidoProduto.PedidoStatus      := 'cons';
          fPedidoProduto.ShowModal;
    end;


end;


procedure TfPedido.RefreshPedido ;
begin
    dm1.qPedDetalhes.active := false;
    dm1.qPedDetalhes.parambyname('XPEDNUM').value := fPedido.EdPedNum.Text;
    dm1.qPedDetalhes.active := true;

    dm1.q1.sql.clear;
    dm1.q1.sql.add('UPDATE Pedido ');
    dm1.q1.sql.add(' SET Ped_Valor = ');
    dm1.q1.sql.add(' (SELECT Sum(pedido_detalhe.vlr_total) ');
    dm1.q1.sql.add(' FROM Pedido_Detalhe ');
    dm1.q1.sql.add('    GROUP BY Pedido_Detalhe.Ped_Num ');
    dm1.q1.sql.add('  HAVING pedido_detalhe.ped_num = Pedido.Ped_Num )  ');
    dm1.q1.sql.add(' WHERE Pedido.Ped_Num = :xPedNum ');
    dm1.q1.parambyname('xPedNum').AsInteger  := StrToInt(EdPedNum.Text) ;
    dm1.q1.ExecSQL ;
    dm1.Connect_TST.Commit;

    if dm1.qListaPedidos.Active = true then dm1.qListaPedidos.Active := false;
    dm1.qListaPedidos.Active   := true;

    fPedido.status_acoes ;

end;


end.
