program Creational.Prototype.Pattern;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Pattern in 'Pattern.pas';

var
  prototypeA, clonedA: IPrototype;
  prototypeB, clonedB: IPrototype;

begin
  try
    // Create initial prototypes
    prototypeA := TConcretePrototypeA.Create;
    prototypeB := TConcretePrototypeB.Create;

    // Clone the prototypes
    clonedA := prototypeA.Clone;
    clonedB := prototypeB.Clone;

    // Output results
    Writeln(prototypeA.GetDescription);
    Writeln(clonedA.GetDescription);
    Writeln(prototypeB.GetDescription);
    Writeln(clonedB.GetDescription);

    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

