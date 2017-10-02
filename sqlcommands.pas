unit sqlcommands;

{$mode objfpc}{$H+}

interface

uses
      Classes, SysUtils;

const
  cns_Sql_ActiveTodos =
    'Select ' + #13 +
       '_id    , '  + #13 + #10 +
       'todo_Fk_Subj    , '  + #13 + #10 +
       'todo_Ctrl    , '  + #13 + #10 +
       'cast(todo_Title as varchar(254)) as todo_Title   , '  + #13 + #10 +
       'todo_Notes    , '  + #13 + #10 +
       'todo_KeyWords    , '  + #13 + #10 +
       'cast(todo_DocFile as varchar(254)) as todo_DocFile   , '  + #13 + #10 +
       'todo_DatGen        , '  + #13 + #10 +
       'todo_DatAlt          , '  + #13 + #10 +
       'todo_YNPrint         , '  + #13 + #10 +
       'todo_YNShow       , '  + #13 + #10 +
       'todo_VolgNr       , '  + #13 + #10 +
       'todo_Lu_Status, '  + #13 + #10 +
       'todo_Lu_Priority, '  + #13 + #10 +
       'todo_HasDeadLine, '  + #13 + #10 +
       'cast(todo_DatDeadLine as varchar(20)) as todo_DatDeadLine, '  + #13 + #10 +
       'cast(todo_DatAfgewerkt as varchar(20)) as todo_DatAfgewerkt, '  + #13 + #10 +
       'cast(todo_DatStart as varchar(20)) as todo_DatStart, '  + #13 + #10 +
       'todo_IsAfgewerkt, '  + #13 + #10 +
       'cast(todo_EndingFashion as varchar(20)) as todo_EndingFashion, ' + #10 +
       'cast(todo_Lu_Type as varchar(20)) as todo_Lu_Type, ' +
       'todo_IsAgenda, ' +
       'todo_LastSerial '   +
    'From ' + #13 +
       'Todos ' +
    'Where ' +
       '  ((todo_IsAfgewerkt = 0) and (todo_Lu_Type = ''Todo'')) ' + #13 + #10 +
    'Order by ' + #13 +
       'todo_VolgNr, todo_Title '  + #13 + #10 ;

  cns_Sql_ActiveByGrp =
    'Select ' + #13 +
       '_id    , '  + #13 + #10 +
       'todo_Fk_Subj    , '  + #13 + #10 +
       'todo_Ctrl    , '  + #13 + #10 +
       'cast(todo_Title as varchar(254)) as todo_Title   , '  + #13 + #10 +
       'todo_Notes    , '  + #13 + #10 +
       'todo_KeyWords    , '  + #13 + #10 +
       'cast(todo_DocFile as varchar(254)) as todo_DocFile   , '  + #13 + #10 +
       'todo_DatGen        , '  + #13 + #10 +
       'todo_DatAlt          , '  + #13 + #10 +
       'todo_YNPrint         , '  + #13 + #10 +
       'todo_YNShow       , '  + #13 + #10 +
       'todo_VolgNr       , '  + #13 + #10 +
       'todo_Lu_Status, '  + #13 + #10 +
       'todo_Lu_Priority, '  + #13 + #10 +
       'todo_HasDeadLine, '  + #13 + #10 +
       'cast(todo_DatDeadLine as varchar(20)) as todo_DatDeadLine, '  + #13 + #10 +
       'cast(todo_DatAfgewerkt as varchar(20)) as todo_DatAfgewerkt, '  + #13 + #10 +
       'cast(todo_DatStart as varchar(20)) as todo_DatStart, '  + #13 + #10 +
       'todo_IsAfgewerkt, '  + #13 + #10 +
    'cast(todo_EndingFashion as varchar(20)) as todo_EndingFashion, ' + #10 +
    'cast(todo_Lu_Type as varchar(20)) as todo_Lu_Type, ' +
    'todo_IsAgenda, ' +
       'todo_LastSerial ' +
    'From ' + #13 +
       'Todos ' +
    'Where ' +
       '((todo_Fk_Subj = :SubjectId) and (todo_IsAfgewerkt = 0) and (todo_Lu_Type = ''Todo'')) ' + #13 + #10 +
    'Order by ' + #13 +
       'todo_VolgNr, todo_Title '  + #13 + #10 ;

  cns_Sql_AlleTodos =
    'Select ' + #13 +
       '_id    , '  + #13 + #10 +
       'todo_Fk_Subj    , '  + #13 + #10 +
       'todo_Ctrl    , '  + #13 + #10 +
       'cast(todo_Title as varchar(254)) as todo_Title   , '  + #13 + #10 +
       'todo_Notes    , '  + #13 + #10 +
       'todo_KeyWords    , '  + #13 + #10 +
       'cast(todo_DocFile as varchar(254)) as todo_DocFile   , '  + #13 + #10 +
       'todo_DatGen        , '  + #13 + #10 +
       'todo_DatAlt          , '  + #13 + #10 +
       'todo_YNPrint         , '  + #13 + #10 +
       'todo_YNShow       , '  + #13 + #10 +
       'todo_VolgNr       , '  + #13 + #10 +
       'todo_Lu_Status, '  + #13 + #10 +
       'todo_Lu_Priority, '  + #13 + #10 +
       'todo_HasDeadLine, '  + #13 + #10 +
       'cast(todo_DatDeadLine as varchar(20)) as todo_DatDeadLine, '  + #13 + #10 +
       'cast(todo_DatAfgewerkt as varchar(20)) as todo_DatAfgewerkt, '  + #13 + #10 +
       'cast(todo_DatStart as varchar(20)) as todo_DatStart, '  + #13 + #10 +
       'todo_IsAfgewerkt, '  + #13 + #10 +
    'cast(todo_EndingFashion as varchar(20)) as todo_EndingFashion, ' + #10 +
    'cast(todo_Lu_Type as varchar(20)) as todo_Lu_Type, ' +
    'todo_IsAgenda, ' +
       'todo_LastSerial ' +
    'From ' + #13 +
       'Todos ' +
    'Where ' +
    'and (todo_Lu_Type = ''Todo'') ' +
    'Order by ' + #13 +
       'todo_VolgNr, todo_Title '  + #13 + #10;

  cns_Sql_AllAgendaItems =
     'Select ' +
  '_id    , ' + #10 +
  'todo_Fk_Subj    , ' + #10 +
  'todo_Ctrl    , ' + #10 +
  'cast(todo_Title as varchar(254)) as todo_Title   , ' + #10 +
  'todo_Notes    , ' + #10 +
  'todo_KeyWords    , ' + #10 +
  'cast(todo_DocFile as varchar(254)) as todo_DocFile   , '  + #10 +
  'todo_DatGen        , '  + #10 +
  'todo_DatAlt          , '  + #10 +
  'todo_YNPrint         , '  + #10 +
  'todo_YNShow       , '  + #10 +
  'todo_VolgNr       , '  + #10 +
  'todo_Lu_Status, '  + #10 +
  'todo_Lu_Priority, '  + #10 +
  'todo_HasDeadLine, '  + #10 +
  'cast(todo_DatDeadLine as varchar(20)) as todo_DatDeadLine, '  + #10 +
  'cast(todo_DatAfgewerkt as varchar(20)) as todo_DatAfgewerkt, '  + #10 +
  'cast(todo_DatStart as varchar(20)) as todo_DatStart, '  + #10 +
  'cast(todo_DatPlan as varchar(20)) as todo_DatPlan, '  + #10 +
  'todo_IsAgenda, '  + #10 +
  'todo_Importance, '  + #10 +
  'todo_IsAfgewerkt, '  + #10 +
  'todo_LastSerial ' +
 'From ' +
  'Todos ' +
