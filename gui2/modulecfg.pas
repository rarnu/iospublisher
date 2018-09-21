unit modulecfg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IniFiles, math;

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

type

  { TIOSConfig }

  TIOSConfig = class
  private
    FAppStoreAccount: string;
    FAppStoreCertificate: string;
    FAppStorePassword: string;
    FAppStoreProvisionKey: string;
    FAppStoreProvisionValue: string;
    FAppStoreTeamId: string;
    FBitCode: Boolean;
    FEnterpriseAutoSign: Boolean;
    FEnterpriseCertificate: string;
    FEnterpriseProvisionKey: string;
    FEnterpriseProvisionValue: string;
    FEnterpriseTeamId: string;
    FFirApiToken: string;
    FFirAutoSign: Boolean;
    FFirBundleId: string;
    FFirCertificate: string;
    FFirIcon: string;
    FFirInfoPlist: string;
    FFirProvisionKey: string;
    FFirProvisionValue: string;
    FFirTeamId: string;
    FPgyerApiKey: string;
    FPgyerAutoSign: Boolean;
    FPgyerCertificate: string;
    FPgyerProvisionKey: string;
    FPgyerProvisionValue: string;
    FPgyerTeamId: string;
    FPgyerUKey: string;
    FProjFile: string;
    FProjName: string;
    FSchemeName: string;
  public
    procedure loadCfg(APath: string);
    procedure saveCfg(APath: string);
  public
    // common
    property ProjFile: string read FProjFile write FProjFile;
    property ProjName: string read FProjName write FProjName;
    property SchemeName: string read FSchemeName write FSchemeName;
    property BitCode: Boolean read FBitCode write FBitCode;

    // appstore
    property AppStoreProvisionKey: string read FAppStoreProvisionKey write FAppStoreProvisionKey;
    property AppStoreProvisionValue: string read FAppStoreProvisionValue write FAppStoreProvisionValue;
    property AppStoreCertificate: string read FAppStoreCertificate write FAppStoreCertificate;
    property AppStoreTeamId: string read FAppStoreTeamId write FAppStoreTeamId;
    property AppStoreAccount: string read FAppStoreAccount write FAppStoreAccount;
    property AppStorePassword: string read FAppStorePassword write FAppStorePassword;

    // pgyer
    property PgyerProvisionKey: string read FPgyerProvisionKey write FPgyerProvisionKey;
    property PgyerProvisionValue: string read FPgyerProvisionValue write FPgyerProvisionValue;
    property PgyerCertificate: string read FPgyerCertificate write FPgyerCertificate;
    property PgyerTeamId: string read FPgyerTeamId write FPgyerTeamId;
    property PgyerUKey: string read FPgyerUKey write FPgyerUKey;
    property PgyerApiKey: string read FPgyerApiKey write FPgyerApiKey;
    property PgyerAutoSign: Boolean read FPgyerAutoSign write FPgyerAutoSign;

    // enterprise
    property EnterpriseProvisionKey: string read FEnterpriseProvisionKey write FEnterpriseProvisionKey;
    property EnterpriseProvisionValue: string read FEnterpriseProvisionValue write FEnterpriseProvisionValue;
    property EnterpriseCertificate: string read FEnterpriseCertificate write FEnterpriseCertificate;
    property EnterpriseTeamId: string read FEnterpriseTeamId write FEnterpriseTeamId;
    property EnterpriseAutoSign: Boolean read FEnterpriseAutoSign write FEnterpriseAutoSign;

    // fir.im
    property FirProvisionKey: string read FFirProvisionKey write FFirProvisionKey;
    property FirProvisionValue: string read FFirProvisionValue write FFirProvisionValue;
    property FirCertificate: string read FFirCertificate write FFirCertificate;
    property FirTeamId: string read FFirTeamId write FFirTeamId;
    property FirAutoSign: Boolean read FFirAutoSign write FFirAutoSign;
    property FirBundleId: string read FFirBundleId write FFirBundleId;
    property FirInfoPlist: string read FFirInfoPlist write FFirInfoPlist;
    property FirIcon: string read FFirIcon write FFirIcon;
    property FirApiToken: string read FFirApiToken write FFirApiToken;

  end;

