unit datamodule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, DB, BufDataset, FileUtil,
  Forms,
  Dialogs, Controls;

type

  { TDatModMain }

  TDatModMain = class(TDataModule)
				dsLu_TodoType: TDataSource;
				dsLu_EndFashion: TDataSource;
    dsLst_ItemPriority: TDataSource;
    dsLst_FileStatus: TDataSource;
    dsList_Subjects: TDataSource;
    ImageListMain: TImageList;
    SQLite3Con: TSQLite3Connection;
		SQLLu_EndingFashionlupI_Code: TStringField;
		SQLLu_EndingFashionlupI_Fk_LookUpCd: TLongintField;
		SQLLu_EndingFashionlupI_IntVal: TLongintField;
		SQLLu_EndingFashionlupI_MemoVal: TMemoField;
		SQLLu_EndingFashionlupI_TextVal: TStringField;
		SQLLu_EndingFashion_id: TAutoIncField;
		SQLLu_TodoTypelupI_Code: TStringField;
		SQLLu_TodoTypelupI_Fk_LookUpCd: TLongintField;
		SQLLu_TodoTypelupI_IntVal: TLongintField;
		SQLLu_TodoTypelupI_MemoVal: TMemoField;
		SQLLu_TodoTypelupI_TextVal: TStringField;
		SQLLu_TodoType_id: TAutoIncField;
		SQLQryAgendaItemstodo_Clc_TimeToGo1: TStringField;
		SQLQryAgendaItemstodo_Ctrl: TMemoField;
		SQLQryAgendaItemstodo_DatAfgewerkt: TStringField;
		SQLQryAgendaItemstodo_DatAlt: TMemoField;
		SQLQryAgendaItemstodo_DatDeadLine: TStringField;
		SQLQryAgendaItemstodo_DatGen: TMemoField;
		SQLQryAgendaItemstodo_DatPlan: TStringField;
		SQLQryAgendaItemstodo_DatStart: TStringField;
		SQLQryAgendaItemstodo_DocFile: TStringField;
		SQLQryAgendaItemstodo_EndingFashion: TStringField;
		SQLQryAgendaItemstodo_Fk_Subj: TLongintField;
		SQLQryAgendaItemstodo_HasDeadLine: TLongintField;
		SQLQryAgendaItemstodo_Importance: TLongintField;
		SQLQryAgendaItemstodo_IsAfgewerkt: TLongintField;
		SQLQryAgendaItemstodo_IsAgenda: TLongintField;
		SQLQryAgendaItemstodo_KeyWords: TMemoField;
		SQLQryAgendaItemstodo_LastSerial: TLongintField;
		SQLQryAgendaItemstodo_Lu_Priority: TLongintField;
		SQLQryAgendaItemstodo_Lu_Status: TLongintField;
		SQLQryAgendaItemstodo_Lu_Type: TStringField;
		SQLQryAgendaItemstodo_Notes: TMemoField;
		SQLQryAgendaItemstodo_Title: TStringField;
		SQLQryAgendaItemstodo_VolgNr: TLongintField;
		SQLQryAgendaItemstodo_YNPrint: TLongintField;
		SQLQryAgendaItemstodo_YNShow: TLongintField;
		SQLQryAgendaItems_id: TAutoIncField;
    SQLQryList_Subjects: TSQLQuery;
		SQLQryLookUpItemslupI_Code: TStringField;
    SQLQryLookUpItemslupI_Fk_LookUpCd: TLongintField;
    SQLQryLookUpItemslupI_IntVal: TLongintField;
    SQLQryLookUpItemslupI_MemoVal: TMemoField;
    SQLQryLookUpItemslupI_TextVal: TStringField;
    SQLQryLookUpItems_id: TLongintField;
    SQLQryLookUps: TSQLQuery;
    SQLQryLookUpslkup_Code: TStringField;
    SQLQryLookUpslkup_LookUpCd: TLongintField;
    SQLQryLookUpslkup_Nm: TStringField;
    SQLQryLookUpslkup_Notes: TMemoField;
    SQLQryLookUps_id: TAutoIncField;
    SQLQryLookUpItems: TSQLQuery;
    SQLQryLst_Priority: TSQLQuery;
		SQLQryLst_PrioritylupI_Code: TMemoField;
		SQLQryLst_PrioritylupI_Fk_LookUpCd: TLongintField;
		SQLQryLst_PrioritylupI_IntVal: TLongintField;
		SQLQryLst_PrioritylupI_MemoVal: TMemoField;
		SQLQryLst_PrioritylupI_TextVal: TStringField;
		SQLQryLst_Priority_id: TLongintField;
		SQLQryLst_StatuslupI_Code: TMemoField;
		SQLQryLst_StatuslupI_Fk_LookUpCd: TLongintField;
		SQLQryLst_StatuslupI_IntVal: TLongintField;
		SQLQryLst_StatuslupI_MemoVal: TMemoField;
		SQLQryLst_StatuslupI_TextVal: TStringField;
		SQLQryLst_Statustodo_Lu_Status: TLongintField;
		SQLQryLst_Status_id: TLongintField;
    SQLQrySubjectssubj_Notes: TMemoField;
    SQLQrySubjectssubj_Notes1: TMemoField;
    SQLQrySubjectssubj_Title: TStringField;
    SQLQrySubjectssubj_Title1: TStringField;
    SQLQrySubjects_id: TAutoIncField;
    SQLQrySubjects_id1: TAutoIncField;
    SQLQrySleutelsLtsteWrde: TLongintField;
    SQLQrySleutelsNmTabel: TStringField;
    SQLQrySleutels_id: TLongintField;
    SQLQrySleutels: TSQLQuery;
    SQLQryGetId_id: TLongintField;
    SQLQryExecute: TSQLQuery;
    SQLQrySubjects: TSQLQuery;
    SQLQryLst_Status: TSQLQuery;
		SQLQryTodos: TSQLQuery;
		SQLQryTodostodo_Ctrl: TMemoField;
		SQLQryTodostodo_DatAfgewerkt: TStringField;
		SQLQryTodostodo_DatAlt: TMemoField;
		SQLQryTodostodo_DatDeadLine: TStringField;
		SQLQryTodostodo_DatGen: TMemoField;
		SQLQryTodostodo_DatStart: TStringField;
		SQLQryTodostodo_DocFile: TStringField;
		SQLQryTodostodo_EndingFashion: TStringField;
		SQLQryTodostodo_Fk_Subj: TLongintField;
		SQLQryTodostodo_HasDeadLine: TLongintField;
		SQLQryTodostodo_IsAfgewerkt: TLongintField;
		SQLQryTodostodo_IsAgenda: TLongintField;
		SQLQryTodostodo_KeyWords: TMemoField;
		SQLQryTodostodo_LastSerial: TLongintField;
		SQLQryTodostodo_Lu_Priority: TLongintField;
		SQLQryTodostodo_Lu_Status: TLongintField;
		SQLQryTodostodo_Lu_Type: TStringField;
		SQLQryTodostodo_Notes: TMemoField;
		SQLQryTodostodo_Title: TStringField;
		SQLQryTodostodo_VolgNr: TLongintField;
		SQLQryTodostodo_YNPrint: TLongintField;
		SQLQryTodostodo_YNShow: TLongintField;
		SQLQryTodos_id: TAutoIncField;
		SQLQryAgendaItems: TSQLQuery;
		SQLLu_EndingFashion: TSQLQuery;
		SQLLu_TodoType: TSQLQuery;
    SQLTransact: TSQLTransaction;
		StringField1: TStringField;
		StringField2: TStringField;
    StringField3: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SQLite3ConBeforeConnect(Sender: TObject);
		procedure SQLQryAgendaItemsAfterDelete(DataSet: TDataSet);
		procedure SQLQryAgendaItemsAfterInsert(DataSet: TDataSet);
		procedure SQLQryAgendaItemsCalcFields(DataSet: TDataSet);
    procedure SQLQryLookUpItemsAfterInsert(DataSet: TDataSet);
    procedure SQLQryLookUpItemsAfterPost(DataSet: TDataSet);
    procedure SQLQryLookUpsAfterInsert(DataSet: TDataSet);
    procedure SQLQryLookUpsAfterPost(DataSet: TDataSet);
    procedure SQLQrySleutelsAfterPost(DataSet: TDataSet);
    function Ophoog(lTableName: string): longint;
    procedure SQLQryContactNmbrCalcFields(DataSet: TDataSet);
    procedure RefrSqlQry(aSqlQry: TSQLQuery);
    procedure ResetDetailDs(aSqlQuery: TSQLQuery; aParm: string; aParmVal: integer);
    procedure SQLQrySubjectsAfterInsert(DataSet: TDataSet);
    procedure SQLQrySubjectsAfterPost(DataSet: TDataSet);
		procedure SQLQryTodosAfterInsert(DataSet: TDataSet);
		procedure SQLQryTodosAfterPost(DataSet: TDataSet);
		procedure SQLQryAfterInsert(DataSet: TDataSet);
		procedure SQLQryAfterPost(DataSet: TDataSet);
  private
  	procedure RefrLijsten(aSqlQuery: TSQLQuery);
    procedure UpdateLookUpLsts;
  public
		function GetTextFromSql(aSqlQuery: TSQLQuery; aFieldNm: string;
					aKey: longint): string;
    function ExecuteCmnds(aCommand: string): boolean;
    procedure ChangeSqlQrySql(aSqlQry: TSQLQuery; aSql: string;
      aParmNm: string; aKey: longint = 0);
    procedure UpdateAll(aSqlQuery: TSQLQuery);
    procedure SealTable(aSqlDb: TSQLQuery);
		procedure SetToEdit(aSqlDb: TSQLQuery);
  end;

