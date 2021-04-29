unit product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfProduct = class(TForm)
    leName: TLabeledEdit;
    leUnit: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    leVat: TLabeledEdit;
    procedure leNameChange(Sender: TObject);
    procedure leUnitChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProduct: TfProduct;

implementation

{$R *.dfm}

procedure TfProduct.leNameChange(Sender: TObject);
begin
  BitBtn1.Enabled:=(leName.Text <> '') and (leUnit.Text <> '') and (leVat.Text <> '');
end;

procedure TfProduct.leUnitChange(Sender: TObject);
begin
  BitBtn1.Enabled:=(leName.Text <> '') and (leUnit.Text <> '') and (leVat.Text <> '');
end;

end.