var
  ioscfg: TIOSConfig;

implementation

{ TIOSConfig }

procedure TIOSConfig.loadCfg(APath: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(APath);

  // common
  FProjFile:= ini.ReadString(SEC_COMMON, KEY_PROJFILE, '');
  FProjName:= ini.ReadString(SEC_COMMON, KEY_PROJNAME, '');
  FSchemeName:= ini.ReadString(SEC_COMMON, KEY_SCHEME, '');
  FBitCode:= ini.ReadInteger(SEC_COMMON, KEY_BITCODE, 0) = 1;

  // appstore
  FAppStoreProvisionKey:= ini.ReadString(SEC_APPSTORE, KEY_PROVISIONKEY, '');
  FAppStoreProvisionValue:= ini.ReadString(SEC_APPSTORE, KEY_PROVISIONVALUE, '');
  FAppStoreCertificate:= ini.ReadString(SEC_APPSTORE, KEY_CERTIFICATE, '');
  FAppStoreTeamId:= ini.ReadString(SEC_APPSTORE, KEY_TEAMID, '');
  FAppStoreAccount:= ini.ReadString(SEC_APPSTORE, KEY_APPSTORE_ACCOUNT, '');
  FAppStorePassword:= ini.ReadString(SEC_APPSTORE, KEY_APPSTORE_PASSWORD, '');

  // pgyer
  FPgyerProvisionKey:= ini.ReadString(SEC_PGYER, KEY_PROVISIONKEY, '');
  FPgyerProvisionValue:= ini.ReadString(SEC_PGYER, KEY_PROVISIONVALUE, '');
  FPgyerCertificate:= ini.ReadString(SEC_PGYER, KEY_CERTIFICATE, '');
  FPgyerTeamId:= ini.ReadString(SEC_PGYER, KEY_TEAMID, '');
  FPgyerUKey:= ini.ReadString(SEC_PGYER, KEY_PGYERUKEY, '');
  FPgyerApiKey:= ini.ReadString(SEC_PGYER, KEY_PGYERAPIKEY, '');
  FPgyerAutoSign:= ini.ReadInteger(SEC_PGYER, KEY_AUTOSIGN, 0) = 1;

  // enterprise
  FEnterpriseProvisionKey:= ini.ReadString(SEC_ENTERPRISE, KEY_PROVISIONKEY, '');
  FEnterpriseProvisionValue:= ini.ReadString(SEC_ENTERPRISE, KEY_PROVISIONVALUE, '');
  FEnterpriseCertificate:= ini.ReadString(SEC_ENTERPRISE, KEY_CERTIFICATE, '');
  FEnterpriseTeamId:= ini.ReadString(SEC_ENTERPRISE, KEY_TEAMID, '');
  FEnterpriseAutoSign:= ini.ReadInteger(SEC_ENTERPRISE, KEY_AUTOSIGN, 0) = 1;

  // fir.im
  FFirProvisionKey:= ini.ReadString(SEC_FIR, KEY_PROVISIONKEY, '');
  FFirProvisionValue:= ini.ReadString(SEC_FIR, KEY_PROVISIONVALUE, '');
  FFirCertificate:= ini.ReadString(SEC_FIR, KEY_CERTIFICATE, '');
  FFirTeamId:= ini.ReadString(SEC_FIR, KEY_TEAMID, '');
  FFirAutoSign:= ini.ReadInteger(SEC_FIR, KEY_AUTOSIGN, 0) = 1;
  FFirBundleId:= ini.ReadString(SEC_FIR, KEY_BUNDLEID, '');
  FFirInfoPlist:= ini.ReadString(SEC_FIR, KEY_INFOPLIST, '');
  FFirIcon:= ini.ReadString(SEC_FIR, KEY_ICON, '');
  FFirApiToken:= ini.ReadString(SEC_FIR, KEY_APITOKEN, '');

  ini.Free;
end;

procedure TIOSConfig.saveCfg(APath: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(APath);

  // common
  ini.WriteString(SEC_COMMON, KEY_PROJFILE, FProjFile);
  ini.WriteString(SEC_COMMON, KEY_PROJNAME, FProjName);
  ini.WriteString(SEC_COMMON, KEY_SCHEME, FSchemeName);
  ini.WriteInteger(SEC_COMMON, KEY_BITCODE, ifthen(FBitCode, 1, 0));

  // appstore
  ini.WriteString(SEC_APPSTORE, KEY_PROVISIONKEY, FAppStoreProvisionKey);
  ini.WriteString(SEC_APPSTORE, KEY_PROVISIONVALUE, FAppStoreProvisionValue);
  ini.WriteString(SEC_APPSTORE, KEY_CERTIFICATE, FAppStoreCertificate);
  ini.WriteString(SEC_APPSTORE, KEY_TEAMID, FAppStoreTeamId);
  ini.WriteString(SEC_APPSTORE, KEY_APPSTORE_ACCOUNT, FAppStoreAccount);
  ini.WriteString(SEC_APPSTORE, KEY_APPSTORE_PASSWORD, FAppStorePassword);

  // pgyer
  ini.WriteString(SEC_PGYER, KEY_PROVISIONKEY, FPgyerProvisionKey);
  ini.WriteString(SEC_PGYER, KEY_PROVISIONVALUE, FPgyerProvisionValue);
  ini.WriteString(SEC_PGYER, KEY_CERTIFICATE, FPgyerCertificate);
  ini.WriteString(SEC_PGYER, KEY_TEAMID, FPgyerTeamId);
  ini.WriteString(SEC_PGYER, KEY_PGYERUKEY, FPgyerUKey);
  ini.WriteString(SEC_PGYER, KEY_PGYERAPIKEY, FPgyerApiKey);
  ini.WriteInteger(SEC_PGYER, KEY_AUTOSIGN, ifthen(FPgyerAutoSign, 1, 0));

  // enterprise
  ini.WriteString(SEC_ENTERPRISE, KEY_PROVISIONKEY, FEnterpriseProvisionKey);
  ini.WriteString(SEC_ENTERPRISE, KEY_PROVISIONVALUE, FEnterpriseProvisionValue);
  ini.WriteString(SEC_ENTERPRISE, KEY_CERTIFICATE, FEnterpriseCertificate);
  ini.WriteString(SEC_ENTERPRISE, KEY_TEAMID, FEnterpriseTeamId);
  ini.WriteInteger(SEC_ENTERPRISE, KEY_AUTOSIGN, ifthen(FEnterpriseAutoSign, 1, 0));

  // fir.im
  ini.WriteString(SEC_FIR, KEY_PROVISIONKEY, FFirProvisionKey);
  ini.WriteString(SEC_FIR, KEY_PROVISIONVALUE, FFirProvisionValue);
  ini.WriteString(SEC_FIR, KEY_CERTIFICATE, FFirCertificate);
  ini.WriteString(SEC_FIR, KEY_TEAMID, FFirTeamId);
  ini.WriteInteger(SEC_FIR, KEY_AUTOSIGN, ifthen(FFirAutoSign, 1, 0));
  ini.WriteString(SEC_FIR, KEY_BUNDLEID, FFirBundleId);
  ini.WriteString(SEC_FIR, KEY_INFOPLIST, FFirInfoPlist);
  ini.WriteString(SEC_FIR, KEY_ICON, FFirIcon);
  ini.WriteString(SEC_FIR, KEY_APITOKEN, FFirApiToken);

  ini.Free;
end;

initialization
  ioscfg := TIOSConfig.Create;

finalization
  ioscfg.Free;

end.

