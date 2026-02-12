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

// https://github.com/Bayselonarrend/OpenIntegrations

//@skip-check module-structure-method-in-regions

Function GetHashSum() Export

    LastBuildHash  = "D38B9910DDA840982ADF24EBE9FDDA81D47E5A3CA3BD5BFE19A9993A68E579A4";

    Return LastBuildHash;

EndFunction
