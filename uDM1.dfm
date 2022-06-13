object dm1: Tdm1
  OldCreateOrder = False
  Height = 305
  Width = 607
  object Connect_tst: TFDConnection
    ConnectionName = 'wk_tst'
    Params.Strings = (
      'Database=wk_tst'
      'User_Name=root'
      'Password=vertrigo'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object qListaPedidos: TFDQuery
    Connection = Connect_tst
    SQL.Strings = (
      'SELECT pedido.*, cliente.cli_nome, cliente.cli_cidade'
      
        'FROM cliente INNER JOIN pedido ON cliente.cli_id = pedido.ped_cl' +
        'iid;')
    Left = 112
    Top = 16
    object qListaPedidosped_num: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Pedido'
      FieldName = 'ped_num'
      Origin = 'ped_num'
      Required = True
    end
    object qListaPedidosped_data: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'ped_data'
      Origin = 'ped_data'
      Required = True
    end
    object qListaPedidosped_cliid: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Cod Cliente'
      FieldName = 'ped_cliid'
      Origin = 'ped_cliid'
      Required = True
    end
    object qListaPedidoscli_nome: TStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 30
      FieldName = 'cli_nome'
      Origin = 'cli_nome'
      Required = True
      Size = 100
    end
    object qListaPedidoscli_cidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'cli_cidade'
      Origin = 'cli_cidade'
      Required = True
      Size = 50
    end
    object qListaPedidosped_valor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'ped_valor'
      Origin = 'ped_valor'
      Required = True
    end
  end
  object q1: TFDQuery
    Connection = Connect_tst
    Left = 456
    Top = 16
  end
  object qPedDetalhes: TFDQuery
    Connection = Connect_tst
    SQL.Strings = (
      
        'SELECT pedido_detalhe.autoincrem, pedido_detalhe.ped_num, pedido' +
        '_detalhe.prod_id, produto.prod_descricao, pedido_detalhe.qtd, pe' +
        'dido_detalhe.vlr_unit, pedido_detalhe.vlr_total'
      
        'FROM pedido_detalhe INNER JOIN produto ON pedido_detalhe.prod_id' +
        ' = produto.prod_id'
      'WHERE (((pedido_detalhe.ped_num)=:xPedNum   ))'
      'ORDER BY pedido_detalhe.ped_num, pedido_detalhe.prod_id;')
    Left = 536
    Top = 16
    ParamData = <
      item
        Name = 'XPEDNUM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qPedDetalhesautoincrem: TFDAutoIncField
      FieldName = 'autoincrem'
      Origin = 'autoincrem'
      ProviderFlags = [pfInWhere, pfInKey]
      Visible = False
    end
    object qPedDetalhesped_num: TIntegerField
      FieldName = 'ped_num'
      Origin = 'ped_num'
      Required = True
      Visible = False
    end
    object qPedDetalhesprod_id: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Cod Produto'
      FieldName = 'prod_id'
      Origin = 'prod_id'
      Required = True
    end
    object qPedDetalhesprod_descricao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o Produto'
      DisplayWidth = 30
      FieldName = 'prod_descricao'
      Origin = 'prod_descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qPedDetalhesqtd: TFloatField
      FieldName = 'qtd'
      Origin = 'qtd'
      Required = True
    end
    object qPedDetalhesvlr_unit: TFloatField
      DisplayLabel = '$ Unit'
      FieldName = 'vlr_unit'
      Origin = 'vlr_unit'
      Required = True
    end
    object qPedDetalhesvlr_total: TFloatField
      DisplayLabel = '$ Total do Item'
      FieldName = 'vlr_total'
      Origin = 'vlr_total'
      Required = True
    end
  end
  object qBuscaPedido: TFDQuery
    Connection = Connect_tst
    SQL.Strings = (
      
        'SELECT pedido.ped_num, pedido.ped_data, pedido.ped_cliid, client' +
        'e.cli_nome, pedido.ped_valor'
      
        'FROM cliente INNER JOIN pedido ON cliente.cli_id = pedido.ped_cl' +
        'iid'
      'WHERE pedido.ped_num = :xPedNum ;')
    Left = 208
    Top = 16
    ParamData = <
      item
        Name = 'XPEDNUM'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qBuscaPedidoped_num: TIntegerField
      FieldName = 'ped_num'
      Origin = 'ped_num'
      Required = True
    end
    object qBuscaPedidoped_data: TDateField
      FieldName = 'ped_data'
      Origin = 'ped_data'
      Required = True
    end
    object qBuscaPedidoped_cliid: TIntegerField
      FieldName = 'ped_cliid'
      Origin = 'ped_cliid'
      Required = True
    end
    object qBuscaPedidocli_nome: TStringField
      FieldName = 'cli_nome'
      Origin = 'cli_nome'
      Required = True
      Size = 100
    end
    object qBuscaPedidoped_valor: TFloatField
      FieldName = 'ped_valor'
      Origin = 'ped_valor'
      Required = True
    end
  end
  object qBuscaProduto: TFDQuery
    Connection = Connect_tst
    SQL.Strings = (
      'SELECT *'
      'FROM Produto'
      'where Prod_ID  = :xProdID')
    Left = 368
    Top = 16
    ParamData = <
      item
        Name = 'XPRODID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qBuscaProdutoprod_id: TIntegerField
      FieldName = 'prod_id'
      Origin = 'prod_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qBuscaProdutoprod_descricao: TStringField
      FieldName = 'prod_descricao'
      Origin = 'prod_descricao'
      Required = True
      Size = 100
    end
    object qBuscaProdutoprod_precovenda: TFloatField
      FieldName = 'prod_precovenda'
      Origin = 'prod_precovenda'
      Required = True
    end
  end
  object qBuscaCliente: TFDQuery
    Connection = Connect_tst
    SQL.Strings = (
      'SELECT *'
      'FROM Cliente'
      'where Cli_ID  = :xCliID')
    Left = 288
    Top = 16
    ParamData = <
      item
        Name = 'XCLIID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qBuscaClientecli_id: TIntegerField
      FieldName = 'cli_id'
      Origin = 'cli_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qBuscaClientecli_nome: TStringField
      FieldName = 'cli_nome'
      Origin = 'cli_nome'
      Required = True
      Size = 100
    end
    object qBuscaClientecli_cidade: TStringField
      FieldName = 'cli_cidade'
      Origin = 'cli_cidade'
      Required = True
      Size = 50
    end
    object qBuscaClientecli_UF: TStringField
      FieldName = 'cli_UF'
      Origin = 'cli_UF'
      Required = True
      Size = 2
    end
  end
end
