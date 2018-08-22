unit frmMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, IniFiles, math, FileUtil;

type

  { TFormMain }

  TFormMain = class(TForm)
    btnProjPath: TButton;
    btnProjFile: TButton;
    btnProjName: TButton;
    btnSave: TButton;
    btnFirInfoPlist: TButton;
    btnFirIcon: TButton;
    chkFirAuto: TCheckBox;
    chkPgyerAuto: TCheckBox;
    chkBitcode: TCheckBox;
    chkEnterpriseAuto: TCheckBox;
    edtEnterpriseCertificate: TEdit;
    edtFirCertificate: TEdit;
    edtEnterpriseProvisionKey: TEdit;
    edtFirProvisionKey: TEdit;
    edtEnterpriseProvisionValue: TEdit;
    edtFirProvisionValue: TEdit;
    edtEnterpriseTeamID: TEdit;
    edtFirTeamID: TEdit;
    edtFirBundleID: TEdit;
    edtFirInfoPlist: TEdit;
    edtFirIcon: TEdit;
    edtFirApiToken: TEdit;
    edtProjFile: TEdit;
    edtAppStoreTeamID: TEdit;
    edtPgyerProvisionKey: TEdit;
    edtPgyerProvisionValue: TEdit;
    edtPgyerCertificate: TEdit;
    edtPgyerApiKey: TEdit;
    edtPgyerUKey: TEdit;
    edtPgyerTeamID: TEdit;
    edtSchemeName: TEdit;
    edtProjName: TEdit;
    edtAppStoreProvisionKey: TEdit;
    edtAppStoreProvisionValue: TEdit;
    edtAppStoreCertificate: TEdit;
    edtAppStorePassword: TEdit;
    edtAppStoreAccount: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblProjPath: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel2: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel3: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    procedure btnFirIconClick(Sender: TObject);
    procedure btnFirInfoPlistClick(Sender: TObject);
    procedure btnProjFileClick(Sender: TObject);
    procedure btnProjNameClick(Sender: TObject);
    procedure btnProjPathClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCurrentPath: string;
    procedure loadCfg();
  public

  end;

var
  FormMain: TFormMain;

implementation

{$R *.frm}

const
  SEC_COMMON = 'Common';
  SEC_APPSTORE = 'AppStore';
  SEC_PGYER = 'Pgyer';
  SEC_ENTERPRISE = 'Enterprise';
  SEC_FIR = 'Fir';

  KEY_PROJFILE = 'ProjectFile';
  KEY_PROJNAME = 'ProjectName';
  KEY_SCHEME = 'SchemeName';
  KEY_BITCODE = 'EnableBitcode';

  KEY_PROVISIONKEY = 'ProvisionKey';
  KEY_PROVISIONVALUE = 'ProvisionValue';
  KEY_CERTIFICATE = 'Certificate';
  KEY_TEAMID = 'TeamID';
  KEY_AUTOSIGN = 'Auto';

  // appstore
  KEY_APPSTORE_ACCOUNT = 'Account';
  KEY_APPSTORE_PASSWORD = 'Password';

  // pgyer
  KEY_PGYERUKEY = 'UKey';
  KEY_PGYERAPIKEY = 'ApiKey';

  // fir.im
  KEY_BUNDLEID = 'BundleID';
  KEY_INFOPLIST = 'InfoPList';
  KEY_ICON = 'Icon';
  KEY_APITOKEN = 'ApiToken';

{ TFormMain }

function isUnderProjectPath(APath: string): Boolean;
var
  path: string;
  src: TSearchRec;
  ret: Boolean = False;
begin
  path := APath;
  if (not path.EndsWith('/')) then path += '/';
  if (FindFirst(path + '*.*', faAnyFile, src) = 0) then begin
    repeat
      if (src.Name = '.') or (src.Name = '..') then Continue;
      if (string(src.Name).EndsWith('.xcworkspace')) or (string(src.Name).EndsWith('.xcodeproj')) then begin
        ret := True;
        Break;
      end;
    until FindNext(src) <> 0;
    FindClose(src);
  end;
  Exit(ret);
end;

procedure TFormMain.btnProjPathClick(Sender: TObject);
begin
  with TSelectDirectoryDialog.Create(nil) do begin
    if (Execute) then begin
      if (isUnderProjectPath(FileName)) then begin
        FCurrentPath:= FileName;
        if (not FCurrentPath.EndsWith('/')) then FCurrentPath += '/';
        lblProjPath.Caption:= FCurrentPath;
        loadCfg();
      end else begin
        MessageDlg('Error', 'Not an iOS project path.', mtError, [mbOK], 0);
      end;
    end;
    Free;
  end;
end;

procedure TFormMain.btnProjFileClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do begin
    InitialDir:= FCurrentPath;
    Filter:= 'xcodeproj|*.xcodeproj|xcworkspace|*.xcworkspace|all|*.*';
    if (Execute) then begin
      edtProjFile.Text:= ExtractFileName(FileName);
    end;
    Free;
  end;
