unit frmAppStore;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, frmBase, orca_scene2d, orcautils, modulecfg;

type

  { TFormAppStore }

  TFormAppStore = class(TFormBase)
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FLblProvisionKey: TD2Text;
    FLblProvisionValue: TD2Text;
    FLblCertificate: TD2Text;
    FLblTeamId: TD2Text;
    FLblAccount: TD2Text;
    FLblPassword: TD2Text;

    FTxtProvisionKey: TD2HudTextBox;
    FTxtProvisionValue: TD2HudTextBox;
    FTxtCertificate: TD2HudTextBox;
    FTxtTeamId: TD2HudTextBox;
    FTxtAccount: TD2HudTextBox;
    FTxtPassword: TD2HudTextBox;
  public

  end;

var
  FormAppStore: TFormAppStore;

implementation

{$R *.frm}

{ TFormAppStore }

procedure TFormAppStore.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  ioscfg.AppStoreProvisionKey:= FTxtProvisionKey.Text;
  ioscfg.AppStoreProvisionValue:= FTxtProvisionValue.Text;
  ioscfg.AppStoreCertificate:= FTxtCertificate.Text;
  ioscfg.AppStoreTeamId:= FTxtTeamId.Text;
  ioscfg.AppStoreAccount:= FTxtAccount.Text;
  ioscfg.AppStorePassword:= FTxtPassword.Text;
end;

procedure TFormAppStore.FormCreate(Sender: TObject);
begin
  inherited;
  // init form
  Width:= 460;
  Height:= 260;
  Window.Text:= 'AppStore Config';

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

  FLblAccount := TD2Text(createD2VO(Root, TD2Text, 8, 136, 90, 32));
  FLblAccount.setup('Account');
  FTxtAccount := TD2HudTextBox(createD2VO(Root, TD2HudTextBox, 120, 138, 300, 28));

  FLblPassword := TD2Text(createD2VO(Root, TD2Text, 8, 168, 90, 32));
  FLblPassword.setup('Password');
  FTxtPassword := TD2HudTextBox(createD2VO(Root, TD2HudTextBox, 120, 170, 300, 28));

  // load
  FTxtProvisionKey.Text:= ioscfg.AppStoreProvisionKey;
  FTxtProvisionValue.Text:= ioscfg.AppStoreProvisionValue;
  FTxtCertificate.Text:= ioscfg.AppStoreCertificate;
  FTxtTeamId.Text:= ioscfg.AppStoreTeamId;
  FTxtAccount.Text:= ioscfg.AppStoreAccount;
  FTxtPassword.Text:= ioscfg.AppStorePassword;

end;

end.

