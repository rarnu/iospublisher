unit frmFirIm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, frmBase, orca_scene2d, orcautils, modulecfg;

type

  { TFormFirIm }

  TFormFirIm = class(TFormBase)
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FInitDir: string;
    FLblProvisionKey: TD2Text;
    FLblProvisionValue: TD2Text;
    FLblCertificate: TD2Text;
    FLblTeamId: TD2Text;
    FLblAutoSign: TD2Text;

    FLblBundleId: TD2Text;
    FLblInfoPlist: TD2Text;
    FLblIcon: TD2Text;
    FLblApiToken: TD2Text;

    FTxtProvisionKey: TD2HudTextBox;
    FTxtProvisionValue: TD2HudTextBox;
    FTxtCertificate: TD2HudTextBox;
    FTxtTeamId: TD2HudTextBox;
    FChkAutoSign: TD2HudCheckBox;

    FTxtBundleId: TD2HudTextBox;
    FTxtInfoPlist: TD2HudTextBox;
    FTxtIcon: TD2HudTextBox;
    FTxtApiToken: TD2HudTextBox;

    FBTnInfoPlist: TD2HudCornerButton;
    FBtnIcon: TD2HudCornerButton;
    procedure onBtnIconClick(Sender: TObject);
    procedure onBtnInfoPlistClick(Sender: TObject);
  public
    property InitDir: string read FInitDir write FInitDir;
  end;

var
  FormFirIm: TFormFirIm;

implementation

{$R *.frm}

{ TFormFirIm }

procedure TFormFirIm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  ioscfg.FirProvisionKey:= FTxtProvisionKey.Text;
  ioscfg.FirProvisionValue:= FTxtProvisionValue.Text;
  ioscfg.FirCertificate:= FTxtCertificate.Text;
  ioscfg.FirTeamId:= FTxtTeamId.Text;
  ioscfg.FirAutoSign:= FChkAutoSign.IsChecked;
  ioscfg.FirBundleId:= FTxtBundleId.Text;
  ioscfg.FirInfoPlist:= FTxtInfoPlist.Text;
  ioscfg.FirIcon:= FTxtIcon.Text;
  ioscfg.FirApiToken:= FTxtApiToken.Text;
end;

procedure TFormFirIm.FormCreate(Sender: TObject);
begin
  inherited;
  Width:= 460;
  Height:= 356;
  Window.Text:= 'Fir.im Config';

  FLblProvisionKey := TD2Text(createD2VO(Root, TD2Text, 8, 8, 90, 32));
  FLblProvisionKey.setup('Provision Key');
  FTxtProvisionKey := TD2HudTextBox(createD2VO(Root, TD2HudTextBox, 120, 10, 300, 28));
  FTxtProvisionKey.ShowHint:= True;
  FTxtProvisionKey.Hint:= 'in exportOptions.plist [provisioningProfiles.key]';

  FLblProvisionValue := TD2Text(createD2VO(Root, TD2Text, 8, 40, 90, 32));
  FLblProvisionValue.setup('Provision Value');
  FTxtProvisionValue := TD2HudTextBox(createD2VO(Root, TD2HudTextBox, 120, 42, 300, 28));
  FTxtProvisionValue.ShowHint:= True;
  FTxtProvisionValue.Hint:= 'in exportOptions.plist [provisioningProfiles.value]';

  FLblCertificate := TD2Text(createD2VO(Root, TD2Text, 8, 72, 90, 32));
  FLblCertificate.setup('Certificate');
  FTxtCertificate := TD2HudTextBox(createD2VO(Root, TD2HudTextBox, 120, 74, 300, 28));
  FTxtCertificate.ShowHint:= True;
  FTxtCertificate.Hint:= 'in exportOptions.plist [signingCertificate]';

  FLblTeamId := TD2Text(createD2VO(Root, TD2Text, 8, 104, 90, 32));
  FLblTeamId.setup('Team ID');
  FTxtTeamId := TD2HudTextBox(createD2VO(Root, TD2HudTextBox, 120, 106, 300, 28));
  FTxtTeamId.ShowHint:= True;
  FTxtTeamId.Hint:= 'in exportOptions.plist [teamID]';

  FLblAutoSign := TD2Text(createD2VO(Root, TD2Text, 8, 136, 90, 32));
  FLblAutoSign.setup('Autosign');
  FChkAutoSign := TD2HudCheckBox(createD2VO(Root, TD2HudCheckBox, 120, 138, 28, 28));

  FLblBundleId:= TD2Text(createD2VO(Root, TD2Text, 8, 168, 90, 32));
  FLblBundleId.setup('Bundle ID');
  FTxtBundleId := TD2HudTextBox(createD2VO(Root, TD2HudTextBox, 120, 170, 300, 28));

  FLblInfoPlist:= TD2Text(createD2VO(Root, TD2Text, 8, 200, 90, 32));
  FLblInfoPlist.setup('Info.plist');
  FTxtInfoPlist := TD2HudTextBox(createD2VO(Root, TD2HudTextBox, 120, 202, 260, 28));
  FBTnInfoPlist := TD2HudCornerButton(createD2VO(Root, TD2HudCornerButton, 380, 202, 40, 28));
  FBTnInfoPlist.Text:= '...';
  FBTnInfoPlist.Corners:= [];
  FBTnInfoPlist.OnClick:=@onBtnInfoPlistClick;

  FLblIcon:= TD2Text(createD2VO(Root, TD2Text, 8, 232, 90, 32));
  FLblIcon.setup('Icon');
  FTxtIcon := TD2HudTextBox(createD2VO(Root, TD2HudTextBox, 120, 234, 260, 28));
  FBtnIcon := TD2HudCornerButton(createD2VO(Root, TD2HudCornerButton, 380, 234, 40, 28));
  FBtnIcon.Text:= '...';
  FBtnIcon.Corners:= [];
  FBtnIcon.OnClick:=@onBtnIconClick;

  FLblApiToken:= TD2Text(createD2VO(Root, TD2Text, 8, 264, 90, 32));
  FLblApiToken.setup('Api Token');
  FTxtApiToken := TD2HudTextBox(createD2VO(Root, TD2HudTextBox, 120, 266, 300, 28));

  // load
  FTxtProvisionKey.Text:= ioscfg.FirProvisionKey;
  FTxtProvisionValue.Text:= ioscfg.FirProvisionValue;
  FTxtCertificate.Text:= ioscfg.FirCertificate;
  FTxtTeamId.Text:= ioscfg.FirTeamId;
  FChkAutoSign.IsChecked:= ioscfg.FirAutoSign;
  FTxtBundleId.Text:= ioscfg.FirBundleId;
  FTxtInfoPlist.Text:= ioscfg.FirInfoPlist;
  FTxtIcon.Text:= ioscfg.FirIcon;
  FTxtApiToken.Text:= ioscfg.FirApiToken;

end;

procedure TFormFirIm.onBtnInfoPlistClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do begin
    InitialDir:= FInitDir;
    Filter:= 'plist|*.plist';
    if (Execute) then begin
      FTxtInfoPlist.Text:= FileName.Replace(FInitDir, '');
    end;
    Free;
  end;
end;

procedure TFormFirIm.onBtnIconClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do begin
    InitialDir:= FInitDir;
    Filter:= 'png|*.png';
    if (Execute) then begin
      FTxtIcon.Text:= FileName.Replace(FInitDir, '');
    end;
    Free;
  end;
end;

end.

