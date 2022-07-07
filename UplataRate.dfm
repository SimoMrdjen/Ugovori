object frmUplataRate: TfrmUplataRate
  Left = 2186
  Top = 181
  Caption = 'Uplata rate'
  ClientHeight = 426
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 148
    Top = 229
    Width = 72
    Height = 16
    Alignment = taRightJustify
    Caption = 'Vrsta pla'#263'anja:'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Impact'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lblIznosRate: TLabel
    Left = 103
    Top = 134
    Width = 117
    Height = 17
    Alignment = taRightJustify
    Caption = 'Iznos rate po ugovoru'
    Color = clGradientActiveCaption
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Impact'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblkupac: TLabel
    Left = 56
    Top = 40
    Width = 37
    Height = 18
    Alignment = taCenter
    Caption = 'Kupac'
    Color = clActiveCaption
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 176
    Top = 189
    Width = 44
    Height = 16
    Caption = 'Placanje:'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Impact'
    Font.Style = []
    ParentFont = False
  end
  object edtUplata: TEdit
    Left = 232
    Top = 176
    Width = 169
    Height = 27
    Alignment = taRightJustify
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnSnimiUplatu: TBitBtn
    Left = 448
    Top = 312
    Width = 265
    Height = 57
    Caption = 'Snimi uplatu'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Impact'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnSnimiUplatuClick
  end
  object dtDatumRate: TDateTimePicker
    Left = 464
    Top = 185
    Width = 186
    Height = 21
    Date = 44715.594031828700000000
    Time = 44715.594031828700000000
    TabOrder = 2
  end
  object cmbVrstaPlacanja: TComboBox
    Left = 232
    Top = 228
    Width = 169
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Items.Strings = (
      'GOTOVINA'
      'KARTICA'
      'RACUN')
  end
  object edtIznosRAteIzUgovora: TEdit
    Left = 232
    Top = 121
    Width = 161
    Height = 21
    Enabled = False
    TabOrder = 4
    Text = 'edtIznosRAteIzUgovora'
  end
end
