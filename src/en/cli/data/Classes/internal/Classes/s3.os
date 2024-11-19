Function ПолучитьСостав() Export

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Библиотека");
    CompositionTable.Columns.Add("Модуль");
    CompositionTable.Columns.Add("Метод");
    CompositionTable.Columns.Add("МетодПоиска");
    CompositionTable.Columns.Add("Параметр");
    CompositionTable.Columns.Add("Описание");
    CompositionTable.Columns.Add("ОписаниеМетода");
    CompositionTable.Columns.Add("Область");

    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBasicDataStructure";
    NewLine.МетодПоиска = "GETBASICDATASTRUCTURE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL: domain for common methods or full URL with parameters for methods of direct request sending";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Returns the basic data for request in structured form";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBasicDataStructure";
    NewLine.МетодПоиска = "GETBASICDATASTRUCTURE";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access key for authorization";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBasicDataStructure";
    NewLine.МетодПоиска = "GETBASICDATASTRUCTURE";
    NewLine.Параметр    = "--secret";
    NewLine.Описание    = "Secret key for authorization";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBasicDataStructure";
    NewLine.МетодПоиска = "GETBASICDATASTRUCTURE";
    NewLine.Параметр    = "--region";
    NewLine.Описание    = "Service region";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBasicDataStructure";
    NewLine.МетодПоиска = "GETBASICDATASTRUCTURE";
    NewLine.Параметр    = "--service";
    NewLine.Описание    = "Type of service, if different from s3 (optional, def. val. - s3)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "SendRequestWithoutBody";
    NewLine.МетодПоиска = "SENDREQUESTWITHOUTBODY";
    NewLine.Параметр    = "--method";
    NewLine.Описание    = "HTTP method";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Sends a simple http request without a body";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "SendRequestWithoutBody";
    NewLine.МетодПоиска = "SENDREQUESTWITHOUTBODY";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data (with full URL). See GetBasicDataStructure";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "SendRequestWithoutBody";
    NewLine.МетодПоиска = "SENDREQUESTWITHOUTBODY";
    NewLine.Параметр    = "--binary";
    NewLine.Описание    = "Disables an attempt to convert the response to JSON (optional, def. val. - No)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "SendRequestWithoutBody";
    NewLine.МетодПоиска = "SENDREQUESTWITHOUTBODY";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "SendRequestWithBody";
    NewLine.МетодПоиска = "SENDREQUESTWITHBODY";
    NewLine.Параметр    = "--method";
    NewLine.Описание    = "HTTP method";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Send http request with body";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "SendRequestWithBody";
    NewLine.МетодПоиска = "SENDREQUESTWITHBODY";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data (with full URL). See GetBasicDataStructure";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "SendRequestWithBody";
    NewLine.МетодПоиска = "SENDREQUESTWITHBODY";
    NewLine.Параметр    = "--body";
    NewLine.Описание    = "Binary data or file of request body data";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "SendRequestWithBody";
    NewLine.МетодПоиска = "SENDREQUESTWITHBODY";
    NewLine.Параметр    = "--binary";
    NewLine.Описание    = "Disables an attempt to convert the response to JSON (optional, def. val. - No)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "SendRequestWithBody";
    NewLine.МетодПоиска = "SENDREQUESTWITHBODY";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CreateBucket";
    NewLine.МетодПоиска = "CREATEBUCKET";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Creates a new bucket with the specified name";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CreateBucket";
    NewLine.МетодПоиска = "CREATEBUCKET";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CreateBucket";
    NewLine.МетодПоиска = "CREATEBUCKET";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - No)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CreateBucket";
    NewLine.МетодПоиска = "CREATEBUCKET";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucket";
    NewLine.МетодПоиска = "DELETEBUCKET";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Deletes the bucket by name";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucket";
    NewLine.МетодПоиска = "DELETEBUCKET";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucket";
    NewLine.МетодПоиска = "DELETEBUCKET";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - No)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucket";
    NewLine.МетодПоиска = "DELETEBUCKET";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "HeadBucket";
    NewLine.МетодПоиска = "HEADBUCKET";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Checks if the bucket is available for the current account or account by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "HeadBucket";
    NewLine.МетодПоиска = "HEADBUCKET";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "HeadBucket";
    NewLine.МетодПоиска = "HEADBUCKET";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - No)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "HeadBucket";
    NewLine.МетодПоиска = "HEADBUCKET";
    NewLine.Параметр    = "--account";
    NewLine.Описание    = "Account ID to verify that hes the bucket owner (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "HeadBucket";
    NewLine.МетодПоиска = "HEADBUCKET";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketEncryption";
    NewLine.МетодПоиска = "PUTBUCKETENCRYPTION";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Sets bucket encryption by XML configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketEncryption";
    NewLine.МетодПоиска = "PUTBUCKETENCRYPTION";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketEncryption";
    NewLine.МетодПоиска = "PUTBUCKETENCRYPTION";
    NewLine.Параметр    = "--conf";
    NewLine.Описание    = "XML string or file of encryption configuration";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketEncryption";
    NewLine.МетодПоиска = "PUTBUCKETENCRYPTION";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - No)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketEncryption";
    NewLine.МетодПоиска = "PUTBUCKETENCRYPTION";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketEncryption";
    NewLine.МетодПоиска = "GETBUCKETENCRYPTION";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Gets the previously set bucket encryption configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketEncryption";
    NewLine.МетодПоиска = "GETBUCKETENCRYPTION";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketEncryption";
    NewLine.МетодПоиска = "GETBUCKETENCRYPTION";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - No)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketEncryption";
    NewLine.МетодПоиска = "GETBUCKETENCRYPTION";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucketEncryption";
    NewLine.МетодПоиска = "DELETEBUCKETENCRYPTION";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Deletes the bucket encryption configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucketEncryption";
    NewLine.МетодПоиска = "DELETEBUCKETENCRYPTION";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucketEncryption";
    NewLine.МетодПоиска = "DELETEBUCKETENCRYPTION";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - No)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucketEncryption";
    NewLine.МетодПоиска = "DELETEBUCKETENCRYPTION";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketTagging";
    NewLine.МетодПоиска = "PUTBUCKETTAGGING";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Sets the tag set for the bucket";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketTagging";
    NewLine.МетодПоиска = "PUTBUCKETTAGGING";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketTagging";
    NewLine.МетодПоиска = "PUTBUCKETTAGGING";
    NewLine.Параметр    = "--tagset";
    NewLine.Описание    = "Set of tags (key and value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketTagging";
    NewLine.МетодПоиска = "PUTBUCKETTAGGING";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - No)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketTagging";
    NewLine.МетодПоиска = "PUTBUCKETTAGGING";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketTagging";
    NewLine.МетодПоиска = "GETBUCKETTAGGING";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Gets the bucket tag set";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketTagging";
    NewLine.МетодПоиска = "GETBUCKETTAGGING";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketTagging";
    NewLine.МетодПоиска = "GETBUCKETTAGGING";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - No)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketTagging";
    NewLine.МетодПоиска = "GETBUCKETTAGGING";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucketTagging";
    NewLine.МетодПоиска = "DELETEBUCKETTAGGING";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Deletes the bucket tag set";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucketTagging";
    NewLine.МетодПоиска = "DELETEBUCKETTAGGING";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucketTagging";
    NewLine.МетодПоиска = "DELETEBUCKETTAGGING";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - No)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucketTagging";
    NewLine.МетодПоиска = "DELETEBUCKETTAGGING";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketVersioning";
    NewLine.МетодПоиска = "PUTBUCKETVERSIONING";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Sets the versioning settings for bucket objects";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketVersioning";
    NewLine.МетодПоиска = "PUTBUCKETVERSIONING";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketVersioning";
    NewLine.МетодПоиска = "PUTBUCKETVERSIONING";
    NewLine.Параметр    = "--status";
    NewLine.Описание    = "Enable and disable versioning, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketVersioning";
    NewLine.МетодПоиска = "PUTBUCKETVERSIONING";
    NewLine.Параметр    = "--mfad";
    NewLine.Описание    = "Enable and disable MFA deletion, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketVersioning";
    NewLine.МетодПоиска = "PUTBUCKETVERSIONING";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - No)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutBucketVersioning";
    NewLine.МетодПоиска = "PUTBUCKETVERSIONING";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketVersioning";
    NewLine.МетодПоиска = "GETBUCKETVERSIONING";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Gets the values of versioning settings of objects in the bucket";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketVersioning";
    NewLine.МетодПоиска = "GETBUCKETVERSIONING";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketVersioning";
    NewLine.МетодПоиска = "GETBUCKETVERSIONING";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - No)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketVersioning";
    NewLine.МетодПоиска = "GETBUCKETVERSIONING";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListBuckets";
    NewLine.МетодПоиска = "LISTBUCKETS";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Gets a list of buckets. It is possible to use filters if they are provided by your service";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListBuckets";
    NewLine.МетодПоиска = "LISTBUCKETS";
    NewLine.Параметр    = "--prefix";
    NewLine.Описание    = "Filtering by prefix, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListBuckets";
    NewLine.МетодПоиска = "LISTBUCKETS";
    NewLine.Параметр    = "--region";
    NewLine.Описание    = "Selection by bucket region, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListBuckets";
    NewLine.МетодПоиска = "LISTBUCKETS";
    NewLine.Параметр    = "--ctoken";
    NewLine.Описание    = "Page token if pagination is used (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListBuckets";
    NewLine.МетодПоиска = "LISTBUCKETS";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutObject";
    NewLine.МетодПоиска = "PUTOBJECT";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Name of the object in the bucket";
    NewLine.Область     = "Objects managment";
    NewLine.ОписаниеМетода   = "Uploads the file to the bucket";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutObject";
    NewLine.МетодПоиска = "PUTOBJECT";
    NewLine.Параметр    = "--bucket";
    NewLine.Описание    = "Name of the bucket to put the object";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutObject";
    NewLine.МетодПоиска = "PUTOBJECT";
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "File path or binary data of the object";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutObject";
    NewLine.МетодПоиска = "PUTOBJECT";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutObject";
    NewLine.МетодПоиска = "PUTOBJECT";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "HeadObject";
    NewLine.МетодПоиска = "HEADOBJECT";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Name of the object in the bucket";
    NewLine.Область     = "Objects managment";
    NewLine.ОписаниеМетода   = "Receives information about the properties of the object in the baquette";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "HeadObject";
    NewLine.МетодПоиска = "HEADOBJECT";
    NewLine.Параметр    = "--bucket";
    NewLine.Описание    = "Name of the bucket in which the object is stored";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "HeadObject";
    NewLine.МетодПоиска = "HEADOBJECT";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "HeadObject";
    NewLine.МетодПоиска = "HEADOBJECT";
    NewLine.Параметр    = "--ver";
    NewLine.Описание    = "Token for receiving a specific version of an object (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "HeadObject";
    NewLine.МетодПоиска = "HEADOBJECT";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetObject";
    NewLine.МетодПоиска = "GETOBJECT";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Name of the object in the bucket";
    NewLine.Область     = "Objects managment";
    NewLine.ОписаниеМетода   = "Gets the contents of the object from the bucket";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetObject";
    NewLine.МетодПоиска = "GETOBJECT";
    NewLine.Параметр    = "--bucket";
    NewLine.Описание    = "Name of the bucket in which the object is stored";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetObject";
    NewLine.МетодПоиска = "GETOBJECT";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetObject";
    NewLine.МетодПоиска = "GETOBJECT";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetObject";
    NewLine.МетодПоиска = "GETOBJECT";
    NewLine.Параметр    = "--ver";
    NewLine.Описание    = "Token for receiving a specific version of an object (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetObject";
    NewLine.МетодПоиска = "GETOBJECT";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetObject";
    NewLine.МетодПоиска = "GETOBJECT";
    NewLine.Параметр    = "--out";
    NewLine.Описание    = "Path to directly write a file to disk (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Name of the object in the bucket";
    NewLine.Область     = "Objects managment";
    NewLine.ОписаниеМетода   = "Removes the object from the bucket";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--bucket";
    NewLine.Описание    = "Name of the bucket to put the object";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--ver";
    NewLine.Описание    = "Token for deleting a specific version of an object (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--sname";
    NewLine.Описание    = "Path (name) in the source bucket";
    NewLine.Область     = "Objects managment";
    NewLine.ОписаниеМетода   = "Copies an object from one location to another";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--sbucket";
    NewLine.Описание    = "Source bucket name";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Path (name) in the destination bucket";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--bucket";
    NewLine.Описание    = "Destination bucket name";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutObjectTagging";
    NewLine.МетодПоиска = "PUTOBJECTTAGGING";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Object name";
    NewLine.Область     = "Objects managment";
    NewLine.ОписаниеМетода   = "Sets the tag set of the object";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutObjectTagging";
    NewLine.МетодПоиска = "PUTOBJECTTAGGING";
    NewLine.Параметр    = "--bucket";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutObjectTagging";
    NewLine.МетодПоиска = "PUTOBJECTTAGGING";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutObjectTagging";
    NewLine.МетодПоиска = "PUTOBJECTTAGGING";
    NewLine.Параметр    = "--tagset";
    NewLine.Описание    = "Set of tags (key and value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "PutObjectTagging";
    NewLine.МетодПоиска = "PUTOBJECTTAGGING";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetObjectTagging";
    NewLine.МетодПоиска = "GETOBJECTTAGGING";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Object name";
    NewLine.Область     = "Objects managment";
    NewLine.ОписаниеМетода   = "Gets the tag set of the object";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetObjectTagging";
    NewLine.МетодПоиска = "GETOBJECTTAGGING";
    NewLine.Параметр    = "--bucket";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetObjectTagging";
    NewLine.МетодПоиска = "GETOBJECTTAGGING";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetObjectTagging";
    NewLine.МетодПоиска = "GETOBJECTTAGGING";
    NewLine.Параметр    = "--ver";
    NewLine.Описание    = "Token for retrieving data of a specific version of an object (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetObjectTagging";
    NewLine.МетодПоиска = "GETOBJECTTAGGING";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteObjectTagging";
    NewLine.МетодПоиска = "DELETEOBJECTTAGGING";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Object name";
    NewLine.Область     = "Objects managment";
    NewLine.ОписаниеМетода   = "Deletes an objects tag set";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteObjectTagging";
    NewLine.МетодПоиска = "DELETEOBJECTTAGGING";
    NewLine.Параметр    = "--bucket";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteObjectTagging";
    NewLine.МетодПоиска = "DELETEOBJECTTAGGING";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteObjectTagging";
    NewLine.МетодПоиска = "DELETEOBJECTTAGGING";
    NewLine.Параметр    = "--ver";
    NewLine.Описание    = "Token for deleting data of a specific version of an object (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteObjectTagging";
    NewLine.МетодПоиска = "DELETEOBJECTTAGGING";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListObjects";
    NewLine.МетодПоиска = "LISTOBJECTS";
    NewLine.Параметр    = "--bucket";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Objects managment";
    NewLine.ОписаниеМетода   = "Gets the list of objects in the selected bucket";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListObjects";
    NewLine.МетодПоиска = "LISTOBJECTS";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListObjects";
    NewLine.МетодПоиска = "LISTOBJECTS";
    NewLine.Параметр    = "--prefix";
    NewLine.Описание    = "Filtering by prefix, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListObjects";
    NewLine.МетодПоиска = "LISTOBJECTS";
    NewLine.Параметр    = "--ctoken";
    NewLine.Описание    = "Page token if pagination is used (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListObjects";
    NewLine.МетодПоиска = "LISTOBJECTS";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListObjectVersions";
    NewLine.МетодПоиска = "LISTOBJECTVERSIONS";
    NewLine.Параметр    = "--bucket";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Objects managment";
    NewLine.ОписаниеМетода   = "Gets a list of all versions of objects in the selected bucket";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListObjectVersions";
    NewLine.МетодПоиска = "LISTOBJECTVERSIONS";
    NewLine.Параметр    = "--basic";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListObjectVersions";
    NewLine.МетодПоиска = "LISTOBJECTVERSIONS";
    NewLine.Параметр    = "--prefix";
    NewLine.Описание    = "Filtering by prefix, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListObjectVersions";
    NewLine.МетодПоиска = "LISTOBJECTVERSIONS";
    NewLine.Параметр    = "--ver";
    NewLine.Описание    = "Version ID for the beginning of the list (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "ListObjectVersions";
    NewLine.МетодПоиска = "LISTOBJECTVERSIONS";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Objects managment";

    Return CompositionTable;
EndFunction

