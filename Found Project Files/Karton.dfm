object DlgKarton: TDlgKarton
  Left = 22
  Top = 9
  Width = 762
  Height = 553
  Caption = #1054#1090#1095#1077#1090' '#1085#1072' '#1087#1083#1072#1097#1072#1085#1080#1103#1090#1072' '#1085#1072' '#1082#1086#1086#1087#1077#1088#1072#1090#1086#1088#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  Menu = MenuKarton
  OldCreateOrder = True
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 231
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Label11: TLabel
      Left = 0
      Top = 199
      Width = 754
      Height = 32
      Align = alBottom
      AutoSize = False
      Transparent = True
    end
    object Label14: TLabel
      Left = 4
      Top = 206
      Width = 51
      Height = 16
      Caption = #1057#1087#1080#1089#1098#1082':'
    end
    object GBoxPostupl: TGroupBox
      Left = 475
      Top = 0
      Width = 279
      Height = 199
      Align = alRight
      Caption = #1055#1083#1072#1097#1072#1085#1080#1103
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      OnMouseMove = GBoxPostuplMouseMove
      object Label1: TLabel
        Left = 126
        Top = 18
        Width = 43
        Height = 16
        Alignment = taRightJustify
        Caption = #1041#1072#1085#1082#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 135
        Top = 40
        Width = 34
        Height = 16
        Alignment = taRightJustify
        Caption = #1050#1072#1089#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label3: TLabel
        Left = 125
        Top = 64
        Width = 44
        Height = 16
        Alignment = taRightJustify
        Caption = #1054#1073#1097#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Bevel2: TBevel
        Left = 12
        Top = 84
        Width = 248
        Height = 3
        Shape = bsTopLine
      end
      object Label12: TLabel
        Left = 37
        Top = 92
        Width = 132
        Height = 16
        Alignment = taRightJustify
        Caption = #1053#1072#1082#1072#1079#1072#1090#1077#1083#1085#1080' '#1083#1080#1093#1074#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label13: TLabel
        Left = 84
        Top = 166
        Width = 85
        Height = 16
        Alignment = taRightJustify
        Caption = #1047#1072#1076#1098#1083#1078#1077#1085#1080#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label7: TLabel
        Left = 60
        Top = 114
        Width = 109
        Height = 16
        Alignment = taRightJustify
        Caption = #1048#1079#1090#1077#1075#1083#1077#1085#1072' '#1089#1091#1084#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label9: TLabel
        Left = 7
        Top = 139
        Width = 162
        Height = 16
        Alignment = taRightJustify
        Caption = #1056#1077#1072#1083#1085#1086' '#1087#1086#1089#1090#1098#1087#1083#1077#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Bevel3: TBevel
        Left = 13
        Top = 158
        Width = 248
        Height = 5
        Shape = bsTopLine
      end
      object DBEdit4: TDBTextRec
        Left = 173
        Top = 163
        Width = 103
        Height = 20
        Alignment = taRightJustify
        Color = clWhite
        DataField = 'SUM of PlanVnoska'
        DataSource = DtSPogas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BorderStyle = bsSingle
        CheckValue = False
        CaptionDim = #1083#1074
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clBlack
        FontDim.Height = -13
        FontDim.Name = 'MS Sans Serif'
        FontDim.Style = []
        DimBuffer = 20
        Freese = True
        FreeseWidth = 2
        IsValue = 1
        Redraw = False
        ZeroCheck = True
        ZeroType = ztFloat
      end
      object DBEdit7: TDBTextRec
        Left = 173
        Top = 112
        Width = 103
        Height = 20
        Alignment = taRightJustify
        Color = clWhite
        DataField = 'SUM of IztOrder'
        DataSource = DtSTegleSuma
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BorderStyle = bsSingle
        CheckValue = False
        CaptionDim = #1083#1074
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clBlack
        FontDim.Height = -13
        FontDim.Name = 'MS Sans Serif'
        FontDim.Style = []
        DimBuffer = 20
        Freese = True
        FreeseWidth = 2
        IsValue = 1
        Redraw = False
        ZeroCheck = True
        ZeroType = ztFloat
      end
      object DBEdit5: TDBTextRec
        Left = 172
        Top = 89
        Width = 103
        Height = 20
        Alignment = taRightJustify
        Color = clWhite
        DataField = 'SUM of NakazLixva'
        DataSource = DtSPostupl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BorderStyle = bsSingle
        CheckValue = True
        CaptionDim = #1083#1074
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clBlack
        FontDim.Height = -13
        FontDim.Name = 'MS Sans Serif'
        FontDim.Style = []
        DimBuffer = 20
        Freese = True
        FreeseWidth = 2
        IsValue = 1
        Redraw = False
        ZeroCheck = True
        ZeroType = ztFloat
      end
      object DBEdit3: TDBTextRec
        Left = 172
        Top = 62
        Width = 103
        Height = 20
        Alignment = taRightJustify
        Color = clWhite
        DataField = 'SUM of Plachane'
        DataSource = DtSPostupl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        BorderStyle = bsSingle
        CheckValue = False
        CaptionDim = #1083#1074
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clBlack
        FontDim.Height = -13
        FontDim.Name = 'MS Sans Serif'
        FontDim.Style = []
        DimBuffer = 20
        Freese = True
        FreeseWidth = 2
        IsValue = 1
        Redraw = False
        ZeroCheck = True
        ZeroType = ztFloat
      end
      object DBEdit1: TDBTextRec
        Left = 172
        Top = 38
        Width = 103
        Height = 20
        Alignment = taRightJustify
        Color = clWhite
        DataField = 'SUM of Plachane'
        DataSource = DtSOrder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BorderStyle = bsSingle
        CheckValue = False
        CaptionDim = #1083#1074
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clBlack
        FontDim.Height = -13
        FontDim.Name = 'MS Sans Serif'
        FontDim.Style = []
        DimBuffer = 20
        Freese = True
        FreeseWidth = 2
        IsValue = 1
        Redraw = False
        ZeroCheck = True
        ZeroType = ztFloat
      end
      object DBEdit2: TDBTextRec
        Left = 172
        Top = 15
        Width = 103
        Height = 20
        Alignment = taRightJustify
        Color = clWhite
        DataField = 'SUM of Plachane'
        DataSource = DtSBanka
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BorderStyle = bsSingle
        CheckValue = False
        CaptionDim = #1083#1074
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clBlack
        FontDim.Height = -13
        FontDim.Name = 'MS Sans Serif'
        FontDim.Style = []
        DimBuffer = 20
        Freese = True
        FreeseWidth = 2
        IsValue = 1
        Redraw = False
        ZeroCheck = True
        ZeroType = ztFloat
      end
      object LblRealPost: TLabelRec
        Left = 173
        Top = 136
        Width = 103
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        CaptionDim = #1083#1074
        Color = clWhite
        DimBuffer = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clBlack
        FontDim.Height = -13
        FontDim.Name = 'MS Sans Serif'
        FontDim.Style = []
        Freese = True
        FreeseWidth = 2
        ParentFont = False
        ParentColor = False
        Redraw = False
      end
    end
    object GBoxPasp: TGroupBox
      Left = 0
      Top = 0
      Width = 174
      Height = 199
      Align = alLeft
      Caption = #1050#1086#1086#1087#1077#1088#1072#1090#1086#1088
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnMouseMove = GBoxPaspMouseMove
      object LblEGN: TLabel
        Left = 37
        Top = 103
        Width = 31
        Height = 16
        Caption = #1045#1043#1053':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LblFName: TLabel
        Left = 38
        Top = 40
        Width = 30
        Height = 16
        Caption = #1048#1084#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LblSName: TLabel
        Left = 6
        Top = 61
        Width = 62
        Height = 16
        Caption = #1055#1088#1077#1079#1080#1084#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LblLName: TLabel
        Left = 6
        Top = 82
        Width = 62
        Height = 16
        Caption = #1060#1072#1084#1080#1083#1080#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 47
        Top = 19
        Width = 21
        Height = 16
        Caption = 'No:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit6: TDBTextRec
        Left = 73
        Top = 17
        Width = 45
        Height = 20
        Alignment = taCenter
        Color = clWhite
        DataField = 'ID_NAME'
        DataSource = DtSKoop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BorderStyle = bsSingle
        CheckValue = False
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clWindowText
        FontDim.Height = -13
        FontDim.Name = 'System'
        FontDim.Style = []
        DimBuffer = 0
        Freese = False
        FreeseWidth = 0
        IsValue = 1
        Redraw = False
        ZeroType = ztInteger
      end
      object DEdtName: TDBTextRec
        Left = 73
        Top = 38
        Width = 94
        Height = 20
        Color = clWhite
        DataField = 'FName'
        DataSource = DtSKoop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BorderStyle = bsSingle
        CheckValue = False
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clWindowText
        FontDim.Height = -13
        FontDim.Name = 'System'
        FontDim.Style = []
        DimBuffer = 0
        Freese = False
        FreeseWidth = 0
        IsValue = 1
        Redraw = False
        ZeroType = ztInteger
      end
      object DEdtSName: TDBTextRec
        Left = 73
        Top = 59
        Width = 94
        Height = 20
        Color = clWhite
        DataField = 'SName'
        DataSource = DtSKoop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BorderStyle = bsSingle
        CheckValue = False
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clWindowText
        FontDim.Height = -13
        FontDim.Name = 'System'
        FontDim.Style = []
        DimBuffer = 0
        Freese = False
        FreeseWidth = 0
        IsValue = 1
        Redraw = False
        ZeroType = ztInteger
      end
      object DEdtLName: TDBTextRec
        Left = 73
        Top = 80
        Width = 94
        Height = 20
        Color = clWhite
        DataField = 'LName'
        DataSource = DtSKoop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BorderStyle = bsSingle
        CheckValue = False
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clWindowText
        FontDim.Height = -13
        FontDim.Name = 'System'
        FontDim.Style = []
        DimBuffer = 0
        Freese = False
        FreeseWidth = 0
        IsValue = 1
        Redraw = False
        ZeroType = ztInteger
      end
      object DEdtEGN: TDBTextRec
        Left = 73
        Top = 101
        Width = 94
        Height = 20
        Color = clWhite
        DataField = 'EGN'
        DataSource = DtSPasp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BorderStyle = bsSingle
        CheckValue = False
        FontDim.Charset = DEFAULT_CHARSET
        FontDim.Color = clWindowText
        FontDim.Height = -13
        FontDim.Name = 'System'
        FontDim.Style = []
        DimBuffer = 0
        Freese = False
        FreeseWidth = 0
        IsValue = 1
        Redraw = False
        ZeroType = ztInteger
      end
    end
    object Panel2: TPanel
      Left = 174
      Top = 0
      Width = 301
      Height = 199
      Align = alClient
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      object GBoxUchstie: TGroupBox
        Left = 0
        Top = 0
        Width = 301
        Height = 134
        Align = alTop
        Caption = #1059#1095#1072#1089#1090#1080#1077' '#1074' '#1082#1086#1086#1087#1077#1088#1072#1094#1080#1103#1090#1072
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnMouseMove = GBoxUchstieMouseMove
        object LblUBlock: TLabel
          Left = 12
          Top = 22
          Width = 35
          Height = 16
          Alignment = taRightJustify
          Caption = #1041#1083#1086#1082':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LblUEtag: TLabel
          Left = 9
          Top = 43
          Width = 38
          Height = 16
          Alignment = taRightJustify
          Caption = #1045#1090#1072#1078':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LblUApart: TLabel
          Left = 24
          Top = 64
          Width = 23
          Height = 16
          Alignment = taRightJustify
          Caption = #1040#1087'.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LblUMag: TLabel
          Left = 135
          Top = 64
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = #1052#1072#1075#1072#1079#1080#1085':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LblUGarag: TLabel
          Left = 152
          Top = 22
          Width = 43
          Height = 16
          Alignment = taRightJustify
          Caption = #1043#1072#1088#1072#1078':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LblUMaze: TLabel
          Left = 9
          Top = 85
          Width = 38
          Height = 16
          Alignment = taRightJustify
          Caption = #1052#1072#1079#1077':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LblUAtelie: TLabel
          Left = 145
          Top = 84
          Width = 51
          Height = 16
          Alignment = taRightJustify
          Caption = #1040#1090#1077#1083#1080#1077':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LblUTavan: TLabel
          Left = 151
          Top = 43
          Width = 44
          Height = 16
          Alignment = taRightJustify
          Caption = #1058#1072#1074#1072#1085':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LblUIdealnaChast: TLabel
          Left = 111
          Top = 111
          Width = 85
          Height = 16
          Alignment = taRightJustify
          Caption = #1050#1086#1077#1092#1080#1094#1080#1077#1085#1090':'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Bevel1: TBevel
          Left = 14
          Top = 104
          Width = 271
          Height = 3
          Shape = bsTopLine
        end
        object DEdtUBlock: TDBTextRec
          Left = 50
          Top = 19
          Width = 78
          Height = 20
          Color = clWhite
          DataField = 'Blok'
          DataSource = DtSUchast
          ParentColor = False
          BorderStyle = bsSingle
          CheckValue = False
          FontDim.Charset = DEFAULT_CHARSET
          FontDim.Color = clWindowText
          FontDim.Height = -13
          FontDim.Name = 'System'
          FontDim.Style = []
          DimBuffer = 0
          Freese = False
          FreeseWidth = 0
          IsValue = 1
          Redraw = False
          ZeroType = ztInteger
        end
        object DEdtUEtag: TDBTextRec
          Left = 50
          Top = 40
          Width = 78
          Height = 20
          Color = clWhite
          DataField = 'Etag'
          DataSource = DtSUchast
          ParentColor = False
          BorderStyle = bsSingle
          CheckValue = False
          FontDim.Charset = DEFAULT_CHARSET
          FontDim.Color = clWindowText
          FontDim.Height = -13
          FontDim.Name = 'System'
          FontDim.Style = []
          DimBuffer = 0
          Freese = False
          FreeseWidth = 0
          IsValue = 1
          Redraw = False
          ZeroType = ztInteger
        end
        object DEdtUApart: TDBTextRec
          Left = 50
          Top = 61
          Width = 78
          Height = 20
          Color = clWhite
          DataField = 'Apart'
          DataSource = DtSUchast
          ParentColor = False
          BorderStyle = bsSingle
          CheckValue = False
          FontDim.Charset = DEFAULT_CHARSET
          FontDim.Color = clWindowText
          FontDim.Height = -13
          FontDim.Name = 'System'
          FontDim.Style = []
          DimBuffer = 0
          Freese = False
          FreeseWidth = 0
          IsValue = 1
          Redraw = False
          ZeroType = ztInteger
        end
        object DEdtUMaze: TDBTextRec
          Left = 50
          Top = 82
          Width = 78
          Height = 20
          Color = clWhite
          DataField = 'Maze'
          DataSource = DtSUchast
          ParentColor = False
          BorderStyle = bsSingle
          CheckValue = False
          FontDim.Charset = DEFAULT_CHARSET
          FontDim.Color = clWindowText
          FontDim.Height = -13
          FontDim.Name = 'System'
          FontDim.Style = []
          DimBuffer = 0
          Freese = False
          FreeseWidth = 0
          IsValue = 1
          Redraw = False
          ZeroType = ztInteger
        end
        object DEdtUGarag: TDBTextRec
          Left = 199
          Top = 19
          Width = 78
          Height = 20
          Color = clWhite
          DataField = 'Garag'
          DataSource = DtSUchast
          ParentColor = False
          BorderStyle = bsSingle
          CheckValue = False
          FontDim.Charset = DEFAULT_CHARSET
          FontDim.Color = clWindowText
          FontDim.Height = -13
          FontDim.Name = 'System'
          FontDim.Style = []
          DimBuffer = 0
          Freese = False
          FreeseWidth = 0
          IsValue = 1
          Redraw = False
          ZeroType = ztInteger
        end
        object DEdtUTavan: TDBTextRec
          Left = 199
          Top = 40
          Width = 78
          Height = 20
          Color = clWhite
          DataSource = DtSUchast
          ParentColor = False
          BorderStyle = bsSingle
          CheckValue = False
          FontDim.Charset = DEFAULT_CHARSET
          FontDim.Color = clWindowText
          FontDim.Height = -13
          FontDim.Name = 'System'
          FontDim.Style = []
          DimBuffer = 0
          Freese = False
          FreeseWidth = 0
          IsValue = 1
          Redraw = False
          ZeroType = ztInteger
        end
        object DEdtUMag: TDBTextRec
          Left = 199
          Top = 61
          Width = 78
          Height = 20
          Color = clWhite
          DataField = 'Magazin'
          DataSource = DtSUchast
          ParentColor = False
          BorderStyle = bsSingle
          CheckValue = False
          FontDim.Charset = DEFAULT_CHARSET
          FontDim.Color = clWindowText
          FontDim.Height = -13
          FontDim.Name = 'System'
          FontDim.Style = []
          DimBuffer = 0
          Freese = False
          FreeseWidth = 0
          IsValue = 1
          Redraw = False
          ZeroType = ztInteger
        end
        object DEdtUAtelie: TDBTextRec
          Left = 199
          Top = 82
          Width = 78
          Height = 20
          Color = clWhite
          DataField = 'Atelie'
          DataSource = DtSUchast
          ParentColor = False
          BorderStyle = bsSingle
          CheckValue = False
          FontDim.Charset = DEFAULT_CHARSET
          FontDim.Color = clWindowText
          FontDim.Height = -13
          FontDim.Name = 'System'
          FontDim.Style = []
          DimBuffer = 0
          Freese = False
          FreeseWidth = 0
          IsValue = 1
          Redraw = False
          ZeroType = ztInteger
        end
        object DEdtUIdealnaChast: TDBTextRec
          Left = 199
          Top = 109
          Width = 78
          Height = 20
          Alignment = taRightJustify
          Color = clWhite
          DataField = 'Koef'
          DataSource = DtSKoop
          ParentColor = False
          BorderStyle = bsSingle
          CheckValue = False
          FontDim.Charset = DEFAULT_CHARSET
          FontDim.Color = clWindowText
          FontDim.Height = -13
          FontDim.Name = 'System'
          FontDim.Style = []
          DimBuffer = 0
          Freese = False
          FreeseWidth = 0
          IsValue = 1
          Redraw = False
          ZeroType = ztInteger
        end
      end
      object GBoxPredVns: TGroupBox
        Left = 0
        Top = 134
        Width = 301
        Height = 65
        Align = alClient
        Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1085#1080' '#1074#1085#1086#1089#1082#1080
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnMouseMove = GBoxPredVnsMouseMove
        object Label4: TLabel
          Left = 24
          Top = 18
          Width = 151
          Height = 16
          Alignment = taRightJustify
          Caption = #1055#1098#1088#1074#1086#1085#1072#1095#1072#1083#1085#1072' '#1074#1085#1086#1089#1082#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 57
          Top = 40
          Width = 118
          Height = 16
          Alignment = taRightJustify
          Caption = #1042#1085#1086#1089#1082#1072' '#1079#1072' '#1087#1088#1086#1077#1082#1090':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 279
          Top = 18
          Width = 16
          Height = 16
          Caption = #1083#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 279
          Top = 40
          Width = 7
          Height = 16
          Caption = '$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit8: TDBEdit
          Left = 179
          Top = 38
          Width = 98
          Height = 20
          AutoSize = False
          DataField = 'ProectVns'
          DataSource = DtSKoopProect
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnKeyUp = DBEdit8KeyUp
        end
        object DBEdit9: TDBEdit
          Left = 179
          Top = 15
          Width = 98
          Height = 20
          AutoSize = False
          Ctl3D = True
          DataField = 'PurVns'
          DataSource = DtSKoopProect
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnKeyUp = DBEdit9KeyUp
        end
      end
    end
    object CBoxKoop: TComboBox
      Left = 61
      Top = 203
      Width = 309
      Height = 24
      Style = csDropDownList
      Ctl3D = True
      DropDownCount = 15
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnClick = CBoxKoopChange
    end
  end
  object PnlStatus: TPanel
    Left = 0
    Top = 485
    Width = 754
    Height = 19
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object NewDBGrid1: TDBGrid
    Left = 0
    Top = 231
    Width = 754
    Height = 254
    TextRow = 2
    ColumnDrag = False
    ColMoving = False
    Align = alClient
    Ctl3D = False
    DataSource = DtSKarton
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnKeyDown = DBGridFull1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'RedNom'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PlanVnoska'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KraenSrok'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DocNom'
        Title.Alignment = taCenter
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Plachane'
        Title.Alignment = taCenter
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VidPl'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ProsrDni'
        Title.Alignment = taCenter
        Title.Color = clWhite
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NakazLixva'
        Title.Alignment = taCenter
        Title.Color = clWhite
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IztDocNom'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IztData'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IztOrder'
        Title.Alignment = taCenter
        Title.Color = clAqua
        Width = 88
        Visible = True
      end>
  end
  object DtSKarton: TDataSource
    DataSet = TblKarton
    Left = 112
    Top = 388
  end
  object TblKarton: TTable
    DatabaseName = 'Stroitel'
    TableName = 'DML5.DB'
    Left = 104
    Top = 341
    object TblKartonRedNom: TStringField
      Alignment = taCenter
      DisplayLabel = 'No'
      DisplayWidth = 5
      FieldName = 'RedNom'
      Size = 4
    end
    object TblKartonPlanVnoska: TCurrencyField
      DisplayLabel = #1048#1089#1082#1072#1085#1072' '#1089#1091#1084#1072' ('#1083#1074')'
      DisplayWidth = 11
      FieldName = 'PlanVnoska'
      DisplayFormat = '# ### ##0.#0'
    end
    object TblKartonKraenSrok: TDateField
      Alignment = taCenter
      DisplayLabel = #1050#1088#1072#1077#1085' '#1089#1088#1086#1082
      DisplayWidth = 12
      FieldName = 'KraenSrok'
    end
    object TblKartonDocNom: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090' ~No'
      DisplayWidth = 11
      FieldName = 'DocNom'
    end
    object TblKartonData: TDateField
      Alignment = taCenter
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'Data'
    end
    object TblKartonPlachane: TCurrencyField
      DisplayLabel = #1042#1085#1077#1089#1077#1085#1072' '#1089#1091#1084#1072' ('#1083#1074')'
      DisplayWidth = 11
      FieldName = 'Plachane'
      DisplayFormat = '# ### ##0.#0'
    end
    object TblKartonVidPl: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1080#1076
      DisplayWidth = 7
      FieldName = 'VidPl'
      Size = 10
    end
    object TblKartonProsrDni: TSmallintField
      Alignment = taCenter
      DisplayLabel = #1055#1088#1086#1089#1088#1086#1095#1080#1077' '#1074' '#1076#1085#1080
      DisplayWidth = 12
      FieldName = 'ProsrDni'
    end
    object TblKartonNakazLixva: TCurrencyField
      DisplayLabel = #1053#1072#1082#1072#1079'. '#1083#1080#1093#1074#1072' ('#1083#1074')'
      DisplayWidth = 12
      FieldName = 'NakazLixva'
      DisplayFormat = '# ### ##0.#0'
    end
    object TblKartonIztDocNom: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090' ~No'
      DisplayWidth = 11
      FieldName = 'IztDocNom'
    end
    object TblKartonIztData: TDateField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 9
      FieldName = 'IztData'
    end
    object TblKartonIztOrder: TCurrencyField
      DisplayLabel = #1048#1079#1090#1077#1075#1083#1077#1085#1072' '#1089#1091#1084#1072' ('#1083#1074')'
      DisplayWidth = 13
      FieldName = 'IztOrder'
      DisplayFormat = '# ### ##0.#0'
    end
  end
  object DtSKoop: TDataSource
    DataSet = QrySortKoop
    Left = 163
    Top = 391
  end
  object TblPasp: TTable
    DatabaseName = 'Stroitel'
    IndexFieldNames = 'ID_PASPORT'
    MasterFields = 'ID_NAME'
    MasterSource = DtSKoop
    TableName = '2.DB'
    Left = 215
    Top = 340
  end
  object DtSPasp: TDataSource
    DataSet = TblPasp
    Left = 215
    Top = 391
  end
  object TblUchast: TTable
    DatabaseName = 'Stroitel'
    IndexFieldNames = 'ID_UCHASTIE'
    MasterFields = 'ID_NAME'
    MasterSource = DtSKoop
    TableName = '5.DB'
    Left = 266
    Top = 340
    object TblUchastID_UCHASTIE: TSmallintField
      FieldName = 'ID_UCHASTIE'
    end
    object TblUchastBlok: TStringField
      FieldName = 'Blok'
      Size = 15
    end
    object TblUchastEtag: TStringField
      FieldName = 'Etag'
      Size = 15
    end
    object TblUchastApart: TStringField
      FieldName = 'Apart'
      Size = 15
    end
    object TblUchastMagazin: TStringField
      FieldName = 'Magazin'
      Size = 15
    end
    object TblUchastGarag: TStringField
      FieldName = 'Garag'
      Size = 15
    end
    object TblUchastMaze: TStringField
      FieldName = 'Maze'
      Size = 15
    end
    object TblUchastAtelie: TStringField
      FieldName = 'Atelie'
      Size = 15
    end
    object TblUchastTavan: TStringField
      FieldName = 'Tavan'
      Size = 15
    end
    object TblUchastIdealnaChast: TFloatField
      FieldName = 'IdealnaChast'
    end
  end
  object DtSUchast: TDataSource
    DataSet = TblUchast
    Left = 266
    Top = 391
  end
  object QryPostupl: TQuery
    DatabaseName = 'Stroitel'
    SQL.Strings = (
      'Select Sum(Plachane), Sum(NakazLixva)'
      'From "6.DB"'
      'WHERE DocNom <> "'#1057#1072#1083#1076#1086'."')
    UpdateMode = upWhereChanged
    Left = 372
    Top = 340
    object QryPostuplQryPostuplSUMofPlachane: TCurrencyField
      FieldName = 'SUM of Plachane'
      DisplayFormat = '# ### ##0.#0'
    end
    object QryPostuplQryPostuplSUMofNakazLixva: TCurrencyField
      FieldName = 'SUM of NakazLixva'
      DisplayFormat = '# ### ##0.#0'
    end
  end
  object DtSPostupl: TDataSource
    DataSet = QryPostupl
    Left = 369
    Top = 391
  end
  object QryBanka: TQuery
    DatabaseName = 'Stroitel'
    SQL.Strings = (
      'Select Sum(Plachane)'
      'From "6.DB"'
      'Where VidPl = "'#1041#1072#1085#1082#1072'"')
    UpdateMode = upWhereChanged
    Left = 421
    Top = 339
    object QryBankaSUMofPlachane: TCurrencyField
      FieldName = 'SUM of Plachane'
      DisplayFormat = '# ### ##0.#0'
    end
  end
  object DtSBanka: TDataSource
    DataSet = QryBanka
    Left = 421
    Top = 391
  end
  object DtSOrder: TDataSource
    DataSet = QryOrder
    Left = 472
    Top = 391
  end
  object QryOrder: TQuery
    DatabaseName = 'Stroitel'
    SQL.Strings = (
      'Select Sum(Plachane)'
      'From "6.DB"'
      'Where VidPl = "'#1050#1072#1089#1072'"')
    UpdateMode = upWhereChanged
    Left = 472
    Top = 340
    object QryOrderSUMofPlachane: TCurrencyField
      FieldName = 'SUM of Plachane'
      DisplayFormat = '# ### ##0.#0'
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 392
    Top = 303
  end
  object QryPogas: TQuery
    DatabaseName = 'Stroitel'
    SQL.Strings = (
      'Select Sum(PlanVnoska)'
      'From "6.DB"'
      'Where DocNom = "" ')
    Left = 320
    Top = 340
    object QryPogasSUMofPlanVnoska: TCurrencyField
      FieldName = 'SUM of PlanVnoska'
      DisplayFormat = '# ### ##0.#0'
    end
  end
  object DtSPogas: TDataSource
    DataSet = QryPogas
    Left = 318
    Top = 391
  end
  object MenuKarton: TMainMenu
    Left = 365
    Top = 303
    object N1: TMenuItem
      Caption = #1055#1083#1072#1097#1072#1085#1080#1103
      object N5: TMenuItem
        Caption = #1041#1072#1085#1082#1072'...'
        ShortCut = 16450
        OnClick = N5Click
      end
    end
    object N2: TMenuItem
      Caption = #1057#1090#1088#1086#1080#1090#1077#1083
      object N3: TMenuItem
        Caption = #1055#1083#1072#1085#1086#1074#1080' '#1074#1085#1086#1089#1082#1080'...'
        ShortCut = 16461
        OnClick = N3Click
      end
    end
    object N6: TMenuItem
      Caption = #1055#1088#1080#1085#1090#1077#1088
      object N8: TMenuItem
        Caption = #1055#1086#1076#1088#1086#1073#1077#1085' '#1087#1077#1095#1072#1090'...'
        OnClick = N8Click
      end
      object N10: TMenuItem
        Caption = #1057#1098#1082#1088#1072#1090#1077#1085' '#1087#1077#1095#1072#1090'...'
        OnClick = N10Click
      end
    end
    object N9: TMenuItem
      Caption = #1048#1079#1093#1086#1076
      ShortCut = 16499
      OnClick = N9Click
    end
  end
  object QryTegleSuma: TQuery
    DatabaseName = 'Stroitel'
    SQL.Strings = (
      'SELECT SUM(IztOrder)'
      'FROM "6.DB"')
    Left = 518
    Top = 342
    object QryTegleSumaSUMofIztOrder: TCurrencyField
      FieldName = 'SUM of IztOrder'
      DisplayFormat = '# ### ##0.#0'
    end
  end
  object DtSTegleSuma: TDataSource
    DataSet = QryTegleSuma
    Left = 518
    Top = 393
  end
  object QrySortKoop: TQuery
    DatabaseName = 'Stroitel'
    SQL.Strings = (
      'SELECT *'
      'FROM "1.DB" A'
      'ORDER BY A.FName, A.SName, A.LName')
    Left = 163
    Top = 340
    object QrySortKoopID_NAME: TSmallintField
      FieldName = 'ID_NAME'
    end
    object QrySortKoopFName: TStringField
      FieldName = 'FName'
      Size = 30
    end
    object QrySortKoopSName: TStringField
      FieldName = 'SName'
      Size = 30
    end
    object QrySortKoopLName: TStringField
      FieldName = 'LName'
      Size = 30
    end
    object QrySortKoopNotes: TMemoField
      FieldName = 'Notes'
      BlobType = ftMemo
      Size = 1
    end
    object QrySortKoopFiles: TStringField
      FieldName = 'Files'
      Size = 12
    end
    object QrySortKoopKoef: TFloatField
      FieldName = 'Koef'
      DisplayFormat = '# ### ##0.##0'
    end
    object QrySortKoopPurVns: TFloatField
      FieldName = 'PurVns'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '#0.#0'
    end
    object QrySortKoopProectVns: TFloatField
      FieldName = 'ProectVns'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '#0.#0'
    end
  end
  object TblKoopProect: TTable
    DatabaseName = 'Stroitel'
    IndexFieldNames = 'ID_NAME'
    MasterFields = 'ID_NAME'
    MasterSource = DtSKoop
    TableName = '1.DB'
    Left = 37
    Top = 339
    object TblKoopProectID_NAME: TSmallintField
      FieldName = 'ID_NAME'
    end
    object TblKoopProectProectVns: TFloatField
      FieldName = 'ProectVns'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
    object TblKoopProectPurVns: TFloatField
      FieldName = 'PurVns'
      DisplayFormat = '# ### ##0.#0'
      EditFormat = '######0.#0'
    end
  end
  object DtSKoopProect: TDataSource
    DataSet = TblKoopProect
    Left = 36
    Top = 390
  end
end
