// 

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

#Use "./internal"

#Region Internal

Procedure GetBinaryData(Value) Export
    
    If Value = Undefined Then
        Return;
    EndIf;
    
    Try 
        
        If TypeOf(Value) = Type("BinaryData") Then
            Return;
        Else
            
            File = New File(Value);
            
            If File.Exist() Then
                Value = New BinaryData(Value);
                
            ElsIf StrFind(Value, "//") Then
                                
                Value = OPI_Tools.Get(Value);
                
            Else
                
                Value = Base64Value(Value);
                
            EndIf;
                  
        EndIf;
    
    Except
        Raise "Error getting binary data from parameter: " + ErrorDescription();
    EndTry;
    
EndProcedure

Procedure GetBinaryOrStream(Value) Export
    
    If Value = Undefined Then
        Return;
    EndIf;
    
    If TypeOf(Value) <> Type("String") Then
        GetBinaryData(Value);
        Return;
    EndIf;
    
    File = New File(Value);
    
    If File.Exist() Then
        Value = New FileStream(Value, FileOpenMode.Open);     
    Else
        GetBinaryData(Value);
    EndIf;
    
EndProcedure

Procedure GetCollection(Value) Export
    
    If Value = Undefined Then
        Return;
    EndIf;
    
    Try 
        
        InitialValue = Value;
        
        If ThisIsCollection(Value) Then
            Return;
        Else
            
            If TypeOf(Value) = Type("BinaryData") Then
                Value = GetStringFromBinaryData(Value);
            Else
                Value = OPI_Tools.NumberToString(Value);
            EndIf;
            
            File = New File(Value);
            JSONReader = New JSONReader;
            
            If File.Exist() Then
                
                JSONReader.OpenFile(Value);
                
           ElsIf StrStartsWith(Lower(Value), "http") Then
                
                AndVF = GetTempFileName();
                CopyFile(Value, AndVF);
                JSONReader.OpenFile(AndVF);
                JSONReader.Read();
                
                DeleteFiles(AndVF);
                
            Else
                
                JSONReader.SetString(TrimAll(Value));
                
            EndIf;
            
            Value = ReadJSON(JSONReader, True, Undefined, JSONDateFormat.ISO);
            JSONReader.Close();
            
            If (Not ThisIsCollection(Value)) Or Not ValueIsFilled(Value) Then
                
                Value = InitialValue;
                GetArray(Value);
                
            EndIf;
             
        EndIf;
    
    Except
        
        Value = InitialValue;
    	GetArray(Value);	
        
    EndTry;
        
EndProcedure

Procedure GetArray(Value) Export
    
    If TypeOf(Value) = Type("Array") Then
        Return;
    EndIf;
    
    If TypeOf(Value) = Type("String") 
        And StrStartsWith(Value, "[")
        And StrEndsWith(Value, "]") Then
        	
        CommaInQuotes = "','";
    
	    Value = StrReplace(Value, "['" , "");
	    Value = StrReplace(Value, "']" , "");
	    Value = StrReplace(Value, "', '" , CommaInQuotes);
	    Value = StrReplace(Value, "' , '", CommaInQuotes);
	    Value = StrReplace(Value, "' ,'" , CommaInQuotes);
	
	    Value = StrSplit(Value, CommaInQuotes, False);
	
	    For N = 0 To Value.UBound() Do
	        Value[N] = TrimAll(Value[N]);
	    EndDo;
    
    Else
    	
        If TypeOf(Value) = Type("Number") Then
            Value = OPI_Tools.NumberToString(Value);    
        EndIf;
        
	    OPI_Tools.ValueToArray(Value);
	    
    EndIf;
    
EndProcedure

Procedure GetBoolean(Value) Export
    
    If Value = Undefined Then
        Return;
    EndIf;
    
    Try 
        
        If TypeOf(Value) = Type("Boolean") Then
            Return;
        Else
            Value = Boolean(Value);
        EndIf;
    
    Except
        Raise "Error getting boolean data from parameter";
    EndTry;
        
EndProcedure

Procedure GetLine(Value, Val FromSource = False) Export
    
    If Value = Undefined Then
        Return;
    EndIf;
    
    Try 
        
        If ThisIsSymbolic(Value) Then
                
            If Not FromSource Then
                Value = OPI_Tools.NumberToString(Value);
                Return;    
            EndIf;
              
            Value = OPI_Tools.NumberToString(Value);  
            File = New File(Value);
            
            If File.Exist() Then
                
                TextReader = New TextReader(Value);
                Value = TextReader.Read();
                TextReader.Close();
                
            ElsIf StrStartsWith(Lower(Value), "http") Then
                
                AndVF = GetTempFileName();
                CopyFile(Value, AndVF);
                
                TextReader = New TextReader(AndVF);
                Value = TextReader.Read();
                TextReader.Close();
                
                DeleteFiles(AndVF);
                
            Else
                
                Return;
                
            EndIf;
            
        ElsIf TypeOf(Value) = Type("BinaryData") Then
            
            Value = GetStringFromBinaryData(Value);
            
        ElsIf ThisIsCollection(Value) Then
                
            Value = OPI_Tools.JSONString(Value); 
            
        Else
            Return;
        EndIf;
                  
    Except
        Value = String(Value);
        Return;
    EndTry;
    
EndProcedure

Procedure GetDate(Value) Export
    
    If Value = Undefined Then
        Return;
    EndIf;
    
    Date = "Date";
    
    Try 
        
        If TypeOf(Value) = Type(Date) Then
            Return;
        Else         
            Value = XMLValue(Type(Date), Value);                   
        EndIf;
    
    Except
        OOD = New TypeDescription(Date);
        Value = OOD.AdjustValue(Value);
    EndTry;
        
EndProcedure

Procedure GetNumber(Value) Export
    
    TypeDescription = New TypeDescription("Number");
    Value = TypeDescription.AdjustValue(Value);
    
EndProcedure

#EndRegion

#Region Private

Function ThisIsCollection(Val Value)
	
	Return TypeOf(Value) = Type("Array")
            Or TypeOf(Value) = Type("Structure")
            Or TypeOf(Value) = Type("Map");
            
EndFunction      

Function ThisIsSymbolic(Val Value)
	
	Return TypeOf(Value) = Type("String")
            Or TypeOf(Value) = Type("Number") 
            Or TypeOf(Value) = Type("Date");
            
EndFunction      

#EndRegion
