object frmUgovorDetalji: TfrmUgovorDetalji
  Left = 1976
  Top = 122
  Caption = 'Novi ugovor'
  ClientHeight = 589
  ClientWidth = 1194
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
    Left = 0
    Top = 0
    Width = 1177
    Height = 89
    TabOrder = 0
    object Label1: TLabel
      Left = 672
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Broj LK'
    end
    object Label15: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Prezime'
    end
    object Label2: TLabel
      Left = 504
      Top = 8
      Width = 26
      Height = 13
      Caption = 'JMBG'
    end
    object Label3: TLabel
      Left = 272
      Top = 8
      Width = 18
      Height = 13
      Caption = 'Ime'
    end
    object Label6: TLabel
      Left = 792
      Top = 8
      Width = 79
      Height = 13
      Caption = 'LK izdata kod PU'
    end
    object Label7: TLabel
      Left = 36
      Top = 54
      Width = 34
      Height = 13
      Caption = 'Adresa'
    end
    object edtJMBG: TEdit
      Left = 536
      Top = 3
      Width = 115
      Height = 24
      Color = clBtnHighlight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '1234567890123'
    end
    object edtIme: TEdit
      Left = 296
      Top = 3
      Width = 191
      Height = 24
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = 'Edit1'
    end
    object edtPrezime: TEdit
      Left = 61
      Top = 3
      Width = 188
      Height = 24
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Text = 'e'
    end
    object edtAdresa: TEdit
      Left = 88
      Top = 46
      Width = 1049
      Height = 24
      Color = clBtnHighlight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = 'Edit1'
    end
    object edtGrad: TEdit
      Left = 8
      Top = 49
      Width = 9
      Height = 24
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Text = 'Edit1'
      Visible = False
    end
    object edtPU: TEdit
      Left = 877
      Top = 5
      Width = 260
      Height = 24
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Text = 'Edit1'
    end
    object edtBrojLK: TEdit
      Left = 711
      Top = 3
      Width = 66
      Height = 24
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Text = 'Edit1'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 478
    Width = 1169
    Height = 73
    TabOrder = 1
    object btnSnimiUgovor: TBitBtn
      Left = 711
      Top = 0
      Width = 160
      Height = 65
      Caption = 'Snimi ugovor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnSnimiUgovorClick
    end
    object btnStampaj: TBitBtn
      Left = 896
      Top = 0
      Width = 171
      Height = 65
      Caption = 'Stampaj'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = btnStampajClick
    end
    object btnExit: TBitBtn
      Left = 196
      Top = 0
      Width = 133
      Height = 65
      Caption = 'Vrati na formu za izbor kupca'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      WordWrap = True
      OnClick = btnExitClick
    end
  end
  object Panel4: TPanel
    Left = 8
    Top = 359
    Width = 1168
    Height = 113
    Caption = 'Panel4'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 0
      Top = 7
      Width = 1137
      Height = 74
      DataSource = dtsUgovorZaStampu
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 95
    Width = 1181
    Height = 170
    TabOrder = 3
    object Label4: TLabel
      Left = 942
      Top = 20
      Width = 74
      Height = 13
      Caption = 'Datum ugovora'
    end
    object Label8: TLabel
      Left = 12
      Top = 25
      Width = 33
      Height = 13
      Caption = '1. rata'
    end
    object Label9: TLabel
      Left = 12
      Top = 74
      Width = 33
      Height = 13
      Caption = '2. rata'
    end
    object Label11: TLabel
      Left = 12
      Top = 118
      Width = 33
      Height = 13
      Caption = '3. rata'
    end
    object Label14: TLabel
      Left = 556
      Top = 82
      Width = 63
      Height = 16
      Caption = 'Iznos u'#269'e'#353#263'a'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 552
      Top = 27
      Width = 67
      Height = 16
      Caption = 'Iznos ugovora'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
    end
    object edtIznos1Rata: TEdit
      Left = 273
      Top = 17
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clWhite
      Enabled = False
      TabOrder = 0
      Text = '0.00'
    end
    object edtIznosUgovora: TEdit
      Left = 625
      Top = 22
      Width = 121
      Height = 26
      Alignment = taRightJustify
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnExit = edtIznosUgovoraExit
    end
    object edtIznosUcesca: TEdit
      Left = 625
      Top = 75
      Width = 121
      Height = 26
      Alignment = taRightJustify
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnChange = edtIznosUcescaChange
    end
    object dateUgovor: TDateTimePicker
      Left = 942
      Top = 64
      Width = 186
      Height = 21
      Date = 44699.469430752320000000
      Time = 44699.469430752320000000
      Color = clYellow
      TabOrder = 3
    end
    object date1Rata: TDateTimePicker
      Left = 51
      Top = 19
      Width = 186
      Height = 21
      Date = 44699.469430752320000000
      Time = 44699.469430752320000000
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnChange = date1RataChange
    end
    object date2Rata: TDateTimePicker
      Left = 51
      Top = 64
      Width = 186
      Height = 21
      Date = 44699.469430752320000000
      Time = 44699.469430752320000000
      Enabled = False
      TabOrder = 5
    end
    object date3Rata: TDateTimePicker
      Left = 51
      Top = 110
      Width = 186
      Height = 21
      Date = 44699.469430752320000000
      Time = 44699.469430752320000000
      Enabled = False
      TabOrder = 6
    end
    object edtIznos2Rata: TEdit
      Left = 273
      Top = 64
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clWhite
      Enabled = False
      TabOrder = 7
      Text = '0.00'
    end
    object edtIznos3Rata: TEdit
      Left = 273
      Top = 107
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clBtnHighlight
      Enabled = False
      TabOrder = 8
      Text = '0.00'
    end
  end
  object Panel5: TPanel
    Left = 10
    Top = 271
    Width = 1176
    Height = 89
    TabOrder = 4
    object lblSnimljenUgovorPoruka: TLabel
      Left = 416
      Top = 41
      Width = 346
      Height = 41
      Caption = 'lblSnimljenUgovorPoruka'
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
  end
  object dtsUgovorZaStampu: TDataSource
    Left = 828
    Top = 144
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 1124
    Top = 109
  end
  object kbmFromForma: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'IznosUgovora'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IznosUcesca'
        DataType = ftCurrency
      end
      item
        Name = '1rata'
        DataType = ftCurrency
      end
      item
        Name = '2rata'
        DataType = ftCurrency
      end
      item
        Name = '3rata'
        DataType = ftCurrency
      end
      item
        Name = 'Datum1'
        DataType = ftDate
      end
      item
        Name = 'Datum2'
        DataType = ftDate
      end
      item
        Name = 'Datum3'
        DataType = ftDate
      end
      item
        Name = 'BrojUgovora'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ImePrezime'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'JMBG'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LK'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Adresa'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '7.73.00 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 808
    Top = 232
    object kbmFromFormaIznosUgovora: TStringField
      FieldName = 'IznosUgovora'
    end
    object kbmFromFormaIznosUcesca: TCurrencyField
      FieldName = 'IznosUcesca'
    end
    object kbmFromFormaField1rata: TCurrencyField
      FieldName = '1rata'
    end
    object kbmFromFormaField2rata: TCurrencyField
      FieldName = '2rata'
    end
    object kbmFromFormaField3rata: TCurrencyField
      FieldName = '3rata'
    end
    object kbmFromFormaDatum1: TDateField
      FieldKind = fkCalculated
      FieldName = 'Datum1'
      Calculated = True
    end
    object kbmFromFormaDatum2: TDateField
      FieldName = 'Datum2'
    end
    object kbmFromFormaDatum3: TDateField
      FieldName = 'Datum3'
    end
    object kbmFromFormaBrojUgovora: TStringField
      FieldKind = fkCalculated
      FieldName = 'BrojUgovora'
      Calculated = True
    end
    object kbmFromFormaImePrezime: TStringField
      FieldName = 'ImePrezime'
    end
    object kbmFromFormaJMBG: TStringField
      FieldName = 'JMBG'
    end
    object kbmFromFormaLK: TStringField
      FieldName = 'LK'
    end
    object kbmFromFormaAdresa: TStringField
      FieldName = 'Adresa'
    end
  end
  object frxReport1: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44722.447108842600000000
    ReportOptions.LastChange = 44722.447108842600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 978
    Top = 295
    Datasets = <>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'ID'
        Value = ''
      end
      item
        Name = 'KUPAC'
        Value = ''
      end
      item
        Name = 'IZNOS'
        Value = ''
      end
      item
        Name = 'UCESCE'
        Value = ''
      end
      item
        Name = 'RATA'
        Value = ''
      end
      item
        Name = 'DATUM_1_RATE'
        Value = ''
      end
      item
        Name = 'DATUM_2_RATE'
        Value = ''
      end
      item
        Name = 'DATUM_3_RATE'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Left = 45.354360000000000000
          Top = 37.795300000000000000
          Width = 393.071120000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'UGOVOR O PRODAJI ROBE NA RATE br: '#9#9#9#9#9#9#9)
          ParentFont = False
          VAlign = vaCenter
        end
        object ID: TfrxMemoView
          Left = 464.882190000000000000
          Top = 26.456710000000000000
          Width = 79.370130000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[ID]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 857.953310000000000000
        Top = 154.960730000000000000
        Width = 740.409927000000000000
        RowCount = 1
        object Memo39: TfrxMemoView
          Left = 11.338590000000000000
          Top = 778.583180000000000000
          Width = 245.669450000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13421772
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'potpis')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 79.370130000000000000
          Top = 755.906000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'KUPAC')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo41: TfrxMemoView
          Left = 468.661720000000000000
          Top = 778.583180000000000000
          Width = 245.669450000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13421772
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'potpis')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 544.252320000000000000
          Top = 755.906000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'PRODAVAC')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 725.669760000000000000
          Height = 52.913420000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          LineSpacing = 4.000000000000000000
          Memo.UTF8W = (
            '  Ugovorne strane:'
            
              '1. STR DUO ZRENJANIN MARIJA MR'#272'EN PR, ul. Gimnazijska 17, Zrenja' +
              'nin, PIB: 100907791, mbr. 54406177  koju zastupa Marija      Mr'#273 +
              'en, u daljem tekstu: PRODAVAC i'
            ''
            #9#9#9#9#9#9#9#9
            '')
          ParentFont = False
        end
        object KUPAC: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 725.669760000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          LineSpacing = 4.000000000000000000
          Memo.UTF8W = (
            '[KUPAC]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 105.826840000000000000
          Width = 725.669760000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          LineSpacing = 4.000000000000000000
          Memo.UTF8W = (
            #268'l.1'
            
              'PRODAVAC i KUPAC su postigli dogovor da Kupac mo'#382'e robu iz asort' +
              'imana Prodavca kupiti na odlo'#382'eno pla'#263'anje bez kamate,na vi'#353'e me' +
              'se'#269'nih rata, a da '#263'e isplatu vr'#353'iti na na'#269'in i u rokovima utvr'#273'e' +
              'nim ovim Ugovorom.'
            '')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 166.299320000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Ugovorne strane saglasno konstatuju da je dana ')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 279.685220000000000000
          Top = 166.299320000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 362.834880000000000000
          Top = 166.299320000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Kupac preuzeo robu u ukupnoj vrednosti od ')
          ParentFont = False
        end
        object IZNOS: TfrxMemoView
          Left = 612.283860000000000000
          Top = 166.299320000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[IZNOS]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 185.196970000000000000
          Width = 725.669760000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          LineSpacing = 4.000000000000000000
          Memo.UTF8W = (
            
              'dinara  u prodavnici prodavca na adresi  Baglja'#353' Zapad 5 , Zrenj' +
              'anin. Kupac se obavezuje da isplatu iznosa iz predhodnog stava i' +
              'zvr'#353'i u 4 rate i to:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 147.401670000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #268'l.2')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 226.771800000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'U'#269'e'#353#263'e  u iznosu od ')
          ParentFont = False
          VAlign = vaCenter
        end
        object UCESCE: TfrxMemoView
          Left = 147.401670000000000000
          Top = 226.771800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[UCESCE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 230.551330000000000000
          Top = 226.771800000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'dinara prilikom preuzimanja robe. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 253.228510000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '1.ratu u iznosu od ')
          ParentFont = False
          VAlign = vaCenter
        end
        object RATA: TfrxMemoView
          Left = 124.724490000000000000
          Top = 253.228510000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[RATA]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 211.653680000000000000
          Top = 253.228510000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'din., najkasnije do')
          ParentFont = False
          VAlign = vaCenter
        end
        object DATUM_1_RATE: TfrxMemoView
          Left = 332.598640000000000000
          Top = 253.228510000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd.mm.yyyy.'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[DATUM_1_RATE]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Top = 275.905690000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '2.ratu u iznosu od ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Top = 298.582870000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '3.ratu u iznosu od ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 124.724490000000000000
          Top = 275.905690000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[RATA]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 124.724490000000000000
          Top = 298.582870000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[RATA]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 211.653680000000000000
          Top = 275.905690000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'din., najkasnije do')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 211.653680000000000000
          Top = 298.582870000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'din., najkasnije do')
          ParentFont = False
          VAlign = vaCenter
        end
        object DATUM_2_RATE: TfrxMemoView
          Left = 332.598640000000000000
          Top = 275.905690000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd.mm.yyyy.'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[DATUM_2_RATE]')
          ParentFont = False
        end
        object DATUM_3_RATE: TfrxMemoView
          Left = 332.598640000000000000
          Top = 298.582870000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd.mm.yyyy.'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[DATUM_3_RATE]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 3.779530000000000000
          Top = 336.378170000000000000
          Width = 68.031540000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Upla'#263'eno ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 79.370130000000000000
          Top = 336.378170000000000000
          Width = 170.078850000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'din')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 257.008040000000000000
          Top = 336.378170000000000000
          Width = 37.795300000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'dana')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 291.023810000000000000
          Top = 336.378170000000000000
          Width = 158.740260000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 544.252320000000000000
          Top = 336.378170000000000000
          Width = 181.417440000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'potpis')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 449.764070000000000000
          Top = 336.378170000000000000
          Width = 90.708720000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'na ime 1.rate')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 3.779530000000000000
          Top = 374.173470000000000000
          Width = 68.031540000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Upla'#263'eno ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 79.370130000000000000
          Top = 374.173470000000000000
          Width = 170.078850000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'din')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 257.008040000000000000
          Top = 374.173470000000000000
          Width = 37.795300000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'dana')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 291.023810000000000000
          Top = 374.173470000000000000
          Width = 158.740260000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 544.252320000000000000
          Top = 374.173470000000000000
          Width = 181.417440000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'potpis')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 449.764070000000000000
          Top = 374.173470000000000000
          Width = 90.708720000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'na ime 2.rate')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 3.779530000000000000
          Top = 411.968770000000000000
          Width = 68.031540000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Upla'#263'eno ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 79.370130000000000000
          Top = 411.968770000000000000
          Width = 170.078850000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'din')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 257.008040000000000000
          Top = 411.968770000000000000
          Width = 37.795300000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'dana')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 291.023810000000000000
          Top = 411.968770000000000000
          Width = 158.740260000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 544.252320000000000000
          Top = 411.968770000000000000
          Width = 181.417440000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'potpis')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 449.764070000000000000
          Top = 411.968770000000000000
          Width = 90.708720000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'na ime 3.rate')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Top = 487.559370000000000000
          Width = 725.669760000000000000
          Height = 211.653680000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          LineSpacing = 4.000000000000000000
          Memo.UTF8W = (
            #268'l.3'
            
              'U slu'#269'aju da Kupac kasni sa isplatom bilo koje rate, ceo dug dos' +
              'peva u celosti i Prodavac mo'#382'e pokrenuti postupak prinudne napla' +
              'te ,pri '#269'emu se dug uve'#263'ava za iznos zakonske zatezne kamate od ' +
              'dana dospelosti do dana isplate. '
            
              'Kupac ne mo'#382'e preuzimati dodatnu robu i zaklju'#269'ivati novi Ugovor' +
              ' pre isplate duga po ovom Ugovoru.'
            #9#9#9#9#9#268'l.4'
            
              'Obe ugovorne strane se obavezuju da uredno vode evidenciju o isp' +
              'lati rata i stanju duga, kao i da svojim potpisom pored svake is' +
              'pla'#263'ene rate (na samom ugovoru, na ozna'#269'enom mestu u '#269'l.2), potv' +
              'rde pla'#263'anje i to tako da '#263'e Kupac potpisati primerak Prodavca, ' +
              'a Prodavac primerak Kupca.'
            #268'l.5'
            
              'Ovaj Ugovor sa'#269'injen je u 2 (dva) istovetna primerka, po 1 (jeda' +
              'n) za svaku Ugovornu stranu.'#9#9#9#9#9#9
            #268'l.6'
            
              ' Ugovor stupa na snagu danom zaklju'#269'enja, a prestaje da va'#382'i isp' +
              'latom ukupnog iznosa, kada '#263'e Prodavac izdati Kupcu kona'#269'ni ra'#269'u' +
              'n.'
            ''
            '')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 7.559060000000000000
          Top = 706.772110000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'U Zrenjaninu, ')
          ParentFont = False
          VAlign = vaBottom
        end
        object Date1: TfrxMemoView
          Left = 109.606370000000000000
          Top = 706.772110000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo38: TfrxMemoView
          Left = 192.756030000000000000
          Top = 706.772110000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'godine. ')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo43: TfrxMemoView
          Left = 3.779530000000000000
          Top = 461.102660000000000000
          Width = 264.567100000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          LineSpacing = 4.000000000000000000
          Memo.UTF8W = (
            'Kupac uplatu mo'#382'e izvr'#353'iti i na teku'#263'i ra'#269'un br.')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 272.126160000000000000
          Top = 461.102660000000000000
          Width = 83.149660000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          LineSpacing = 4.000000000000000000
          Memo.UTF8W = (
            '155-55730-48')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 362.834880000000000000
          Top = 461.102660000000000000
          Width = 264.567100000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          LineSpacing = 4.000000000000000000
          Memo.UTF8W = (
            'kod Halk banke, sa pozivom na broj Ugovora.')
          ParentFont = False
        end
      end
    end
  end
end