var
  DatModMain: TDatModMain;

implementation

{$R *.lfm}

{ TDatModMain }

uses
  sqlcommands,
  VD_Conversie,
  globals;

procedure TDatModMain.SQLite3ConBeforeConnect(Sender: TObject);
begin
  SQLite3Con.DataBaseName := qPathToDataBase;
end;

procedure TDatModMain.SQLQryAgendaItemsAfterDelete(DataSet: TDataSet);
begin
  SQLQryAfterPost(DataSet);
  RefrSqlQry(SQLQryTodos);
end;

procedure TDatModMain.SQLQryAgendaItemsCalcFields(DataSet: TDataSet);
var
  lNow: TDateTime;
  lAgenda: TDateTime;
begin
  lNow := Now;
  lAgenda := stndStringToDateTime(SQLQryAgendaItemstodo_DatPlan.AsString);
  SQLQryAgendaItemstodo_Clc_TimeToGo1.AsString :=
    DiffBetweenDateTimes(lNow, lAgenda);
end;

procedure TDatModMain.DataModuleCreate(Sender: TObject);
begin
  //SQLiteLibraryName := 'sqlite3.dll';

  SQLite3Con.Connected := True;
  SQLTransact.Active := True;

  SQLQrySubjects.Active := True;
  SQLQryAgendaItems.Active := True;
  SQLQryList_Subjects.Active := True;

  SQLQryLst_Status.Active := True;
  SQLQryLst_Priority.Active := True;
  SQLLu_EndingFashion.Active:=True;
  SQLLu_TodoType.Active:=True;

  SQLQryLookUps.Active := True;
  SQLQryLookUpItems.Active := True;
  SQLQrySleutels.Active := True;
  SQLQrySleutels.ExecSQL;

  SQLQryTodos.Active := True;

