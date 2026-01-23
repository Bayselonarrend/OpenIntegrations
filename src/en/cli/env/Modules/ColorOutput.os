#Region Public

Procedure Message(Val MessageText = "", Val pMessageStatus = Undefined) Export
	
	If pMessageStatus = MessageStatus.Important Then
		TextColor = "Red";
	ElsIf pMessageStatus = MessageStatus.Attention Then
		TextColor = "Yellow";
	ElsIf pMessageStatus = MessageStatus.Information Then
		TextColor = "Green";
	ElsIf pMessageStatus = MessageStatus.VeryImportant Then
		TextColor = "Red";
	Else
		TextColor = Undefined;
	EndIf;

	WriteLine(MessageText, TextColor);

EndProcedure

Procedure WriteLine(Val MessageText = "", Val TextColor = Undefined) Export

	Write(MessageText, TextColor);

	Console.Write(Chars.LF);

EndProcedure

Procedure Write(Val MessageText, Val TextColor = Undefined) Export
	
	If Upper(TextColor) = "MONOCHROME" Then
		TextColor = Undefined;
		ColoredOutputAvailable = False;
	Else
		ColoredOutputAvailable = True;
	EndIf;

	FieldsTable = ParseString(MessageText, TextColor);

	If ColoredOutputAvailable Then
		
		PreviousTextColorValue = Console.TextColor;
		If NOT ValueIsFilled(PreviousTextColorValue) Then
			PreviousTextColorValue = ConsoleColor.White;
		EndIf;
		
		If TextColor = Undefined Then
			TextColor = PreviousTextColorValue;
		EndIf;
		For Each Field In FieldsTable Do
			If ValueIsFilled(Field.Color) Then
				Console.TextColor = ConsoleColor[Field.Color];
			Else
				Console.TextColor = PreviousTextColorValue;
			EndIf;
			Console.Write(Field.Text);
		EndDo;
		
		Console.TextColor = PreviousTextColorValue;
		
	Else
		
		FieldArray = FieldsTable.UnloadColumn("Text");
		TextColorWithoutColoredFields = StrConcat(FieldArray);
		
		Console.Write(TextColorWithoutColoredFields);

	EndIf;

EndProcedure

#EndRegion

#Region Private

Function ParseString(MessageText, TextColor)

	Length = StrLen(MessageText);
	
	Table = New ValueTable();
	Table.Columns.Add("Text");
	Table.Columns.Add("Color");

	tbColoredFields = ColoredFields(MessageText);

	Pos = 1;
	For Each ColorField In tbColoredFields Do
		If Pos < ColorField.Item Then
			Text = Mid(MessageText, Pos, ColorField.Item - Pos);
			Str = Table.Add();
			Str.Text = Text;
			Str.Color = TextColor;
		EndIf;
		
		Str = Table.Add();
		Str.Text = ColorField.Text;
		Str.Color = ColorField.Color;
		
		Pos = ColorField.Item + ColorField.Length;
	EndDo;

	If Pos-1 <= Length Then
		Text = Mid(MessageText, Pos);
		Str = Table.Add();
		Str.Text = Text;
		Str.Color = TextColor;
	EndIf;
	
	Return Table;
	
EndFunction

Function ColoredFields(MessageText)
	
	RX = New Regex(ColoredSubstringPattern());
	Coincidences = RX.Matches(MessageText);

	ColoredFields = New ValueTable;
	ColoredFields.Columns.Add("Item");
	ColoredFields.Columns.Add("Text");
	ColoredFields.Columns.Add("Length");
	ColoredFields.Columns.Add("Color");
	
	For Each Coincidence In Coincidences Do
		Groups = Coincidence.Groups;
		str = ColoredFields.Add();
		str.Item = Coincidence.Index+1;
		str.Text = Groups[1].Value;
		str.Length = Coincidence.Length;
		ColorName = Groups[2].Value;
		str.Color = ColorName;
	EndDo;
	
	ColoredFields.Sort("Item");
	
	Return ColoredFields;

EndFunction

Function ColoredSubstringPattern()
	
	Return "\((.+?)\|#color=(.+?)\)"; // (Text|#color=Color)

EndFunction

#EndRegion
#Region Alternate

Procedure Сообщить(Val ТекстСообщения = "", Val пСтатусСообщения = Undefined) Export
	Message(ТекстСообщения, пСтатусСообщения);
EndProcedure

Procedure ВывестиСтроку(Val ТекстСообщения = "", Val ЦветТекста = Undefined) Export
	WriteLine(ТекстСообщения, ЦветТекста);
EndProcedure

Procedure Вывести(Val ТекстСообщения, Val ЦветТекста = Undefined) Export
	Write(ТекстСообщения, ЦветТекста);
EndProcedure

#EndRegion