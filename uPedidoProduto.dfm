object fPedidoProduto: TfPedidoProduto
  Left = 0
  Top = 0
  Caption = 'fPedidoProduto'
  ClientHeight = 201
  ClientWidth = 619
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
  object LabChave: TLabel
    Left = 65
    Top = 52
    Width = 38
    Height = 13
    Caption = 'Chave :'
  end
  object Label2: TLabel
    Left = 44
    Top = 76
    Width = 59
    Height = 13
    Caption = 'Pedido n'#250'm:'
  end
  object Label3: TLabel
    Left = 39
    Top = 100
    Width = 64
    Height = 13
    Caption = 'C'#243'd Produto:'
  end
  object Label4: TLabel
    Left = 43
    Top = 124
    Width = 60
    Height = 13
    Caption = 'Quantidade:'
  end
  object Label5: TLabel
    Left = 53
    Top = 148
    Width = 50
    Height = 13
    Caption = '$ Unit'#225'rio:'
  end
  object Label6: TLabel
    Left = 63
    Top = 172
    Width = 40
    Height = 13
    Caption = '$ Total :'
  end
  object EdAutoIncrem: TEdit
    Left = 109
    Top = 49
    Width = 92
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object EdPedNum: TEdit
    Left = 109
    Top = 73
    Width = 92
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object EdProdID: TEdit
    Left = 109
    Top = 97
    Width = 92
    Height = 21
    TabOrder = 2
    OnKeyDown = EdProdIDKeyDown
  end
  object EdQTD: TEdit
    Left = 109
    Top = 121
    Width = 92
    Height = 21
    TabOrder = 3
    OnKeyDown = EdQTDKeyDown
  end
  object EdVlrUnit: TEdit
    Left = 109
    Top = 145
    Width = 92
    Height = 21
    TabOrder = 4
    OnKeyDown = EdVlrUnitKeyDown
  end
  object EdVlrTotal: TEdit
    Left = 109
    Top = 169
    Width = 92
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 5
  end
  object btn1: TButton
    Left = 109
    Top = 8
    Width = 108
    Height = 25
    Caption = 'Confirma Inclus'#227'o'
    TabOrder = 6
    OnClick = btn1Click
  end
  object EdDescrProduto: TEdit
    Left = 207
    Top = 97
    Width = 350
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 7
  end
end
