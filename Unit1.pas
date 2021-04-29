unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    eQuantity: TEdit;
    ePrice: TEdit;
    leSum: TLabeledEdit;
    btnOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure eQuantityChange(Sender: TObject);
    procedure eQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure ePriceChange(Sender: TObject);
    procedure leSumChange(Sender: TObject);
  private
    { Private declarations }
    procedure CheckOk;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  common;

{$R *.dfm}

procedure TForm1.CheckOk;
begin
  btnOk.Enabled := (ePrice.Text <> '') and (eQuantity.Text <> '') and (leSum.Text <> '');
end;

procedure TForm1.ePriceChange(Sender: TObject);
begin
  if ePrice.Focused and (ePrice.Text <> '') then
  begin
    if eQuantity.Text <> '' then
      leSum.Text := FloatToStrF(
        StrToFloat(ePrice.Text) * StrToFloat(eQuantity.Text),
        ffFixed, 15, 2)
    else
      if leSum.Text <> '' then
        eQuantity.Text := FloatToStrF(
          StrToFloat(leSum.Text) / StrToFloat(ePrice.Text),
          ffFixed, 15, 2)

  end;
  CheckOk;
end;

procedure TForm1.eQuantityChange(Sender: TObject);
begin
  if eQuantity.Focused and (eQuantity.Text <> '') then
  begin
    if ePrice.Text <> '' then
      leSum.Text := FloatToStrF(
        StrToFloat(ePrice.Text) * StrToFloat(eQuantity.Text),
        ffFixed, 15, 2)
    else
      if leSum.Text <> '' then
        ePrice.Text := FloatToStrF(
          StrToFloat(leSum.Text) / StrToFloat(eQuantity.Text),
          ffFixed, 15, 2)

  end;

  CheckOk;
end;

procedure TForm1.eQuantityKeyPress(Sender: TObject; var Key: Char);
var
  s: string;
  k: integer;
begin
  if key = #8 then exit;  // #8 = backspace
  if (key = '.') or (key = ',') then
    key := FormatSettings.DecimalSeparator;
  s := (Sender as TCustomEdit).Text;
  k := (Sender as TCustomEdit).SelStart; // местоположение курсора
  s := copy(s, 1, k) + key + copy(s, k+1, length(s));
  if (key = 'e') or (key = 'E') or not CheckStrToFloat(s) then key := #0;


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  eQuantity.Clear;
  ePrice.Clear;
end;

procedure TForm1.leSumChange(Sender: TObject);
begin
  if leSum.Focused and (leSum.Text <> '') then
  begin
    if eQuantity.Text <> '' then
        ePrice.Text := FloatToStrF(
          StrToFloat(leSum.Text) / StrToFloat(eQuantity.Text),
          ffFixed, 15, 2)
    else
      if ePrice.Text <> '' then
      eQuantity.Text := FloatToStrF(
        StrToFloat(leSum.Text) / StrToFloat(ePrice.Text),
        ffFixed, 15, 2)

  end;
  CheckOk;
end;

end.


