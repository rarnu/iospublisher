unit frmmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, frmBase, orca_scene2d, orcautils, modulecfg;

type

  { TFormMain }

  TFormMain = class(TFormBase)
    procedure FormCreate(Sender: TObject);
  private

    FCurrentPath: string;

    FLayProj: TD2HudGroupBox;
    FLblProjPath: TD2Text;
    FBtnProjPath: TD2HudCornerButton;
    FBtnProjSave: TD2HudCornerButton;

    FLayCommon: TD2HudGroupBox;
    FLblProjFile: TD2Text;
    FLblProjName: TD2Text;
    FLblScheme: TD2Text;
    FLblBitCode: TD2Text;

    FTxtProjFile: TD2HudTextBox;
    FTxtProjName: TD2HudTextBox;
    FTxtScheme: TD2HudTextBox;
    FChkBitCode: TD2HudCheckBox;

    FBtnProjFile: TD2HudCornerButton;
    FBtnProjName: TD2HudCornerButton;

    FLayChannel: TD2HudGroupBox;
    FBtnChAppStore: TD2HudCornerButton;
    FBtnChPgyer: TD2HudCornerButton;
    FBtnChEnterprise: TD2HudCornerButton;
    FBtnChFirIm: TD2HudCornerButton;
    procedure onBtnAppStoreClick(Sender: TObject);
    procedure onBtnEnterpriseClick(Sender: TObject);
    procedure onBtnFirImClick(Sender: TObject);
    procedure onBtnPgyerClick(Sender: TObject);
    procedure onBtnProjFileClick(Sender: TObject);
    procedure onBtnProjNameClick(Sender: TObject);
    procedure onBtnProjSaveClick(Sender: TObject);

  private
    procedure loadCfg();
    procedure onBtnProjPathClick(sender: TObject);
  public

  end;

var
  FormMain: TFormMain;

implementation

uses
  frmAppStore, frmPgyer, frmEnterprise, frmFirIm;

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
  inherited;
  // init form
  Width:= 552;
  Height:= 380;
  Window.Text:= 'iOS Publisher Config 2';

  // init variables
  FCurrentPath:= '';

  // init components
  FLayProj:= TD2HudGroupBox(createD2VO(Root, TD2HudGroupBox, 0, 0, 0, 60, vaMostTop, 0, 8, 8, 8));
  FLayProj.Text:= 'Project Path';
  FLblProjPath := TD2Text(createD2VO(FLayProj, TD2Text, 0,0,0,0, vaClient, 24, 8));
  FLblProjPath.setup('');

  FBtnProjPath := TD2HudCornerButton(createD2VO(FLayProj, TD2HudCornerButton, 0, 0, 60, 0, vaRight, 0, 16, 0, 8));
  FBtnProjPath.Text:= '...';
  FBtnProjPath.Corners:= [];
  FBtnProjPath.OnClick:= @onBtnProjPathClick;

  FBtnProjSave := TD2HudCornerButton(createD2VO(FLayProj, TD2HudCornerButton, 0, 0, 60, 0, vaMostRight, 0, 16, 8, 8));
  FBtnProjSave.Text:= 'Save';
  FBtnProjSave.Corners:= [];
  FBtnProjSave.OnClick:=@onBtnProjSaveClick;

  FLayCommon:= TD2HudGroupBox(createD2VO(Root, TD2HudGroupBox, 0, 0, 0, 0, vaClient, 0, 8, 8, 8));
  FLayCommon.Text:= 'Common';

  //
  FLblProjFile:= TD2Text(createD2VO(FLayCommon, TD2Text, 24, 16, 90, 32));
  FLblProjFile.setup('Project File');
  FTxtProjFile := TD2HudTextBox(createD2VO(FLayCommon, TD2HudTextBox, 120, 18, 343, 28));
  FBtnProjFile := TD2HudCornerButton(createD2VO(FLayCommon, TD2HudCornerButton, 463, 18, 40, 28));
  FBtnProjFile.Text:= '...';
  FBtnProjFile.Corners:= [];
  FBtnProjFile.OnClick:=@onBtnProjFileClick;

  FLblProjName := TD2Text(createD2VO(FLayCommon, TD2Text, 24, 48, 90, 32));
  FLblProjName.setup('Project Name');
  FTxtProjName := TD2HudTextBox(createD2VO(FLayCommon, TD2HudTextBox, 120, 50, 343, 28));
  FBtnProjName := TD2HudCornerButton(createD2VO(FLayCommon, TD2HudCornerButton, 463, 50, 40, 28));
  FBtnProjName.Text:= '...';
  FBtnProjName.Corners:= [];
  FBtnProjName.OnClick:=@onBtnProjNameClick;

  FLblScheme := TD2Text(createD2VO(FLayCommon, TD2Text, 24, 80, 90, 32));
  FLblScheme.setup('Scheme Name');
  FTxtScheme := TD2HudTextBox(createD2VO(FLayCommon, TD2HudTextBox, 120, 82, 383, 28));

  FLblBitCode := TD2Text(createD2VO(FLayCommon, TD2Text, 24, 112, 90, 32));
  FLblBitCode.setup('Enable BitCode');
  FChkBitCode := TD2HudCheckBox(createD2VO(FLayCommon, TD2HudCheckBox, 120, 114, 28, 28));

  FLayChannel:= TD2HudGroupBox(createD2VO(Root, TD2HudGroupBox, 0, 0, 0, 68, vaMostBottom, 0, 8, 8, 8));
  FLayChannel.Text:= 'Publish Channels';

  FBtnChAppStore:= TD2HudCornerButton(createD2VO(FLayChannel, TD2HudCornerButton, 0, 0, 120, 0, vaLeft, 24, 24, 0, 8));
  FBtnChAppStore.Text:= 'AppStore';
  FBtnChAppStore.Corners:= [];
  FBtnChAppStore.OnClick:=@onBtnAppStoreClick;
  FBtnChPgyer:= TD2HudCornerButton(createD2VO(FLayChannel, TD2HudCornerButton, 120, 0, 120, 0, vaLeft, 0, 24, 0, 8));
  FBtnChPgyer.Text:= 'Pgyer';
  FBtnChPgyer.Corners:= [];
  FBtnChPgyer.OnClick:=@onBtnPgyerClick;
  FBtnChEnterprise:= TD2HudCornerButton(createD2VO(FLayChannel, TD2HudCornerButton, 240, 0, 120, 0, vaLeft, 0, 24, 0, 8));
  FBtnChEnterprise.Text:= 'Enterprise';
  FBtnChEnterprise.Corners:= [];
  FBtnChEnterprise.OnClick:=@onBtnEnterpriseClick;
  FBtnChFirIm:= TD2HudCornerButton(createD2VO(FLayChannel, TD2HudCornerButton, 360, 0, 120, 0, vaLeft, 0, 24, 0, 8));
  FBtnChFirIm.Text:= 'Fir.im';
  FBtnChFirIm.Corners:= [];
  FBtnChFirIm.OnClick:=@onBtnFirImClick;

