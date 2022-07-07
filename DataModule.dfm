object DM: TDM
  OldCreateOrder = False
  Left = 2230
  Top = 91
  Height = 242
  Width = 550
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=ugovori_aplikacija'
      'User_Name=root'
      'Password=dr.dirlija'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    Left = 368
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'libmysql.dll'
    Left = 456
    Top = 16
  end
  object fdqSelect: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 392
    Top = 128
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 88
    Top = 72
  end
end
