program Project1;

uses
  Vcl.Forms,
  System.SysUtils,
  Unit1 in 'Unit1.pas' {Form1},
  common in 'common.pas',
  datamodule in 'datamodule.pas' {dm: TDataModule},
  main in 'main.pas' {fMain},
  firms in 'firms.pas' {fFirms},
  Firm in 'Firm.pas' {fFirm},
  products in 'products.pas' {fProducts},
  product in 'product.pas' {fProduct},
  FuturaNew in 'FuturaNew.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  FormatSettings.DecimalSeparator := DecimalSeparator; //Десятичный разд всегда точка
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfProducts, fProducts);
  Application.CreateForm(TfProduct, fProduct);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