end;

procedure TFormMain.btnFirInfoPlistClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do begin
    InitialDir:= FCurrentPath;
    Filter:= 'plist|*.plist';
    if (Execute) then begin
      edtFirInfoPlist.Text:= FileName.Replace(FCurrentPath, '');
    end;
    Free;
  end;
end;

procedure TFormMain.btnFirIconClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do begin
    InitialDir:= FCurrentPath;
    Filter:= 'png|*.png';
    if (Execute) then begin
      edtFirIcon.Text:= FileName.Replace(FCurrentPath, '');
    end;
    Free;
  end;
end;

procedure TFormMain.btnProjNameClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do begin
    InitialDir:= FCurrentPath;
    Filter := 'xcodeproj|*.xcodeproj';
    if (Execute) then begin
      edtProjName.Text:= ExtractFileNameWithoutExt(ExtractFileName(FileName));
    end;
    Free;
  end;
end;

procedure TFormMain.btnSaveClick(Sender: TObject);
var
  iniPath: string;
  ini: TIniFile;
begin
  // save
  if (FCurrentPath = '') then Exit;
  iniPath:= FCurrentPath + 'iospub.cfg';
  ini := TIniFile.Create(iniPath);

  // common
  ini.WriteString(SEC_COMMON, KEY_PROJFILE, edtProjFile.Text);
  ini.WriteString(SEC_COMMON, KEY_PROJNAME, edtProjName.Text);
  ini.WriteString(SEC_COMMON, KEY_SCHEME, edtSchemeName.Text);
  ini.WriteInteger(SEC_COMMON, KEY_BITCODE, ifthen(chkBitcode.Checked, 1, 0));

  // appstore
  ini.WriteString(SEC_APPSTORE, KEY_PROVISIONKEY, edtAppStoreProvisionKey.Text);
  ini.WriteString(SEC_APPSTORE, KEY_PROVISIONVALUE, edtAppStoreProvisionValue.Text);
  ini.WriteString(SEC_APPSTORE, KEY_CERTIFICATE, edtAppStoreCertificate.Text);
  ini.WriteString(SEC_APPSTORE, KEY_TEAMID, edtAppStoreTeamID.Text);
  ini.WriteString(SEC_APPSTORE, KEY_APPSTORE_ACCOUNT, edtAppStoreAccount.Text);
  ini.WriteString(SEC_APPSTORE, KEY_APPSTORE_PASSWORD, edtAppStorePassword.Text);

  // pgyer
  ini.WriteString(SEC_PGYER, KEY_PROVISIONKEY, edtPgyerProvisionKey.Text);
  ini.WriteString(SEC_PGYER, KEY_PROVISIONVALUE, edtPgyerProvisionValue.Text);
  ini.WriteString(SEC_PGYER, KEY_CERTIFICATE, edtPgyerCertificate.Text);
  ini.WriteString(SEC_PGYER, KEY_TEAMID, edtPgyerTeamID.Text);
  ini.WriteString(SEC_PGYER, KEY_PGYERUKEY, edtPgyerUKey.Text);
  ini.WriteString(SEC_PGYER, KEY_PGYERAPIKEY, edtPgyerApiKey.Text);
  ini.WriteInteger(SEC_PGYER, KEY_AUTOSIGN, ifthen(chkPgyerAuto.Checked, 1, 0));

  // enterprise
  ini.WriteString(SEC_ENTERPRISE, KEY_PROVISIONKEY, edtEnterpriseProvisionKey.Text);
  ini.WriteString(SEC_ENTERPRISE, KEY_PROVISIONVALUE, edtEnterpriseProvisionValue.Text);
  ini.WriteString(SEC_ENTERPRISE, KEY_CERTIFICATE, edtEnterpriseCertificate.Text);
  ini.WriteString(SEC_ENTERPRISE, KEY_TEAMID, edtEnterpriseTeamID.Text);
  ini.WriteInteger(SEC_ENTERPRISE, KEY_AUTOSIGN, ifthen(chkEnterpriseAuto.Checked, 1, 0));

  // fir.im
  ini.WriteString(SEC_FIR, KEY_PROVISIONKEY, edtFirProvisionKey.Text);
  ini.WriteString(SEC_FIR, KEY_PROVISIONVALUE, edtFirProvisionValue.Text);
  ini.WriteString(SEC_FIR, KEY_CERTIFICATE, edtFirCertificate.Text);
  ini.WriteString(SEC_FIR, KEY_TEAMID, edtFirTeamID.Text);
  ini.WriteInteger(SEC_FIR, KEY_AUTOSIGN, ifthen(chkFirAuto.Checked, 1, 0));
  ini.WriteString(SEC_FIR, KEY_BUNDLEID, edtFirBundleID.Text);
  ini.WriteString(SEC_FIR, KEY_INFOPLIST, edtFirInfoPlist.Text);
  ini.WriteString(SEC_FIR, KEY_ICON, edtFirIcon.Text);
  ini.WriteString(SEC_FIR, KEY_APITOKEN, edtFirApiToken.Text);

  ini.Free;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FCurrentPath:= '';
