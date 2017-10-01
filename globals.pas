unit globals;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Cls_Entities,
  ps_inifile,
  DataModule;

const
  cns_Apl_Version = 'Versie 1.1.1.0';
  cns_Apl_MainFrmCaption = 'Mainform Todo applicatie ';

  cns_tbl_DocTypes_nm = 'DocTypes';
  cns_tbl_Todos_nm = 'Todos';
  cns_tbl_LookUps_nm = 'LookUps';
  cns_tbl_LookUpItems_nm = 'LookUpItems';
  cns_tbl_Subjects_nm = 'Subjects';
  cns_tbl_Dossiers_nm = 'Dossiers';
  cns_tbl_DossierItems_nm = 'DossierItems';
  cns_tbl_Versions_nm = 'Versions';

//  cns_IniFileNm = '\Voorraad\VoorRdSettings.ini';
  cns_DataBaseNm = 'dbTodo.db';
  cns_DataLocation = '/home/corbij/Portable/Documenten/DataBases/Sqlite/ToDo/';

  cns_Msg_PendingUpdates = 'Er zijn wijzigingen die nog niet zijn doorgevoerd';
  cns_Msg_WiltUOpslaan = 'Wilt u de wijzigingen opslaan voor het sluiten vd pagina?';
  cns_Msg_AlleenArtForm = 'U kunt de prijs alleen wijzigen in het artikel formulier';
  cns_Msg_RefresIsHerbereken = 'Save + Refresh = Herbereken';

  cns_Txt_LijstTotaal = 'Lijst totaal: ';
  cns_Txt_ToonAllen = 'Toon allen';
  cns_Txt_Categorien = 'Categorien';

  cns_Ini_DataBasePath = 'DataBasePath';
  cns_Ini_PathToAppData = 'PathToAppData';

  cns_Fmt_DbDateTime = 'YYYY-MM-DD hh:nn:ss';


var
 TheInputString: String = '';

 MainDataMod: TDatModMain;

 FmtSettings: TFormatSettings;

 qIniPropStorage: TPsIniClass;

 qPathToAppData: String;
 qPathToDataBase: String;
 qPathToIniFile: String;

implementation

end.

