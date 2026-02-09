#Use "./internal"
#Use "../../tools"

Tests = OPI_TestDataRetrieval.FormAssertsTests();

For Each Test In Tests Do
    Execute("OPI_Tests." + Test + "()");
EndDo;
#Region Alternate



#EndRegion
