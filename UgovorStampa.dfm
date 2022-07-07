object frmUgovorStampa: TfrmUgovorStampa
  Left = 2125
  Top = 720
  Caption = #352'tampa ugovora'
  ClientHeight = 194
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMinimized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grdStampaUgovor: TDBGrid
    Left = 40
    Top = 40
    Width = 1201
    Height = 120
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnStampaj: TBitBtn
    Left = 1088
    Top = 520
    Width = 75
    Height = 25
    Caption = 'Stampaj'
    TabOrder = 1
  end
end
