unit Pattern;

interface

type
  IPrototype = interface
  ['{3D94E6F0-EC5C-4D3D-B2D7-33475B2A9C98}']
    function Clone: IPrototype;
    function GetDescription: string;
    procedure SetData(const AData: string);
    function GetData: string;
  end;

  TConcretePrototype = class(TInterfacedObject, IPrototype)
  private
    FData: string;
  public
    constructor Create(const AData: string);
    function Clone: IPrototype;
    function GetDescription: string;
    procedure SetData(const AData: string);
    function GetData: string;
  end;

implementation

{ TConcretePrototype }

constructor TConcretePrototype.Create(const AData: string);
begin
  FData := AData;
end;

function TConcretePrototype.Clone: IPrototype;
begin
  Result := TConcretePrototype.Create(Self.FData);
end;

function TConcretePrototype.GetDescription: string;
begin
  Result := 'Cloned object with data: ' + FData;
end;

procedure TConcretePrototype.SetData(const AData: string);
begin
  FData := AData;
end;

function TConcretePrototype.GetData: string;
begin
  Result := FData;
end;

end.

