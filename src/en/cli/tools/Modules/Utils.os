// CLI: tools

Var MaximumNesting;
Var DesiredParameter;

#Region Internal

// Parse JSON to Parameters
// Displays the values that can be obtained from the passed JSON and returns
// Specific Value When Specifying Field Name
// 
// Parameters:
//  JSON                           - String  - JSON data                                                          - json
//  MaximumNestingLevel - Number   - Parsing depth limit. Full depth by default  - nesting
//  ParameterName                   - String  - Field name to retrieve. Displays the entire list if not specified         - name 
//  Encoding                      - String  - Encoding of JSON Data                            - enc
// 
// Returns:
//  String - empty string
Function ParseJSON(Val JSON
	, Val MaximumNestingLevel = 0
	, Val ParameterName = ""
	, Val Encoding = "UTF-8") Export

	MaximumNesting = Number(MaximumNestingLevel);
    DesiredParameter         = ParameterName;

	GetCollection(JSON, Encoding);

	If Not TypeOf(JSON) = Type("Map") Then
		Raise "JSON Parameter Data Conversion Error";
	EndIf;

	Value = GetValuesRecursively(JSON);
	Return Value;

EndFunction

// Convert Base64 String to Binary File
// Convert file with Base64 string to binary file
// 
// Parameters:
//  Entry  - String  - Base64 File       - in
// 
// Returns:
//  String - empty string
Function ConvertBase64ToBinary(Val Entry) Export

	InputFile = New File(Entry);

	If Not InputFile.Exists() Then
		Raise("Input File Not Found!!");
	EndIf;

	TextDocument = New TextDocument();
	TextDocument.Read(Entry);
	
	B64 = TextDocument.GetText();
    BD  = Base64Value(B64);

	Return BD;

EndFunction

#EndRegion

#Region Private

Function GetValuesRecursively(Val JSON, Val Prefix = "", Val CurrentNesting = 1, FieldMapping = "")

	If Not ValueIsFilled(FieldMapping) Then
		FieldMapping = New Map;
	EndIf;

	ReturnValue = "";

	For Each Pair In JSON Do

		Value = Pair.Value;
		Key     = Prefix + String(Pair.Key);

		ThisIsCollection = TypeOf(Value) = Type("Map") Or TypeOf(Value) = Type("Structure");
		NextNesting         = CurrentNesting + 1;
		NextNestingAvailable = MaximumNesting = 0 Or NextNesting <= MaximumNesting;

	    If Not ThisIsCollection Or Not NextNestingAvailable Then

			duplicates = FieldMapping.Get(Key);

			If duplicates = Undefined Then
				Counter         = 0;
				EnvironmentVariable = Key;
			Else
				Counter         = duplicates + 1;
				EnvironmentVariable = Key + StrReplace(String(duplicates), Chars.NBSp, "");
			EndIf;

			FieldMapping.Insert(Key, Counter);

			GetLine(Value);

			If Not ValueIsFilled(DesiredParameter) Then
			    Message(EnvironmentVariable, MessageStatus.Information);
				Message(Value + Chars.LF, MessageStatus.Attention);
			Else

                If EnvironmentVariable = DesiredParameter Then
					ReturnValue = Value;
					Break;
				EndIf;

			EndIf;	
		Else
			NewPrefix = Key + "_";
			ReturnValue = GetValuesRecursively(Value
			    , NewPrefix
				, NextNesting
				, FieldMapping);

			If ValueIsFilled(ReturnValue) Then
				Break;
			EndIf;

		EndIf;

	EndDo;

	Return ?(ValueIsFilled(ReturnValue), ReturnValue, Chars.LF);

EndFunction

Procedure GetLine(Value)

	ThisIsCollection = TypeOf(Value) = Type("Map") Or TypeOf(Value) = Type("Structure") Or TypeOf(Value) = Type("Array");

	If ThisIsCollection Then

		JSONParameters = New JSONWriterSettings(JSONLineBreak.Windows
        , " "
        , True
        , True
        , False
        , False
        , False
        , False);

        JSONWriter = New JSONWriter;
        JSONWriter.SetString(JSONParameters);
    
        WriteJSON(JSONWriter, Value);
        Value = JSONWriter.Close();

	Else
		Value = String(Value);
	EndIf;

EndProcedure

Procedure GetCollection(Value, Val Encoding)
    
    If Value = Undefined Then
        Return;
    EndIf;
    
	InitialValue = Value;
	
	If ThisIsCollection(Value) Then
		Return;
	Else
		
		If TypeOf(Value) = Type("BinaryData") Then
			Value = GetStringFromBinaryData(Value, Encoding);
		Else
			Value = String(Value);
		EndIf;
		
		File               = New File(Value);
		TextDocument  = New TextDocument();
		
		If File.Exists() Then
			
			TextDocument.Read(Value, Encoding);
			Value = TextDocument.GetText();
			
		ElsIf StrStartsWith(Lower(Value), "http") Then
			
			TFN = GetTempFileName();
			CopyFile(Value, TFN);
			TextDocument.Read(TFN, Encoding);

			Value = TextDocument.GetText();
			
			DeleteFiles(TFN);
			
		Else
			
			Value = String(Value);
			
		EndIf;
			
	EndIf;

	NormalizeTextInput(Value);
	JSONReader  = New JSONReader;
	JSONReader.SetString(TrimAll(Value));
	Value = ReadJSON(JSONReader, True, Undefined, JSONDateFormat.ISO);
	JSONReader.Close();
        
EndProcedure

Procedure NormalizeTextInput(Text)

	InitialCurly    = StrFind(Text, "{");
	LastCurly    = StrFind(Text, "}", SearchDirection.FromEnd);

	If InitialCurly = 0 Or LastCurly = 0 Then
		Return;
	EndIf;

	Text = Mid(Text, InitialCurly, LastCurly - InitialCurly + 1);

EndProcedure

Function ThisIsCollection(Val Value)

	Return TypeOf(Value) = Type("Array")
			Or TypeOf(Value) = Type("Structure")
			Or TypeOf(Value) = Type("Map");
			
EndFunction 

#EndRegion
