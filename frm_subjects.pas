unit frm_subjects;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  ComCtrls, DBGrids, StdCtrls, ExtCtrls;

type

  { TfrmSubjects }

  TfrmSubjects = class(TForm)
    dbedtSubTitle: TDBEdit;
    dbGrdSubjects: TDBGrid;
    dbMmSubjects: TDBMemo;
		dbTxtPnlSelectedRec: TDBText;
    dsSubjects: TDataSource;
    dbNavSubjects: TDBNavigator;
    lblSubjTitle: TLabel;
		Panel1: TPanel;
    pgcntrlSubjects: TPageControl;
    tbshtNotes: TTabSheet;
    tbshtDetails: TTabSheet;
    tbshtOverz: TTabSheet;
		theToolBar: TToolBar;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmSubjects: TfrmSubjects;

implementation

{$R *.lfm}

end.

