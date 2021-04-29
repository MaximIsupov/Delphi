unit common;

interface

const
  DecimalSeparator = '.'; // = так как константа


function CheckStrToFloat(s : string) : boolean;

implementation
uses
  System.SysUtils;

function CheckStrToFloat(s : string) : boolean;
begin
  try
    StrToFloat(s);
    Result := True;  // Result возвращается функцией
  except
    Result := False;
  end;
end;

end.
