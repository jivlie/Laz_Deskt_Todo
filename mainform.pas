unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  FileUtil,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  ComCtrls,
  Menus,
  VD_FormPosSize;

type

  { TFrmMain }

  TFrmMain = class(TForm)
    btnSubjects: TButton;
		btnTodos: TButton;
		btnAgenda: TButton;
    Image1: TImage;
		theMainMenu: TMainMenu;
		mnItmSettingsFrm: TMenuItem;
		mnItmLookups: TMenuItem;
		mnitmSettings: TMenuItem;
    tlbrMainFrm: TToolBar;
		ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    theFormPosSize: TVDFormPosSize;
		procedure btnAgendaClick(Sender: TObject);
    procedure btnSubjectsClick(Sender: TObject);
		procedure btnTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
		procedure mnItmLookupsClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.lfm}

{ TFrmMain }

uses
  frm_subjects,
  frm_lookups,
  frm_Items,
  frm_agenda,
  Cls_Entities,
  datamodule,
  VD_Conversie,
  ps_inifile,
  globals;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Self.Caption := cns_Apl_MainFrmCaption + cns_Apl_Version;
  FmtSettings.DateSeparator := '-';
  FmtSettings.ShortDateFormat := 'dd mm yyyy';
  FmtSettings.TimeSeparator := ':';
  FmtSettings.LongTimeFormat := 'hh:nn';

  // Haal local app dir (niet Path) op, voor linux is dit dir van exe file, voor windows
  // klopt onderstaande waarsch niet.
  // De iniclass plakt automatisch Filename "IniSettings" achter dirPad.
  // #$# Onderst. pakt wel exe dir in ontwikkel omgeving, maar bij opstarten
  // vanuit starter wordt dit de home dir (bijv /home/corbij/)
  //qPathToIniFile := Application.EnvironmentVariable['PWD'];
  qPathToIniFile := ExtractFilePath(Application.ExeName );
  qIniPropStorage := TPsIniClass.Create(qPathToIniFile);

  // Haal pad naar database op
  qPathToAppData := qIniPropStorage.ReadIniString(cns_Ini_PathToAppData, EmptyStr);
  if qPathToAppData = EmptyStr then
    qPathToAppData := cns_DataLocation;

  qPathToDataBase := PathCombine(qPathToAppData, cns_DataBaseNm);

  // Let op: moet gebeuren na qPathToDb ingevuld is.
  MainDataMod := TDatModMain.Create(nil);
end;

procedure TFrmMain.btnSubjectsClick(Sender: TObject);
begin
  if not Assigned(frmSubjects) then
    frmSubjects := TfrmSubjects.Create(Application);
  frmSubjects.Show;
end;

procedure TFrmMain.btnAgendaClick(Sender: TObject);
begin
  TfrmAgenda.ShowfrmAgenda;
end;

procedure TFrmMain.btnTodosClick(Sender: TObject);
begin
  if not Assigned(frmItems) then
    frmItems := TfrmItems.Create(Application);
  frmItems.Show;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
end;

procedure TFrmMain.mnItmLookupsClick(Sender: TObject);
begin
  if not Assigned(frmLookUps) then
    frmLookUps := TfrmLookUps.Create(Application);
  frmLookUps.Show;
end;

procedure TFrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  MainDataMod.Free;
//  MainDataMod.FreeInstance;
end;

end.


