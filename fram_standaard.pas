unit fram_standaard;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, DbCtrls, ComCtrls, DBGrids,
  StdCtrls, ExtCtrls;

type

  { TframStandaard }

  TframStandaard = class(TFrame)
			     btnAddGenre: TButton;
    DBMemo1: TDBMemo;
		dbTxtPnlSelectedRec: TDBText;
    dsNtnGenres: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
		Panel1: TPanel;
    tbshtNotes: TTabSheet;
    tbshtDetails: TTabSheet;
    tbshtOverview: TTabSheet;
    thePageControl: TPageControl;
		theToolBar: TToolBar;
    procedure btnAddGenreClick(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
  private
    { private declarations }
    _OnTable: String;
  public
    { public declarations }
    property OnTable : String Read _OnTable Write _OnTable;
  end;

implementation

{$R *.lfm}

{ TframStandaard }

uses
  globals;

procedure TframStandaard.btnAddGenreClick(Sender: TObject);
begin
  //if TfrmGenres.ShowModalGenres then
  //begin
  //  With MainDataMod do
  //  begin
  //    SQLQryTTGenresDVDs.DisableControls;
  //
  //    SQLQryTTGenresDVDs.Insert;
  //    SQLQryTTGenresDVDs.Post;
  //    SQLQryTTGenresDVDs.Refresh;
  //
  //    SQLQryTTGenresDVDs.EnableControls;
  //  end;
  //end;
end;

procedure TframStandaard.FrameEnter(Sender: TObject);
begin
  //MainDataMod.qOnTableGenres := _OnTable;
end;

end.

