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

#EndRegion

#Region Internal

Procedure MainHandler(Context, NexHandler) Export

    Try
        ProcessRequest(Context);
    Except

        Error = ErrorDescription();

        Context.Response.StatusCode = 500;
        Context.Response.Write(Error);

    EndTry

EndProcedure

Procedure ProcessRequest(Context)

    Path = Context.Request.Path;

    Path = ?(StrStartsWith(Path, "/") , Right(Path, StrLen(Path - 1)) , Path);
    Path = ?(StrEndsWith(Path  , "/") , Left(Path , StrLen(Path - 1)) , Path);

    HandlerDescription = ProxyModule.GetRequestsHandler(ProjectPath, Path);

    Context.Response.StatusCode = 200;
    Context.Response.Write("Hello world!");

EndProcedure

#EndRegion
