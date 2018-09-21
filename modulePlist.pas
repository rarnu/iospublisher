unit modulePlist;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

procedure generatePlistEnterprise(ABitcode: Boolean; AProvisionKey: string; AProvisionValue: string; ACertificate: string; ATeamId: string; AAuto: Boolean);
procedure generatePlist(ABitcode: Boolean; AProvisionKey: string; AProvisionValue: string; ACertificate: string; ATeamId: string);

implementation

procedure generatePlistEnterprise(ABitcode: Boolean; AProvisionKey: string; AProvisionValue: string; ACertificate: string; ATeamId: string; AAuto: Boolean);
var
  path: string;
begin
  path := GetCurrentDir;
  if (not path.EndsWith('/')) then path += '/';
  path += 'export.plist';
  with TStringList.Create do begin
    Clear;
    Add('<?xml version="1.0" encoding="UTF-8"?>');
    Add('<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">');
    Add('<plist version="1.0">');
    Add('<dict>');
    Add('    <key>method</key>');
    Add('    <string>enterprise</string>');
    Add('    <key>compileBitcode</key>');
    if (ABitcode) then Add('    <true/>') else Add('    <false/>');
    if (AAuto) then begin
      Add('    <key>signingStyle</key>');
      Add('    <string>automatic</string>');
    end else begin
      Add('    <key>provisioningProfiles</key>');
      Add('    <dict>');
      Add(Format('        <key>%s</key>', [AProvisionKey]));
      Add(Format('        <string>%s</string>', [AProvisionValue]));
      Add('    </dict>');
      Add('    <key>signingCertificate</key>');
      Add(Format('    <string>%s</string>', [ACertificate]));
      Add('    <key>signingStyle</key>');
      Add('    <string>manual</string>');
    end;
    Add('    <key>stripSwiftSymbols</key>');
    Add('    <true/>');
    Add('    <key>teamID</key>');
    Add(Format('    <string>%s</string>', [ATeamId]));
    Add('    <key>thinning</key>');
    Add('    <string>&lt;none&gt;</string>');
    Add('</dict>');
    Add('</plist>');
    SaveToFile(path);
    Free;
  end;
end;

procedure generatePlist(ABitcode: Boolean; AProvisionKey: string; AProvisionValue: string; ACertificate: string; ATeamId: string);
var
  path: string;
begin
  path := GetCurrentDir;
  if (not path.EndsWith('/')) then path += '/';
  path += 'export.plist';
  with TStringList.Create do begin
    Clear;
    Add('<?xml version="1.0" encoding="UTF-8"?>');
    Add('<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">');
    Add('<plist version="1.0">');
    Add('<dict>');
    Add('    <key>method</key>');
    Add('    <string>app-store</string>');
    Add('    <key>compileBitcode</key>');
    if (ABitcode) then Add('    <true/>') else Add('    <false/>');
    Add('    <key>provisioningProfiles</key>');
    Add('    <dict>');
    Add(Format('        <key>%s</key>', [AProvisionKey]));
    Add(Format('        <string>%s</string>', [AProvisionValue]));
    Add('    </dict>');
    Add('    <key>signingCertificate</key>');
    Add(Format('    <string>%s</string>', [ACertificate]));
    Add('    <key>signingStyle</key>');
    Add('    <string>manual</string>');
    Add('    <key>stripSwiftSymbols</key>');
    Add('    <true/>');
    Add('    <key>teamID</key>');
    Add(Format('    <string>%s</string>', [ATeamId]));
    Add('    <key>uploadSymbols</key>');
    Add('    <true/>');
    Add('</dict>');
    Add('</plist>');
    SaveToFile(path);
    Free;
  end;
end;

end.

