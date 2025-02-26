program Creational.Prototype.Pattern;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Pattern in 'Pattern.pas';

var
  Original, Cloned: IPrototype;

begin
  try
    Original := TConcretePrototype.Create('Initial Data');

    Cloned := Original.Clone;

    Cloned.SetData('Modified Clone Data');

    Writeln('Original: ', Original.GetDescription);
    Writeln('Cloned: ', Cloned.GetDescription);

    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

