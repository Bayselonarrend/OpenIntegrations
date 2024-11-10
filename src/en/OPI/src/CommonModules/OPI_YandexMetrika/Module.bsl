// OneScript: ./OInt/core/Modules/OPI_YandexMetrika.os
// Lib: Yandex Metrika
// CLI: metrika

// MIT License

// Copyright (c) 2023 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

// Uncomment if OneScript is executed
// #Use "../../tools"

#Region Public

#Region TagsManagment

// Create tag
// Creates a tag with the specified name
//
// Note
// Method at API documentation: [Creating a tag](@yandex.ru/dev/metrika/en/management/openapi/label/createLabel)
//
// Parameters:
// Token - String - Auth token - token
// Name - String - Tag title - title
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function CreateTag(Val Token, Val Name) Export

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/labels";

    Label = New Structure;
    OPI_Tools.AddField("name", Name, "String", Label);

    Response = OPI_Tools.Post(URL, New Structure("label", Label), Headers);

    Return Response;

EndFunction

// Update tag
// Changes the tag name by ID
//
// Note
// Method at API documentation: [Changing a tag](@yandex.ru/dev/metrika/en/management/openapi/label/updateLabel)
//
// Parameters:
// Token - String - Auth token - token
// TagID - String - Tag ID to change - label
// Name - String - New name - title
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function UpdateTag(Val Token, Val TagID, Val Name) Export

    OPI_TypeConversion.GetLine(TagID);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/label/" + TagID;

    Label = New Structure;
    OPI_Tools.AddField("name", Name, "String", Label);

    Response = OPI_Tools.Put(URL, New Structure("label", Label), Headers);

    Return Response;

EndFunction

// Get tag
// Gets the tag by ID
//
// Note
// Method at API documentation: [Tag information](@yandex.ru/dev/metrika/en/management/openapi/label/getLabel)
//
// Parameters:
// Token - String - Auth token - token
// TagID - String - Tag ID - label
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetTag(Val Token, Val TagID) Export

    OPI_TypeConversion.GetLine(TagID);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/label/" + TagID;

    Response = OPI_Tools.Get(URL, , Headers);

    Return Response;

EndFunction

// Delete tag
// Deletes a tag by ID
//
// Note
// Method at API documentation: [Deleting a tag](@yandex.ru/dev/metrika/en/management/openapi/label/deleteLabel)
//
// Parameters:
// Token - String - Auth token - token
// TagID - String - ID of the tag to be deleted - label
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function DeleteTag(Val Token, Val TagID) Export

    OPI_TypeConversion.GetLine(TagID);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/label/" + TagID;

    Response = OPI_Tools.Delete(URL, , Headers);

    Return Response;

EndFunction

// Get tags list
// Gets a list of the users tags
//
// Note
// Method at API documentation: [List of user tags](@yandex.ru/dev/metrika/en/management/openapi/label/getLabels)
//
// Parameters:
// Token - String - Auth token - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetTagsList(Val Token) Export

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/labels";

    Response = OPI_Tools.Get(URL, , Headers);

    Return Response;

EndFunction

#EndRegion

#Region CountersManagement

