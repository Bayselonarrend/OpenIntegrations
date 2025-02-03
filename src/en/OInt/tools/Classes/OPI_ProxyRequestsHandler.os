// OneScript: ./OInt/tools/Classes/OPI_ProxyRequestsHandler.os

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
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:NumberOfOptionalParams-off

//@skip-check module-unused-local-variable
//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check use-non-recommended-method
//@skip-check module-accessibility-at-client
//@skip-check object-module-export-variable

#Region Variables

Var ProjectPath Export;
Var ProxyModule Export;
Var OPIObject Export;

#EndRegion

#Region Internal

Procedure MainHandler(Context, NexHandler) Export

    #If Host Or ThickClientOrdinaryApplication Or ExternalConnection Then

    Try
        Result = ProcessRequest(Context);
    Except

        Error = BriefErrorDescription(ErrorInfo());

        Context.Response.StatusCode = 500;

        Result = New Structure("result,error", False, "OneScript exception " + Error);

    EndTry;

    JSON = OPI_Tools.JSONString(Result);

    Context.Response.ContentType = "application/json;charset=UTF8";
    Context.Response.Write(JSON);

    #Else
    Raise "The method is not available on the client!";
    #EndIf

EndProcedure

Function ProcessRequest(Context)

    Path = Context.Request.Path;

    Path = ?(StrStartsWith(Path , "/") , Right(Path, StrLen(Path) - 1) , Path);
    Path = ?(StrEndsWith(Path   , "/") , Left(Path , StrLen(Path) - 1) , Path);

    HandlerDescription = ProxyModule.GetRequestsHandler(ProjectPath, Path);

    If HandlerDescription["result"] Then

        Handler = HandlerDescription["data"];
        Handler = ?(TypeOf(Handler) = Type("Array"), Handler[0], Handler);

        Result = ExecuteProcessing(Context, Handler);

    Else
        Result = ProcessingError(Context, 404, "Handler not found!");
    EndIf;

    Return Result;

EndFunction

#EndRegion

#Region Private

Function ExecuteProcessing(Context, Handler)

    Method         = Upper(Context.Request.Method);
    HandlerMethod  = Upper(Handler["method"]);
    MethodForCheck = ?(HandlerMethod = "MULTIPART", "POST", HandlerMethod);

    If Not Method = MethodForCheck Then
        Return ProcessingError(Context, 405, "Method " + Method + " is not available for this handler!");
    EndIf;

    If HandlerMethod = "GET" Then

        Result = ExecuteProcessingGet(Context, Handler);

    ElsIf HandlerMethod = "POST" Then

        Result = ExecuteProcessinPost(Context, Handler);

    Else

        Result = ProcessingError(Context, 405, "Method " + Method + " is not available for this handler!");

    EndIf;

    Return Result;

EndFunction

Function ExecuteProcessingGet(Context, Handler)

    Request    = Context.Request;
    Parameters = Request.Parameters;

    Return ExecuteUniversalProcessing(Context, Handler, Parameters);

EndFunction

Function ExecuteProcessinPost(Context, Handler)

    Request = Context.Request;

    Body       = Request.Body;
    JSONReader = New JSONReader();
    JSONReader.OpenStream(Body);

    Parameters = ReadJSON(JSONReader, True);
    JSONReader.Close();

    Return ExecuteUniversalProcessing(Context, Handler, Parameters);

EndFunction

Function ExecuteUniversalProcessing(Context, Handler, Parameters)

    Arguments = Handler["args"];
    Command   = Handler["library"];
    Method    = Handler["function"];

    ParametersBoiler   = FormParametersBoiler(Arguments, Parameters);
    ExecutionStructure = OPIObject.СформироватьСтрокуВызоваМетода(ParametersBoiler, Command, Method);

    Response = Undefined;

    If ExecutionStructure["Error"] Then
        Response = New Structure("result,error", False, "Error in the name of a command or handler function!");
    Else

        ExecutionText = ExecutionStructure["Result"];

        Execute(ExecutionText);


        Response = New Structure("result,data", True, Response);

    EndIf;

    Return Response;

EndFunction

Function FormParametersBoiler(Arguments, Parameters)

    StrictArguments    = New Map;
    NonStrictArguments = New Map;

    For Each Argument In Arguments Do

        Key   = "--" + Argument["arg"];
        Value = Argument["value"];
        Value = ?(StrStartsWith(Value , """"), Right(Value, StrLen(Value) - 1), Value);
        Value = ?(StrEndsWith(Value   , """"), Left(Value , StrLen(Value) - 1), Value);

        If Argument["strict"] = 1 Then
            StrictArguments.Insert(Key, Value);
        Else
            NonStrictArguments.Insert(Key, Value);
        EndIf;

    EndDo;

    ParametersBoiler = NonStrictArguments;

    For Each Parameter In Parameters Do

        Value = Parameter.Value;
        Value = ?(StrStartsWith(Value , """"), Right(Value, StrLen(Value) - 1), Value);
        Value = ?(StrEndsWith(Value   , """"), Left(Value , StrLen(Value) - 1), Value);

        ParametersBoiler.Insert("--" + Parameter.Key, Value);

    EndDo;

    For Each Argument In StrictArguments Do
        ParametersBoiler.Insert(Argument.Key, Argument.Value);
    EndDo;

    Return ParametersBoiler;

EndFunction

Function ProcessingError(Context, Code, Text)

    Context.Response.StatusCode = Code;

    Return New Structure("result,error", False, Text);

EndFunction

#EndRegion
