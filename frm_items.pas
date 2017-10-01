unit frm_items;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, DBDateTimePicker, RTTICtrls, LR_Class,
	LR_DBSet, Forms, Controls, Graphics, Dialogs, DbCtrls, ComCtrls, DBGrids,
	StdCtrls, ExtCtrls, DBExtCtrls, ps_dbSqliteDateTimePicker, VD_SearchEdit;

type

  { TfrmItems }

  TfrmItems = class(TForm)
    btnOpenDoc: TButton;
    btnSelFilePath: TButton;
		dbChkBxIsAgenda: TDBCheckBox;
		dbchkbxAfgewerkt: TDBCheckBox;
    dbedtFilePath: TDBEdit;
    dbedtTitle: TDBEdit;
    dbgrdDocuments: TDBGrid;
    dbLkupCmbxSujects: TDBLookupComboBox;
    dbCmbBxSubjects: TDBLookupComboBox;
    dbmmDocNotes: TDBMemo;
    dbmmDocKeyWords: TDBMemo;
		dbSqltDTPckrStartDatum1: TDBSqliteDTPicker;
		dbSqltDTPickerAfgewerktdat: TDBSqliteDTPicker;
		dbSqltDTPckrStartDatum: TDBSqliteDTPicker;
		dbTxtPnlSelectedRec: TDBText;
    dsTodos: TDataSource;
		frDBDsTod: TfrDBDataSet;
		frRprtTodo: TfrReport;
		lblIsAgenda: TLabel;
		lblDatAfgewerkt: TLabel;
		lblAfgewerkt: TLabel;
		lblDatStart: TLabel;
		lblDatDeadline: TLabel;
		theRadioGroup: TRadioGroup;
    theDbNavigator: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    lblSubject: TLabel;
    opnDlgDocFilePath: TOpenDialog;
		Panel1: TPanel;
    thePageControl: TPageControl;
    tbshtKeyWords: TTabSheet;
    tbshtNotes: TTabSheet;
    tbshtDetails: TTabSheet;
    tbshtOverz: TTabSheet;
		theToolBar: TToolBar;
                vdSrchEdtTitle: TVDSearchEdit;
    procedure btnOpenDocClick(Sender: TObject);
    procedure btnSelFilePathClick(Sender: TObject);
		procedure dbchkbxAfgewerktClick(Sender: TObject);
    procedure dbCmbBxSubjectsSelect(Sender: TObject);
		procedure dsTodosDataChange(Sender: TObject; Field: TField);
		procedure FormShow(Sender: TObject);
    procedure thePageControlChange(Sender: TObject);
		procedure theRadioGroupClick(Sender: TObject);
  private
				procedure FormUpdate;
    { private declarations }
  public
    { public declarations }
  end;

var
  frmItems: TfrmItems;

implementation

{$R *.lfm}

{ TfrmItems }

uses
  variants,
  sqlcommands,
  VD_Conversie,
  LCLintf,
  Globals;

var
  qCurSubj: Integer;

procedure TfrmItems.btnSelFilePathClick(Sender: TObject);
var
  filename: string;
  lInd_EdtState: Boolean;
begin
  lInd_EdtState := false;

  //if opnDlgDocFilePath.Execute then
  //begin
  //  filename := opnDlgDocFilePath.Filename;
  //  With MainDataMod do
  //  begin
  //    if not (SQLQryDocuments.State in [dsEdit, dsInsert] ) then
  //    begin
  //      lInd_EdtState := true;
  //      SQLQryDocuments.Edit;
  //    end;
  //    SQLQryDocumentsdoc_DocFile.AsString := filename;
  //
  //    if not lInd_EdtState then
  //      UpdateAll(SQLQryDocuments);
  //  end;
  //end;
end;

procedure TfrmItems.theRadioGroupClick(Sender: TObject);
begin
  With MainDataMod do
  begin
    If theRadioGroup.ItemIndex = 0 then
    begin
      dbCmbBxSubjects.Enabled := false;
      // Save current group
      ChangeSqlQrySql(SQLQryTodos, cns_Sql_ActiveTodos,'');
    end;
    // Actief per groep
    If theRadioGroup.ItemIndex = 1 then
    begin
      dbCmbBxSubjects.Enabled := true;
      ChangeSqlQrySql(SQLQryTodos, cns_Sql_ActiveByGrp,'SubjectId',SQLQrySubjects_id.AsLongint);
    end;
    If theRadioGroup.ItemIndex = 2 then
    begin
      dbCmbBxSubjects.Enabled := false;
      ChangeSqlQrySql(SQLQryTodos, cns_Sql_AlleTodos,'');
    end;
    // Word nog niet gebruikt
    If theRadioGroup.ItemIndex = 3 then
    begin
      dbCmbBxSubjects.Enabled := false;
      ChangeSqlQrySql(SQLQryTodos, cns_Sql_ActiveTodos,'',0);
    end;

  end;
end;

procedure TfrmItems.dbchkbxAfgewerktClick(Sender: TObject);
begin
  With MainDataMod do
  begin
    SetToEdit(SQLQryTodos);
    SQLQryTodostodo_DatAfgewerkt.AsString := FormatDateTime(cns_Fmt_DbDateTime, Now);
    FormUpdate;
	end;
end;

procedure TfrmItems.dbCmbBxSubjectsSelect(Sender: TObject);
begin
  if VarType(dbCmbBxSubjects.KeyValue) = varinteger then qCurSubj := dbCmbBxSubjects.KeyValue;

  if not (theRadioGroup.ItemIndex = 1) then
  begin
    MainDataMod.ResetDetailDs(MainDataMod.SQLQryToDos, 'Subject', qCurSubj);
    dbgrdDocuments.Refresh;
    Application.ProcessMessages;
  end;
end;

procedure TfrmItems.dsTodosDataChange(Sender: TObject; Field: TField);
begin
  FormUpdate;
end;

procedure TfrmItems.FormShow(Sender: TObject);
begin
  thePageControl.ActivePageIndex := 0;
end;

procedure TfrmItems.FormUpdate;
begin
  lblDatAfgewerkt.Visible := dbchkbxAfgewerkt.Checked;
  dbSqltDTPickerAfgewerktdat.Visible := dbchkbxAfgewerkt.Checked;
end;

procedure TfrmItems.thePageControlChange(Sender: TObject);
begin
  //  theDbNavigator.Enabled := thePageControl.ActivePage <> tbshtVersions;

  //if  thePageControl.ActivePage = tbshtVersions then
  //begin
  //  With MainDataMod do
  //  begin
      //if (SQLQryVersions.State in [dsEdit, dsInsert] ) then
      //begin
      //  UpdateAll(SQLQryVersions);
      //end;
      //
      //ResetDetailDs(SQLQryVersions, 'Document', SQLQryDocuments_id.AsLongint);
//    end;
//  end;
end;

procedure TfrmItems.btnOpenDocClick(Sender: TObject);
var
  filename: string;
begin
  frRprtTodo.LoadFromFile(pathCombine(qPathToIniFile, 'OverzTodos.lrf'));
  frRprtTodo.ShowReport;


  //With MainDataMod do
  //begin
  //  filename := SQLQryTodostodo_DocFile.AsString;
  //
  //  OpenDocument(filename);
  //
  //end;
end;

end.

