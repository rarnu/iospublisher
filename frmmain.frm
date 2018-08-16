object FormMain: TFormMain
  Left = 359
  Height = 399
  Top = 159
  Width = 449
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'iOS Publisher GUI'
  ClientHeight = 399
  ClientWidth = 449
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '6.6'
  object pnlProjectPath: TPanel
    Left = 8
    Height = 50
    Top = 8
    Width = 433
    Align = alTop
    BorderSpacing.Around = 8
    BevelOuter = bvNone
    ClientHeight = 50
    ClientWidth = 433
    TabOrder = 0
    object lblProjectPath: TLabel
      Left = 8
      Height = 34
      Top = 8
      Width = 342
      Align = alClient
      BorderSpacing.Around = 8
      Layout = tlCenter
      ParentColor = False
    end
    object btnSave: TButton
      Left = 358
      Height = 50
      Top = 0
      Width = 75
      Align = alRight
      Caption = '保存'
      OnClick = btnSaveClick
      TabOrder = 0
    end
  end
  object pnlConfig: TPanel
    Left = 8
    Height = 314
    Top = 77
    Width = 433
    Align = alClient
    BorderSpacing.Around = 8
    BevelOuter = bvNone
    ClientHeight = 314
    ClientWidth = 433
    TabOrder = 1
    object sbMain: TScrollBox
      Left = 0
      Height = 314
      Top = 0
      Width = 433
      HorzScrollBar.Page = 1
      HorzScrollBar.Visible = False
      VertScrollBar.Page = 314
      Align = alClient
      ClientHeight = 314
      ClientWidth = 433
      TabOrder = 0
      object pnlProjectFile: TPanel
        Left = 0
        Height = 48
        Top = 0
        Width = 433
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 48
        ClientWidth = 433
        TabOrder = 0
        object lblProjectFile: TLabel
          Left = 8
          Height = 32
          Top = 8
          Width = 90
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = '项目文件'
          Layout = tlCenter
          ParentColor = False
        end
        object edtProjectFile: TEdit
          Left = 106
          Height = 32
          Top = 8
          Width = 271
          Align = alClient
          BorderSpacing.Around = 8
          ReadOnly = True
          TabOrder = 0
        end
        object btnProjectFile: TButton
          Left = 385
          Height = 48
          Top = 0
          Width = 48
          Align = alRight
          Caption = '...'
          OnClick = btnProjectFileClick
          TabOrder = 1
        end
      end
      object pnlProjectFile1: TPanel
        Left = 0
        Height = 48
        Top = 48
        Width = 433
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 48
        ClientWidth = 433
        TabOrder = 1
        object lblProjectFile1: TLabel
          Left = 8
          Height = 32
          Top = 8
          Width = 90
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = '项目名称'
          Layout = tlCenter
          ParentColor = False
        end
        object edtProjectName: TEdit
          Left = 106
          Height = 32
          Top = 8
          Width = 271
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
        end
        object btnProjectName: TButton
          Left = 385
          Height = 48
          Top = 0
          Width = 48
          Align = alRight
          Caption = '...'
          OnClick = btnProjectNameClick
          TabOrder = 1
        end
      end
      object pnlProjectFile2: TPanel
        Left = 0
        Height = 48
        Top = 96
        Width = 433
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 48
        ClientWidth = 433
        TabOrder = 2
        object lblProjectFile2: TLabel
          Left = 8
          Height = 32
          Top = 8
          Width = 90
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Scheme 名称'
          Layout = tlCenter
          ParentColor = False
        end
        object edtSchemeName: TEdit
          Left = 106
          Height = 32
          Top = 8
          Width = 319
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
        end
      end
      object pnlProjectFile3: TPanel
        Left = 0
        Height = 48
        Top = 144
        Width = 433
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 48
        ClientWidth = 433
        TabOrder = 3
        object lblProjectFile3: TLabel
          Left = 8
          Height = 32
          Top = 8
          Width = 90
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = '启用 Bitcode'
          Layout = tlCenter
          ParentColor = False
        end
        object chkBitcode: TCheckBox
          Left = 106
          Height = 48
          Top = 0
          Width = 43
          Align = alLeft
          Caption = '      '
          TabOrder = 0
        end
      end
      object bv1: TBevel
        Left = 0
        Height = 3
        Top = 192
        Width = 433
        Align = alTop
        Shape = bsTopLine
      end
      object pnlProjectFile4: TPanel
        Left = 0
        Height = 48
        Top = 195
        Width = 433
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 48
        ClientWidth = 433
        TabOrder = 4
        object lblProjectFile4: TLabel
          Left = 8
          Height = 32
          Top = 8
          Width = 90
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Provision 名称'
          Layout = tlCenter
          ParentColor = False
        end
        object edtProvisionKey: TEdit
          Left = 106
          Height = 32
          Top = 8
          Width = 319
          Align = alClient
          BorderSpacing.Around = 8
          ParentShowHint = False
          TabOrder = 0
          TextHint = '对应 exportOptions.plist 内 provisioningProfiles.key'
        end
      end
      object pnlProjectFile5: TPanel
        Left = 0
        Height = 48
        Top = 243
        Width = 433
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 48
        ClientWidth = 433
        TabOrder = 5
        object lblProjectFile5: TLabel
          Left = 8
          Height = 32
          Top = 8
          Width = 90
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Provision 值'
          Layout = tlCenter
          ParentColor = False
        end
        object edtProvisionValue: TEdit
          Left = 106
          Height = 32
          Top = 8
          Width = 319
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = '对应 exportOptions.plist 内 provisioningProfiles.value'
        end
      end
      object pnlProjectFile6: TPanel
        Left = 0
        Height = 48
        Top = 291
        Width = 433
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 48
        ClientWidth = 433
        TabOrder = 6
        object lblProjectFile6: TLabel
          Left = 8
          Height = 32
          Top = 8
          Width = 90
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = '证书名称'
          Layout = tlCenter
          ParentColor = False
        end
        object edtCertificate: TEdit
          Left = 106
          Height = 32
          Top = 8
          Width = 319
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = '对应 exportOptions.plist 内 signingCertificate'
        end
      end
      object pnlProjectFile7: TPanel
        Left = 0
        Height = 48
        Top = 339
        Width = 433
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 48
        ClientWidth = 433
        TabOrder = 7
        object lblProjectFile7: TLabel
          Left = 8
          Height = 32
          Top = 8
          Width = 90
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = '用户组 ID'
          Layout = tlCenter
          ParentColor = False
        end
        object edtTeamID: TEdit
          Left = 106
          Height = 32
          Top = 8
          Width = 319
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = '对应 exportOptions.plist 内 teamID'
        end
      end
      object bv2: TBevel
        Left = 0
        Height = 3
        Top = 387
        Width = 433
        Align = alTop
        Shape = bsTopLine
      end
      object pnlProjectFile8: TPanel
        Left = 0
        Height = 48
        Top = 390
        Width = 433
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 48
        ClientWidth = 433
        TabOrder = 8
        object lblProjectFile8: TLabel
          Left = 8
          Height = 32
          Top = 8
          Width = 90
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'AppStore 帐号'
          Layout = tlCenter
          ParentColor = False
        end
        object edtAppstoreAccount: TEdit
          Left = 106
          Height = 32
          Top = 8
          Width = 319
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
        end
      end
      object pnlProjectFile9: TPanel
        Left = 0
        Height = 48
        Top = 438
        Width = 433
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 48
        ClientWidth = 433
        TabOrder = 9
        object lblProjectFile9: TLabel
          Left = 8
          Height = 32
          Top = 8
          Width = 90
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'AppStore 密码'
          Layout = tlCenter
          ParentColor = False
        end
        object edtAppstorePassword: TEdit
          Left = 106
          Height = 32
          Top = 8
          Width = 319
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
        end
      end
      object pnlProjectFile10: TPanel
        Left = 0
        Height = 48
        Top = 534
        Width = 433
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 48
        ClientWidth = 433
        TabOrder = 10
        object lblProjectFile10: TLabel
          Left = 8
          Height = 32
          Top = 8
          Width = 90
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = '蒲公英 ApiKey'
          Layout = tlCenter
          ParentColor = False
        end
        object edtPgyerApiKey: TEdit
          Left = 106
          Height = 32
          Top = 8
          Width = 319
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
        end
      end
      object pnlProjectFile11: TPanel
        Left = 0
        Height = 48
        Top = 486
        Width = 433
        Align = alTop
        BevelOuter = bvNone
        ClientHeight = 48
        ClientWidth = 433
        TabOrder = 11
        object lblProjectFile11: TLabel
          Left = 8
          Height = 32
          Top = 8
          Width = 90
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = '蒲公英 UKey'
          Layout = tlCenter
          ParentColor = False
        end
        object edtPgyerUkey: TEdit
          Left = 106
          Height = 32
          Top = 8
          Width = 319
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
        end
      end
    end
  end
  object Bevel1: TBevel
    Left = 0
    Height = 3
    Top = 66
    Width = 449
    Align = alTop
    Shape = bsTopLine
  end
end
