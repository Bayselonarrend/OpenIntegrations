---
id: ReportPortal
sidebar_class_name: ReportPortal
keywords: [1C, 1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, ReportPortal]
---

<img src={require('../../static/img/APIs/ReportPortal.png').default} width='64px' />

# ReportPortal

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_ReportPortal" cli="rportal" use="oint/api/rportal" lang="en"/>

This section is dedicated to the library for working with ReportPortal API in 1C:Enterprise, OneScript and CLI. This page describes all the actions necessary for a complete start of work

## Getting started

ReportPortal is an open-source test results management system. The library allows you to integrate your automated tests with ReportPortal for centralized storage and analysis of results.

### Getting authorization token

To work with ReportPortal API, you need to obtain an authorization token. There are two types of tokens:

#### Temporary token

Obtained based on user login and password and has a limited validity period:

```bsl
URL = "https://your-reportportal-instance.com";
Login = "your_username";
Password = "your_password";

Response = OPI_ReportPortal.GetTemporaryToken(URL, Login, Password);
Token = Response["access_token"];
```

#### Permanent token

For long-term use, it is recommended to create a permanent token:

1. Get a temporary token as described above
2. Find out your user ID (can be found in the profile on the ReportPortal web interface)
3. Create a permanent token:

```bsl
UserID = "your_user_id";
KeyName = "API Key for Integration";

Response = OPI_ReportPortal.GetPermanentToken(URL, Token, UserID, KeyName);
PermanentToken = Response["apiKey"];
```

Save the obtained permanent token for further use in library method calls.

:::important
If necessary, the permanent token can be deleted using the `DeletePermanentToken` function by passing the token ID
:::

### Main features

The library provides functionality for:

- **Managing test launches** — creating and completing test execution sessions
- **Working with test items** — creating test hierarchy (suite, test, step, etc.)
- **Recording logs** — adding detailed information about test execution with various levels (error, warn, info, etc.)
- **Configuring attributes and descriptions** — adding metadata for test results

All library methods work with JSON structures, which provides flexibility in parameter configuration.