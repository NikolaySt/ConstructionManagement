object DlgPrintOtchet: TDlgPrintOtchet
  Left = 2
  Top = -1
  Width = 808
  Height = 580
  Caption = 'DlgPrintOtchet'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PrintPage: TPrintDesignPage
    Left = 7
    Top = 5
    Width = 771
    Height = 1043
    BaseDesign.Pen.Color = clWhite
    BaseDesign.Font.Charset = DEFAULT_CHARSET
    BaseDesign.Font.Color = clWindowText
    BaseDesign.Font.Height = -11
    BaseDesign.Font.Name = 'MS Sans Serif'
    BaseDesign.Font.Style = []
    BaseDesign.GridPen.Color = 14342874
    BaseDesign.GridPen.Style = psDot
    BaseDesign.CenterPen.Color = clRed
    BaseDesign.CenterPen.Style = psDot
    object LblTitle: TPrintDesignLabel
      Left = 100
      Top = 62
      Width = 570
      Height = 53
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Caption = '����� �� ������������� � ������������ �� ������������� ��� - '
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Transparent = True
      WordWrap = True
      AutoSize = False
    end
    object PrintDesignLabel2: TPrintDesignLabel
      Left = 624
      Top = 21
      Width = 59
      Height = 16
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Caption = '���:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
    end
    object PrintDesignLabel3: TPrintDesignLabel
      Left = 622
      Top = 38
      Width = 61
      Height = 16
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = True
      Caption = '��. ���:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
    end
    object PrintDesignLabel4: TPrintDesignLabel
      Left = 689
      Top = 21
      Width = 44
      Height = 16
      ViewAllPages = True
      ShowCurrentPage = True
      ShowAllPages = False
      FindBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
    end
    object PrintDesignLabel5: TPrintDesignLabel
      Left = 689
      Top = 38
      Width = 44
      Height = 16
      ViewAllPages = True
      ShowCurrentPage = False
      ShowAllPages = True
      FindBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
    end
    object PrintDesignFigure1: TPrintDesignFigure
      Left = 26
      Top = 128
      Width = 716
      Height = 86
      Brush.Style = bsClear
      Figures = tfRoundRect
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FindBottom = False
      RoundEllipseWidth = 30
      RoundEllipseHeight = 30
    end
    object PrintDesignDBLabelDim1: TPrintDesignDBLabelDim
      Left = 178
      Top = 147
      Width = 132
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      AutoSize = False
      CaptionDim = '��.'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 27
      Freese = True
      FreeseWidth = 4
      DataField = 'SUM of Purvo_Vnoski'
      DataSource = DlgOtchet.DtSSumaOtchet
      CheckValue = False
      IsValue = 1
      ZeroType = ztInteger
    end
    object PrintDesignDBLabelDim2: TPrintDesignDBLabelDim
      Left = 178
      Top = 179
      Width = 132
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      AutoSize = False
      CaptionDim = '��.'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 27
      Freese = True
      FreeseWidth = 4
      DataField = 'SUM of LichniVniski'
      DataSource = DlgOtchet.DtSSumaOtchet
      CheckValue = False
      IsValue = 1
      ZeroType = ztInteger
    end
    object PrintDesignDBLabelDim3: TPrintDesignDBLabelDim
      Left = 410
      Top = 147
      Width = 132
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      AutoSize = False
      CaptionDim = '��.'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 27
      Freese = True
      FreeseWidth = 4
      DataField = 'SUM of Nak_Lixvi'
      DataSource = DlgOtchet.DtSSumaOtchet
      CheckValue = False
      IsValue = 1
      ZeroType = ztInteger
    end
    object PrintDesignDBLabelDim4: TPrintDesignDBLabelDim
      Left = 410
      Top = 179
      Width = 132
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      AutoSize = False
      CaptionDim = '��.'
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 27
      Freese = True
      FreeseWidth = 4
      DataField = 'SUM of Zadulgenia'
      DataSource = DlgOtchet.DtSSumaOtchet
      CheckValue = False
      IsValue = 1
      ZeroType = ztInteger
    end
    object PrintDesignDBLabelDim5: TPrintDesignDBLabelDim
      Left = 637
      Top = 179
      Width = 90
      Height = 20
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      AutoSize = False
      FontDim.Charset = DEFAULT_CHARSET
      FontDim.Color = clWindowText
      FontDim.Height = -11
      FontDim.Name = 'MS Sans Serif'
      FontDim.Style = []
      FontOwner = True
      DimBuffer = 0
      Freese = False
      FreeseWidth = 0
      DataField = 'SUM of IdealnaChast'
      DataSource = DlgOtchet.DtSSumaOtchet
      CheckValue = False
      IsValue = 1
      ZeroType = ztInteger
    end
    object PrintDesignLabel6: TPrintDesignLabel
      Left = 62
      Top = 149
      Width = 115
      Height = 16
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Caption = '������. ������:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
    end
    object PrintDesignLabel7: TPrintDesignLabel
      Left = 74
      Top = 181
      Width = 103
      Height = 16
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Caption = '����� ������:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
    end
    object PrintDesignLabel8: TPrintDesignLabel
      Left = 308
      Top = 149
      Width = 99
      Height = 16
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Caption = '�����. �����:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
    end
    object PrintDesignLabel9: TPrintDesignLabel
      Left = 311
      Top = 181
      Width = 96
      Height = 16
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Caption = '����������:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
    end
    object PrintDesignLabel10: TPrintDesignLabel
      Left = 541
      Top = 182
      Width = 92
      Height = 16
      ViewAllPages = False
      ShowCurrentPage = False
      ShowAllPages = False
      FindBottom = False
      Caption = '����������:'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Transparent = True
      AutoSize = False
    end
    object PrintGrid: TPrintDesignDBGrid
      Left = 21
      Top = 228
      Width = 740
      Height = 740
      Anchors = [akLeft, akTop, akBottom]
      DataSource = DlgOtchet.DtSOtchet
      EnableFrame = True
      FrameType = ftRectangle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      MoveTable = True
      RowHeight = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      TitleRow = 3
    end
  end
end