end;

procedure TFormMain.loadCfg();
var
  iniPath: string;
  ini: TIniFile;
begin
  iniPath:= FCurrentPath + 'iospub.cfg';
  if (not FileExists(iniPath)) then begin
    with TStringList.Create do begin
      Add('[Common]');
      Add('[AppStore]');
      Add('[Pgyer]');
      SaveToFile(iniPath);
      Free;
    end;
  end;
  ini := TIniFile.Create(iniPath);

  // common
  edtProjFile.Text:= ini.ReadString(SEC_COMMON, KEY_PROJFILE, '');
  edtProjName.Text:= ini.ReadString(SEC_COMMON, KEY_PROJNAME, '');
  edtSchemeName.Text:= ini.ReadString(SEC_COMMON, KEY_SCHEME, '');
  chkBitcode.Checked:= ini.ReadInteger(SEC_COMMON, KEY_BITCODE, 0) = 1;

  // appstore
  edtAppStoreProvisionKey.Text:= ini.ReadString(SEC_APPSTORE, KEY_PROVISIONKEY, '');
  edtAppStoreProvisionValue.Text:= ini.ReadString(SEC_APPSTORE, KEY_PROVISIONVALUE, '');
  edtAppStoreCertificate.Text:= ini.ReadString(SEC_APPSTORE, KEY_CERTIFICATE, '');
  edtAppStoreTeamID.Text:= ini.ReadString(SEC_APPSTORE, KEY_TEAMID, '');
  edtAppStoreAccount.Text:= ini.ReadString(SEC_APPSTORE, KEY_APPSTORE_ACCOUNT, '');
  edtAppStorePassword.Text:= ini.ReadString(SEC_APPSTORE, KEY_APPSTORE_PASSWORD, '');

  // pgyer
  edtPgyerProvisionKey.Text:= ini.ReadString(SEC_PGYER, KEY_PROVISIONKEY, '');
  edtPgyerProvisionValue.Text:= ini.ReadString(SEC_PGYER, KEY_PROVISIONVALUE, '');
  edtPgyerCertificate.Text:= ini.ReadString(SEC_PGYER, KEY_CERTIFICATE, '');
  edtPgyerTeamID.Text:= ini.ReadString(SEC_PGYER, KEY_TEAMID, '');
  edtPgyerUKey.Text:= ini.ReadString(SEC_PGYER, KEY_PGYERUKEY, '');
  edtPgyerApiKey.Text:= ini.ReadString(SEC_PGYER, KEY_PGYERAPIKEY, '');
  chkPgyerAuto.Checked:= ini.ReadInteger(SEC_PGYER, KEY_AUTOSIGN, 0) = 1;

  // enterprise
  edtEnterpriseProvisionKey.Text:= ini.ReadString(SEC_ENTERPRISE, KEY_PROVISIONKEY, '');
  edtEnterpriseProvisionValue.Text:= ini.ReadString(SEC_ENTERPRISE, KEY_PROVISIONVALUE, '');
  edtEnterpriseCertificate.Text:= ini.ReadString(SEC_ENTERPRISE, KEY_CERTIFICATE, '');
  edtEnterpriseTeamID.Text:= ini.ReadString(SEC_ENTERPRISE, KEY_TEAMID, '');
  chkEnterpriseAuto.Checked:= ini.ReadInteger(SEC_ENTERPRISE, KEY_AUTOSIGN, 0) = 1;

  // fir.im
  edtFirProvisionKey.Text:= ini.ReadString(SEC_FIR, KEY_PROVISIONKEY, '');
  edtFirProvisionValue.Text:= ini.ReadString(SEC_FIR, KEY_PROVISIONVALUE, '');
  edtFirCertificate.Text:= ini.ReadString(SEC_FIR, KEY_CERTIFICATE, '');
  edtFirTeamID.Text:= ini.ReadString(SEC_FIR, KEY_TEAMID, '');
  chkFirAuto.Checked:= ini.ReadInteger(SEC_FIR, KEY_AUTOSIGN, 0) = 1;
  edtFirBundleID.Text:= ini.ReadString(SEC_FIR, KEY_BUNDLEID, '');
  edtFirInfoPlist.Text:= ini.ReadString(SEC_FIR, KEY_INFOPLIST, '');
  edtFirIcon.Text:= ini.ReadString(SEC_FIR, KEY_ICON, '');
  edtFirApiToken.Text:= ini.ReadString(SEC_FIR, KEY_APITOKEN, '');

  ini.Free;
end;

end.