'Where ' +
  ' ((todo_IsAgenda = 1) or (todo_Lu_Type = ''Event'') or (todo_Lu_Type = ''Journal'')) ' +
 'Order by ' +
  'todo_VolgNr, todo_Title '  + #10;

  cns_Sql_AgendaItemsBySubj =
     'Select ' +
  '_id    , ' + #10 +
  'todo_Fk_Subj    , ' + #10 +
  'todo_Ctrl    , ' + #10 +
  'cast(todo_Title as varchar(254)) as todo_Title   , ' + #10 +
  'todo_Notes    , ' + #10 +
  'todo_KeyWords    , ' + #10 +
  'cast(todo_DocFile as varchar(254)) as todo_DocFile   , '  + #10 +
  'todo_DatGen        , '  + #10 +
  'todo_DatAlt          , '  + #10 +
  'todo_YNPrint         , '  + #10 +
  'todo_YNShow       , '  + #10 +
  'todo_VolgNr       , '  + #10 +
  'todo_Lu_Status, '  + #10 +
  'todo_Lu_Priority, '  + #10 +
  'todo_HasDeadLine, '  + #10 +
  'cast(todo_DatDeadLine as varchar(20)) as todo_DatDeadLine, '  + #10 +
  'cast(todo_DatAfgewerkt as varchar(20)) as todo_DatAfgewerkt, '  + #10 +
  'cast(todo_DatStart as varchar(20)) as todo_DatStart, '  + #10 +
  'cast(todo_DatPlan as varchar(20)) as todo_DatPlan, '  + #10 +
  'todo_IsAgenda, '  + #10 +
  'todo_Importance, '  + #10 +
  'todo_IsAfgewerkt, '  + #10 +
  'todo_LastSerial ' +
 'From ' +
  'Todos ' +
'Where ' +
  '(((todo_IsAgenda = 1) or (todo_Lu_Type = ''Event'') or (todo_Lu_Type = ''Journal'')) and (todo_Fk_Subj = :SubjId)) ' +
  'Order by ' +
  'todo_VolgNr, todo_Title '  + #10;


implementation

end.

