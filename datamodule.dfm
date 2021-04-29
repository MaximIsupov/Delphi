object dm: Tdm
  OldCreateOrder = False
  Height = 585
  Width = 943
  object IBTransaction1: TIBTransaction
    Left = 144
    Top = 40
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'E:\bd_is\DB1.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 72
    Top = 40
  end
  object tFirm: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'FIRM'
    UniDirectional = False
    Left = 72
    Top = 104
    object tFirmID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'ID'
    end
    object tFirmNAME: TIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 50
    end
    object tFirmINN: TIBStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 10
    end
    object tFirmADDRESS: TIBStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADDRESS'
      Size = 200
    end
  end
  object spFirmNew: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'FIRM_NEW'
    Left = 72
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftWideString
        Name = 'IN_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'IN_ADRESS'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'IN_INN'
        ParamType = ptInput
      end>
  end
  object spFirmEdit: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'FIRM_EDIT'
    Left = 72
    Top = 232
  end
  object spFirmDelete: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'FIRM_DELETE'
    Left = 72
    Top = 304
  end
  object tProducts: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PRODUCTS'
    UniDirectional = False
    Left = 144
    Top = 104
  end
  object spProductsNew: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'PRODUCTS_NEW'
    Left = 144
    Top = 168
  end
  object spProductsEdit: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'PRODUCTS_EDIT'
    Left = 144
    Top = 240
  end
  object spProductsDelete: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'PRODUCTS_DELETE'
    Left = 152
    Top = 304
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read')
    Left = 456
    Top = 40
  end
  object qFutura: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 456
    Top = 104
  end
end
