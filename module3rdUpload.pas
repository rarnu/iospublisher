unit module3rdUpload;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fphttpclient, fpjson, jsonparser, jsonscanner;

procedure uploadPgyer(ipaPath: string; schemaName: string; ukey: string; apikey: string);
procedure uploadFirIcon(iconPath: string; key: string; token: string; url: string);
procedure uploadFirIpa(ipaPath: string; schemeName: string; key: string; token: string; url: string; plistPath: string);
procedure uploadFir(ipaPath: string; iconPath: string; schemeName: string; bundleId: string; apiToken: string; plistPath: string);

implementation

procedure uploadPgyer(ipaPath: string; schemaName: string; ukey: string; apikey: string);
const
  UPLOAD_URL = 'http://www.pgyer.com/apiv1/app/upload';
var
  params: TStringList;
  ss: TStringStream;
  logstr: string;
begin
  params := TStringList.Create;
  params.Add(Format('uKey=%s', [ukey]));
  params.Add(Format('_api_key=%s', [apikey]));
  params.Add('publishRange=2');
  ss := TStringStream.Create('');
  with TFPHTTPClient.Create(nil) do begin
    try
      FileFormPost(UPLOAD_URL, params, 'file', ipaPath + '/' + schemaName + '.ipa', ss);
    except
      on e: Exception do begin
        WriteLn('Upload error: ' + e.Message);
      end;
    end;
    Free;
  end;
  logstr:= ss.DataString;
  WriteLn(logstr);
  ss.Free;
  params.Free;
end;

procedure uploadFirIcon(iconPath: string; key: string; token: string; url: string);
var
  ss: TStringStream;
  params: TStringList;
begin
  with TFPHTTPClient.Create(nil) do begin
    ss := TStringStream.Create('');
    params := TStringList.Create;
    params.Add(Format('key=%s', [key]));
    params.Add(Format('token=%s', [token]));
    try
      FileFormPost(url, params, 'file', iconPath, ss);
      WriteLn(ss.DataString);
    except
      on E: Exception do WriteLn('Upload Icon Error: ' + E.Message);
    end;
    params.Free;
    ss.Free;
    Free;
  end;
end;

procedure extractInfoPlist(plistPath: string; out versionCode: Integer; out versionName: string);
var
  sl: TStringList;
  i: Integer;
begin
  sl := TStringList.Create;
  sl.LoadFromFile(plistPath);
  for i:= 0 to sl.Count - 1 do begin
    if (sl[i].Contains('<key>CFBundleShortVersionString</key>')) then begin
      versionName:= sl[i + 1].Replace('<string>', '').Replace('</string>', '').Trim;
    end;
    if (sl[i].Contains('<key>CFBundleVersion</key>')) then begin
      versionCode:= StrToIntDef(sl[i + 1].Replace('<string>', '').Replace('</string>', '').Trim, 0);
    end;
  end;
  sl.Free;
end;

procedure uploadFirIpa(ipaPath: string; schemeName: string; key: string; token: string; url: string; plistPath: string);
var
  vCode: Integer;
  vName: string;
  ss: TStringStream;
  params: TStringList;
begin
  extractInfoPlist(plistPath, vCode, vName);
  with TFPHTTPClient.Create(nil) do begin
    ss := TStringStream.Create('');
    params := TStringList.Create;
    params.Add(Format('key=%s', [key]));
    params.Add(Format('token=%s', [token]));
    params.Add(Format('x:name=%s', [schemeName]));
    params.Add(Format('x:version=%s', [vName]));
    params.Add(Format('x:build=%d', [vCode]));
    params.Add('x:release_type=Inhouse');
    try
      FileFormPost(url, params, 'file', ipaPath, ss);
      WriteLn(ss.DataString);
    except
      on E: Exception do WriteLn('Upload IPA Error: ' + E.Message);
    end;
    params.Free;
    ss.Free;
    Free;
  end;
end;

procedure uploadFir(ipaPath: string; iconPath: string; schemeName: string; bundleId: string; apiToken: string; plistPath: string);
var
  ss: TStringStream;
  retjson: string = '';
  json: TJSONObject = nil;
  jCertIcon: TJSONObject;
  jCertBinary: TJSONObject;
  parser: TJSONParser = nil;
begin
  with TFPHTTPClient.Create(nil) do begin
    AddHeader('Content-Type', 'application/json');
    ss := TStringStream.Create(Format('{"type":"ios", "bundle_id":"%s", "api_token":"%s"}', [bundleId, apiToken]));
    RequestBody := ss;
    try
      retjson := Post('http://api.fir.im/apps');
    except
    end;
    ss.Free;
    Free;
  end;
  if (retjson = '') or (retjson.Contains('errors')) then begin
    WriteLn('Error: ' + retjson);
    Exit;
  end;
  try
    try
      parser := TJSONParser.Create(retjson, [joUTF8]);
      json := TJSONObject(parser.Parse);
      jCertIcon := json.Objects['cert'].Objects['icon'];
      uploadFirIcon(iconPath, jCertIcon.Strings['key'], jCertIcon.Strings['token'], jCertIcon.Strings['upload_url']);
      jCertBinary := json.Objects['cert'].Objects['binary'];
      uploadFirIpa(ipaPath + '/' + schemeName + '.ipa', schemeName, jCertBinary.Strings['key'], jCertBinary.Strings['token'], jCertBinary.Strings['upload_url'], plistPath);
    except
    end;
  finally
    if (json <> nil) then json.Free;
    if (parser <> nil) then parser.Free;
  end;
end;

end.

