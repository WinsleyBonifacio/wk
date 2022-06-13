object fPedido: TfPedido
  Left = 0
  Top = 0
  Caption = 'fPedido'
  ClientHeight = 384
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 52
    Top = 40
    Width = 60
    Height = 13
    Caption = 'N'#250'm Pedido:'
  end
  object Label2: TLabel
    Left = 85
    Top = 66
    Width = 27
    Height = 13
    Caption = 'Data:'
  end
  object Label3: TLabel
    Left = 53
    Top = 95
    Width = 59
    Height = 13
    Caption = 'C'#243'd Cliente:'
  end
  object Label4: TLabel
    Left = 60
    Top = 121
    Width = 55
    Height = 13
    Caption = 'Valor Total:'
  end
  object EdPedNum: TEdit
    Left = 116
    Top = 37
    Width = 109
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object EdPedData: TEdit
    Left = 116
    Top = 64
    Width = 109
    Height = 21
    TabOrder = 1
    OnKeyDown = EdPedDataKeyDown
  end
  object EdPedCliId: TEdit
    Left = 116
    Top = 91
    Width = 109
    Height = 21
    TabOrder = 2
    OnKeyDown = EdPedCliIdKeyDown
  end
  object EdValorTotal: TEdit
    Left = 116
    Top = 118
    Width = 109
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 4
  end
  object GridPedDetalhes: TDBGrid
    Left = 49
    Top = 176
    Width = 712
    Height = 200
    TabStop = False
    DataSource = dsPedDetalhes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnDblClick = GridPedDetalhesDblClick
    OnKeyDown = GridPedDetalhesKeyDown
  end
  object btnAddProd: TBitBtn
    Left = 8
    Top = 176
    Width = 35
    Height = 35
    Hint = 'Cadastra novo artigo e inclui nesta opera'#231#227'o'
    Glyph.Data = {
      D60B0000424DD60B00000000000036000000280000001F0000001F0000000100
      180000000000A00B000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D0CD8C7971AEA19CFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DCDA8A776FA99C96FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D758F7D758F7D758F7D75FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D758F7D758F7D758F
      7D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF94837B8F7D758F7D75FFFFFF94837B8F7D758F7D
      75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9989818F7D758F7D75FFFFFFA99C968F
      7D758F7D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D75FFFFFFFFFFFFFFFFFF8F7D758F7D
      75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D75FFFFFFFFFFFFFFFFFF8F
      7D758F7D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D75FFFFFFFFFFFFFFFFFF8F7D758F7D
      75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D75FFFFFFFFFFFFFFFFFF8F
      7D758F7D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFEBE8E78F7D758F7D758C7A718F7D758F7D758F7D
      758C7A718C7A718C7A718C7A718C7A718F7D758F7D758F7D758C7A718F7D758F
      7D758F7D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C7A718F7D758F7D758F7D758F7D758F7D
      758F7D758F7D758F7D758F7D758F7D758F7D758F7D758F7D758F7D758F7D758F
      7D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94837B8F7D758F7D75F4F2F1F4F2F1F4F2
      F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F18F7D758F7D758F
      7D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D75F4F2F1F4F2F1F4F2F1F4F2
      F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F18F7D758F
      7D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D75F4F2F1F4F2F1F4F2F1F4F2
      F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F18F7D758F
      7D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D75F4F2F1F4F2F1F4F2F1F4F2
      F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1DCD7D58F7D758F
      7D758C7A71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D75F4F2F1F4F2F1F4F2F1F4F2
      F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1A99C968F7D758F7D758F7D758F
      7D758F7D758F7D758F7D75FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFEBE8E78F7D75907E76F4F2F1F4F2F1F4F2F1F4F2
      F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F1CEC6C38F7D758F7D758C7A71FFFFFFFF
      FFFFFFFFFF8F7D758F7D758F7D75FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF9989818F7D75E7E3E1F4F2F1F4F2F1F4F2F1F4F2
      F1F4F2F1F4F2F1F4F2F1F4F2F1F4F2F18F7D758F7D75FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFE7E3E18F7D758F7D75FFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D75F4F2F1F4F2F1F4F2F1F4F2F1F4F2
      F1F4F2F1F4F2F1F4F2F1F4F2F18F7D758F7D75E7E3E1FFFFFFFFFFFFDEF3D298
      DB74FFFFFFFFFFFFFFFFFF8F7D758F7D75B9AFAAFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D75F4F2F1F4F2F1F4F2F1F4F2F1F4F2
      F1F4F2F1F4F2F1F4F2F1F4F2F18F7D758F7D75FFFFFFFFFFFFFFFFFFADE29098
      DB74E6F6DEFFFFFFFFFFFFFFFFFF8F7D758F7D75FFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D75F4F2F1F4F2F1F4F2F1F4F2F1F4F2
      F1F4F2F1F4F2F1F4F2F1F4F2F18F7D758F7D75FFFFFFD1EFC398DB7498DB7498
      DB7498DB7498DB74FFFFFFFFFFFF8F7D758F7D75FFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D75F4F2F1F4F2F1F4F2F1F4F2F1F4F2
      F1F4F2F1F4F2F1F4F2F1F4F2F18F7D758F7D75FFFFFFFFFFFF98DB7498DB7498
      DB7498DB7498DB74FFFFFFFFFFFF8F7D758F7D75FFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D758C79718C79718C79718C79718C79
      718C79718C79718C79718C79718F7D758F7D75FFFFFFFFFFFFFFFFFFADE29098
      DB74E6F6DEFFFFFFFFFFFFF8F7F68F7D758F7D75FFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF9D8E878F7D758F7D758F7D758F7D758F7D758F7D758F7D
      758F7D758F7D758F7D758F7D758F7D758F7D758F7D75FFFFFFFFFFFFFFFFFF98
      DB74FFFFFFFFFFFFFFFFFF8F7D758F7D75F4F2F1FFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF8F7D758F7D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D7594837BFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF8F7D758F7D758F7D75FFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF8F7D758F7D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D758F7D758C7A719D
      8E878F7D758F7D758F7D758F7D75FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF8F7D758F7D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7D758F7D758F7D758F
      7D758F7D758F7D758F7D75FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFF0EEED8F7D758F7D75F0EEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1
      DCDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000008F7D758F7D75
      8F7D758F7D758F7D758C7A71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000AEA19C8C7971
      8C79718C7971FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Visible = False
    OnClick = btnAddProdClick
  end
  object EdPedidocliNome: TEdit
    Left = 231
    Top = 91
    Width = 370
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 3
  end
  object btn1: TButton
    Left = 116
    Top = 4
    Width = 109
    Height = 25
    Caption = 'Salvar'
    TabOrder = 5
    OnClick = btn1Click
  end
  object dsPedDetalhes: TDataSource
    DataSet = dm1.qPedDetalhes
    Left = 144
    Top = 216
  end
end