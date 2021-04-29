object fFirm: TfFirm
  Left = 0
  Top = 0
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1080
  ClientHeight = 268
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object leName: TLabeledEdit
    Left = 40
    Top = 40
    Width = 201
    Height = 21
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    MaxLength = 50
    TabOrder = 0
    OnChange = leNameChange
  end
  object leAddress: TLabeledEdit
    Left = 40
    Top = 88
    Width = 313
    Height = 21
    EditLabel.Width = 31
    EditLabel.Height = 13
    EditLabel.Caption = #1040#1076#1088#1077#1089
    MaxLength = 200
    TabOrder = 1
    OnChange = leNameChange
  end
  object leINN: TLabeledEdit
    Left = 40
    Top = 136
    Width = 201
    Height = 21
    EditLabel.Width = 21
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1053#1053
    MaxLength = 10
    NumbersOnly = True
    TabOrder = 2
    OnChange = leNameChange
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 192
    Width = 75
    Height = 25
    Caption = #1044#1072
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 166
    Top = 192
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
end
