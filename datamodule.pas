unit datamodule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBTable,
  IBX.IBDatabase, IBX.IBStoredProc, IBX.IBQuery;

type
  Tdm = class(TDataModule)
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
    tFirm: TIBTable;
    spFirmNew: TIBStoredProc;
    spFirmEdit: TIBStoredProc;
    spFirmDelete: TIBStoredProc;
    tFirmID: TIntegerField;
    tFirmNAME: TIBStringField;
    tFirmADDRESS: TIBStringField;
    tFirmINN: TIBStringField;
    tProducts: TIBTable;
    spProductsNew: TIBStoredProc;
    spProductsEdit: TIBStoredProc;
    spProductsDelete: TIBStoredProc;
    IBTransaction2: TIBTransaction;
    qFutura: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function FirmNew(inName, inAddress, ininn : string): integer;
    procedure FirmEdit(inID: integer; inName, inAddress, inINN: String);
    procedure FirmDelete(inID: integer);

    function ProductsNew(inName, inUnit : string; inVat : real): integer;
    procedure ProductsEdit(inID: integer; inName, inUnit: String; inVat: real);
    procedure ProductsDelete(inID: integer);
    procedure FuturaSelect(condition: string);
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure Tdm.FuturaSelect(condition: string);
begin
  if qFutura.Transaction.InTransaction then qFutura.Transaction.Rollback;
  qFutura.Close;
  qFutura.SQL.Clear;
  qFutura.SQL.Add('select * from futura');
  if condition<>'' then qFutura.SQL.Add('where '+condition);
  qFutura.Open;
  qFutura.FetchAll;
end;

function Tdm.ProductsNew(inName, inUnit: string; inVat: real): integer;
begin
  if spProductsNew.Params.FindParam('IN_NAME')=nil then
    spProductsNew.Params.CreateParam(ftString, 'IN_NAME', ptInput)
  else
  begin
    spProductsNew.ParamByName('IN_NAME').DataType:=ftString;
    spProductsNew.ParamByName('IN_NAME').ParamType:=ptInput;
  end;
  if spProductsNew.Params.FindParam('IN_UNIT')=nil then
    spProductsNew.Params.CreateParam(ftString, 'IN_UNIT', ptInput)
  else
  begin
    spProductsNew.ParamByName('IN_UNIT').DataType:=ftString;
    spProductsNew.ParamByName('IN_UNIT').ParamType:=ptInput;
  end;
    if spProductsNew.Params.FindParam('IN_VAT')=nil then
    spProductsNew.Params.CreateParam(ftFloat, 'IN_VAT', ptInput)
  else
  begin
    spProductsNew.ParamByName('IN_VAT').DataType:=ftFloat;
    spProductsNew.ParamByName('IN_VAT').ParamType:=ptInput;
  end;

  if spProductsNew.Params.FindParam('OUT_ID')=nil then
    spProductsNew.Params.CreateParam(ftInteger, 'OUT_ID', ptOutput)
  else
  begin
    spProductsNew.ParamByName('OUT_ID').DataType:=ftInteger;
    spProductsNew.ParamByName('OUT_ID').ParamType:=ptOutput;
  end;

  spProductsNew.ParamByName('IN_NAME').Value:=inName;
  spProductsNew.ParamByName('IN_UNIT').Value:=inUnit;
  spProductsNew.ParamByName('IN_VAT').Value:=inVat;

  if not spProductsNew.Transaction.InTransaction then
    spProductsNew.Transaction.StartTransaction;
  spProductsNew.ExecProc;
  Result:=spProductsNew.ParamByName('OUT_ID').AsInteger;
  if spProductsNew.Transaction.InTransaction then
    spProductsNew.Transaction.Commit;
end;


