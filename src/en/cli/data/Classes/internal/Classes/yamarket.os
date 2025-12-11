
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
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetMarketsList";
    NewLine.SearchMethod  = "GETMARKETSLIST";
    NewLine.Parameter     = "--Key)";
    NewLine.ParameterTrim = "-K";
    NewLine.Description     = "token";
    NewLine.Region      = "Campaigns and business";
    NewLine.MethodDescription   = "Gets the list of shops in the cabinet by token";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetMarketsList";
    NewLine.SearchMethod  = "GETMARKETSLIST";
    NewLine.Parameter     = "--page";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Issue page number of the list (optional, def. val.. - 1)";
    NewLine.Region      = "Campaigns and business";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetMarket";
    NewLine.SearchMethod  = "GETMARKET";
    NewLine.Parameter     = "--Key)";
    NewLine.ParameterTrim = "-K";
    NewLine.Description     = "token";
    NewLine.Region      = "Campaigns and business";
    NewLine.MethodDescription   = "Gets information about a market (campaign) by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetMarket";
    NewLine.SearchMethod  = "GETMARKET";
    NewLine.Parameter     = "--campaign";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Market ID (campaignsId)";
    NewLine.Region      = "Campaigns and business";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetBusinessSettings";
    NewLine.SearchMethod  = "GETBUSINESSSETTINGS";
    NewLine.Parameter     = "--Key)";
    NewLine.ParameterTrim = "-K";
    NewLine.Description     = "token";
    NewLine.Region      = "Campaigns and business";
    NewLine.MethodDescription   = "Gets the values of cabinet (business) settings by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetBusinessSettings";
    NewLine.SearchMethod  = "GETBUSINESSSETTINGS";
    NewLine.Parameter     = "--business";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Business ID";
    NewLine.Region      = "Campaigns and business";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetCampaignSettings";
    NewLine.SearchMethod  = "GETCAMPAIGNSETTINGS";
    NewLine.Parameter     = "--Key)";
    NewLine.ParameterTrim = "-K";
    NewLine.Description     = "token";
    NewLine.Region      = "Campaigns and business";
    NewLine.MethodDescription   = "Gets market (campaign) settings by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetCampaignSettings";
    NewLine.SearchMethod  = "GETCAMPAIGNSETTINGS";
    NewLine.Parameter     = "--campaign";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Market ID (campaignsId)";
    NewLine.Region      = "Campaigns and business";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "AddUpdateProducts";
    NewLine.SearchMethod  = "ADDUPDATEPRODUCTS";
    NewLine.Parameter     = "--Key)";
    NewLine.ParameterTrim = "-K";
    NewLine.Description     = "token";
    NewLine.Region      = "Product management";
    NewLine.MethodDescription   = "Adds or updates product information in the catalogue";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "AddUpdateProducts";
    NewLine.SearchMethod  = "ADDUPDATEPRODUCTS";
    NewLine.Parameter     = "--business";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Business ID";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "AddUpdateProducts";
    NewLine.SearchMethod  = "ADDUPDATEPRODUCTS";
    NewLine.Parameter     = "--offers";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Array of product descriptions";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "AddUpdateProducts";
    NewLine.SearchMethod  = "ADDUPDATEPRODUCTS";
    NewLine.Parameter     = "--pmedia";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "A flag of using only your own product images (optional, def. val.. - False)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetCampaignProducts";
    NewLine.SearchMethod  = "GETCAMPAIGNPRODUCTS";
    NewLine.Parameter     = "--Key)";
    NewLine.ParameterTrim = "-K";
    NewLine.Description     = "token";
    NewLine.Region      = "Product management";
    NewLine.MethodDescription   = "Gets the list of products of the selected market (campaign)";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetCampaignProducts";
    NewLine.SearchMethod  = "GETCAMPAIGNPRODUCTS";
    NewLine.Parameter     = "--business";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Campaign ID";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetCampaignProducts";
    NewLine.SearchMethod  = "GETCAMPAIGNPRODUCTS";
    NewLine.Parameter     = "--filters";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Product filters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetCampaignProducts";
    NewLine.SearchMethod  = "GETCAMPAIGNPRODUCTS";
    NewLine.Parameter     = "--page";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Next page token in case of a large selection (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetBusinessProducts";
    NewLine.SearchMethod  = "GETBUSINESSPRODUCTS";
    NewLine.Parameter     = "--Key)";
    NewLine.ParameterTrim = "-K";
    NewLine.Description     = "token";
    NewLine.Region      = "Product management";
    NewLine.MethodDescription   = "Gets the list of products of the business";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetBusinessProducts";
    NewLine.SearchMethod  = "GETBUSINESSPRODUCTS";
    NewLine.Parameter     = "--business";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Business ID";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetBusinessProducts";
    NewLine.SearchMethod  = "GETBUSINESSPRODUCTS";
    NewLine.Parameter     = "--filters";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Product filters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetBusinessProducts";
    NewLine.SearchMethod  = "GETBUSINESSPRODUCTS";
    NewLine.Parameter     = "--page";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Next page token in case of a large selection (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yamarket";
    NewLine.Module       = "OPI_YandexMarket";
    NewLine.Method        = "GetProductStructure";
    NewLine.SearchMethod  = "GETPRODUCTSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Product management";
    NewLine.MethodDescription   = "Gets the structure of product standard fields";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_YandexMarket = LoadScript(""%1/oint/core/Modules/OPI_YandexMarket.os"", Context);
        |" + Chars.LF;


EndFunction 
