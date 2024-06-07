Function GetComposition() Export

    TableСоwithтаinа = New ValueTable();
    TableСоwithтаinа.Columns.Add("Library");
    TableСоwithтаinа.Columns.Add("Module");
    TableСоwithтаinа.Columns.Add("Method");
    TableСоwithтаinа.Columns.Add("SearchMethod");
    TableСоwithтаinа.Columns.Add("Parameter");
    TableСоwithтаinа.Columns.Add("Description");
    TableСоwithтаinа.Columns.Add("MethodDescription");
    TableСоwithтаinа.Columns.Add("Region");

    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "tools";
    NewLine.Module      = "Утorты";
    NewLine.Method       = "ParseJSON";
    NewLine.SearchMethod = "РАЗЛОЖAndТЬJSON";
    NewLine.Parameter    = "--json";
    NewLine.Description    = "JSON data";
    NewLine.Region     = "Служебный программный andнтерфейwith";
    NewLine.MethodDescription   = "Displays the values that can be obtained from the passed JSON and returns
    |    Specific Value When Specifying Field Name";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "tools";
    NewLine.Module      = "Утorты";
    NewLine.Method       = "ParseJSON";
    NewLine.SearchMethod = "РАЗЛОЖAndТЬJSON";
    NewLine.Parameter    = "--nesting";
    NewLine.Description    = "Parsing depth limit. Full depth by default (optional, def. val. - Empty)";
    NewLine.Region     = "Служебный программный andнтерфейwith";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "tools";
    NewLine.Module      = "Утorты";
    NewLine.Method       = "ParseJSON";
    NewLine.SearchMethod = "РАЗЛОЖAndТЬJSON";
    NewLine.Parameter    = "--name";
    NewLine.Description    = "Field name to retrieve. Displays the entire list if not specified (optional, def. val. - Empty)";
    NewLine.Region     = "Служебный программный andнтерфейwith";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "tools";
    NewLine.Module      = "Утorты";
    NewLine.Method       = "ParseJSON";
    NewLine.SearchMethod = "РАЗЛОЖAndТЬJSON";
    NewLine.Parameter    = "--enc";
    NewLine.Description    = "Encoding of JSON Data (optional, def. val. - UTF-8)";
    NewLine.Region     = "Служебный программный andнтерфейwith";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "tools";
    NewLine.Module      = "Утorты";
    NewLine.Method       = "ConvertBase64ToBinary";
    NewLine.SearchMethod = "ПРЕОБРАЗОInАТЬBASE64InДInОAndЧNЫЕ";
    NewLine.Parameter    = "--in";
    NewLine.Description    = "Base64 File";
    NewLine.Region     = "Служебный программный andнтерфейwith";
    NewLine.MethodDescription   = "Convert file with Base64 string to binary file";

    Return TableСоwithтаinа;
EndFunction

