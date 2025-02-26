unit Pattern;

interface

uses SysUtils;

type 
  TSingle = class (Tobject)
  public
    procedure WriteCount;
    class function NewInstance: TObject; override;
    procedure FreeInstance; override;
end;

implementation

var 
  Instance: TObject = nil;
  nCount: Integer = 0;

procedure TSingle.FreeInstance; 
begin
  Dec (nCount);
  if nCount = 0 then
  begin
    inherited FreeInstance; //Free the Singleton if no instances are active --> No Garbage collection, we can't just let it stay alive freely 'just in case'
    Instance := nil;
  end; 
end;

class function TSingle.NewInstance: TObject;
begin
  if not Assigned (Instance) then
    Instance := inherited NewInstance; 
  Result := Instance;
  Inc (nCount); 
end;

procedure TSingle.WriteCount;
begin
  WriteLn('Count = ' + IntToStr(nCount));
end;

end.
