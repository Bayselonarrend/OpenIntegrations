#Use 1commands
#Use coverage
#Use fs
#Use oint

FS.EnsureEmptyDirectory("./OInt/coverage/data");
PathToStat = FS.FullPath("./OInt/coverage/data/stat.json");

Command = New Command;
Command.SetCommand("oscript");
Command.AddParameter(StrTemplate("-codestat=%1", PathToStat));
Command.AddParameter(FS.FullPath("./OInt/tests/Modules/Coverage_RunAllTests.os")); // File start tests
Command.ShowOutputImmediately(True);

ReturnCode = Command.Execute();
File_Stat = New File(PathToStat);
PackageName = "oint";

GenerationProcessor = New CoverageReportGenerator();

Message(File_Stat.FullName);
ProcessorObject = GenerationProcessor.StatisticsFile(File_Stat.FullName);
ProcessorObject = ProcessorObject.SourceDirectory(FS.FullPath("./OInt"));
ProcessorObject = ProcessorObject.WorkingDirectory(FS.FullPath("./OInt/coverage/data"));
ProcessorObject = ProcessorObject.GenericCoverage();

ProcessorObject.Formulate();
