unit frmEnterprise;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, frmBase, orca_scene2d, orcautils, modulecfg;

type

  { TFormEnterprise }

  TFormEnterprise = class(TFormBase)
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FLblProvisionKey: TD2Text;
    FLblProvisionValue: TD2Text;
    FLblCertificate: TD2Text;
    FLblTeamId: TD2Text;
    FLblAutoSign: TD2Text;

    FTxtProvisionKey: TD2HudTextBox;
    FTxtProvisionValue: TD2HudTextBox;
    FTxtCertificate: TD2HudTextBox;
    FTxtTeamId: TD2HudTextBox;
    FChkAutoSign: TD2HudCheckBox;

  public

  end;

var
  FormEnterprise: TFormEnterprise;

implementation

{$R *.frm}

{ TFormEnterprise }

procedure TFormEnterprise.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  ioscfg.EnterpriseProvisionKey:= FTxtProvisionKey.Text;
  ioscfg.EnterpriseProvisionValue:= FTxtProvisionValue.Text;
  ioscfg.EnterpriseCertificate:= FTxtCertificate.Text;
  ioscfg.EnterpriseTeamId:= FTxtTeamId.Text;
  ioscfg.EnterpriseAutoSign:= FChkAutoSign.IsChecked;
end;

procedure TFormEnterprise.FormCreate(Sender: TObject);
begin
  inherited;
  Width:= 460;
  Height:= 228;
  Window.Text:= 'Enterprise Config';

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

  // load
  FTxtProvisionKey.Text:= ioscfg.EnterpriseProvisionKey;
  FTxtProvisionValue.Text:= ioscfg.EnterpriseProvisionValue;
  FTxtCertificate.Text:= ioscfg.EnterpriseCertificate;
  FTxtTeamId.Text:= ioscfg.EnterpriseTeamId;
  FChkAutoSign.IsChecked:= ioscfg.EnterpriseAutoSign;
end;

end.