end;

procedure TDatModMain.RefrSqlQry(aSqlQry: TSQLQuery);
begin
  aSqlQry.DisableControls;
  aSqlQry.Refresh;
  aSqlQry.EnableControls;
end;

procedure TDatModMain.ResetDetailDs(aSqlQuery: TSQLQuery; aParm: string;
  aParmVal: integer);
begin
  if (aSQLQuery.State in [dsEdit, dsInsert] ) then
   aSQLQuery.Post;

 aSQLQuery.DisableControls;
 aSQLQuery.ParamByName(aParm).AsInteger:= aParmVal;
 aSQLQuery.Refresh;
 aSQLQuery.EnableControls;
end;

function TDatModMain.Ophoog(lTableName: string): longint;
var
  lInteger: longint;
begin
  with SQLQrySleutels do
  begin
    //*sm02 Record bijzoeken/aanmaken in OphoogDataSet.
    if not (SQLQrySleutels.Locate('NmTabel', lTableName, [])) then
    begin
      // Als tabel nog niet in gebruik was
      append;
      FieldByName('NmTabel').AsString := lTableName;
      FieldByName('LtsteWrde').AsLongint := 10;
      lInteger := 10;
      //ShowMessage( 'Er is een nieuwe record aangemaakt' + chr( 13 ) +
      //  'tbv sleutel registratie voor tabel:' + chr( 13 ) +
      //  lTableName );
    end
    else
    begin
      Edit;
      FieldByName('LtsteWrde').AsLongint :=
        FieldByName('LtsteWrde').AsLongint + 10;
      lInteger := FieldByName('LtsteWrde').AsLongint;
    end;
    Post;
  end;  // With

  Result := lInteger;