procedure Tdm.ProductsEdit(inID: integer; inName, inUnit: String; inVat: real);
begin
  if spProductsEdit.Params.FindParam('IN_NAME')=nil then
    spProductsEdit.Params.CreateParam(ftString, 'IN_NAME', ptInput)
  else
  begin
    spProductsEdit.ParamByName('IN_NAME').DataType:=ftString;
    spProductsEdit.ParamByName('IN_NAME').ParamType:=ptInput;
  end;
  if spProductsEdit.Params.FindParam('IN_UNIT')=nil then
    spProductsEdit.Params.CreateParam(ftString, 'IN_UNIT', ptInput)
  else
  begin
    spProductsEdit.ParamByName('IN_UNIT').DataType:=ftString;
    spProductsEdit.ParamByName('IN_UNIT').ParamType:=ptInput;
  end;
  if spProductsNew.Params.FindParam('IN_VAT')=nil then
    spProductsNew.Params.CreateParam(ftFloat, 'IN_VAT', ptInput)
  else
  begin
    spProductsNew.ParamByName('IN_VAT').DataType:=ftFloat;
    spProductsNew.ParamByName('IN_VAT').ParamType:=ptInput;
  end;


  if spProductsEdit.Params.FindParam('IN_ID')=nil then
    spProductsEdit.Params.CreateParam(ftInteger, 'IN_ID', ptInput)
  else
  begin
    spProductsEdit.ParamByName('IN_ID').DataType:=ftInteger;
    spProductsEdit.ParamByName('IN_ID').ParamType:=ptInput;
  end;

  spProductsEdit.ParamByName('IN_ID').AsInteger:=inID;
  spProductsEdit.ParamByName('IN_NAME').Value:=inName;
  spProductsEdit.ParamByName('IN_UNIT').Value:=inUnit;
  spProductsEdit.ParamByName('IN_VAT').Value:=inVat;

  if not spProductsEdit.Transaction.InTransaction then
    spProductsEdit.Transaction.StartTransaction;
  spProductsEdit.ExecProc;

  if spProductsEdit.Transaction.InTransaction then
    spProductsEdit.Transaction.Commit;
end;


procedure Tdm.ProductsDelete(inID: integer);
begin
  if spProductsDelete.Params.FindParam('IN_ID')=nil then
    spProductsDelete.Params.CreateParam(ftInteger, 'IN_ID', ptInput)
  else
  begin
    spProductsDelete.ParamByName('IN_ID').DataType:=ftInteger;
    spProductsDelete.ParamByName('IN_ID').ParamType:=ptInput;
  end;

  spProductsDelete.ParamByName('IN_ID').AsInteger:=inID;

  if not spProductsDelete.Transaction.InTransaction then
    spProductsDelete.Transaction.StartTransaction;
  spProductsDelete.ExecProc;

  if spProductsDelete.Transaction.InTransaction then
    spProductsDelete.Transaction.Commit;
end;


procedure Tdm.FirmDelete(inID: integer);
begin

  if spFirmDelete.Params.FindParam('IN_ID')=nil then
    spFirmDelete.Params.CreateParam(ftInteger, 'IN_ID', ptInput)
  else
  begin
    spFirmDelete.ParamByName('IN_ID').DataType:=ftInteger;
    spFirmDelete.ParamByName('IN_ID').ParamType:=ptInput;
  end;

  spFirmDelete.ParamByName('IN_ID').AsInteger:=inID;

  if not spFirmDelete.Transaction.InTransaction then
    spFirmDelete.Transaction.StartTransaction;
  spFirmDelete.ExecProc;

  if spFirmDelete.Transaction.InTransaction then
    spFirmDelete.Transaction.Commit;
end;


