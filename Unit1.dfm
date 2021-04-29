object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 280
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 31
    Top = 40
    Width = 60
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object Label2: TLabel
    Left = 65
    Top = 69
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object eQuantity: TEdit
    Left = 112
    Top = 37
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'eQuantity'
    OnChange = eQuantityChange
    OnKeyPress = eQuantityKeyPress
  end
  object ePrice: TEdit
    Left = 112
    Top = 66
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'ePrice'
    OnChange = ePriceChange
    OnKeyPress = eQuantityKeyPress
  end
  object leSum: TLabeledEdit
    Left = 112
    Top = 112
    Width = 121
    Height = 21
    EditLabel.Width = 31
    EditLabel.Height = 13
    EditLabel.Caption = #1057#1091#1084#1084#1072
    LabelPosition = lpLeft
    LabelSpacing = 15
    TabOrder = 2
    OnChange = leSumChange
    OnKeyPress = eQuantityKeyPress
  end
  object btnOk: TBitBtn
    Left = 31
    Top = 176
    Width = 75
    Height = 25
    Caption = #1044#1072
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 158
    Top = 176
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
end
