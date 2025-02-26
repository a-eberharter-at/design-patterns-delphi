program Structural.Adapter.Pattern;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Pattern in 'Pattern.pas';

var
  adaptee: TAdaptee;
  target: ITarget;

begin
  ReportMemoryLeaksOnShutDown := DebugHook <> 0;
  try
    adaptee := TAdaptee.Create;
    try
      WriteLn('Before the new standard' + #13#10 + 'Precise reading:'); //#13 is CR, #10 equals new LF, #0 equals NULL, #9 equals TAB
      WriteLn(adaptee.SpecificRequest(5, 3));

      target := TAdapter.Create;
      WriteLn(#10 + 'Moving to new standard');
      WriteLn(target.Request(5));

      ReadLn;
    finally
       adaptee.Free;
    end; 
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
