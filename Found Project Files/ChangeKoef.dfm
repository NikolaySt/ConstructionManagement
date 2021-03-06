object DlgChangeKoef: TDlgChangeKoef
  Left = 229
  Top = 248
  BorderStyle = bsDialog
  Caption = 'Промяна на коефициента'
  ClientHeight = 82
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BtnOK: TButton
    Left = 171
    Top = 21
    Width = 83
    Height = 25
    Caption = 'Промяна'
    Default = True
    TabOrder = 1
    OnClick = BtnOKClick
  end
  object BtnCancel: TButton
    Left = 171
    Top = 52
    Width = 83
    Height = 25
    Caption = 'Отказ'
    ModalResult = 2
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 3
    Width = 158
    Height = 73
    Caption = 'Кефициент'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 20
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Стар:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 13
      Top = 46
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Нов:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LblKoef: TLabelRec
      Left = 44
      Top = 16
      Width = 91
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.000'
      Color = clWhite
      DimBuffer = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      Freese = False
      FreeseWidth = 0
      ParentFont = False
      ParentColor = False
      Redraw = False
    end
    object EdtKoef: TValueEdit
      Left = 44
      Top = 42
      Width = 91
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Format = '#.#'
      TypeValue = tvReal
    end
  end
end
