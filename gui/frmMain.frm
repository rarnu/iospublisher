object FormMain: TFormMain
  Left = 47
  Height = 636
  Top = 270
  Width = 481
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'iOS Publisher GUI Config 1.0.7'
  ClientHeight = 636
  ClientWidth = 481
  Color = clWhite
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '6.3'
  object GroupBox1: TGroupBox
    Left = 8
    Height = 65
    Top = 8
    Width = 465
    Align = alTop
    AutoSize = True
    BorderSpacing.Around = 8
    Caption = 'Project Path'
    ClientHeight = 47
    ClientWidth = 463
    TabOrder = 0
    object lblProjPath: TLabel
      Left = 8
      Height = 31
      Top = 8
      Width = 331
      Align = alClient
      BorderSpacing.Around = 8
      Layout = tlCenter
      ParentColor = False
    end
    object btnProjPath: TButton
      Left = 347
      Height = 31
      Top = 8
      Width = 40
      Align = alRight
      BorderSpacing.Around = 8
      Caption = '...'
      OnClick = btnProjPathClick
      ParentFont = False
      TabOrder = 0
    end
    object btnSave: TButton
      Left = 395
      Height = 31
      Top = 8
      Width = 60
      Align = alRight
      BorderSpacing.Around = 8
      Caption = 'Save'
      OnClick = btnSaveClick
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Height = 202
    Top = 81
    Width = 465
    Align = alTop
    AutoSize = True
    BorderSpacing.Around = 8
    Caption = 'Common'
    ClientHeight = 184
    ClientWidth = 463
    TabOrder = 1
    object Panel1: TPanel
      Left = 0
      Height = 46
      Top = 0
      Width = 463
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel1'
      ClientHeight = 46
      ClientWidth = 463
      TabOrder = 0
      object btnProjFile: TButton
        Left = 415
        Height = 30
        Top = 8
        Width = 40
        Align = alRight
        BorderSpacing.Around = 8
        Caption = '...'
        OnClick = btnProjFileClick
        TabOrder = 0
      end
      object Label1: TLabel
        Left = 8
        Height = 30
        Top = 8
        Width = 100
        Align = alLeft
        AutoSize = False
        BorderSpacing.Around = 8
        Caption = 'Project File'
        Layout = tlCenter
        ParentColor = False
      end
      object edtProjFile: TEdit
        Left = 116
        Height = 30
        Top = 8
        Width = 291
        Align = alClient
        BorderSpacing.Around = 8
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Left = 0
      Height = 46
      Top = 138
      Width = 463
      Align = alTop
      BevelOuter = bvNone
      ClientHeight = 46
      ClientWidth = 463
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Height = 30
        Top = 8
        Width = 100
        Align = alLeft
        AutoSize = False
        BorderSpacing.Around = 8
        Caption = 'Enable Bitcode'
        Layout = tlCenter
        ParentColor = False
      end
      object chkBitcode: TCheckBox
        Left = 116
        Height = 46
        Top = 0
        Width = 32
        Align = alLeft
        Caption = '  '
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 0
      Height = 46
      Top = 92
      Width = 463
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel3'
      ClientHeight = 46
      ClientWidth = 463
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Height = 30
        Top = 8
        Width = 100
        Align = alLeft
        AutoSize = False
        BorderSpacing.Around = 8
        Caption = 'Scheme Name'
        Layout = tlCenter
        ParentColor = False
      end
      object edtSchemeName: TEdit
        Left = 116
        Height = 30
        Top = 8
        Width = 339
        Align = alClient
        BorderSpacing.Around = 8
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 0
      Height = 46
      Top = 46
      Width = 463
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel4'
      ClientHeight = 46
      ClientWidth = 463
      TabOrder = 3
      object btnProjName: TButton
        Left = 415
        Height = 30
        Top = 8
        Width = 40
        Align = alRight
        BorderSpacing.Around = 8
        Caption = '...'
        OnClick = btnProjNameClick
        TabOrder = 0
      end
      object Label4: TLabel
        Left = 8
        Height = 30
        Top = 8
        Width = 100
        Align = alLeft
        AutoSize = False
        BorderSpacing.Around = 8
        Caption = 'Project Name'
        Layout = tlCenter
        ParentColor = False
      end
      object edtProjName: TEdit
        Left = 116
        Height = 30
        Top = 8
        Width = 291
        Align = alClient
        BorderSpacing.Around = 8
        TabOrder = 1
      end
    end
  end
  object PageControl1: TPageControl
    Left = 8
    Height = 337
    Top = 291
    Width = 465
    ActivePage = TabSheet1
    Align = alClient
    BorderSpacing.Around = 8
    TabIndex = 0
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'AppStore'
      ClientHeight = 306
      ClientWidth = 455
      object Panel5: TPanel
        Left = 0
        Height = 46
        Top = 0
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel5'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 0
        object Label5: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Provision Key'
          Layout = tlCenter
          ParentColor = False
        end
        object edtAppStoreProvisionKey: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = 'in exportOptions.plist [provisioningProfiles.key]'
        end
      end
      object Panel6: TPanel
        Left = 0
        Height = 46
        Top = 46
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel6'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 1
        object Label6: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Provision Value'
          Layout = tlCenter
          ParentColor = False
        end
        object edtAppStoreProvisionValue: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = 'in exportOptions.plist [provisioningProfiles.value]'
        end
      end
      object Panel7: TPanel
        Left = 0
        Height = 46
        Top = 92
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel7'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 2
        object Label7: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Certificate'
          Layout = tlCenter
          ParentColor = False
        end
        object edtAppStoreCertificate: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = 'in exportOptions.plist [signingCertificate]'
        end
      end
      object Panel8: TPanel
        Left = 0
        Height = 46
        Top = 230
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel8'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 3
        object Label8: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Password'
          Layout = tlCenter
          ParentColor = False
        end
        object edtAppStorePassword: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
        end
      end
      object Panel9: TPanel
        Left = 0
        Height = 46
        Top = 184
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel9'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 4
        object Label9: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Account'
          Layout = tlCenter
          ParentColor = False
        end
        object edtAppStoreAccount: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
        end
      end
      object Panel10: TPanel
        Left = 0
        Height = 46
        Top = 138
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel10'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 5
        object Label10: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Team ID'
          Layout = tlCenter
          ParentColor = False
        end
        object edtAppStoreTeamID: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = 'in exportOptions.plist [teamID]'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Pgyer'
      ClientHeight = 306
      ClientWidth = 455
      object Panel11: TPanel
        Left = 0
        Height = 46
        Top = 0
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel11'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 0
        object Label11: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Provision Key'
          Layout = tlCenter
          ParentColor = False
        end
        object edtPgyerProvisionKey: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = 'in exportOptions.plist [provisioningProfiles.key]'
        end
      end
      object Panel12: TPanel
        Left = 0
        Height = 46
        Top = 46
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel12'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 1
        object Label12: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Provision Value'
          Layout = tlCenter
          ParentColor = False
        end
        object edtPgyerProvisionValue: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = 'in exportOptions.plist [provisioningProfiles.value]'
        end
      end
      object Panel13: TPanel
        Left = 0
        Height = 46
        Top = 92
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel13'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 2
        object Label13: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Certificate'
          Layout = tlCenter
          ParentColor = False
        end
        object edtPgyerCertificate: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = 'in exportOptions.plist [signingCertificate]'
        end
      end
      object Panel14: TPanel
        Left = 0
        Height = 46
        Top = 230
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel14'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 3
        object Label14: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Api Key'
          Layout = tlCenter
          ParentColor = False
        end
        object edtPgyerApiKey: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
        end
      end
      object Panel15: TPanel
        Left = 0
        Height = 46
        Top = 184
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel15'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 4
        object Label15: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'UKey'
          Layout = tlCenter
          ParentColor = False
        end
        object edtPgyerUKey: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
        end
      end
      object Panel16: TPanel
        Left = 0
        Height = 46
        Top = 138
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel16'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 5
        object Label16: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Team ID'
          Layout = tlCenter
          ParentColor = False
        end
        object edtPgyerTeamID: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = 'in exportOptions.plist [teamID]'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Enterprise'
      ClientHeight = 306
      ClientWidth = 455
      object Panel17: TPanel
        Left = 0
        Height = 46
        Top = 0
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel17'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 0
        object Label17: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Provision Key'
          Layout = tlCenter
          ParentColor = False
        end
        object edtEnterpriseProvisionKey: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = 'in exportOptions.plist [provisioningProfiles.key]'
        end
      end
      object Panel18: TPanel
        Left = 0
        Height = 46
        Top = 46
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel18'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 1
        object Label18: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Provision Value'
          Layout = tlCenter
          ParentColor = False
        end
        object edtEnterpriseProvisionValue: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = 'in exportOptions.plist [provisioningProfiles.value]'
        end
      end
      object Panel19: TPanel
        Left = 0
        Height = 46
        Top = 92
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel19'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 2
        object Label19: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Certificate'
          Layout = tlCenter
          ParentColor = False
        end
        object edtEnterpriseCertificate: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = 'in exportOptions.plist [signingCertificate]'
        end
      end
      object Panel20: TPanel
        Left = 0
        Height = 46
        Top = 138
        Width = 455
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel20'
        ClientHeight = 46
        ClientWidth = 455
        TabOrder = 3
        object Label20: TLabel
          Left = 8
          Height = 30
          Top = 8
          Width = 100
          Align = alLeft
          AutoSize = False
          BorderSpacing.Around = 8
          Caption = 'Team ID'
          Layout = tlCenter
          ParentColor = False
        end
        object edtEnterpriseTeamID: TEdit
          Left = 116
          Height = 30
          Top = 8
          Width = 331
          Align = alClient
          BorderSpacing.Around = 8
          TabOrder = 0
          TextHint = 'in exportOptions.plist [teamID]'
        end
      end
    end
  end
end