// Create counter
// Creates a counter by field description
//
// Note
// Method at API documentation: [Creating a counter](@yandex.ru/dev/metrika/en/management/openapi/counter/addCounter)
//
// Parameters:
// Token - String - Auth token - token
// CounterStructure - Structure of KeyAndValue - Counter structure. See GetCounterStructure - fields
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function CreateCounter(Val Token, Val CounterStructure) Export

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/counters";

    Parameters = New Structure;
    OPI_Tools.AddField("counter", CounterStructure, "Collection", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Update counter
// Changes counter field values by ID
//
// Note
// Method at API documentation: [Changing a counter](@yandex.ru/dev/metrika/en/management/openapi/counter/editCounter)
//
// Parameters:
// Token - String - Auth token - token
// CounterID - String, Number - Counter ID to change - counter
// CounterStructure - Structure of KeyAndValue - Structure of fields to be changed. See GetCounterStructure - fields
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function UpdateCounter(Val Token, Val CounterID, Val CounterStructure) Export

    OPI_TypeConversion.GetLine(CounterID);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/counter/" + CounterID;

    Parameters = New Structure;
    OPI_Tools.AddField("counter", CounterStructure, "Collection", Parameters);

    Response = OPI_Tools.Put(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get counter
// Gets information about the counter by ID
//
// Note
// Method at API documentation: [Counter information](@yandex.ru/dev/metrika/en/management/openapi/counter/counter)
//
// Parameters:
// Token - String - Auth token - token
// CounterID - String, Number - Counter ID - counter
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetCounter(Val Token, Val CounterID) Export

    OPI_TypeConversion.GetLine(CounterID);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/counter/" + CounterID;

    Response = OPI_Tools.Get(URL, , Headers);

    Return Response;

EndFunction

// Delete counter
// Deletes a counter by ID
//
// Note
// Method at API documentation: [Deleting a counter](@yandex.ru/dev/metrika/en/management/openapi/counter/deleteCounter)
//
// Parameters:
// Token - String - Auth token - token
// CounterID - Number, String - Counter ID for deletion - counter
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function DeleteCounter(Val Token, Val CounterID) Export

    OPI_TypeConversion.GetLine(CounterID);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/counter/" + CounterID;

    Response = OPI_Tools.Delete(URL, , Headers);

    Return Response;

EndFunction

// Get counter structure
// Gets the structure of standard fields for counter creation
//
// Note
// Description in the API documentation: [Creating a counter](@yandex.ru/dev/metrika/en/management/openapi/counter/addCounter)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure of KeyAndValue - Counter field structure
Function GetCounterStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    CounterStructure = New Structure;
    CounterStructure.Insert("autogoals_enabled", "<auto-targeting>");

        CodeSettingsStructure = New Structure;
        CodeSettingsStructure.Insert("async"       , "<asynchronous counter code>");
        CodeSettingsStructure.Insert("clickmap"    , "<collection of statistics for Click Map operation>");
        CodeSettingsStructure.Insert("ecommerce"   , "<e-commerce data collection>");
        CodeSettingsStructure.Insert("in_one_line" , "<output the counter code in one line>");
        CodeSettingsStructure.Insert("track_hash"  , "<tracking the hash in the browser address bar>");
        CodeSettingsStructure.Insert("visor"       , "<recording and analyzing the behavior of site visitors>");
        CodeSettingsStructure.Insert("xml_site"    , "<for XML-sites>");
        CodeSettingsStructure.Insert("ytm"         , "<use of a tag management system>");
        CodeSettingsStructure.Insert("alternative_cdn"
            , "<take into account visits from regions without access to Yandex resources>");

            InformerStructure = New Structure;
            InformerStructure.Insert("color_arrow", "<arrow color on the informer>");
            InformerStructure.Insert("color_end"  , "<final (bottom) color of the informer in RRGGBBAA format>");
            InformerStructure.Insert("color_start", "<initial (top) color of the informer in RRGGBBAA format>");
            InformerStructure.Insert("color_text" , "<informer text color>");
            InformerStructure.Insert("enabled"    , "<informer display permission>");
            InformerStructure.Insert("indicator"  , "<informer index>");
            InformerStructure.Insert("size"       , "<informer size>");
            InformerStructure.Insert("type"       , "<informer type>");

        CodeSettingsStructure.Insert("informer", InformerStructure);

    CounterStructure.Insert("code_options", CodeSettingsStructure);

        FlagsStructure = New Structure;
        FlagsStructure.Insert("collect_first_party_data" , "<use advanced tracking settings>");
        FlagsStructure.Insert("measurement_enabled"      , "<enable the Measurement Protocol option>");
        FlagsStructure.Insert("use_in_benchmarks"        , "<access market reports>");
        FlagsStructure.Insert("direct_allow_use_goals_without_access"
            , "<allow optimization by goals in advertising campaigns without access to the counter>");

    CounterStructure.Insert("counter_flags", FlagsStructure);
    CounterStructure.Insert("favorite"     , "<favorite>");
    CounterStructure.Insert("filter_robots", "<robots filtration>");

        FiltersArray = New Array;

            FilterStructure = New Structure;
            FilterStructure.Insert("action"         , "<filter type>");
            FilterStructure.Insert("attr"           , "<type of data to which the filter is applied>");
            FilterStructure.Insert("status"         , "<filter status>");
            FilterStructure.Insert("type"           , "<attitude or action for the filter>");
            FilterStructure.Insert("end_ip"         , "<last IP address of the range>");
            FilterStructure.Insert("id"             , "<filter identifier to change>");
            FilterStructure.Insert("start_ip"       , "<first IP address of the range>");
            FilterStructure.Insert("value"          , "<value>");
            FilterStructure.Insert("with_subdomains", "<subdomain filter>");

        FiltersArray.Add(FilterStructure);

    CounterStructure.Insert("filters"                , FiltersArray);
    CounterStructure.Insert("gdpr_agreement_accepted", "<consent to the Data Processing Agreement>");

        GoalsArray = New Array;

            GoalStructure = New Structure;
            GoalStructure.Insert("name"         , "<goal name>");
            GoalStructure.Insert("type"         , "<goal type>");
            GoalStructure.Insert("default_price", "<goal default price>");
            GoalStructure.Insert("id"           , "<if of goal for updating>");
            GoalStructure.Insert("is_favorite"  , "<favorite>");

        GoalsArray.Add(GoalStructure);

    CounterStructure.Insert("goals", GoalsArray);

        PremissionsArray = New Array;

            PermissionsStructure = New Structure;
            PermissionsStructure.Insert("perm"               , "<Access level>");
            PermissionsStructure.Insert("comment"            , "<arbitrary comment>");
            PermissionsStructure.Insert("partner_data_access", "<access to report group Monetization>");
            PermissionsStructure.Insert("user_login"         , "<login of the user to whom the authorization has been granted>");
            PermissionsStructure.Insert("user_uid"           , "<uid of the user to whom the authorization has been granted>");

        PremissionsArray.Add(PermissionsStructure);

    CounterStructure.Insert("grants", PremissionsArray);

        LabelsArray = New Array;

            LabelStructure = New Structure;
            LabelStructure.Insert("name", "<lable name>");

        LabelsArray.Add(LabelStructure);

    CounterStructure.Insert("labels"            , LabelsArray);
    CounterStructure.Insert("measurement_tokens", "<active token list>");

        MirrorsArray = New Array;

            MirrorStructure = New Structure;
            MirrorStructure.Insert("site", "<full site domain>");

        MirrorsArray.Add(MirrorStructure);

    CounterStructure.Insert("mirrors2", MirrorsArray);
    CounterStructure.Insert("name"    , "<counter name>");

        OfflineOptionsStructure = New Structure;
        OfflineOptionsStructure.Insert("offline_calls_extended_threshold" , "<extended call accounting period>");
        OfflineOptionsStructure.Insert("offline_conversion_extended_threshold"
            , "<extended accounting period for offline conversions>");
        OfflineOptionsStructure.Insert("offline_visits_extended_threshold"
            , "<extended accounting period for offline visits>");

    CounterStructure.Insert("offline_options", OfflineOptionsStructure);

        ActionsArray = New Array;

            OperationStructure = New Structure;
            OperationStructure.Insert("action", "<action type>");
            OperationStructure.Insert("attr"  , "<filter field>");
            OperationStructure.Insert("status", "<action status>");
            OperationStructure.Insert("id"    , "<change actions>");
            OperationStructure.Insert("value" , "<replacement value>");

        ActionsArray.Add(OperationStructure);

    CounterStructure.Insert("operations" , ActionsArray);
    CounterStructure.Insert("owner_login", "<owners login>");
    CounterStructure.Insert("permission" , "<counter access level>");

        AnalyticsStructure = New Structure;
        AnalyticsStructure.Insert("enabled"       , "<content analytics data collection>");
        AnalyticsStructure.Insert("schema"        , "<markup type used on the site>");
        AnalyticsStructure.Insert("schema_options", "<available markup options>");

    CounterStructure.Insert("publisher_options", AnalyticsStructure);
    CounterStructure.Insert("site2"            , MirrorsArray);
    CounterStructure.Insert("source"           , "<counter type>");
    CounterStructure.Insert("time_zone_name"   , "<time zone>");
    CounterStructure.Insert("visit_threshold"  , "<visit timeout in seconds>");

        WebvisorStructure = New Structure;
        WebvisorStructure.Insert("arch_enabled"    , "<page saving>");
        WebvisorStructure.Insert("arch_type"       , "<page content recording>");
        WebvisorStructure.Insert("load_player_type", "<page load to player>");
        WebvisorStructure.Insert("urls"            , "<save page list>");
        WebvisorStructure.Insert("wv_forms"        , "<recording the contents of fields and forms>");
        WebvisorStructure.Insert("wv_version"      , "<webvisor version>");

    CounterStructure.Insert("webvisor", WebvisorStructure);

    If Clear Then
        CounterStructure = OPI_Tools.ClearCollectionRecursively(CounterStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return CounterStructure;

EndFunction

#EndRegion

#EndRegion
