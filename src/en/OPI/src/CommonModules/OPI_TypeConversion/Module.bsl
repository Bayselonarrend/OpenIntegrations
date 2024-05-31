// Location OS: ./OInt/tools/Modules/OPI_TypeConversion.os

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UnusedLocalVariable-off

// #Use "./internal"

#Region ServiceProgramInterface

Procedure GetBinaryData(Value) Export
    
    If Value = Undefined Then
        Return;
    EndIf;
    
    Attempt 
        
        If TypeValue(Value) = Type("BinaryData") Then
            Return;
        Otherwise
            
            File = New File(Value);
            
            If File.Exists() Then
                Value = New BinaryData(Value);
                
            ElseIf StrFind(Value, "//") Then
                                
                Value = OPI_Tools.Get(Value);
                
            Otherwise
                
                Value = Base64Value(Value);
                
            EndIf;
                  
        EndIf;
    
    Exception
        RaiseException "Error getting binary data from parameter: " + ErrorDescription();
    EndOfAttempt;
    
EndProcedure

Procedure GetBinaryOrStream(Value) Export
    
    If Value = Undefined Then
        Return;
    EndIf;
    
    If TypeValue(Value) <> Type("String") Then
        GetBinaryData(Value);
        Return;
    EndIf;
    
    File = New File(Value);
    
    If File.Exists() Then
        Value = New FileStream(Value, FileOpenMode.Open);     
    Otherwise
        GetBinaryData(Value);
    EndIf;
    
EndProcedure

Procedure GetCollection(Value) Export
    
    If Value = Undefined Then
        Return;
    EndIf;
    
    Attempt 
        
        InitialValue = Value;
        
        If ThisIsCollection(Value) Then
            Return;
        Otherwise
            
            If TypeValue(Value) = Type("BinaryData") Then
                Value = GetStringFromBinaryData(Value);
            Otherwise
                Value = OPI_Tools.NumberToString(Value);
            EndIf;
            
            File        = New File(Value);
            ReadingJSON  = New ReadingJSON;
            
            If File.Exists() Then
                
                ReadingJSON.OpenFile(Value);
                
           ElseIf StringStartsWith(nReg(Value), "http") Then
                
                AndVF = GetTempFileName();
                CopyFile(Value, AndVF);
                ReadingJSON.OpenFile(AndVF);
                ReadingJSON.Read();
                
                DeleteFiles(AndVF);
                
            Otherwise
                
                ReadingJSON.SetString(ShortLP(Value));
                
            EndIf;
            
            Value = ReadJSON(ReadingJSON, True, Undefined, JSONDateFormat.ISO);
            ReadingJSON.Close();
            
            If (Not ThisIsCollection(Value)) Or Not ValueFilled(Value) Then
                
                Value = InitialValue;
                GetArray(Value);
                
            EndIf;
             
        EndIf;
    
    Exception
        
        Value = InitialValue;
    	GetArray(Value);	
        
    EndOfAttempt;
        
EndProcedure

Procedure GetArray(Value) Export
    
    If TypeValue(Value) = Type("Array") Then
        Return;
    EndIf;
    
    If TypeValue(Value) = Type("String") 
        And StringStartsWith(Value, "[")
        And StrEndsWith(Value, "]") Then
        	
        CommaInQuotes = "','";
    
	    Value = StringReplace(Value, "['"   , "");
	    Value = StringReplace(Value, "']"   , "");
	    Value = StringReplace(Value, "', '" , CommaInQuotes);
	    Value = StringReplace(Value, "' , '", CommaInQuotes);
	    Value = StringReplace(Value, "' ,'" , CommaInQuotes);
	
	    Value = StrSplit(Value, CommaInQuotes, False);
	
	    For N = 0 by Value.WithinBoundary() Loop
	        Value[N] = ShortLP(Value[N]);
	    EndOfLoop;
    
    Otherwise
    	
        If TypeValue(Value) = Type("Number") Then
            Value = OPI_Tools.NumberToString(Value);    
        EndIf;
        
	    OPI_Tools.ValueToArray(Value);
	    
    EndIf;
    
EndProcedure

Procedure GetBoolean(Value) Export
    
    If Value = Undefined Then
        Return;
    EndIf;
    
    Attempt 
        
        If TypeValue(Value) = Type("Boolean") Then
            Return;
        Otherwise
            Value = Boolean(Value);
        EndIf;
    
    Exception
        RaiseException "Error getting boolean data from parameter";
    EndOfAttempt;
        
EndProcedure

Procedure GetLine(Value, Val FromSource = False) Export
    
    If Value = Undefined Then
        Return;
    EndIf;
    
    Attempt 
        
        If ThisIsSymbolic(Value) Then
                
            If Not FromSource Then
                Value = OPI_Tools.NumberToString(Value);
                Return;    
            EndIf;
              
            Value = OPI_Tools.NumberToString(Value);  
            File     = New File(Value);
            
            If File.Exists() Then
                
                ReadingText = New ReadingText(Value);
                Value     = ReadingText.Read();
                ReadingText.Close();
                
            ElseIf StringStartsWith(nReg(Value), "http") Then
                
                AndVF = GetTempFileName();
                CopyFile(Value, AndVF);
                
                ReadingText = New ReadingText(AndVF);
                Value     = ReadingText.Read();
                ReadingText.Close();
                
                DeleteFiles(AndVF);
                
            Otherwise
                
                Return;
                
            EndIf;
            
        ElseIf TypeValue(Value) = Type("BinaryData") Then
            
            Value = GetStringFromBinaryData(Value);
            
        ElseIf ThisIsCollection(Value) Then
                
            Value = OPI_Tools.JSONString(Value); 
            
        Otherwise
            Return;
        EndIf;
                  
    Exception
        Value = String(Value);
        Return;
    EndOfAttempt;
    
EndProcedure

Procedure GetDate(Value) Export
    
    If Value = Undefined Then
        Return;
    EndIf;
    
    Date = "Date";
    
    Attempt 
        
        If TypeValue(Value) = Type(Date) Then
            Return;
        Otherwise         
            Value = XMLValue(Type(Date), Value);                   
        EndIf;
    
    Exception
        OOD = New TypeDescription(Date);
        Value = OOD.ConvertValue(Value);
    EndOfAttempt;
        
EndProcedure

Procedure GetNumber(Value) Export
    
    TypeDescription = New TypeDescription("Number");
    Value = TypeDescription.ConvertValue(Value);
    
EndProcedure

#EndRegion

#Region ServiceProceduresAndFunctions

Function ThisIsCollection(Val Value)
	
	Return TypeValue(Value) = Type("Array")
            Or TypeValue(Value) = Type("Structure")
            Or TypeValue(Value) = Type("Match");
            
EndFunction      

Function ThisIsSymbolic(Val Value)
	
	Return TypeValue(Value) = Type("String")
            Or TypeValue(Value) = Type("Number") 
            Or TypeValue(Value) = Type("Date");
            
EndFunction      

#EndRegion
