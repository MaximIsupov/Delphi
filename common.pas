unit common;

interface

const
  DecimalSeparator = '.'; // = ��� ��� ���������


function CheckStrToFloat(s : string) : boolean;

implementation
uses
  System.SysUtils;

function CheckStrToFloat(s : string) : boolean;
begin
  try
    StrToFloat(s);
    Result := True;  // Result ������������ ��������
  except
    Result := False;
  end;
end;

end.
