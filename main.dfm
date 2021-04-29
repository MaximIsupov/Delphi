object fMain: TfMain
  Left = 0
  Top = 0
  Caption = #1043#1083#1072#1074#1085#1086#1077' '#1086#1082#1085#1086
  ClientHeight = 691
  ClientWidth = 1021
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 1021
    Height = 691
    Align = alClient
    TabOrder = 0
    Tabs.Strings = (
      #1055#1088#1080#1093#1086#1076#1085#1099#1077
      #1056#1072#1089#1093#1086#1076#1085#1099#1077)
    TabIndex = 0
    OnChange = TabControl1Change
    object DBGrid2: TDBGrid
      Left = 4
      Top = 297
      Width = 1013
      Height = 390
      Align = alClient
      DataSource = dsInfo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBGrid1: TDBGrid
      Left = 4
      Top = 24
      Width = 1013
      Height = 273
      Align = alTop
      DataSource = dsFutura
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object MainMenu1: TMainMenu
    Left = 640
    Top = 224
    object N1: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object N3: TMenuItem
        Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1055#1088#1086#1076#1091#1082#1094#1080#1103
        OnClick = N4Click
      end
    end
    object N2: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N2Click
    end
  end
  object dsFutura: TDataSource
    Left = 456
    Top = 96
  end
  object dsInfo: TDataSource
    Left = 472
    Top = 464
  end
end
