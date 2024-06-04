#Use 1commands
#Use coverage
#Use fs

FS.EnsureEmptyDirectory("coverage\data");
PathToStat = "coverage\stat.json";

Command = New Command;
Command.SetCommand("oscript");
Command.AddParameter(StrTemplate("-codestat=%1", PathToStat));
Command.AddParameter("D:\REPOS\OpenIntegrations\src\ru\OInt\tests\Modules\Coverage_StartAllTests.os"); // File start tests
Command.ShowOutputImmediately(True);

File_Stat = New File(PathToStat);

GenerationProcessor = New CoverageReportGenerator();

Message(File_Stat.FullName);
GenerationProcessor.RelativePaths()
				.StatisticsFile(File_Stat.FullName)
				.SourceDirectory("D:\REPOS\OpenIntegrations\src\ru\OInt\core")
				.GenericCoverage() 
				.Formulate();