end;

procedure TDatModMain.SQLQryContactNmbrCalcFields(DataSet: TDataSet);
begin

end;

procedure TDatModMain.SQLQryAfterPost(DataSet: TDataSet);
begin
  UpdateAll(TSqlQuery(DataSet));
end;

procedure TDatModMain.SQLQryAfterInsert(DataSet: TDataSet);
begin
  TSQLQuery(DataSet).FieldByName('_id').AsLongInt := Ophoog(TSQLQuery(DataSet).Name);
end;

procedure TDatModMain.UpdateAll(aSqlQuery: TSQLQuery);
begin
  //Todo: Eerst een check uitvoeren of er wel updates zijn, scheelt een hoop.
  //if aSqlQuery.UpdateStatus in [usModified] then
  //begin
  aSqlQuery.DisableControls;
  aSqlQuery.ApplyUpdates(-1);
  SQLTransact.CommitRetaining;
  aSqlQuery.EnableControls;
  //end;
end;

function TDatModMain.ExecuteCmnds(aCommand: string): boolean;
begin
  Result := False;
  SQLQryExecute.Close;
  SQLQryExecute.SQL.Add(aCommand);
  SQLQryExecute.ExecSQL;
  SQLTransact.CommitRetaining;
  SQLQryExecute.Close;
  SQLQryExecute.SQL.Clear;
end;

procedure TDatModMain.ChangeSqlQrySql(aSqlQry: TSQLQuery; aSql: string;
  aParmNm: string; aKey: longint = 0);
begin
  aSqlQry.DisableControls;
  SealTable(aSqlQry);

  aSqlQry.Close;
  aSqlQry.Sql.Clear;
  aSqlQry.Sql.Add(aSql);
  aSqlQry.Open;

  if aKey <> 0 then
  begin
    aSqlQry.ParamByName(aParmNm).AsInteger := aKey;
    aSqlQry.Refresh;
  end;

  aSqlQry.EnableControls;
end;

procedure TDatModMain.SealTable(aSqlDb: TSQLQuery);
begin
  if (aSqlDb.State in [dsEdit, dsInsert] ) then
  begin
    aSqlDb.Post;
  end;
end;

procedure TDatModMain.SetToEdit(aSqlDb: TSQLQuery);
begin
  if not(aSqlDb.State in [dsEdit, dsInsert] ) then
  begin
    aSqlDb.Edit;
  end;
end;

function TDatModMain.GetTextFromSql(aSqlQuery: TSQLQuery; aFieldNm: string;
  aKey: longint): string;
var
  lInd: boolean;
begin
  lInd := False;
  try
    try
      aSqlQuery.Locate('_id', aKey, []);
    except
      lInd := True;
    end;
  finally
  end;

  if lInd then
    Result := EmptyStr
  else
    Result := aSqlQuery.FieldByName(aFieldNm).AsString;
end;

procedure TDatModMain.RefrLijsten(aSqlQuery: TSQLQuery);
begin
  //aSQLQuery.DisableControls;
  aSQLQuery.Refresh;
  //aSQLQuery.EnableControls;
