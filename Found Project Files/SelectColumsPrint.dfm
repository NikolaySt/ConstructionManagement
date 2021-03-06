object DlgSelPrint: TDlgSelPrint
  Left = 97
  Top = 105
  BorderStyle = bsDialog
  Caption = 'Избор на колони за печат'
  ClientHeight = 126
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CheckListBox1: TCheckListBox
    Left = 4
    Top = 3
    Width = 180
    Height = 118
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 16
    Items.Strings = (
      'Коефициент'
      'Първоначални вноски'
      'Лични вноски'
      'Наказателни лихви'
      'Изтеглени суми'
      'Реално постъпление'
      'Задължения')
    ParentFont = False
    TabOrder = 0
  end
  object BtnOK: TButton
    Left = 193
    Top = 65
    Width = 86
    Height = 25
    Caption = 'ОК'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object BtnCancel: TButton
    Left = 193
    Top = 97
    Width = 86
    Height = 25
    Caption = 'Отказ'
    ModalResult = 2
    TabOrder = 2
  end
end
