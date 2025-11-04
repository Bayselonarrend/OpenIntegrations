
Var CompositionTable;

Function GetComposition() Export

    If CompositionTable <> Undefined Then
        Return CompositionTable;
    EndIf;

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Library");
    CompositionTable.Columns.Add("Module");
    CompositionTable.Columns.Add("Method");
    CompositionTable.Columns.Add("SearchMethod");
    CompositionTable.Columns.Add("Parameter");
    CompositionTable.Columns.Add("ParameterTrim");
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBasicDataStructure";
    NewLine.SearchMethod  = "GETBASICDATASTRUCTURE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL: domain for common methods or full URL with parameters for direct request sending";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Returns the basic data for request in structured form";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBasicDataStructure";
    NewLine.SearchMethod  = "GETBASICDATASTRUCTURE";
    NewLine.Parameter     = "--access";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Access key for authorization";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBasicDataStructure";
    NewLine.SearchMethod  = "GETBASICDATASTRUCTURE";
    NewLine.Parameter     = "--secret";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Secret key for authorization";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBasicDataStructure";
    NewLine.SearchMethod  = "GETBASICDATASTRUCTURE";
    NewLine.Parameter     = "--region";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Service region";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBasicDataStructure";
    NewLine.SearchMethod  = "GETBASICDATASTRUCTURE";
    NewLine.Parameter     = "--service";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Type of service, if different from s3 (optional, def. val. - s3)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "SendRequestWithoutBody";
    NewLine.SearchMethod  = "SENDREQUESTWITHOUTBODY";
    NewLine.Parameter     = "--method";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "HTTP method";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Sends a simple http request without a body";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "SendRequestWithoutBody";
    NewLine.SearchMethod  = "SENDREQUESTWITHOUTBODY";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data (with full URL). See GetBasicDataStructure";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "SendRequestWithoutBody";
    NewLine.SearchMethod  = "SENDREQUESTWITHOUTBODY";
    NewLine.Parameter     = "--binary";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Disables an attempt to convert the response to JSON (optional, def. val. - False)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "SendRequestWithoutBody";
    NewLine.SearchMethod  = "SENDREQUESTWITHOUTBODY";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "SendRequestWithBody";
    NewLine.SearchMethod  = "SENDREQUESTWITHBODY";
    NewLine.Parameter     = "--method";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "HTTP method";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Send http request with body";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "SendRequestWithBody";
    NewLine.SearchMethod  = "SENDREQUESTWITHBODY";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data (with full URL). See GetBasicDataStructure";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "SendRequestWithBody";
    NewLine.SearchMethod  = "SENDREQUESTWITHBODY";
    NewLine.Parameter     = "--body";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Binary data or file of request body data";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "SendRequestWithBody";
    NewLine.SearchMethod  = "SENDREQUESTWITHBODY";
    NewLine.Parameter     = "--binary";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Disables an attempt to convert the response to JSON (optional, def. val. - False)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "SendRequestWithBody";
    NewLine.SearchMethod  = "SENDREQUESTWITHBODY";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "CreateBucket";
    NewLine.SearchMethod  = "CREATEBUCKET";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Buckets management";
    NewLine.MethodDescription   = "Creates a new bucket with the specified name";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "CreateBucket";
    NewLine.SearchMethod  = "CREATEBUCKET";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "CreateBucket";
    NewLine.SearchMethod  = "CREATEBUCKET";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "CreateBucket";
    NewLine.SearchMethod  = "CREATEBUCKET";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteBucket";
    NewLine.SearchMethod  = "DELETEBUCKET";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Buckets management";
    NewLine.MethodDescription   = "Deletes the bucket by name";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteBucket";
    NewLine.SearchMethod  = "DELETEBUCKET";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteBucket";
    NewLine.SearchMethod  = "DELETEBUCKET";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteBucket";
    NewLine.SearchMethod  = "DELETEBUCKET";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "HeadBucket";
    NewLine.SearchMethod  = "HEADBUCKET";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Buckets management";
    NewLine.MethodDescription   = "Checks if the bucket is available for the current account or account by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "HeadBucket";
    NewLine.SearchMethod  = "HEADBUCKET";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "HeadBucket";
    NewLine.SearchMethod  = "HEADBUCKET";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "HeadBucket";
    NewLine.SearchMethod  = "HEADBUCKET";
    NewLine.Parameter     = "--account";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Account ID to verify that hes the bucket owner (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "HeadBucket";
    NewLine.SearchMethod  = "HEADBUCKET";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketEncryption";
    NewLine.SearchMethod  = "PUTBUCKETENCRYPTION";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Buckets management";
    NewLine.MethodDescription   = "Sets bucket encryption by XML configuration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketEncryption";
    NewLine.SearchMethod  = "PUTBUCKETENCRYPTION";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketEncryption";
    NewLine.SearchMethod  = "PUTBUCKETENCRYPTION";
    NewLine.Parameter     = "--conf";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "XML string or file of encryption configuration";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketEncryption";
    NewLine.SearchMethod  = "PUTBUCKETENCRYPTION";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketEncryption";
    NewLine.SearchMethod  = "PUTBUCKETENCRYPTION";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBucketEncryption";
    NewLine.SearchMethod  = "GETBUCKETENCRYPTION";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Buckets management";
    NewLine.MethodDescription   = "Gets the previously set bucket encryption configuration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBucketEncryption";
    NewLine.SearchMethod  = "GETBUCKETENCRYPTION";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBucketEncryption";
    NewLine.SearchMethod  = "GETBUCKETENCRYPTION";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBucketEncryption";
    NewLine.SearchMethod  = "GETBUCKETENCRYPTION";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteBucketEncryption";
    NewLine.SearchMethod  = "DELETEBUCKETENCRYPTION";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Buckets management";
    NewLine.MethodDescription   = "Deletes the bucket encryption configuration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteBucketEncryption";
    NewLine.SearchMethod  = "DELETEBUCKETENCRYPTION";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteBucketEncryption";
    NewLine.SearchMethod  = "DELETEBUCKETENCRYPTION";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteBucketEncryption";
    NewLine.SearchMethod  = "DELETEBUCKETENCRYPTION";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketTagging";
    NewLine.SearchMethod  = "PUTBUCKETTAGGING";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Buckets management";
    NewLine.MethodDescription   = "Sets the tag set for the bucket";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketTagging";
    NewLine.SearchMethod  = "PUTBUCKETTAGGING";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketTagging";
    NewLine.SearchMethod  = "PUTBUCKETTAGGING";
    NewLine.Parameter     = "--tagset";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Set of tags (key and value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketTagging";
    NewLine.SearchMethod  = "PUTBUCKETTAGGING";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketTagging";
    NewLine.SearchMethod  = "PUTBUCKETTAGGING";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBucketTagging";
    NewLine.SearchMethod  = "GETBUCKETTAGGING";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Buckets management";
    NewLine.MethodDescription   = "Gets the bucket tag set";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBucketTagging";
    NewLine.SearchMethod  = "GETBUCKETTAGGING";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBucketTagging";
    NewLine.SearchMethod  = "GETBUCKETTAGGING";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBucketTagging";
    NewLine.SearchMethod  = "GETBUCKETTAGGING";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteBucketTagging";
    NewLine.SearchMethod  = "DELETEBUCKETTAGGING";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Buckets management";
    NewLine.MethodDescription   = "Deletes the bucket tag set";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteBucketTagging";
    NewLine.SearchMethod  = "DELETEBUCKETTAGGING";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteBucketTagging";
    NewLine.SearchMethod  = "DELETEBUCKETTAGGING";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteBucketTagging";
    NewLine.SearchMethod  = "DELETEBUCKETTAGGING";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketVersioning";
    NewLine.SearchMethod  = "PUTBUCKETVERSIONING";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Buckets management";
    NewLine.MethodDescription   = "Sets the versioning settings for bucket objects";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketVersioning";
    NewLine.SearchMethod  = "PUTBUCKETVERSIONING";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketVersioning";
    NewLine.SearchMethod  = "PUTBUCKETVERSIONING";
    NewLine.Parameter     = "--status";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Enable and disable versioning, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketVersioning";
    NewLine.SearchMethod  = "PUTBUCKETVERSIONING";
    NewLine.Parameter     = "--mfad";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Enable and disable MFA deletion, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketVersioning";
    NewLine.SearchMethod  = "PUTBUCKETVERSIONING";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutBucketVersioning";
    NewLine.SearchMethod  = "PUTBUCKETVERSIONING";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBucketVersioning";
    NewLine.SearchMethod  = "GETBUCKETVERSIONING";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Buckets management";
    NewLine.MethodDescription   = "Gets the values of versioning settings of objects in the bucket";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBucketVersioning";
    NewLine.SearchMethod  = "GETBUCKETVERSIONING";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBucketVersioning";
    NewLine.SearchMethod  = "GETBUCKETVERSIONING";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetBucketVersioning";
    NewLine.SearchMethod  = "GETBUCKETVERSIONING";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListBuckets";
    NewLine.SearchMethod  = "LISTBUCKETS";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Buckets management";
    NewLine.MethodDescription   = "Gets a list of buckets. It is possible to use filters if they are provided by your service";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListBuckets";
    NewLine.SearchMethod  = "LISTBUCKETS";
    NewLine.Parameter     = "--prefix";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Filtering by prefix, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListBuckets";
    NewLine.SearchMethod  = "LISTBUCKETS";
    NewLine.Parameter     = "--region";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Selection by bucket region, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListBuckets";
    NewLine.SearchMethod  = "LISTBUCKETS";
    NewLine.Parameter     = "--ctoken";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Page token if pagination is used (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListBuckets";
    NewLine.SearchMethod  = "LISTBUCKETS";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Buckets management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutObject";
    NewLine.SearchMethod  = "PUTOBJECT";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of the object in the bucket";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Uploads the file to the bucket";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutObject";
    NewLine.SearchMethod  = "PUTOBJECT";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Name of the bucket to put the object";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutObject";
    NewLine.SearchMethod  = "PUTOBJECT";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "File path or binary data of the object";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutObject";
    NewLine.SearchMethod  = "PUTOBJECT";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutObject";
    NewLine.SearchMethod  = "PUTOBJECT";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutObject";
    NewLine.SearchMethod  = "PUTOBJECT";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadFullObject";
    NewLine.SearchMethod  = "UPLOADFULLOBJECT";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of the object in the bucket";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Upload object with single request";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadFullObject";
    NewLine.SearchMethod  = "UPLOADFULLOBJECT";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Name of the bucket to put the object";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadFullObject";
    NewLine.SearchMethod  = "UPLOADFULLOBJECT";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "File path or binary data of the object";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadFullObject";
    NewLine.SearchMethod  = "UPLOADFULLOBJECT";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadFullObject";
    NewLine.SearchMethod  = "UPLOADFULLOBJECT";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadFullObject";
    NewLine.SearchMethod  = "UPLOADFULLOBJECT";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "InitPartsUpload";
    NewLine.SearchMethod  = "INITPARTSUPLOAD";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of the object in the bucket";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Initializes the multipart object uploading";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "InitPartsUpload";
    NewLine.SearchMethod  = "INITPARTSUPLOAD";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Name of the bucket to put the object";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "InitPartsUpload";
    NewLine.SearchMethod  = "INITPARTSUPLOAD";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "InitPartsUpload";
    NewLine.SearchMethod  = "INITPARTSUPLOAD";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "InitPartsUpload";
    NewLine.SearchMethod  = "INITPARTSUPLOAD";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadObjectPart";
    NewLine.SearchMethod  = "UPLOADOBJECTPART";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of the object in the bucket";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Uploads a part of an object for multipart uploading";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadObjectPart";
    NewLine.SearchMethod  = "UPLOADOBJECTPART";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Name of the bucket to put the object";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadObjectPart";
    NewLine.SearchMethod  = "UPLOADOBJECTPART";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadObjectPart";
    NewLine.SearchMethod  = "UPLOADOBJECTPART";
    NewLine.Parameter     = "--upload";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Upload ID. See InitPartsUpload";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadObjectPart";
    NewLine.SearchMethod  = "UPLOADOBJECTPART";
    NewLine.Parameter     = "--part";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Number of the object part from 1 to 10000";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadObjectPart";
    NewLine.SearchMethod  = "UPLOADOBJECTPART";
    NewLine.Parameter     = "--content";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Part content for uploading";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "UploadObjectPart";
    NewLine.SearchMethod  = "UPLOADOBJECTPART";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "FinishPartsUpload";
    NewLine.SearchMethod  = "FINISHPARTSUPLOAD";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of the object in the bucket";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Confirms the multipart uploading finish";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "FinishPartsUpload";
    NewLine.SearchMethod  = "FINISHPARTSUPLOAD";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Name of the bucket to put the object";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "FinishPartsUpload";
    NewLine.SearchMethod  = "FINISHPARTSUPLOAD";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "FinishPartsUpload";
    NewLine.SearchMethod  = "FINISHPARTSUPLOAD";
    NewLine.Parameter     = "--upload";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Upload ID. See InitPartsUpload";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "FinishPartsUpload";
    NewLine.SearchMethod  = "FINISHPARTSUPLOAD";
    NewLine.Parameter     = "--tags";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "An array of tags (Etag) from the uploads responses of each part";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "FinishPartsUpload";
    NewLine.SearchMethod  = "FINISHPARTSUPLOAD";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "FinishPartsUpload";
    NewLine.SearchMethod  = "FINISHPARTSUPLOAD";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "AbortMultipartUpload";
    NewLine.SearchMethod  = "ABORTMULTIPARTUPLOAD";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of the object in the bucket";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Aborts the multipart uploading of the object";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "AbortMultipartUpload";
    NewLine.SearchMethod  = "ABORTMULTIPARTUPLOAD";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Name of the bucket to put the object";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "AbortMultipartUpload";
    NewLine.SearchMethod  = "ABORTMULTIPARTUPLOAD";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "AbortMultipartUpload";
    NewLine.SearchMethod  = "ABORTMULTIPARTUPLOAD";
    NewLine.Parameter     = "--upload";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Upload ID. See InitPartsUpload";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "AbortMultipartUpload";
    NewLine.SearchMethod  = "ABORTMULTIPARTUPLOAD";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "AbortMultipartUpload";
    NewLine.SearchMethod  = "ABORTMULTIPARTUPLOAD";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "HeadObject";
    NewLine.SearchMethod  = "HEADOBJECT";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of the object in the bucket";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Receives information about the properties of the object in the baquette";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "HeadObject";
    NewLine.SearchMethod  = "HEADOBJECT";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Name of the bucket in which the object is stored";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "HeadObject";
    NewLine.SearchMethod  = "HEADOBJECT";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "HeadObject";
    NewLine.SearchMethod  = "HEADOBJECT";
    NewLine.Parameter     = "--ver";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Token for receiving a specific version of an object (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "HeadObject";
    NewLine.SearchMethod  = "HEADOBJECT";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "HeadObject";
    NewLine.SearchMethod  = "HEADOBJECT";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObject";
    NewLine.SearchMethod  = "GETOBJECT";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of the object in the bucket";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Gets the contents of the object from the bucket";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObject";
    NewLine.SearchMethod  = "GETOBJECT";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Name of the bucket in which the object is stored";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObject";
    NewLine.SearchMethod  = "GETOBJECT";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObject";
    NewLine.SearchMethod  = "GETOBJECT";
    NewLine.Parameter     = "--ver";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Token for receiving a specific version of an object (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObject";
    NewLine.SearchMethod  = "GETOBJECT";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObject";
    NewLine.SearchMethod  = "GETOBJECT";
    NewLine.Parameter     = "--out";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Path to directly write a file to disk (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObject";
    NewLine.SearchMethod  = "GETOBJECT";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteObject";
    NewLine.SearchMethod  = "DELETEOBJECT";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of the object in the bucket";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Removes the object from the bucket";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteObject";
    NewLine.SearchMethod  = "DELETEOBJECT";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Name of the bucket to put the object";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteObject";
    NewLine.SearchMethod  = "DELETEOBJECT";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteObject";
    NewLine.SearchMethod  = "DELETEOBJECT";
    NewLine.Parameter     = "--ver";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Token for deleting a specific version of an object (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteObject";
    NewLine.SearchMethod  = "DELETEOBJECT";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteObject";
    NewLine.SearchMethod  = "DELETEOBJECT";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "CopyObject";
    NewLine.SearchMethod  = "COPYOBJECT";
    NewLine.Parameter     = "--sname";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Path (name) in the source bucket";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Copies an object from one location to another";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "CopyObject";
    NewLine.SearchMethod  = "COPYOBJECT";
    NewLine.Parameter     = "--sbucket";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Source bucket name";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "CopyObject";
    NewLine.SearchMethod  = "COPYOBJECT";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Path (name) in the destination bucket";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "CopyObject";
    NewLine.SearchMethod  = "COPYOBJECT";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Destination bucket name";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "CopyObject";
    NewLine.SearchMethod  = "COPYOBJECT";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "CopyObject";
    NewLine.SearchMethod  = "COPYOBJECT";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "CopyObject";
    NewLine.SearchMethod  = "COPYOBJECT";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutObjectTagging";
    NewLine.SearchMethod  = "PUTOBJECTTAGGING";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Object name";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Sets the tag set of the object";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutObjectTagging";
    NewLine.SearchMethod  = "PUTOBJECTTAGGING";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutObjectTagging";
    NewLine.SearchMethod  = "PUTOBJECTTAGGING";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutObjectTagging";
    NewLine.SearchMethod  = "PUTOBJECTTAGGING";
    NewLine.Parameter     = "--tagset";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Set of tags (key and value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutObjectTagging";
    NewLine.SearchMethod  = "PUTOBJECTTAGGING";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "PutObjectTagging";
    NewLine.SearchMethod  = "PUTOBJECTTAGGING";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectTagging";
    NewLine.SearchMethod  = "GETOBJECTTAGGING";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Object name";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Gets the tag set of the object";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectTagging";
    NewLine.SearchMethod  = "GETOBJECTTAGGING";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectTagging";
    NewLine.SearchMethod  = "GETOBJECTTAGGING";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectTagging";
    NewLine.SearchMethod  = "GETOBJECTTAGGING";
    NewLine.Parameter     = "--ver";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Token for retrieving data of a specific version of an object (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectTagging";
    NewLine.SearchMethod  = "GETOBJECTTAGGING";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectTagging";
    NewLine.SearchMethod  = "GETOBJECTTAGGING";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteObjectTagging";
    NewLine.SearchMethod  = "DELETEOBJECTTAGGING";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Object name";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Deletes an objects tag set";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteObjectTagging";
    NewLine.SearchMethod  = "DELETEOBJECTTAGGING";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteObjectTagging";
    NewLine.SearchMethod  = "DELETEOBJECTTAGGING";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteObjectTagging";
    NewLine.SearchMethod  = "DELETEOBJECTTAGGING";
    NewLine.Parameter     = "--ver";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Token for deleting data of a specific version of an object (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteObjectTagging";
    NewLine.SearchMethod  = "DELETEOBJECTTAGGING";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "DeleteObjectTagging";
    NewLine.SearchMethod  = "DELETEOBJECTTAGGING";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListObjects";
    NewLine.SearchMethod  = "LISTOBJECTS";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Gets the list of objects in the selected bucket";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListObjects";
    NewLine.SearchMethod  = "LISTOBJECTS";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListObjects";
    NewLine.SearchMethod  = "LISTOBJECTS";
    NewLine.Parameter     = "--prefix";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Filtering by prefix, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListObjects";
    NewLine.SearchMethod  = "LISTOBJECTS";
    NewLine.Parameter     = "--ctoken";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Page token if pagination is used (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListObjects";
    NewLine.SearchMethod  = "LISTOBJECTS";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListObjects";
    NewLine.SearchMethod  = "LISTOBJECTS";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListObjectVersions";
    NewLine.SearchMethod  = "LISTOBJECTVERSIONS";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Bucket name";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Gets a list of all versions of objects in the selected bucket";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListObjectVersions";
    NewLine.SearchMethod  = "LISTOBJECTVERSIONS";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListObjectVersions";
    NewLine.SearchMethod  = "LISTOBJECTVERSIONS";
    NewLine.Parameter     = "--prefix";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Filtering by prefix, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListObjectVersions";
    NewLine.SearchMethod  = "LISTOBJECTVERSIONS";
    NewLine.Parameter     = "--ver";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Version ID for the beginning of the list (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListObjectVersions";
    NewLine.SearchMethod  = "LISTOBJECTVERSIONS";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "ListObjectVersions";
    NewLine.SearchMethod  = "LISTOBJECTVERSIONS";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectDownloadLink";
    NewLine.SearchMethod  = "GETOBJECTDOWNLOADLINK";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of the object in the bucket";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Get presigned link for object retrieving without authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectDownloadLink";
    NewLine.SearchMethod  = "GETOBJECTDOWNLOADLINK";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Name of the bucket to put the object";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectDownloadLink";
    NewLine.SearchMethod  = "GETOBJECTDOWNLOADLINK";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectDownloadLink";
    NewLine.SearchMethod  = "GETOBJECTDOWNLOADLINK";
    NewLine.Parameter     = "--expires";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Link lifetime in seconds. 604800 max. (optional, def. val. - 3600)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectDownloadLink";
    NewLine.SearchMethod  = "GETOBJECTDOWNLOADLINK";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectDownloadLink";
    NewLine.SearchMethod  = "GETOBJECTDOWNLOADLINK";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectUploadLink";
    NewLine.SearchMethod  = "GETOBJECTUPLOADLINK";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of the object in the bucket";
    NewLine.Region      = "Objects management";
    NewLine.MethodDescription   = "Gets a direct link to upload (put) an object without additional authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectUploadLink";
    NewLine.SearchMethod  = "GETOBJECTUPLOADLINK";
    NewLine.Parameter     = "--bucket";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Name of the bucket to put the object";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectUploadLink";
    NewLine.SearchMethod  = "GETOBJECTUPLOADLINK";
    NewLine.Parameter     = "--basic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Basic request data. See GetBasicDataStructure";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectUploadLink";
    NewLine.SearchMethod  = "GETOBJECTUPLOADLINK";
    NewLine.Parameter     = "--expires";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Link lifetime in seconds. 604800 max. (optional, def. val. - 3600)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectUploadLink";
    NewLine.SearchMethod  = "GETOBJECTUPLOADLINK";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Objects management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "s3";
    NewLine.Module       = "OPI_S3";
    NewLine.Method        = "GetObjectUploadLink";
    NewLine.SearchMethod  = "GETOBJECTUPLOADLINK";
    NewLine.Parameter     = "--dir";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "True > Path style URL, False > Virtual hosted style URL (optional, def. val. - False)";
    NewLine.Region      = "Objects management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_S3 = LoadScript(""%1/oint/core/Modules/OPI_S3.os"", Context);
        |" + Chars.LF;


EndFunction 