end;

procedure TFormMain.onBtnProjSaveClick(Sender: TObject);
var
  iniPath: string;
begin
  // save
  if (FCurrentPath = '') then Exit;
  iniPath:= FCurrentPath + 'iospub.cfg';
  ioscfg.ProjFile:= FTxtProjFile.Text;
  ioscfg.ProjName:= FTxtProjName.Text;
  ioscfg.SchemeName:= FTxtScheme.Text;
  ioscfg.BitCode:= FChkBitCode.IsChecked;
  ioscfg.saveCfg(iniPath);
end;

procedure TFormMain.onBtnProjFileClick(Sender: TObject);
begin
  if (FCurrentPath = '') then Exit;
  with TOpenDialog.Create(nil) do begin
    InitialDir:= FCurrentPath;
    Filter:= 'xcodeproj|*.xcodeproj|xcworkspace|*.xcworkspace|all|*.*';
    if (Execute) then begin
      FTxtProjFile.Text:= ExtractFileName(FileName);
    end;
    Free;
  end;
end;

procedure TFormMain.onBtnAppStoreClick(Sender: TObject);
begin
  if (FCurrentPath = '') then Exit;
  with TFormAppStore.Create(nil) do begin
    ShowModal;
    Free;
  end;
end;

procedure TFormMain.onBtnEnterpriseClick(Sender: TObject);
begin
  if (FCurrentPath = '') then Exit;
  with TFormEnterprise.Create(nil) do begin
    ShowModal;
    Free;
  end;
end;

procedure TFormMain.onBtnFirImClick(Sender: TObject);
begin
  if (FCurrentPath = '') then Exit;
  with TFormFirIm.Create(nil) do begin
    InitDir:= FCurrentPath;
    ShowModal;
    Free;
  end;
end;

procedure TFormMain.onBtnPgyerClick(Sender: TObject);
begin
  if (FCurrentPath = '') then Exit;
  with TFormPgyer.Create(nil) do begin
    ShowModal;
    Free;
  end;
end;

procedure TFormMain.onBtnProjNameClick(Sender: TObject);
begin
  if (FCurrentPath = '') then Exit;
  with TOpenDialog.Create(nil) do begin
    InitialDir:= FCurrentPath;
    Filter := 'xcodeproj|*.xcodeproj';
    if (Execute) then begin
      FTxtProjName.Text:= ExtractFileNameWithoutExt(ExtractFileName(FileName));
    end;
    Free;
  end;
end;

procedure TFormMain.loadCfg();
var
  iniPath: string;
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

  ioscfg.loadCfg(iniPath);
  // load UI
  FTxtProjFile.Text:= ioscfg.ProjFile;
  FTxtProjName.Text:= ioscfg.ProjName;
  FTxtScheme.Text:= ioscfg.SchemeName;
  FChkBitCode.IsChecked:= ioscfg.BitCode;

end;

procedure TFormMain.onBtnProjPathClick(sender: TObject);
begin
  with TSelectDirectoryDialog.Create(nil) do begin
    if (Execute) then begin
      if (isUnderProjectPath(FileName)) then begin
        FCurrentPath:= FileName;
        if (not FCurrentPath.EndsWith('/')) then FCurrentPath += '/';
        FLblProjPath.Text:= FCurrentPath;
        loadCfg();
      end else begin
        MessageDlg('Error', 'Not an iOS project path.', mtError, [mbOK], 0);
      end;
    end;
    Free;
  end;
end;

end.

