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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:CognitiveComplexity-off
// BSLLS:CommonModuleNameClientServer-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check bsl-legacy-check-string-length
//@skip-check undefined-function-or-procedure
//@skip-check ExternalAppStarting
//@skip-check bsl-legacy-check-string-literal

#If Not WebClient Then // !OPI

#Region Internal

Function Render(Val Template, Val Context, Val PartialTemplates = Undefined) Export

    ContextStack = New Array;
    ContextStack.Add(Context);

    Return ProcessFragment(Template, ContextStack, PartialTemplates);

EndFunction

Function RenderTemplate(Val TemplateName, Val Context, Val PartialTemplates = Undefined) Export

    Template = OPI_Tools.GetTextTemplate(TemplateName);

    Return Render(Template, Context, PartialTemplates);

EndFunction

Function EscapeHTML(Val Text) Export

    If Text = Undefined Or Text = Null Then
        Return "";
    EndIf;

    Result = String(Text);
    Result = StrReplace(Result, "&" , "&amp;");
    Result = StrReplace(Result, "<" , "&lt;");
    Result = StrReplace(Result, ">" , "&gt;");
    Result = StrReplace(Result, """", "&quot;");

    Return Result;

EndFunction

#EndRegion

#Region Private

Function ProcessFragment(Val Template, ContextStack, PartialTemplates)

    Result   = "";
    Position = 1;
    Length   = StrLen(Template);

    While Position <= Length Do

        StartTag = StrFind(Template, "{{", , Position);

        If StartTag = 0 Then
            Result  = Result + Mid(Template, Position);
            Break;
        EndIf;

        Result = Result + Mid(Template, Position, StartTag - Position);

        Tag = ParseTag(Template, StartTag);

        If Tag.Type = "var" Then

            Result   = Result + FormatValue(GetContextValue(ContextStack, Tag.Name), False);
            Position = Tag.End + 1;

        ElsIf Tag.Type = "raw" Then

            Result   = Result + FormatValue(GetContextValue(ContextStack, Tag.Name), True);
            Position = Tag.End + 1;

        ElsIf Tag.Type = "section" Or Tag.Type = "inverted" Then

            Closing  = FindSectionEnd(Template, Tag.End + 1, Tag.Name);
            Internal = Mid(Template, Tag.End + 1, Closing.Start - Tag.End - 1);
            Result   = Result + ProcessSection(Tag.Name, Tag.Type = "inverted", Internal, ContextStack, PartialTemplates);
            Position = Closing.End + 1;

        ElsIf Tag.Type = "partial" Then

            TemplateText = GetPartialTemplateText(Tag.Name, PartialTemplates);
            Result       = Result + ProcessFragment(TemplateText, ContextStack, PartialTemplates);
            Position     = Tag.End + 1;

        Else
            Position = Tag.End + 1;
        EndIf;

    EndDo;

    Return Result;

EndFunction

Function ParseTag(Val Template, Val Start)

    //@skip-check structure-consructor-too-many-keys
    Tag = New Structure("Type, Name, Start, End", "", "", Start, 0);

    If Mid(Template, Start, 3) = "{{{" Then

        EndTag = StrFind(Template, "}}}", , Start + 3);

        If EndTag = 0 Then
            Raise "Raw tag closing not found }}}";
        EndIf;

        Tag.Type = "raw";
        Tag.Name = TrimAll(Mid(Template, Start + 3, EndTag - Start - 3));
        Tag.End  = EndTag + 2;

        Return Tag;

    EndIf;

    EndTag = StrFind(Template, "}}", , Start + 2);

    If EndTag = 0 Then
        Raise "Tag closing not found }}";
    EndIf;

    Entity  = TrimAll(Mid(Template, Start + 2, EndTag - Start - 2));
    Tag.End = EndTag + 1;

    If StrStartWith(Entity, "#") Then
        Tag.Type = "section";
        Tag.Name = TrimAll(Mid(Entity, 2));
    ElsIf StrStartWith(Entity, "^") Then
        Tag.Type = "inverted";
        Tag.Name = TrimAll(Mid(Entity, 2));
    ElsIf StrStartWith(Entity, ">") Then
        Tag.Type = "partial";
        Tag.Name = TrimAll(Mid(Entity, 2));
    Else
        Tag.Type = "var";
        Tag.Name = Entity;
    EndIf;

    Return Tag;

EndFunction

Function FindSectionEnd(Val Template, Val Start, Val SectionName)

    Result    = New Structure("Start, End", 0, 0);
    Depth     = 1;
    Position  = Start;
    Length    = StrLen(Template);
    Openning  = "{{#" + SectionName + "}}";
    Inversion = "{{^" + SectionName + "}}";
    Closing   = "{{/" + SectionName + "}}";

    While Depth > 0 And Position <= Length Do

        OpeningPosition   = StrFind(Template, Openning, , Position);
        InversionPosition = StrFind(Template, Inversion, , Position);
        ClosingPosition   = StrFind(Template, Closing, , Position);

        If ClosingPosition       = 0
            And (OpeningPosition = 0 And InversionPosition = 0) Then
            Raise StrTemplate("Section closing not found {{/%1}}", SectionName);
        EndIf;

        Minimum = Length + 1;

        If ClosingPosition > 0 Then
            Minimum = ClosingPosition;
        EndIf;

        If OpeningPosition > 0 And OpeningPosition < Minimum Then
            Minimum = OpeningPosition;
            TagType = "open";
        ElsIf InversionPosition > 0 And InversionPosition < Minimum Then
            Minimum = InversionPosition;
            TagType = "open";
        Else
            TagType = "close";
        EndIf;

        If TagType = "close" Then
            Depth  = Depth - 1;

            If Depth         = 0 Then
                Result.Start = ClosingPosition;
                Result.End   = ClosingPosition + StrLen(Closing) - 1;
                Break;
            EndIf;

            Position = ClosingPosition + StrLen(Closing);
        Else
            Depth    = Depth + 1;
            Position = Minimum + StrLen(Openning);
        EndIf;

    EndDo;

    Return Result;

EndFunction

Function ProcessSection(Val Name, Val Inversion, Val Internal, ContextStack, PartialTemplates)

    Value  = GetContextValue(ContextStack, Name);
    IsTrue = ValueIsTrue(Value);

    If Inversion Then
        If IsTrue Then
            Return "";
        EndIf;
    Else
        If Not IsTrue Then
            Return "";
        EndIf;
    EndIf;

    If TypeOf(Value) = Type("Array") Then

        Result = "";

        For Each Element In Value Do
            ContextStack.Add(Element);
            Result = Result + ProcessFragment(Internal, ContextStack, PartialTemplates);
            ContextStack.Delete(ContextStack.UBound());
        EndDo;

        Return Result;

    EndIf;

    If TypeOf(Value)     = Type("Structure")
        Or TypeOf(Value) = Type("Map") Then

        ContextStack.Add(Value);

        Try
            Return ProcessFragment(Internal, ContextStack, PartialTemplates);
        Except
            ContextStack.Delete(ContextStack.UBound());
            Raise;
        EndTry;

        ContextStack.Delete(ContextStack.UBound());

    EndIf;

    Return ProcessFragment(Internal, ContextStack, PartialTemplates);

EndFunction

Function GetContextValue(ContextStack, Val Name)

    UpperBound = ContextStack.UBound();

    For Index = 0 To UpperBound Do

        Value = GetValueFromCollection(ContextStack[UpperBound - Index], Name);

        If Value <> Undefined Then
            Return Value;
        EndIf;

    EndDo;

    Return Undefined;

EndFunction

Function GetValueFromCollection(Val Collection, Val Name)

    If Collection = Undefined Then
        Return Undefined;
    EndIf;

    CollectionType = TypeOf(Collection);

    If CollectionType    = Type("Structure") Then
        If Collection.Property(Name) Then
            Return Collection[Name];
        EndIf;
    ElsIf CollectionType = Type("Map") Then
        Value            = Collection.Get(Name);
        If Value <> Undefined Then
            Return Value;
        EndIf;
    EndIf;

    Return Undefined;

EndFunction

Function ValueIsTrue(Val Value)

    If Value = Undefined Or Value = Null Then
        Return False;
    EndIf;

    If TypeOf(Value) = Type("Boolean") Then
        Return Value;
    EndIf;

    If TypeOf(Value) = Type("String") Then
        Return Value <> "";
    EndIf;

    If TypeOf(Value) = Type("Array") Then
        Return Value.Count() > 0;
    EndIf;

    If TypeOf(Value)     = Type("Structure")
        Or TypeOf(Value) = Type("Map") Then
        Return True;
    EndIf;

    Return True;

EndFunction

Function FormatValue(Val Value, Val Raw)

    If Value = Undefined Or Value = Null Then
        Return "";
    EndIf;

    If Raw Then
        Return String(Value);
    EndIf;

    Return EscapeHTML(Value);

EndFunction

Function GetPartialTemplateText(Val Name, PartialTemplates)

    If PartialTemplates <> Undefined Then
        TemplateText = PartialTemplates.Get(Name);
        If TemplateText <> Undefined Then
            Return TemplateText;
        EndIf;
    EndIf;

    Return OPI_Tools.GetTextTemplate(Name);

EndFunction

#EndRegion

#EndIf
