unit fram_LkUpItems;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, DbCtrls, ComCtrls, DBGrids,
  StdCtrls;

type

  { TframLkUpItems }

  TframLkUpItems = class(TFrame)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    dbmmItmMemVal: TDBMemo;
    dsLkUpItems: TDataSource;
    dbgrdLkUpItems: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    lblLookUpCd: TLabel;
    lblTextVal: TLabel;
    pgcntrlLkUpItems: TPageControl;
    tbshtNotes: TTabSheet;
    tbshtDetails: TTabSheet;
    tbshtOverview: TTabSheet;
  private
    { private declarations }
  public
    { public declarations }
  end;

implementation

{$R *.lfm}

end.

