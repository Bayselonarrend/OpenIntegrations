
Var CompositionTable;

Function GetComposition() Export

    If CompositionTable <> Undefined Then
        Return CompositionTable;
    EndIf;

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Library");
    CompositionTable.Columns.Add("Module");
    CompositionTable.Columns.Add("Method");
    CompositionTable.Columns.Add("SearchMethod");
    CompositionTable.Columns.Add("Parameter");
    CompositionTable.Columns.Add("ParameterTrim");
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetListOfBases";
    NewLine.SearchMethod  = "GETLISTOFBASES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Working with databases";
    NewLine.MethodDescription   = "Gets the list of available bases";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetListOfBases";
    NewLine.SearchMethod  = "GETLISTOFBASES";
    NewLine.Parameter     = "--offset";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Next page identifier of the base list from the previous request (optional, def. val. - Empty value)";
    NewLine.Region      = "Working with databases";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetDatabaseTables";
    NewLine.SearchMethod  = "GETDATABASETABLES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Working with databases";
    NewLine.MethodDescription   = "Gets the schema of base tables";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetDatabaseTables";
    NewLine.SearchMethod  = "GETDATABASETABLES";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Base identifier";
    NewLine.Region      = "Working with databases";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateDatabase";
    NewLine.SearchMethod  = "CREATEDATABASE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Working with databases";
    NewLine.MethodDescription   = "Creates a new database
    |    Data structure for option --tablesdata:
    |    {
    |    ""Table name 1"": [
    |                         {
    |                          <Field description data 1>
    |                         },
    |                         {
    |                          <Field description data 2>
    |                        },
    |                       ],
    |    ...
    |    }
    |    
    |    Functions for generating field descriptions: GetStringField, GetNumberField, GetAttachmentField, GetCheckboxField, GetDateField, GetEmailField, GetPhoneField, GetLinkField
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateDatabase";
    NewLine.SearchMethod  = "CREATEDATABASE";
    NewLine.Parameter     = "--ws";
    NewLine.ParameterTrim = "-w";
    NewLine.Description     = "Workspace identifier";
    NewLine.Region      = "Working with databases";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateDatabase";
    NewLine.SearchMethod  = "CREATEDATABASE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New base name";
    NewLine.Region      = "Working with databases";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateDatabase";
    NewLine.SearchMethod  = "CREATEDATABASE";
    NewLine.Parameter     = "--tablesdata";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Table description: Key > name, Value > array of fields";
    NewLine.Region      = "Working with databases";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateTable";
    NewLine.SearchMethod  = "CREATETABLE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Table management";
    NewLine.MethodDescription   = "Creates a new table in the base
    |    [
    |    Data structure for option --fieldsdata:
    |        {
    |          <Field description data 1>
    |        },
    |        {
    |          <Field description data 2>
    |        },
    |    ]
    |    
    |    Functions for generating field descriptions: GetStringField, GetNumberField, GetAttachmentField, GetCheckboxField, GetDateField, GetEmailField, GetPhoneField, GetLinkField
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateTable";
    NewLine.SearchMethod  = "CREATETABLE";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Base identifier";
    NewLine.Region      = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateTable";
    NewLine.SearchMethod  = "CREATETABLE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New table name";
    NewLine.Region      = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateTable";
    NewLine.SearchMethod  = "CREATETABLE";
    NewLine.Parameter     = "--fieldsdata";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Array of field descriptions";
    NewLine.Region      = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateTable";
    NewLine.SearchMethod  = "CREATETABLE";
    NewLine.Parameter     = "--description";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Table description (optional, def. val. - Empty value)";
    NewLine.Region      = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "ModifyTable";
    NewLine.SearchMethod  = "MODIFYTABLE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Table management";
    NewLine.MethodDescription   = "Changes the name and    |   or description of the base";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "ModifyTable";
    NewLine.SearchMethod  = "MODIFYTABLE";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Base identifier";
    NewLine.Region      = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "ModifyTable";
    NewLine.SearchMethod  = "MODIFYTABLE";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Table identifier";
    NewLine.Region      = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "ModifyTable";
    NewLine.SearchMethod  = "MODIFYTABLE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New name (optional, def. val. - Empty value)";
    NewLine.Region      = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "ModifyTable";
    NewLine.SearchMethod  = "MODIFYTABLE";
    NewLine.Parameter     = "--description";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "New description (optional, def. val. - Empty value)";
    NewLine.Region      = "Table management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateField";
    NewLine.SearchMethod  = "CREATEFIELD";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Working with fields";
    NewLine.MethodDescription   = "Creates a new field in the table
    |    Functions for generating field descriptions: GetStringField, GetNumberField, GetAttachmentField, GetCheckboxField, GetDateField, GetEmailField, GetPhoneField, GetLinkField
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateField";
    NewLine.SearchMethod  = "CREATEFIELD";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Base identifier";
    NewLine.Region      = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateField";
    NewLine.SearchMethod  = "CREATEFIELD";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Table identifier";
    NewLine.Region      = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateField";
    NewLine.SearchMethod  = "CREATEFIELD";
    NewLine.Parameter     = "--fielddata";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Description of the new field";
    NewLine.Region      = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "ModifyField";
    NewLine.SearchMethod  = "MODIFYFIELD";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Working with fields";
    NewLine.MethodDescription   = "Changes the name and    |   or description of an existing table field";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "ModifyField";
    NewLine.SearchMethod  = "MODIFYFIELD";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Base identifier Base";
    NewLine.Region      = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "ModifyField";
    NewLine.SearchMethod  = "MODIFYFIELD";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Table identifier";
    NewLine.Region      = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "ModifyField";
    NewLine.SearchMethod  = "MODIFYFIELD";
    NewLine.Parameter     = "--field";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Field identifier";
    NewLine.Region      = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "ModifyField";
    NewLine.SearchMethod  = "MODIFYFIELD";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New name (optional, def. val. - Empty value)";
    NewLine.Region      = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "ModifyField";
    NewLine.SearchMethod  = "MODIFYFIELD";
    NewLine.Parameter     = "--description";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "New description (optional, def. val. - Empty value)";
    NewLine.Region      = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetStringField";
    NewLine.SearchMethod  = "GETSTRINGFIELD";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "New field name";
    NewLine.Region      = "Working with fields";
    NewLine.MethodDescription   = "Gets the description of a string field";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetNumberField";
    NewLine.SearchMethod  = "GETNUMBERFIELD";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "New field name";
    NewLine.Region      = "Working with fields";
    NewLine.MethodDescription   = "Gets the description of a numeric field";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetNumberField";
    NewLine.SearchMethod  = "GETNUMBERFIELD";
    NewLine.Parameter     = "--precision";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Number of decimal places (optional, def. val. - Empty value)";
    NewLine.Region      = "Working with fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetAttachmentField";
    NewLine.SearchMethod  = "GETATTACHMENTFIELD";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Field name";
    NewLine.Region      = "Working with fields";
    NewLine.MethodDescription   = "Gets the description of a file field";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetCheckboxField";
    NewLine.SearchMethod  = "GETCHECKBOXFIELD";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Field name";
    NewLine.Region      = "Working with fields";
    NewLine.MethodDescription   = "Gets the description of a boolean field";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetDateField";
    NewLine.SearchMethod  = "GETDATEFIELD";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Field name";
    NewLine.Region      = "Working with fields";
    NewLine.MethodDescription   = "Gets the description of a date field";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetEmailField";
    NewLine.SearchMethod  = "GETEMAILFIELD";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Field name";
    NewLine.Region      = "Working with fields";
    NewLine.MethodDescription   = "Gets the description of an email field";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetPhoneField";
    NewLine.SearchMethod  = "GETPHONEFIELD";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Field name";
    NewLine.Region      = "Working with fields";
    NewLine.MethodDescription   = "Gets the description of a phone number field";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetLinkField";
    NewLine.SearchMethod  = "GETLINKFIELD";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Field name";
    NewLine.Region      = "Working with fields";
    NewLine.MethodDescription   = "Gets the description of a URL field";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetListOfRecords";
    NewLine.SearchMethod  = "GETLISTOFRECORDS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Record management";
    NewLine.MethodDescription   = "Gets the list of records of the selected table";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetListOfRecords";
    NewLine.SearchMethod  = "GETLISTOFRECORDS";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Database identifier";
    NewLine.Region      = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetListOfRecords";
    NewLine.SearchMethod  = "GETLISTOFRECORDS";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Table identifier";
    NewLine.Region      = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetListOfRecords";
    NewLine.SearchMethod  = "GETLISTOFRECORDS";
    NewLine.Parameter     = "--offset";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Next page identifier of data from the previous request (optional, def. val. - Empty value)";
    NewLine.Region      = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetRecord";
    NewLine.SearchMethod  = "GETRECORD";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Record management";
    NewLine.MethodDescription   = "Gets row data of the table by identifier";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetRecord";
    NewLine.SearchMethod  = "GETRECORD";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Database identifier";
    NewLine.Region      = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetRecord";
    NewLine.SearchMethod  = "GETRECORD";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Table identifier";
    NewLine.Region      = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetRecord";
    NewLine.SearchMethod  = "GETRECORD";
    NewLine.Parameter     = "--record";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Record identifier in the table";
    NewLine.Region      = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreatePosts";
    NewLine.SearchMethod  = "CREATEPOSTS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Record management";
    NewLine.MethodDescription   = "Creates one or an array of records by description or an array of field value descriptions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreatePosts";
    NewLine.SearchMethod  = "CREATEPOSTS";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Database identifier";
    NewLine.Region      = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreatePosts";
    NewLine.SearchMethod  = "CREATEPOSTS";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Table identifier";
    NewLine.Region      = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreatePosts";
    NewLine.SearchMethod  = "CREATEPOSTS";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Set or array of sets of pairs Key : Value > Field : FieldValue";
    NewLine.Region      = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "DeleteRecords";
    NewLine.SearchMethod  = "DELETERECORDS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Record management";
    NewLine.MethodDescription   = "Deletes one or an array of records by identifiers";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "DeleteRecords";
    NewLine.SearchMethod  = "DELETERECORDS";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Database identifier";
    NewLine.Region      = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "DeleteRecords";
    NewLine.SearchMethod  = "DELETERECORDS";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Table identifier";
    NewLine.Region      = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "DeleteRecords";
    NewLine.SearchMethod  = "DELETERECORDS";
    NewLine.Parameter     = "--records";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Identifier or array of record identifiers";
    NewLine.Region      = "Record management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetComments";
    NewLine.SearchMethod  = "GETCOMMENTS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Comment management";
    NewLine.MethodDescription   = "Gets the list of comments for a record in the table";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetComments";
    NewLine.SearchMethod  = "GETCOMMENTS";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Database identifier";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetComments";
    NewLine.SearchMethod  = "GETCOMMENTS";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Table identifier";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetComments";
    NewLine.SearchMethod  = "GETCOMMENTS";
    NewLine.Parameter     = "--record";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Record identifier in the table";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "GetComments";
    NewLine.SearchMethod  = "GETCOMMENTS";
    NewLine.Parameter     = "--offset";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Next page identifier of data from the previous request (optional, def. val. - Empty value)";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateComment";
    NewLine.SearchMethod  = "CREATECOMMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Comment management";
    NewLine.MethodDescription   = "Creates a comment for a record in the table";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateComment";
    NewLine.SearchMethod  = "CREATECOMMENT";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Database identifier";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateComment";
    NewLine.SearchMethod  = "CREATECOMMENT";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Table identifier";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateComment";
    NewLine.SearchMethod  = "CREATECOMMENT";
    NewLine.Parameter     = "--record";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Record identifier in the table";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "CreateComment";
    NewLine.SearchMethod  = "CREATECOMMENT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Comment text";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "EditComment";
    NewLine.SearchMethod  = "EDITCOMMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Comment management";
    NewLine.MethodDescription   = "Changes the text of an existing comment";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "EditComment";
    NewLine.SearchMethod  = "EDITCOMMENT";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Database identifier";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "EditComment";
    NewLine.SearchMethod  = "EDITCOMMENT";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Table identifier";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "EditComment";
    NewLine.SearchMethod  = "EDITCOMMENT";
    NewLine.Parameter     = "--record";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Record identifier in the table";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "EditComment";
    NewLine.SearchMethod  = "EDITCOMMENT";
    NewLine.Parameter     = "--comment";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Comment identifier";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "EditComment";
    NewLine.SearchMethod  = "EDITCOMMENT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New comment text";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "DeleteComment";
    NewLine.SearchMethod  = "DELETECOMMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Comment management";
    NewLine.MethodDescription   = "Deletes a comment for a table record";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "DeleteComment";
    NewLine.SearchMethod  = "DELETECOMMENT";
    NewLine.Parameter     = "--base";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Database identifier";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "DeleteComment";
    NewLine.SearchMethod  = "DELETECOMMENT";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Table identifier";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "DeleteComment";
    NewLine.SearchMethod  = "DELETECOMMENT";
    NewLine.Parameter     = "--record";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Record identifier in the table";
    NewLine.Region      = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "airtable";
    NewLine.Module       = "OPI_Airtable";
    NewLine.Method        = "DeleteComment";
    NewLine.SearchMethod  = "DELETECOMMENT";
    NewLine.Parameter     = "--comment";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Comment identifier";
    NewLine.Region      = "Comment management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_Airtable = LoadScript(""%1/oint/core/Modules/OPI_Airtable.os"", Context);
        |" + Chars.LF;


EndFunction 
