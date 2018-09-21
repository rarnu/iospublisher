unit moduleCommand;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, process;

procedure clean();
procedure compileProject(buildPath:string; work: string; schemaName: string; projectName: string);
procedure buildIpa(buildPath: string; projectPath: string; projectName: string; ipaPath: string; plistPath: string);
procedure validateApp(ipaPath: string; schemaName: string; userName: string; userPass: string);
procedure uploadApp(ipaPath: string; schemaName: string; userName: string; userPass: string);

implementation

const
  BUFSIZE = 1024;
  ALTOOLPATH = '/Applications/Xcode.app/Contents/Applications/Application Loader.app/Contents/Frameworks/ITunesSoftwareService.framework/Versions/A/Support/altool';

procedure innerRunCmd(cmd: string; params: TStringList);
var
  p: TProcess;
  byteRead: LongInt;
  buf: array[0..BUFSIZE - 1] of Byte;
  outstr: string = '';
begin
  p := TProcess.Create(nil);
  p.Executable:= cmd;
  p.Parameters.Assign(params);
  p.Options:= [poUsePipes, poStderrToOutPut];
  p.Execute;
  while (True) do begin
    byteRead:= p.Output.Read(buf, BUFSIZE);
    if (byteRead = 0) then Break;
    SetLength(outstr, byteRead);
    Move(buf[0], outstr[1], byteRead);
    Write(outstr);
  end;
  p.Free;
end;

procedure clean();
var
  params: TStringList;
begin
  params := TStringList.Create;
  params.Clear;
  params.Add('clean');
  params.Add('-configuration');
  params.Add('Release');
  innerRunCmd('xcodebuild', params);
  params.Free;
end;

procedure compileProject(buildPath:string; work: string; schemaName: string; projectName: string);
var
  params: TStringList;
begin
  params := TStringList.Create;
  params.Clear;
  params.Add('archive');
  if (work.EndsWith('.xcodeproj')) then begin
    params.Add('-project');
    params.Add(work);
  end else begin
    params.Add('-workspace');
    params.Add(work);
  end;
  params.Add('-scheme');
  params.Add(schemaName);
  params.Add('-configuration');
  params.Add('Release');
  params.Add('-archivePath');
  params.Add(buildPath + '/' + projectName + '.xcarchive');
  innerRunCmd('xcodebuild', params);
  params.Free;
end;

procedure buildIpa(buildPath: string; projectPath: string; projectName: string; ipaPath: string; plistPath: string);
var
  params: TStringList;
begin
  params := TStringList.Create;
  params.Clear;
  params.Add('-exportArchive');
  params.Add('-archivePath');
  params.Add(buildPath + '/' + projectName + '.xcarchive');
  params.Add('-configuration');
  params.Add('Release');
  params.Add('-exportPath');
  params.Add(ipaPath);
  params.Add('-exportOptionsPlist');
  params.Add(plistPath);
  innerRunCmd('xcodebuild', params);
  params.Free;
end;

procedure validateApp(ipaPath: string; schemaName: string; userName: string; userPass: string);
var
  params: TStringList;
begin
  params := TStringList.Create;
  params.Clear;
  params.Add('--validate-app');
  params.Add('-f');
  params.Add(ipaPath + '/' + schemaName + '.ipa');
  params.Add('-u');
  params.Add(userName);
  params.Add('-p');
  params.Add(userPass);
  params.Add('-t');
  params.Add('ios');
  params.Add('--output-format');
  params.Add('xml');
  innerRunCmd(ALTOOLPATH, params);
  params.Free;
end;

procedure uploadApp(ipaPath: string; schemaName: string; userName: string; userPass: string);
var
  params: TStringList;
begin
  params := TStringList.Create;
  params.Clear;
  params.Add('--upload-app');
  params.Add('-f');
  params.Add(ipaPath + '/' + schemaName + '.ipa');
  params.Add('-u');
  params.Add(userName);
  params.Add('-p');
  params.Add(userPass);
  params.Add('-t');
  params.Add('ios');
  params.Add('--output-format');
  params.Add('xml');
  innerRunCmd(ALTOOLPATH, params);
  params.Free;
end;

end.

