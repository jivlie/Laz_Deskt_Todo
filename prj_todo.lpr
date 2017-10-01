program prj_todo;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, runtimetypeinfocontrols, MainForm, fpvectorial,
	fpvutils, frm_subjects, frm_Lookups, fram_LkUpItems, Cls_Entities, frm_items,
	sqlcommands, fram_standaard, frm_agenda, ps_dbSqliteDateTimePicker
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.

