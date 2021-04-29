unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Vcl.ComCtrls;

type
  TfMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    TabControl1: TTabControl;
    dsFutura: TDataSource;
    dsInfo: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses firms, products, datamodule;

procedure TfMain.FormActivate(Sender: TObject);
begin
dsFutura.DataSet:=dm.qFutura;
TabControl1Change(nil);
end;

procedure TfMain.N2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMain.N3Click(Sender: TObject);
begin
  fFirms:=TfFirms.Create(Application);
  fFirms.ShowModal;
  fFirms.Close;
end;

procedure TfMain.N4Click(Sender: TObject);
begin
  fProducts:=TfProducts.Create(Application);
  fProducts.ShowModal;
  fProducts.Close;
end;

procedure TfMain.TabControl1Change(Sender: TObject);
begin
dm.FuturaSelect('futura_type='+IntToStr(1-2*TabControl1.TabIndex));
end;

end.
