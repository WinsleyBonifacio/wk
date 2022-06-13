unit uPedidoProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDM1;

type
  TfPedidoProduto = class(TForm)
    EdAutoIncrem: TEdit;
    EdPedNum: TEdit;
    EdProdID: TEdit;
    EdQTD: TEdit;
    EdVlrUnit: TEdit;
    EdVlrTotal: TEdit;
    LabChave: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btn1: TButton;
    EdDescrProduto: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EdQTDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdVlrUnitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure status_acoes;
    procedure EdProdIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
         PedidoStatus : string ; //add, cons, up, del, ...
  end;

var
  fPedidoProduto: TfPedidoProduto;

implementation

{$R *.dfm}

uses uPedido;

procedure TfPedidoProduto.btn1Click(Sender: TObject);
begin

  if (PedidoStatus = 'add') and (btn1.Caption = 'Confirma Inclusão') then
  begin
    dm1.q1.sql.clear;
    dm1.q1.sql.add('insert into Pedido_Detalhe (Ped_Num,   Prod_ID,  qtd,    Vlr_Unit,    Vlr_Total) ');
    dm1.q1.sql.add('         values           (:xPedNum, :xProd_ID, :xQTD, :xValorUnit, :xValorTotal) ');
    dm1.q1.parambyname('xPedNum').value     := StrToInt(EdPedNum.Text) ;
    dm1.q1.parambyname('xProd_ID').value    := StrToInt(EdProdID.Text);
    dm1.q1.parambyname('xQTD').value        := StrToFloat(EdQTD.Text);
    dm1.q1.parambyname('xValorUnit').value  := StrToFloat(EdVlrUnit.Text);
    dm1.q1.parambyname('xValorTotal').value := StrToFloat(EdVlrUnit.Text)*StrToFloat(EdQTD.Text)  ;
    dm1.q1.ExecSQL ;
    dm1.Connect_TST.Commit;
    fPedido.PedidoStatus      := 'cons';
    fPedido.RefreshPedido;
    close;
  end;

  if  (PedidoStatus = 'up') and  (btn1.Caption = 'Confirma Alteração') then
  begin
    dm1.q1.sql.clear;
    dm1.q1.sql.add('update Pedido_Detalhe set ');
    dm1.q1.sql.add(' Prod_ID   = :xProd_ID, ');
    dm1.q1.sql.add(' QTD       = :xQTD, ');
    dm1.q1.sql.add(' Vlr_Unit  = :xValorUnit, ');
    dm1.q1.sql.add(' Vlr_Total = :xValorTotal ');
    dm1.q1.sql.add(' where autoincrem = :xAutoIncrem ');
    dm1.q1.parambyname('xAutoIncrem').value := StrToInt(EdAutoIncrem.Text) ;
    dm1.q1.parambyname('xProd_ID').value    := StrToInt(EdProdID.Text);
    dm1.q1.parambyname('xQTD').value        := StrToFloat(EdQTD.Text);
    dm1.q1.parambyname('xValorUnit').value  := StrToFloat(EdVlrUnit.Text);
    dm1.q1.parambyname('xValorTotal').value := StrToFloat(EdVlrUnit.Text)*StrToFloat(EdQTD.Text)  ;
    dm1.q1.ExecSQL ;
    dm1.Connect_TST.Commit;
    fPedido.PedidoStatus      := 'cons';
    fPedido.RefreshPedido;
    close;
  end;

  if (PedidoStatus = 'cons')  and (btn1.Caption = 'Alterar') then
  begin
    PedidoStatus := 'up';
    status_acoes;
  end;

end;


procedure TfPedidoProduto.EdProdIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
  begin
      if (EdProdID.Text = '')  then
      begin
         showmessage('Informe o Código do Produto!');
         exit;
      end;

      if dm1.qbuscaProduto.Active = true then dm1.qbuscaProduto.Active := false ;
      dm1.qbuscaProduto.ParamByName('XPRODID').Value := StrToInt(EdProdID.Text) ;
      dm1.qbuscaProduto.Active := true;

      if (dm1.qbuscaProduto.RecordCount = 0) then
      begin
         showmessage('Produto não cadastrado! Código de Produto "'+EdProdID.Text+'" inválido!' );
         EdProdID.Text := '' ;
      end else
      begin
        EdDescrProduto.Text := dm1.qBuscaProdutoprod_descricao.Value;
        EdVlrUnit.Text      := FloatToStr(dm1.qBuscaProdutoprod_precovenda.Value);
        if (EdQTD.Text <> '') and (EdQTD.Text <> '0') and (EdQTD.Text <> null)  then EdVlrTotal.Text := FloatToStr(StrToFloat(EdQTD.Text) * StrToFloat(EdVlrUnit.Text)) ;
        perform(wm_nextdlgctl,0,0);
      end;

  end;

  if key=38 then perform(wm_nextdlgctl,1,0);
end;

procedure TfPedidoProduto.EdQTDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then perform(wm_nextdlgctl,0,0);
  if key=38 then perform(wm_nextdlgctl,1,0);
end;

procedure TfPedidoProduto.EdVlrUnitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
  begin
     EdVlrTotal.Text := FloatToStr(StrToFloat(EdQTD.Text) * StrToFloat(EdVlrUnit.Text)) ;
     perform(wm_nextdlgctl,0,0);
  end;

  if key=38 then perform(wm_nextdlgctl,1,0);
end;

procedure TfPedidoProduto.FormActivate(Sender: TObject);
begin
     EdPedNum.Text := fPedido.EdPedNum.Text ;
     status_acoes;
end;


procedure TfPedidoProduto.status_acoes;
begin
    if (PedidoStatus = 'cons') or (PedidoStatus = 'up')  then
    begin
      if length(EdPedNum.Text) >=1 then
      begin
         if dm1.qBuscaPedido.active = true then dm1.qBuscaPedido.active := false ;
         dm1.qBuscaPedido.parambyname('xPedNum').value := StrToInt(EdPedNum.Text);
         dm1.qBuscaPedido.active := true ;
      end;
      EdProdID.text        := IntToStr(dm1.qPedDetalhesprod_id.value);
      EdQTD.text           := FloatToStr(dm1.qPedDetalhesqtd.value);
      EdVlrUnit.text       := FloatToStr(dm1.qPedDetalhesvlr_unit.value);
      EdVlrTotal.text      := FloatToStr(dm1.qPedDetalhesvlr_total.Value);
    end;

    if (PedidoStatus = 'cons')  then
    begin
      btn1.Caption := 'Alterar';
      EdPedNum.enabled     := false;
      EdProdID.enabled     := false;
      EdQTD.enabled        := false;
      EdVlrUnit.enabled    := false;
      EdVlrTotal.enabled   := false;
    end;

    if (PedidoStatus = 'up')  then
    begin
      btn1.Caption := 'Confirma Alteração';
      EdPedNum.enabled     := false;
      EdProdID.enabled     := true;
      EdQTD.enabled        := true;
      EdVlrUnit.enabled    := true;
      EdVlrTotal.enabled   := false;
    end;

    if (PedidoStatus = 'add') then
    begin
      btn1.Caption         := 'Confirma Inclusão';

      EdAutoIncrem.text    := '';
      EdProdID.text        := '';
      EdQTD.text           := '';
      EdVlrUnit.text       := '';
      EdVlrTotal.text      := '';


      EdPedNum.enabled     := false;
      EdProdID.enabled     := true;
      EdQTD.enabled        := true;
      EdVlrUnit.enabled    := true;
      EdVlrTotal.enabled   := false;
    end;

end;

end.
