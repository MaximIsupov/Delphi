unit Firm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfFirm = class(TForm)
    leName: TLabeledEdit;
    leAddress: TLabeledEdit;
    leINN: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure leNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFirm: TfFirm;

implementation

{$R *.dfm}

procedure TfFirm.leNameChange(Sender: TObject);
begin
  BitBtn1.Enabled:=(leName.Text <> '') and (leAddress.Text <> '') and (leINN.Text <> '');
end;

end.
