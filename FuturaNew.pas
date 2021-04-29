unit FuturaNew;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ImgList,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    leNumber: TLabeledEdit;
    Label2: TLabel;
    ButtonedEdit1: TButtonedEdit;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure leNumberChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonedEdit1RightButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
  FirmId : Integer;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses firms, datamodule;

procedure TForm2.ButtonedEdit1RightButtonClick(Sender: TObject);
begin
 fFirms:=TfFirms.Create(Application);
 fFirms.showModal;
 if not dm.tFirm.IsEmpty then
 begin
   ButtonedEdit1.Text:=dm.tFirm.FieldByName('NAME').AsString;
   FirmId:=dm.tFirm.FieldByName('ID').AsInteger;
 end;
 fFirms.Release;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
DateTimePicker1.Date:=now;
end;

procedure TForm2.leNumberChange(Sender: TObject);
begin
BitBtn1.Enabled:=(leNumber.Text<>'')and(ButtonedEdit1.Text<>'');
end;

end.
