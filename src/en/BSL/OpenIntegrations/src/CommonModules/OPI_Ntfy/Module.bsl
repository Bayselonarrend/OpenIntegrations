// OneScript: ./OInt/api/ntfy/Modules/OPI_Ntfy.os
// Lib: Ntfy
// CLI: ntfy
// Keywords: ntfy, push, notifications

// DocsCategory: Other
// DocsNameRU: Ntfy
// DocsNameEN: Ntfy

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

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
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:CommonModuleNameClientServer-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

// #Use "../../../tools/main"
// #Use "../../../tools/http"

#If Not WebClient Then // !OPI

#Region Public

#Region Publication

// GetMessageParametersStructure
// Get structure of additional parameters for sending notification
//
// Note:
// ntfy API Documentation: [docs.ntfy.sh/publish](@docs.ntfy.sh/publish)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetMessageParametersStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    FieldsStructure = New Structure;
    FieldsStructure.Insert("Title"   , "<notification header>");
    FieldsStructure.Insert("Priority", "<priority: min, low, default, high, max or number 1-5>");
    FieldsStructure.Insert("Tags"    , "<tags or emojis: string or array of strings>");
    FieldsStructure.Insert("Click"   , "<URL opened when clicking on the notification>");
    FieldsStructure.Insert("Attach"  , "<Attachment URL>");
    FieldsStructure.Insert("Actions" , "<actions in ntfy format>");
    FieldsStructure.Insert("Delay"   , "<delayed send, for example 10m or unix timestamp>");
    FieldsStructure.Insert("Email"   , "<email for forwarding notification>");
    FieldsStructure.Insert("Icon"    , "<Notification icon URL>");
    FieldsStructure.Insert("Markdown", "<true > format text as Markdown>");

    If Clear Then
        FieldsStructure = OPI_Tools.ClearCollectionRecursively(FieldsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return FieldsStructure;

EndFunction

// Send message
// Publish notification to the specified topic
//
// Note:
// ntfy API Documentation: [docs.ntfy.sh/publish](@docs.ntfy.sh/publish)
//
// Parameters:
// URL        - String                   - Ntfy server URL. `ntfy.sh`, if not filled                - url
// Topic      - String                   - Topic Name                                               - topic
// Message    - String                   - Notification text                                        - message
// Token      - String                   - Topic access token, if required                          - token
// Parameters - Structure Of KeyAndValue - Additional parameters. See GetMessageParametersStructure - options
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from ntfy
Function SendMessage(Val URL, Val Topic, Val Message, Val Token = "", Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Topic);
    OPI_TypeConversion.GetLine(Message);

    URL = GetServerURL(URL);
    CompleteURL(URL, Topic);

    Headers = CreateHeaders(Token, Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Message, Headers, False);

    Return Response;

EndFunction

#EndRegion

#Region Obtaining

// GetFilterParametersStructure
// Get structure of parameters for getting messages from topic
//
// Note:
// ntfy API Documentation: [docs.ntfy.sh/subscribe/api](@docs.ntfy.sh/subscribe/api)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetFilterParametersStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    FieldsStructure = New Structure;
    FieldsStructure.Insert("since", "<Message ID starting from which to get the history>");
    FieldsStructure.Insert("limit", "<maximum number of returned messages>");

    If Clear Then
        FieldsStructure = OPI_Tools.ClearCollectionRecursively(FieldsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return FieldsStructure;

EndFunction

// Get messages
// Get messages from topic in JSON format
//
// Note:
// ntfy API Documentation: [docs.ntfy.sh/subscribe/api](@docs.ntfy.sh/subscribe/api)
//
// Parameters:
// URL    - String                   - Ntfy server URL. `ntfy.sh`, if not filled           - url
// Topic  - String                   - Topic Name                                          - topic
// Token  - String                   - Topic access token, if required                     - token
// Filter - Structure Of KeyAndValue - Filter parameters. See GetFilterParametersStructure - filter
//
// Returns:
// Array - topic messages list
Function GetMessages(Val URL, Val Topic, Val Token = "", Val Filter = "") Export

    OPI_TypeConversion.GetLine(Topic);

    URL = GetServerURL(URL);
    CompleteURL(URL, Topic + "/json");

    RequestParameters = CreateFilterParameters(Filter);
    Headers           = CreateHeaders(Token);

    Response = OPI_HTTPRequests.Get(URL, RequestParameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region Management

// Delete message
// Delete message from topic by ID
//
// Note:
// ntfy API Documentation: [docs.ntfy.sh/subscribe/api](@docs.ntfy.sh/subscribe/api)
// To delete a topic, it must be protected and accessible by token
//
// Parameters:
// URL       - String - Ntfy server URL. `ntfy.sh`, if not filled - url
// Topic     - String - Topic Name                                - topic
// MessageID - String - ID of message to delete                   - id
// Token     - String - Topic access token                        - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from ntfy
Function DeleteMessage(Val URL, Val Topic, Val MessageID, Val Token = "") Export

    OPI_TypeConversion.GetLine(Topic);
    OPI_TypeConversion.GetLine(MessageID);

    URL = GetServerURL(URL);
    CompleteURL(URL, Topic + "/" + MessageID);

    Headers = CreateHeaders(Token);

    Response = OPI_HTTPRequests.Delete(URL, , Headers);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function GetServerURL(Val URL)

    If Not ValueIsFilled(URL) Then
        URL = "https://ntfy.sh";
    Else
        OPI_TypeConversion.GetLine(URL);
    EndIf;

    Return URL;

EndFunction

Procedure CompleteURL(URL, Val Path)

    OPI_TypeConversion.GetLine(Path);

    URL = ?(StrEndsWith(URL, "/"), URL, URL + "/");
    URL = URL + Path;

EndProcedure

Function CreateHeaders(Val Token, Val Parameters = "")

    Headers = New Map;

    If ValueIsFilled(Token) Then
        OPI_TypeConversion.GetLine(Token);
        Headers.Insert("Authorization", "Bearer " + Token);
    EndIf;

    If Not ValueIsFilled(Parameters) Then
        Return Headers;
    EndIf;

    ErrorText = "An incorrect collection of additional parameters has been passed!";
    OPI_TypeConversion.GetKeyValueCollection(Parameters, ErrorText);

    HeaderCorrespondence = New Map;
    HeaderCorrespondence.Insert("Title"   , "Title");
    HeaderCorrespondence.Insert("Priority", "Priority");
    HeaderCorrespondence.Insert("Tags"    , "Tags");
    HeaderCorrespondence.Insert("Click"   , "Click");
    HeaderCorrespondence.Insert("Attach"  , "Attach");
    HeaderCorrespondence.Insert("Actions" , "Actions");
    HeaderCorrespondence.Insert("Delay"   , "Delay");
    HeaderCorrespondence.Insert("Email"   , "Email");
    HeaderCorrespondence.Insert("Icon"    , "Icon");
    HeaderCorrespondence.Insert("Markdown", "Markdown");

    For Each Parameter In Parameters Do

        If Not ValueIsFilled(Parameter.Value) Then
            Continue;
        EndIf;

        HeaderName = HeaderCorrespondence[Parameter.Key];

        If HeaderName = Undefined Then
            Continue;
        EndIf;

        HeaderValue = Parameter.Value;

        If Parameter.Key = "Tags" Then

            HeaderValue = GetStringTags(HeaderValue);

        ElsIf Parameter.Key = "Markdown" Then

            OPI_TypeConversion.GetBoolean(HeaderValue);
            HeaderValue = ?(HeaderValue, "yes", "no");

        EndIf;

        OPI_Tools.AddField(HeaderName, HeaderValue, "String", Headers);

    EndDo;

    Return Headers;

EndFunction

Function GetStringTags(Val Tags)

    If TypeOf(Tags) = Type("Array") Then
        OPI_TypeConversion.GetArray(Tags);
        Return StrConcat(Tags, ",");
    EndIf;

    OPI_TypeConversion.GetLine(Tags);
    Return Tags;

EndFunction

Function CreateFilterParameters(Val Filter)

    RequestParameters = New Structure;

    If Not ValueIsFilled(Filter) Then
        Return RequestParameters;
    EndIf;

    ErrorText = "Invalid collection of filter parameters passed!";
    OPI_TypeConversion.GetKeyValueCollection(Filter, ErrorText);

    OPI_Tools.AddField("since", Filter["since"], "String", RequestParameters);
    OPI_Tools.AddField("limit", Filter["limit"], "String", RequestParameters);
    OPI_Tools.AddField("poll" , "1"            , "String", RequestParameters);

    Return RequestParameters;

EndFunction

#EndRegion

#EndIf // !OPI
