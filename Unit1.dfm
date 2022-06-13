object Form1: TForm1
  AlignWithMargins = True
  Left = 0
  Top = 0
  Caption = 'Teste WK + Winsley - Pedidos'
  ClientHeight = 297
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    665
    297)
  PixelsPerInch = 96
  TextHeight = 13
  object pedido_add: TSpeedButton
    Left = 72
    Top = 8
    Width = 23
    Height = 22
    Caption = '+'
    OnClick = pedido_addClick
  end
  object GridPedidos: TDBGrid
    Left = 8
    Top = 36
    Width = 649
    Height = 253
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsListaPedidos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GridPedidosDblClick
  end
  object dsListaPedidos: TDataSource
    DataSet = dm1.qListaPedidos
    Left = 352
    Top = 24
  end
end
