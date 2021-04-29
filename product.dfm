object fProduct: TfProduct
  Left = 0
  Top = 0
  Caption = 'fProduct'
  ClientHeight = 270
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object leName: TLabeledEdit
    Left = 56
    Top = 40
    Width = 217
    Height = 21
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    TabOrder = 0
    OnChange = leNameChange
  end
  object leUnit: TLabeledEdit
    Left = 56
    Top = 96
    Width = 217
    Height = 21
    EditLabel.Width = 99
    EditLabel.Height = 13
    EditLabel.Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
    TabOrder = 1
    OnChange = leUnitChange
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 184
    Width = 75
    Height = 25
    Caption = #1044#1072
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 198
    Top = 184
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object leVat: TLabeledEdit
    Left = 56
    Top = 144
    Width = 217
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1044#1057
    TabOrder = 4
    OnChange = leNameChange
  end
end
