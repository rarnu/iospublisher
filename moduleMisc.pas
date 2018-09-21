unit moduleMisc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function isUnderProjectPath(): Boolean;
procedure generateDefaultConfig();
procedure writeHelp();

implementation

function isUnderProjectPath(): Boolean;
var
  path: string;
  src: TSearchRec;
  ret: Boolean = False;
begin
  path := GetCurrentDir;
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


procedure generateDefaultConfig();
begin
  with TStringList.Create do begin
    Add('[Common]');
    Add('ProjectFile=');
    Add('ProjectName=');
    Add('SchemeName=');
    Add('EnableBitcode=');
    Add('');
    Add('[AppStore]');
    Add('ProvisionKey=');
    Add('ProvisionValue=');
    Add('Certificate=');
    Add('TeamID=');
    Add('Account=');
    Add('Password=');
    Add('');
    Add('[Pgyer]');
    Add('ProvisionKey=');
    Add('ProvisionValue=');
    Add('Certificate=');
    Add('TeamID=');
    Add('Auto=');
    Add('UKey=');
    Add('ApiKey=');
    Add('');
    Add('[Enterprise]');
    Add('ProvisionKey=');
    Add('ProvisionValue=');
    Add('Certificate=');
    Add('TeamID=');
    Add('Auto=');
    Add('');
    Add('[Fir]');
    Add('ProvisionKey=');
    Add('ProvisionValue=');
    Add('Certificate=');
    Add('TeamID=');
    Add('Auto=');
    Add('InfoPList=');
    Add('Icon=');
    Add('BundleID=');
    Add('ApiToken=');
    Add('');
    SaveToFile('iospub.cfg');
    Free;
  end;
end;

procedure writeHelp();
begin
  WriteLn('Usage: iospublisher (v2.0.0) / Scarlett');
  WriteLn('');
  WriteLn('    iospublisher init/build [appstore/pgyer/enterprise/fir]');
  WriteLn('');
  WriteLn('    you must init a project first and fill all parameters in iospub.cfg');
  WriteLn('');
end;

end.