procedure Tdm.FirmEdit(inID: integer; inName, inAddress, inINN: String);
begin
  if spFirmEdit.Params.FindParam('IN_NAME')=nil then
    spFirmEdit.Params.CreateParam(ftString, 'IN_NAME', ptInput)
  else
  begin
    spFirmEdit.ParamByName('IN_NAME').DataType:=ftString;
    spFirmEdit.ParamByName('IN_NAME').ParamType:=ptInput;
  end;
  if spFirmEdit.Params.FindParam('IN_ADRESS')=nil then
    spFirmEdit.Params.CreateParam(ftString, 'IN_ADRESS', ptInput)
  else
  begin
    spFirmEdit.ParamByName('IN_ADRESS').DataType:=ftString;
    spFirmEdit.ParamByName('IN_ADRESS').ParamType:=ptInput;
  end;
  if spFirmEdit.Params.FindParam('IN_INN')=nil then
    spFirmEdit.Params.CreateParam(ftString, 'IN_INN', ptInput)
  else
  begin
    spFirmEdit.ParamByName('IN_INN').DataType:=ftString;
    spFirmEdit.ParamByName('IN_INN').ParamType:=ptInput;
  end;

  if spFirmEdit.Params.FindParam('IN_ID')=nil then
    spFirmEdit.Params.CreateParam(ftInteger, 'IN_ID', ptInput)
  else
  begin
    spFirmEdit.ParamByName('IN_ID').DataType:=ftInteger;
    spFirmEdit.ParamByName('IN_ID').ParamType:=ptInput;
  end;

  spFirmEdit.ParamByName('IN_ID').AsInteger:=inID;
  spFirmEdit.ParamByName('IN_NAME').Value:=inName;
  spFirmEdit.ParamByName('IN_ADRESS').Value:=inAddress;
  spFirmEdit.ParamByName('IN_INN').Value:=inINN;

  if not spFirmEdit.Transaction.InTransaction then
    spFirmEdit.Transaction.StartTransaction;
  spFirmEdit.ExecProc;

  if spFirmEdit.Transaction.InTransaction then
    spFirmEdit.Transaction.Commit;
end;


function Tdm.FirmNew(inName, inAddress, ininn : string): integer;
begin
  if spFirmNew.Params.FindParam('IN_NAME')=nil then
    spFirmNew.Params.CreateParam(ftString, 'IN_NAME', ptInput)
  else
  begin
    spFirmNew.ParamByName('IN_NAME').DataType:=ftString;
    spFirmNew.ParamByName('IN_NAME').ParamType:=ptInput;
  end;
  if spFirmNew.Params.FindParam('IN_ADRESS')=nil then
    spFirmNew.Params.CreateParam(ftString, 'IN_ADRESS', ptInput)
  else
  begin
    spFirmNew.ParamByName('IN_ADRESS').DataType:=ftString;
    spFirmNew.ParamByName('IN_ADRESS').ParamType:=ptInput;
  end;
  if spFirmNew.Params.FindParam('IN_INN')=nil then
    spFirmNew.Params.CreateParam(ftString, 'IN_INN', ptInput)
  else
  begin
    spFirmNew.ParamByName('IN_INN').DataType:=ftString;
    spFirmNew.ParamByName('IN_INN').ParamType:=ptInput;
  end;

  if spFirmNew.Params.FindParam('OUT_ID')=nil then
    spFirmNew.Params.CreateParam(ftInteger, 'OUT_ID', ptOutput)
  else
  begin
    spFirmNew.ParamByName('OUT_ID').DataType:=ftInteger;
    spFirmNew.ParamByName('OUT_ID').ParamType:=ptOutput;
  end;

  spFirmNew.ParamByName('IN_NAME').Value:=inName;
  spFirmNew.ParamByName('IN_ADRESS').Value:=inAddress;
  spFirmNew.ParamByName('IN_INN').Value:=inINN;

  if not spFirmNew.Transaction.InTransaction then
    spFirmNew.Transaction.StartTransaction;
  spFirmNew.ExecProc;
  Result:=spFirmNew.ParamByName('OUT_ID').AsInteger;
  if spFirmNew.Transaction.InTransaction then
    spFirmNew.Transaction.Commit;
end;

end.