end;

//%///%/// SQLQry EventHandlers
procedure TDatModMain.SQLQrySubjectsAfterInsert(DataSet: TDataSet);
begin
  SQLQrySubjects_id.AsLongInt := Ophoog(cns_tbl_Subjects_nm);
end;

procedure TDatModMain.SQLQrySubjectsAfterPost(DataSet: TDataSet);
begin
  UpdateAll(SQLQrySubjects);
  RefrLijsten(SQLQryList_Subjects);
end;

procedure TDatModMain.SQLQryTodosAfterInsert(DataSet: TDataSet);
begin
  SQLQryTodos_id.AsLongInt := Ophoog(cns_tbl_Todos_nm);
  SQLQryTodostodo_VolgNr.AsLongInt := 0;
  SQLQryTodostodo_DatGen.AsString := FormatDateTime(cns_Fmt_DbDateTime, Now);
  SQLQryTodostodo_DatStart.AsString := FormatDateTime(cns_Fmt_DbDateTime, Now);
  SQLQryTodostodo_HasDeadLine.AsLongint := 0;
  SQLQryTodostodo_IsAfgewerkt.AsLongint := 0;
  SQLQryTodostodo_IsAgenda.AsLongint := 0;
  SQLQryTodostodo_Lu_Type.AsString := cns_Lu_TodoTypeTodo;
end;

procedure TDatModMain.SQLQryTodosAfterPost(DataSet: TDataSet);
begin
  UpdateAll(SQLQryTodos);
  RefrSqlQry(SQLQryAgendaItems);
end;

procedure TDatModMain.SQLQrySleutelsAfterPost(DataSet: TDataSet);
begin
  UpdateAll(SQLQrySleutels);
end;

procedure TDatModMain.DataModuleDestroy(Sender: TObject);
begin
  SQLTransact.EndTransaction;
  SQLTransact.Active := False;
  SQLite3Con.Connected := False;
end;

procedure TDatModMain.SQLQryLookUpItemsAfterInsert(DataSet: TDataSet);
begin
  SQLQryLookUpItems_id.AsLongInt := Ophoog(cns_tbl_LookUpItems_nm);

  SQLQryLookUpItemslupI_Fk_LookUpCd.AsLongint := SQLQryLookUpslkup_LookUpCd.AsLongint;
  SQLQryLookUpItemslupI_Code.AsString := SQLQryLookUpslkup_Code.AsString;
end;

procedure TDatModMain.SQLQryLookUpItemsAfterPost(DataSet: TDataSet);
begin
  UpdateAll(SQLQryLookUpItems);
  UpdateLookUpLsts;
end;

procedure TDatModMain.UpdateLookUpLsts;
begin
  RefrLijsten(SQLQryLst_Priority);
  RefrLijsten(SQLQryLst_Status);
end;

procedure TDatModMain.SQLQryAgendaItemsAfterInsert(DataSet: TDataSet);
begin
  SQLQryAfterInsert(DataSet);
  SQLQryAgendaItemstodo_IsAgenda.AsLongint := 1;
  SQLQryAgendaItemstodo_VolgNr.AsLongInt := 0;
  SQLQryAgendaItemstodo_DatGen.AsString := FormatDateTime(cns_Fmt_DbDateTime, Now);
  SQLQryAgendaItemstodo_DatStart.AsString := FormatDateTime(cns_Fmt_DbDateTime, Now);
  SQLQryAgendaItemstodo_HasDeadLine.AsLongint := 0;
  SQLQryAgendaItemstodo_IsAfgewerkt.AsLongint := 0;
  SQLQryAgendaItemstodo_Lu_Type.AsString := cns_Lu_TodoTypeEvent;
end;

procedure TDatModMain.SQLQryLookUpsAfterInsert(DataSet: TDataSet);
begin
  SQLQryLookUps_id.AsLongInt := Ophoog(cns_tbl_LookUps_nm);
end;

procedure TDatModMain.SQLQryLookUpsAfterPost(DataSet: TDataSet);
begin
  UpdateAll(SQLQryLookUps);
end;
end.
