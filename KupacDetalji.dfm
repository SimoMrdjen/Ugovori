object frmNoviKupac: TfrmNoviKupac
  Left = 2191
  Top = 165
  Caption = 'Novi Kupac - Izmena podataka'
  ClientHeight = 546
  ClientWidth = 788
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
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 745
    Height = 417
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 56
      Height = 19
      Caption = 'Prezime'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 71
      Width = 28
      Height = 19
      Caption = 'Ime'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 122
      Width = 39
      Height = 19
      Caption = 'JMBG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 170
      Width = 51
      Height = 19
      Caption = 'Broj LK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 216
      Width = 20
      Height = 19
      Caption = 'PU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 24
      Top = 263
      Width = 49
      Height = 19
      Caption = 'Adresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 20
      Top = 312
      Width = 53
      Height = 19
      Caption = 'Telefon'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 24
      Top = 360
      Width = 39
      Height = 19
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 400
      Top = 355
      Width = 15
      Height = 19
      Caption = '@'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtBrojLK: TEdit
      Left = 176
      Top = 163
      Width = 209
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtPU: TEdit
      Left = 176
      Top = 209
      Width = 209
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtAdresa: TEdit
      Left = 176
      Top = 256
      Width = 545
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtTelefon: TEdit
      Left = 176
      Top = 305
      Width = 209
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtPrezime: TEdit
      Left = 176
      Top = 16
      Width = 209
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtIme: TEdit
      Left = 176
      Top = 64
      Width = 209
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtEmail: TEdit
      Left = 176
      Top = 353
      Width = 218
      Height = 26
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edtJMBG: TEdit
      Left = 176
      Top = 120
      Width = 209
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object edtGmail: TEdit
      Left = 421
      Top = 353
      Width = 89
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Text = 'gmail.com'
    end
    object edtGrad: TEdit
      Left = 472
      Top = 112
      Width = 121
      Height = 21
      ParentCustomHint = False
      TabOrder = 9
      Text = 'edtGrad'
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 32
    Top = 431
    Width = 713
    Height = 123
    TabOrder = 1
    object btnSnimi: TBitBtn
      Left = 16
      Top = 8
      Width = 265
      Height = 65
      Caption = 'Snimi'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSnimiClick
    end
    object btnOdustani: TBitBtn
      Left = 400
      Top = 8
      Width = 73
      Height = 65
      Caption = 'Odustani'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = btnOdustaniClick
    end
    object BitBtn1: TBitBtn
      Left = 536
      Top = 8
      Width = 145
      Height = 65
      Caption = 'Vrati na formu za izbor kupca'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      WordWrap = True
      OnClick = BitBtn1Click
    end
  end
end
