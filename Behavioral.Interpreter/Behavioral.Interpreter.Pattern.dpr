program Behavioral.Interpreter.Pattern;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes,
  Pattern in 'Pattern.pas';

var
  roman: string;
  context: TContext;
  tree: TList;
  i: integer;

begin
  ReportMemoryLeaksOnShutDown := DebugHook <> 0;
  try
    roman := 'MCMXXVIII';
    context := TContext.Create(roman);
    tree := TList.Create;
    try
      tree.Add(TTousandExpression.Create);
      tree.Add(THundredExpression.Create);
      tree.Add(TTenExpression.Create);
      tree.Add(TOneExpression.Create);

      for i := 0 to tree.Count - 1 do begin
        TExpression(tree[i]).Interpret(context); //This is a typecast in Delphi 'TExpression(tree[i])'; Pointer 'tree[i]' points to object of type TExpression
      end;

      WriteLn(Format('%s = %d',[roman, context.FOutput]));
    finally
      context.Free;
      for I := 0 to tree.Count - 1 do begin
       TObject(tree[i]).Free; //No specific typecasting necessary (but works too) due to TObject also tells the compiler to treat it as an object.
      end;
      tree.Free;
      ReadLn;
    end;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
