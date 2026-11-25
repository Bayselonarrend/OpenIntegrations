// OneScript: ./OInt/tools/main/Modules/internal/Modules/internal/Modules/OPI_BuildHash.os

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

// BSLLS:CommonModuleMissingAPI-off
// BSLLS:CodeOutOfRegion-off
// BSLLS:UsingServiceTag-off
// BSLLS:CommonModuleNameClientServer-off

// https://github.com/Bayselonarrend/OpenIntegrations

//@skip-check module-structure-method-in-regions

Function GetHashSum() Export

    LastBuildHash  = "D5CF83A6013CA10989EAA9F6C2C72B6BAC8EDF4ABD7A79D171B4B74479839F2F";
    Return LastBuildHash;

EndFunction

Function GetBranch() Export

    LastBuildBranch = "alpaca/119";
    Return LastBuildBranch;

EndFunction

#Region Alternate



#EndRegion
