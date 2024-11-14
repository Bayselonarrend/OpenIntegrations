﻿Function ПолучитьСостав() Export

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
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Basic request data (with full URL). See GetBasicDataStructure";
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
    NewLine.Параметр    = "--data";
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
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CreateBucket";
    NewLine.МетодПоиска = "CREATEBUCKET";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - Yes)";
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
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "DeleteBucket";
    NewLine.МетодПоиска = "DELETEBUCKET";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - Yes)";
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
    NewLine.Метод       = "CheckBucketAvailability";
    NewLine.МетодПоиска = "CHECKBUCKETAVAILABILITY";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Bucket name";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Checks if the bucket is available for the current account or account by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CheckBucketAvailability";
    NewLine.МетодПоиска = "CHECKBUCKETAVAILABILITY";
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CheckBucketAvailability";
    NewLine.МетодПоиска = "CHECKBUCKETAVAILABILITY";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - Yes)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CheckBucketAvailability";
    NewLine.МетодПоиска = "CHECKBUCKETAVAILABILITY";
    NewLine.Параметр    = "--account";
    NewLine.Описание    = "Account ID to verify that hes the bucket owner (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "CheckBucketAvailability";
    NewLine.МетодПоиска = "CHECKBUCKETAVAILABILITY";
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
    NewLine.Параметр    = "--data";
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
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - Yes)";
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
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketEncryption";
    NewLine.МетодПоиска = "GETBUCKETENCRYPTION";
    NewLine.Параметр    = "--dir";
    NewLine.Описание    = "True > Directory Bucket, False > General Purpose Bucket (optional, def. val. - Yes)";
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
    NewLine.Метод       = "GetBucketsList";
    NewLine.МетодПоиска = "GETBUCKETSLIST";
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Basic request data. See GetBasicDataStructure";
    NewLine.Область     = "Buckets managment";
    NewLine.ОписаниеМетода   = "Gets a list of buckets. It is possible to use filters if they are provided by your service";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketsList";
    NewLine.МетодПоиска = "GETBUCKETSLIST";
    NewLine.Параметр    = "--prefix";
    NewLine.Описание    = "Filtering by the beginning of the name, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketsList";
    NewLine.МетодПоиска = "GETBUCKETSLIST";
    NewLine.Параметр    = "--region";
    NewLine.Описание    = "Selection by bucket region, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketsList";
    NewLine.МетодПоиска = "GETBUCKETSLIST";
    NewLine.Параметр    = "--ctoken";
    NewLine.Описание    = "Page token if pagination is used (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "s3";
    NewLine.Модуль      = "OPI_S3";
    NewLine.Метод       = "GetBucketsList";
    NewLine.МетодПоиска = "GETBUCKETSLIST";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Buckets managment";

    Return CompositionTable;
EndFunction

