unit products;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus;

type
  TfProducts = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProducts: TfProducts;

implementation

{$R *.dfm}

uses datamodule, product;

procedure TfProducts.DBGrid1TitleClick(Column: TColumn);
begin
  DBGrid1.Columns[0].Font.Style:=[];
  DBGrid1.Columns[1].Font.Style:=[];
  DBGrid1.Columns[2].Font.Style:=[];
  Column.Title.Font.Style:=[fsBold];
  case Column.Index of
  0: dm.tProducts.IndexFieldNames:='ID';
  1: dm.tProducts.IndexFieldNames:='NAME;ID';
  2: dm.tProducts.IndexName:='PRODUCTS_IDX2';
  end;
end;

procedure TfProducts.FormCreate(Sender: TObject);
begin
  DataSource1.DataSet := dm.tProducts;
  dm.tProducts.Open;
end;

procedure TfProducts.N1Click(Sender: TObject);
var
  id : integer;
begin
  fProduct:=TfProduct.Create(Application);
  fProduct.ShowModal;

  if fProduct.ModalResult=mrOK then
  begin
    id := dm.ProductsNew(fProduct.leName.Text, fProduct.leUnit.Text, StrToFloat(fProduct.leVat.Text));
    dm.tProducts.Open;
    dm.tProducts.Locate('ID', id, []);
  end;

  fProduct.Release;
end;

procedure TfProducts.N2Click(Sender: TObject);
var
  id : integer;
begin
  fProduct:=TfProduct.Create(Application);
  fProduct.leName.Text := dm.tProducts.FieldByName('NAME').AsString;
  fProduct.leUnit.Text:= dm.tProducts.FieldByName('UNIT').AsString;
  fProduct.leVat.Text:= dm.tProducts.FieldByName('VAT').AsString;
  id := dm.tProducts.FieldByName('ID').AsInteger;
  fProduct.ShowModal;

  if fProduct.ModalResult=mrOK then
  begin
    dm.ProductsEdit(id, fProduct.leName.Text, fProduct.leUnit.Text, StrToFloat(fProduct.leVat.Text));
    dm.tProducts.Open;
    dm.tProducts.Locate('ID', id, []);
  end;

  fProduct.Release;
end;

procedure TfProducts.N3Click(Sender: TObject);
begin

  if MessageDlg('Удалить "' + dm.tProducts.FieldByName('NAME').AsString + '"?',
      mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    begin
      dm.ProductsDelete(dm.tProducts.FieldByName('ID').AsInteger);
      dm.tProducts.Open;
    end;

end;

end.
