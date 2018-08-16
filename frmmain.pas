unit frmmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, IniFiles,
  ExtCtrls, StdCtrls, math;

type

  { TFormMain }

  TFormMain = class(TForm)
    Bevel1: TBevel;
    btnSave: TButton;
    bv1: TBevel;
    btnProjectFile: TButton;
    btnProjectName: TButton;
    bv2: TBevel;
    chkBitcode: TCheckBox;
    edtAppstorePassword: TEdit;
    edtPgyerApiKey: TEdit;
    edtPgyerUkey: TEdit;
    edtTeamID: TEdit;
    edtProjectFile: TEdit;
    edtProjectName: TEdit;
    edtProvisionValue: TEdit;
    edtCertificate: TEdit;
    edtSchemeName: TEdit;
    edtProvisionKey: TEdit;
    edtAppstoreAccount: TEdit;
    lblProjectFile: TLabel;
    lblProjectFile1: TLabel;
    lblProjectFile10: TLabel;
    lblProjectFile11: TLabel;
    lblProjectFile2: TLabel;
    lblProjectFile3: TLabel;
    lblProjectFile4: TLabel;
    lblProjectFile5: TLabel;
    lblProjectFile6: TLabel;
    lblProjectFile7: TLabel;
    lblProjectFile8: TLabel;
    lblProjectFile9: TLabel;
    lblProjectPath: TLabel;
    pnlProjectFile: TPanel;
    pnlConfig: TPanel;
    pnlProjectFile1: TPanel;
    pnlProjectFile10: TPanel;
    pnlProjectFile11: TPanel;
    pnlProjectFile2: TPanel;
    pnlProjectFile3: TPanel;
    pnlProjectFile4: TPanel;
    pnlProjectFile5: TPanel;
    pnlProjectFile6: TPanel;
    pnlProjectFile7: TPanel;
    pnlProjectFile8: TPanel;
    pnlProjectFile9: TPanel;
    pnlProjectPath: TPanel;
    sbMain: TScrollBox;
    procedure btnProjectFileClick(Sender: TObject);
    procedure btnProjectNameClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FProjectPath: string;
    procedure switchProjectPath(APath: string);
  public

  end;

var
  FormMain: TFormMain;

implementation

{$R *.frm}

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

procedure TFormMain.FormCreate(Sender: TObject);
begin
  with TSelectDirectoryDialog.Create(nil) do begin
    Title:= '选择项目路径';
    if (Execute) then begin
      if (isUnderProjectPath(FileName)) then begin
        FProjectPath := FileName;
        if (not FProjectPath.EndsWith('/')) then FProjectPath += '/';
        switchProjectPath(FProjectPath);
      end else begin
        MessageDlg('出错', '必须选择项目所在的路径', mtError, [mbOK], 0);
        Application.Terminate;
      end;
    end else begin
      Application.Terminate;
    end;
    Free;
  end;
end;

procedure TFormMain.btnProjectFileClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do begin
    InitialDir:= FProjectPath;
    if (Execute) then begin
      if (not FileName.EndsWith('.xcworkspace')) and (not FileName.EndsWith('.xcodeproj')) then begin
        MessageDlg('出错', '必须选择 xcworkspace 或 xcodeproj', mtError, [mbOK], 0);
      end else begin
        edtProjectFile.Caption:= ExtractFileName(FileName);
      end;
    end;
    Free;
  end;
end;

procedure TFormMain.btnProjectNameClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do begin
    InitialDir:= FProjectPath;
    if (Execute) then begin
      if (not FileName.EndsWith('.xcodeproj')) then begin
        MessageDlg('出错', '必须选择 xcodeproj', mtError, [mbOK], 0);
      end else begin
        edtProjectName.Caption:= ExtractFileNameWithoutExt(ExtractFileName(FileName));
      end;
    end;
    Free;
  end;
end;

procedure TFormMain.btnSaveClick(Sender: TObject);
var
  ini: TIniFile;
begin
  // save config
  ini := TIniFile.Create(FProjectPath + 'iospub.cfg');
  ini.WriteString('Config', 'ProjectFile', edtProjectFile.Text);
  ini.WriteString('Config', 'ProjectName', edtProjectName.Text);
  ini.WriteString('Config', 'SchemeName', edtSchemeName.Text);
  ini.WriteInteger('Config', 'EnableBitcode', ifthen(chkBitcode.Checked, 1, 0));
  ini.WriteString('Config', 'ProvisionKey', edtProvisionKey.Text);
  ini.WriteString('Config', 'ProvisionValue', edtProvisionValue.Text);
  ini.WriteString('Config', 'Certificate', edtCertificate.Text);
  ini.WriteString('Config', 'TeamID', edtTeamID.Text);
  ini.WriteString('Config', 'AppStoreAccount', edtAppstoreAccount.Text);
  ini.WriteString('Config', 'AppStorePassword', edtAppstorePassword.Text);
  ini.WriteString('Config', 'PgyerUKey', edtPgyerUkey.Text);
  ini.WriteString('Config', 'PgyerApiKey', edtPgyerApiKey.Text);
  ini.Free;
  MessageDlg('提示', '保存配置完毕', mtInformation, [mbOK], 0);
end;

procedure TFormMain.switchProjectPath(APath: string);
var
  iniPath: string;
  ini: TIniFile;
begin
  lblProjectPath.Caption:= '项目路径: ' + APath;
  iniPath:= APath + 'iospub.cfg';
  if (not FileExists(iniPath)) then begin
    with TStringList.Create do begin
      Clear;
      Add('[Config]');
      SaveToFile(iniPath);
      Free;
    end;
  end;
  ini := TIniFile.Create(iniPath);
  edtProjectFile.Text:= ini.ReadString('Config', 'ProjectFile', '');
  edtProjectName.Text:= ini.ReadString('Config', 'ProjectName', '');
  edtSchemeName.Text:= ini.ReadString('Config', 'SchemeName', '');
  chkBitcode.Checked:= ini.ReadInteger('Config', 'EnableBitcode', 0) = 1;
  edtProvisionKey.Text:= ini.ReadString('Config', 'ProvisionKey', '');
  edtProvisionValue.Text:= ini.ReadString('Config', 'ProvisionValue', '');
  edtCertificate.Text:= ini.ReadString('Config', 'Certificate', '');
  edtTeamID.Text:= ini.ReadString('Config', 'TeamID', '');
  edtAppstoreAccount.Text:= ini.ReadString('Config', 'AppStoreAccount', '');
  edtAppstorePassword.Text:= ini.ReadString('Config', 'AppStorePassword', '');
  edtPgyerUkey.Text:= ini.ReadString('Config', 'PgyerUKey', '');
  edtPgyerApiKey.Text:= ini.ReadString('Config', 'PgyerApiKey', '');
  ini.Free;

end;

end.

