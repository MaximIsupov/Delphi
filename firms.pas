unit firms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus;

type
  TfFirms = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    L1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFirms: TfFirms;

implementation

{$R *.dfm}

uses datamodule, Firm;

procedure TfFirms.DBGrid1TitleClick(Column: TColumn);
begin
  DBGrid1.Columns[0].Font.Style:=[];
  DBGrid1.Columns[1].Font.Style:=[];
  DBGrid1.Columns[2].Font.Style:=[];
  Column.Title.Font.Style:=[fsBold];
  case Column.Index of
  0: dm.tFirm.IndexFieldNames:='ID';
  1: dm.tFirm.IndexFieldNames:='NAME;ID';
  2: dm.tFirm.IndexName:='FIRM_IDX2';
  end;

end;

procedure TfFirms.FormCreate(Sender: TObject);
begin
  DataSource1.DataSet := dm.tFirm;
  dm.tFirm.Open;
end;

procedure TfFirms.L1Click(Sender: TObject);
var
  id : integer;
begin
  fFirm:=TfFirm.Create(Application);
  fFirm.ShowModal;

  if fFirm.ModalResult=mrOK then
  begin
    id := dm.FirmNew(fFirm.leName.Text, fFirm.leAddress.Text, fFirm.leINN.Text);
    dm.tFirm.Open;
    dm.tFirm.Locate('ID', id, []);
  end;

  fFirm.Release;
end;

procedure TfFirms.N1Click(Sender: TObject);
var
  id : integer;
begin
  fFirm:=TfFirm.Create(Application);
  fFirm.leName.Text := dm.tFirm.FieldByName('NAME').AsString;
  fFirm.leAddress.Text:= dm.tFirm.FieldByName('ADDRESS').AsString;
  fFirm.leINN.Text:= dm.tFirm.FieldByName('INN').AsString;
  id := dm.tFirm.FieldByName('ID').AsInteger;
  fFirm.ShowModal;

  if fFirm.ModalResult=mrOK then
  begin
    dm.FirmEdit(id, fFirm.leName.Text, fFirm.leAddress.Text, fFirm.leINN.Text);
    dm.tFirm.Open;
    dm.tFirm.Locate('ID', id, []);
  end;

  fFirm.Release;
end;

procedure TfFirms.N2Click(Sender: TObject);
begin

  if MessageDlg('Удалить "' + dm.tFirm.FieldByName('NAME').AsString + '"?',
      mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    begin
      dm.FirmDelete(dm.tFirm.FieldByName('ID').AsInteger);
      dm.tFirm.Open;
    end;

end;

procedure TfFirms.N3Click(Sender: TObject);
begin
  Close;
end;

end.
