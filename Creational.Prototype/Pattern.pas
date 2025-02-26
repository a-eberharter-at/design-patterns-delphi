unit Pattern;

interface

type
  IPrototype = interface
  ['{3D94E6F0-EC5C-4D3D-B2D7-33475B2A9C98}']
    function Clone: IPrototype;
    function GetDescription: string;
  end;

  TConcretePrototypeA = class(TInterfacedObject, IPrototype)
  public
    function Clone: IPrototype;
    function GetDescription: string;
  end;

  TConcretePrototypeB = class(TInterfacedObject, IPrototype)
  public
    function Clone: IPrototype;
    function GetDescription: string;
  end;

implementation

{ TConcretePrototypeA }

function TConcretePrototypeA.Clone: IPrototype;
begin
  Result := TConcretePrototypeA.Create;
end;

function TConcretePrototypeA.GetDescription: string;
begin
  Result := 'Prototype A';
end;

{ TConcretePrototypeB }

function TConcretePrototypeB.Clone: IPrototype;
begin
  Result := TConcretePrototypeB.Create;
end;

function TConcretePrototypeB.GetDescription: string;
begin
  Result := 'Prototype B';
end;

end.
