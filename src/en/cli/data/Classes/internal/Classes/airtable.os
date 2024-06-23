Function ПолучитьСостав() Export

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Библиотека");
    CompositionTable.Columns.Add("Модуль");
    CompositionTable.Columns.Add("Метод");
    CompositionTable.Columns.Add("МетодПоиска");
    CompositionTable.Columns.Add("Параметр");
    CompositionTable.Columns.Add("Описание");
    CompositionTable.Columns.Add("ОписаниеМетода");
    CompositionTable.Columns.Add("Область");

    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetListOfBases";
    NewLine.МетодПоиска = "GETLISTOFBASES";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Working with databases";
    NewLine.ОписаниеМетода   = "Gets the list of available bases";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetListOfBases";
    NewLine.МетодПоиска = "GETLISTOFBASES";
    NewLine.Параметр    = "--offset";
    NewLine.Описание    = "Next page identifier of the base list from the previous request (optional, def. val. - Empty)";
    NewLine.Область     = "Working with databases";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetDatabaseTables";
    NewLine.МетодПоиска = "GETDATABASETABLES";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Working with databases";
    NewLine.ОписаниеМетода   = "Gets the schema of base tables";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetDatabaseTables";
    NewLine.МетодПоиска = "GETDATABASETABLES";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Base identifier";
    NewLine.Область     = "Working with databases";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateDatabase";
    NewLine.МетодПоиска = "CREATEDATABASE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Working with databases";
    NewLine.ОписаниеМетода   = "Creates a new database
    |
    |    The structure of the JSON table properties data (parameter --tablesdata):
    |  {
    |    ""Table name 1"": [
    |                         {
    |                          <Field description data 1>
    |                         },
    |                         {
    |                          <Field description data 2>
    |                        },
    |                       ],
    |   ...
    |  }
    |
    |Functions for generating field descriptions: GetStringField, GetNumberField, GetAttachmentField, GetCheckboxField, GetDateField, GetEmailField, GetPhoneField, GetLinkField
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateDatabase";
    NewLine.МетодПоиска = "CREATEDATABASE";
    NewLine.Параметр    = "--ws";
    NewLine.Описание    = "Workspace identifier";
    NewLine.Область     = "Working with databases";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateDatabase";
    NewLine.МетодПоиска = "CREATEDATABASE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New base name";
    NewLine.Область     = "Working with databases";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateDatabase";
    NewLine.МетодПоиска = "CREATEDATABASE";
    NewLine.Параметр    = "--tablesdata";
    NewLine.Описание    = "Table description: Key > name, Value > array of fields";
    NewLine.Область     = "Working with databases";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateTable";
    NewLine.МетодПоиска = "CREATETABLE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Table management";
    NewLine.ОписаниеМетода   = "Creates a new table in the base
    |
    |    The structure of the JSON array of fields data (parameter --fieldsdata):
    |    [
    |        {
    |          <Field description data 1>
    |        },
    |        {
    |          <Field description data 2>
    |        },
    |    ]
    |
    |Functions for generating field descriptions: GetStringField, GetNumberField, GetAttachmentField, GetCheckboxField, GetDateField, GetEmailField, GetPhoneField, GetLinkField
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateTable";
    NewLine.МетодПоиска = "CREATETABLE";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Base identifier";
    NewLine.Область     = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateTable";
    NewLine.МетодПоиска = "CREATETABLE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New table name";
    NewLine.Область     = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateTable";
    NewLine.МетодПоиска = "CREATETABLE";
    NewLine.Параметр    = "--fieldsdata";
    NewLine.Описание    = "Array of field descriptions";
    NewLine.Область     = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateTable";
    NewLine.МетодПоиска = "CREATETABLE";
    NewLine.Параметр    = "--description";
    NewLine.Описание    = "Table description (optional, def. val. - Empty)";
    NewLine.Область     = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "ModifyTable";
    NewLine.МетодПоиска = "MODIFYTABLE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Table management";
    NewLine.ОписаниеМетода   = "Changes the name and    |   or description of the base";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "ModifyTable";
    NewLine.МетодПоиска = "MODIFYTABLE";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Base identifier";
    NewLine.Область     = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "ModifyTable";
    NewLine.МетодПоиска = "MODIFYTABLE";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table identifier";
    NewLine.Область     = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "ModifyTable";
    NewLine.МетодПоиска = "MODIFYTABLE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New name (optional, def. val. - Empty)";
    NewLine.Область     = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "ModifyTable";
    NewLine.МетодПоиска = "MODIFYTABLE";
    NewLine.Параметр    = "--description";
    NewLine.Описание    = "New description (optional, def. val. - Empty)";
    NewLine.Область     = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateField";
    NewLine.МетодПоиска = "CREATEFIELD";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Working with fields";
    NewLine.ОписаниеМетода   = "Creates a new field in the table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateField";
    NewLine.МетодПоиска = "CREATEFIELD";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Base identifier";
    NewLine.Область     = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateField";
    NewLine.МетодПоиска = "CREATEFIELD";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table identifier";
    NewLine.Область     = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateField";
    NewLine.МетодПоиска = "CREATEFIELD";
    NewLine.Параметр    = "--Description of the new field";
    NewLine.Описание    = "fielddata";
    NewLine.Область     = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "ModifyField";
    NewLine.МетодПоиска = "MODIFYFIELD";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Working with fields";
    NewLine.ОписаниеМетода   = "Changes the name and    |   or description of an existing table field";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "ModifyField";
    NewLine.МетодПоиска = "MODIFYFIELD";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Base identifier Base";
    NewLine.Область     = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "ModifyField";
    NewLine.МетодПоиска = "MODIFYFIELD";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table identifier";
    NewLine.Область     = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "ModifyField";
    NewLine.МетодПоиска = "MODIFYFIELD";
    NewLine.Параметр    = "--field";
    NewLine.Описание    = "Field identifier";
    NewLine.Область     = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "ModifyField";
    NewLine.МетодПоиска = "MODIFYFIELD";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New name (optional, def. val. - Empty)";
    NewLine.Область     = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "ModifyField";
    NewLine.МетодПоиска = "MODIFYFIELD";
    NewLine.Параметр    = "--description";
    NewLine.Описание    = "New description (optional, def. val. - Empty)";
    NewLine.Область     = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetStringField";
    NewLine.МетодПоиска = "GETSTRINGFIELD";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New field name";
    NewLine.Область     = "Working with fields";
    NewLine.ОписаниеМетода   = "Gets the description of a string field";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetNumberField";
    NewLine.МетодПоиска = "GETNUMBERFIELD";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New field name";
    NewLine.Область     = "Working with fields";
    NewLine.ОписаниеМетода   = "Gets the description of a numeric field";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetNumberField";
    NewLine.МетодПоиска = "GETNUMBERFIELD";
    NewLine.Параметр    = "--precision";
    NewLine.Описание    = "Number of decimal places (optional, def. val. - Empty)";
    NewLine.Область     = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetAttachmentField";
    NewLine.МетодПоиска = "GETATTACHMENTFIELD";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Field name";
    NewLine.Область     = "Working with fields";
    NewLine.ОписаниеМетода   = "Gets the description of a file field";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetCheckboxField";
    NewLine.МетодПоиска = "GETCHECKBOXFIELD";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Field name";
    NewLine.Область     = "Working with fields";
    NewLine.ОписаниеМетода   = "Gets the description of a boolean field";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetDateField";
    NewLine.МетодПоиска = "GETDATEFIELD";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Field name";
    NewLine.Область     = "Working with fields";
    NewLine.ОписаниеМетода   = "Gets the description of a date field";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetEmailField";
    NewLine.МетодПоиска = "GETEMAILFIELD";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Field name";
    NewLine.Область     = "Working with fields";
    NewLine.ОписаниеМетода   = "Gets the description of an email field";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetPhoneField";
    NewLine.МетодПоиска = "GETPHONEFIELD";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Field name";
    NewLine.Область     = "Working with fields";
    NewLine.ОписаниеМетода   = "Gets the description of a phone number field";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetLinkField";
    NewLine.МетодПоиска = "GETLINKFIELD";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Field name";
    NewLine.Область     = "Working with fields";
    NewLine.ОписаниеМетода   = "Gets the description of a URL field";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetListOfRecords";
    NewLine.МетодПоиска = "GETLISTOFRECORDS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Record management";
    NewLine.ОписаниеМетода   = "Gets the list of records of the selected table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetListOfRecords";
    NewLine.МетодПоиска = "GETLISTOFRECORDS";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Database identifier";
    NewLine.Область     = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetListOfRecords";
    NewLine.МетодПоиска = "GETLISTOFRECORDS";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table identifier";
    NewLine.Область     = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetListOfRecords";
    NewLine.МетодПоиска = "GETLISTOFRECORDS";
    NewLine.Параметр    = "--offset";
    NewLine.Описание    = "Next page identifier of data from the previous request (optional, def. val. - Empty)";
    NewLine.Область     = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetRecord";
    NewLine.МетодПоиска = "GETRECORD";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Record management";
    NewLine.ОписаниеМетода   = "Gets row data of the table by identifier";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetRecord";
    NewLine.МетодПоиска = "GETRECORD";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Database identifier";
    NewLine.Область     = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetRecord";
    NewLine.МетодПоиска = "GETRECORD";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table identifier";
    NewLine.Область     = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetRecord";
    NewLine.МетодПоиска = "GETRECORD";
    NewLine.Параметр    = "--record";
    NewLine.Описание    = "Record identifier in the table";
    NewLine.Область     = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreatePosts";
    NewLine.МетодПоиска = "CREATEPOSTS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Record management";
    NewLine.ОписаниеМетода   = "Creates one or an array of records by description or an array of field value descriptions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreatePosts";
    NewLine.МетодПоиска = "CREATEPOSTS";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Database identifier";
    NewLine.Область     = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreatePosts";
    NewLine.МетодПоиска = "CREATEPOSTS";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table identifier";
    NewLine.Область     = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreatePosts";
    NewLine.МетодПоиска = "CREATEPOSTS";
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Set or array of sets of pairs Key : Value > Field : FieldValue";
    NewLine.Область     = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "DeletePosts";
    NewLine.МетодПоиска = "DELETEPOSTS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Record management";
    NewLine.ОписаниеМетода   = "Deletes one or an array of records by identifiers";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "DeletePosts";
    NewLine.МетодПоиска = "DELETEPOSTS";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Database identifier";
    NewLine.Область     = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "DeletePosts";
    NewLine.МетодПоиска = "DELETEPOSTS";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table identifier";
    NewLine.Область     = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "DeletePosts";
    NewLine.МетодПоиска = "DELETEPOSTS";
    NewLine.Параметр    = "--records";
    NewLine.Описание    = "Identifier or array of record identifiers";
    NewLine.Область     = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetComments";
    NewLine.МетодПоиска = "GETCOMMENTS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Comment management";
    NewLine.ОписаниеМетода   = "Gets the list of comments for a record in the table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetComments";
    NewLine.МетодПоиска = "GETCOMMENTS";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Database identifier";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetComments";
    NewLine.МетодПоиска = "GETCOMMENTS";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table identifier";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetComments";
    NewLine.МетодПоиска = "GETCOMMENTS";
    NewLine.Параметр    = "--record";
    NewLine.Описание    = "Record identifier in the table";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "GetComments";
    NewLine.МетодПоиска = "GETCOMMENTS";
    NewLine.Параметр    = "--offset";
    NewLine.Описание    = "Next page identifier of data from the previous request (optional, def. val. - Empty)";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateComment";
    NewLine.МетодПоиска = "CREATECOMMENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Comment management";
    NewLine.ОписаниеМетода   = "Creates a comment for a record in the table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateComment";
    NewLine.МетодПоиска = "CREATECOMMENT";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Database identifier";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateComment";
    NewLine.МетодПоиска = "CREATECOMMENT";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table identifier";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateComment";
    NewLine.МетодПоиска = "CREATECOMMENT";
    NewLine.Параметр    = "--record";
    NewLine.Описание    = "Record identifier in the table";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "CreateComment";
    NewLine.МетодПоиска = "CREATECOMMENT";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Comment text";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "EditComment";
    NewLine.МетодПоиска = "EDITCOMMENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Comment management";
    NewLine.ОписаниеМетода   = "Changes the text of an existing comment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "EditComment";
    NewLine.МетодПоиска = "EDITCOMMENT";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Database identifier";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "EditComment";
    NewLine.МетодПоиска = "EDITCOMMENT";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table identifier";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "EditComment";
    NewLine.МетодПоиска = "EDITCOMMENT";
    NewLine.Параметр    = "--record";
    NewLine.Описание    = "Record identifier in the table";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "EditComment";
    NewLine.МетодПоиска = "EDITCOMMENT";
    NewLine.Параметр    = "--comment";
    NewLine.Описание    = "Comment identifier";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "EditComment";
    NewLine.МетодПоиска = "EDITCOMMENT";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "New comment text";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "DeleteComment";
    NewLine.МетодПоиска = "DELETECOMMENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Comment management";
    NewLine.ОписаниеМетода   = "Deletes a comment for a table record";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "DeleteComment";
    NewLine.МетодПоиска = "DELETECOMMENT";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Database identifier";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "DeleteComment";
    NewLine.МетодПоиска = "DELETECOMMENT";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table identifier";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "DeleteComment";
    NewLine.МетодПоиска = "DELETECOMMENT";
    NewLine.Параметр    = "--record";
    NewLine.Описание    = "Record identifier in the table";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "airtable";
    NewLine.Модуль      = "OPI_Airtable";
    NewLine.Метод       = "DeleteComment";
    NewLine.МетодПоиска = "DELETECOMMENT";
    NewLine.Параметр    = "--comment";
    NewLine.Описание    = "Comment identifier";
    NewLine.Область     = "Comment management";

    Return CompositionTable;
EndFunction

