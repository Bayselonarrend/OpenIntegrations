---
id: LDAP
sidebar_class_name: LDAP
keywords: [1C, 1C, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, LDAP]
---

<img src={require('../../static/img/APIs/LDAP.png').default} width='64px' />

# LDAP

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_LDAP" cli="ldap" use="oint/api/ldap" lang="en"/>

This section is dedicated to the library for working with LDAP (Lightweight Directory Access Protocol) in 1C:Enterprise, OneScript, and CLI. This page describes all the actions necessary for a full start of working with LDAP directories, including Active Directory.

<div class="theme-admonition theme-admonition-info admonition_node_modules-@docusaurus-theme-classic-lib-theme-Admonition-Layout-styles-module alert alert--info">

<img src={require('../../static/img/addin.png').default} class="tipimage" />
<div class="addin">An external component is used to implement the functions of this library<br/>
Please refer to the section ["About external components"](/docs/Start/Component-requirements) before starting work</div>
</div>

## Getting Started

To work with LDAP through the library, you need to:

1. Get the LDAP server URL (for example, `ldap://dc.example.com:389` or `ldaps://dc.example.com:636`)
2. Prepare credentials:
   - **Bind DN** — Distinguished Name of the user for authorization (for example, `CN=admin,DC=example,DC=com`)
   - **Password** — user password
3. Form connection parameters
4. Open connection

```bsl
URL = "ldap://dc.example.com:389";
BindDN = "CN=admin,DC=example,DC=com";
Password = "password123";

ConnectionParameters = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, 30);
Connection = OPI_LDAP.CreateConnection(ConnectionParameters);
```

## Connection Setup

### Basic Connection

To create a basic connection, it is sufficient to specify the server URL, Bind DN, and password:

```bsl
ConnectionParameters = OPI_LDAP.FormConnectionParameters(
    "ldap://dc.example.com:389",
    "CN=admin,DC=example,DC=com",
    "password123",
    30  // Timeout in seconds
);

Connection = OPI_LDAP.CreateConnection(ConnectionParameters);
```

### Secure Connection (LDAPS/TLS)

To work with LDAPS or StartTLS, you need to configure TLS:

```bsl
// TLS Configuration
TLSSettings = OPI_LDAP.GetTlsSettings(
    True,  // Disable certificate verification (for self-signed)
    ""     // Path to certificate (optional)
);

Connection = OPI_LDAP.CreateConnection(ConnectionParameters, TLSSettings);
```

### Connection with Logging

For debugging and monitoring, you can enable logging:

```bsl
LogSettings = OPI_LDAP.GetLoggingSettings(
    True,  // Write to memory
    300,   // Maximum events in memory
    "C:\Logs\ldap.log"  // Path to log file (optional)
);

Connection = OPI_LDAP.CreateConnection(ConnectionParameters, , LogSettings);

// Getting log
Log = OPI_LDAP.GetLog(Connection, True, 100);
```

:::important
It is recommended to explicitly close the connection after finishing work:
```bsl
OPI_LDAP.CloseConnection(Connection);
```
:::

## Directory Search

The `ExecuteSearch` method allows you to find entries in the LDAP directory according to specified criteria.

### Basic Search

```bsl
Base = "DC=example,DC=com";
Filter = "(objectClass=user)";

Result = OPI_LDAP.ExecuteSearch(Connection, Base, Filter);
```

### Search with Attribute Selection

```bsl
Attributes = New Array;
Attributes.Add("cn");
Attributes.Add("mail");
Attributes.Add("telephoneNumber");

Result = OPI_LDAP.ExecuteSearch(Connection, Base, Filter, Attributes);
```

### Search Scopes

The `Scope` parameter defines the search depth:

- **base** — only the base object
- **one** — immediate children of the base object
- **subtree** — entire subtree (default)

```bsl
Result = OPI_LDAP.ExecuteSearch(Connection, Base, Filter, , "one");
```

### Automatic Connection Management

When passing connection parameters instead of a connection object, the library will automatically open and close the connection:

```bsl
Result = OPI_LDAP.ExecuteSearch(ConnectionParameters, Base, Filter);
```

:::tip
For multiple operations, it is recommended to use an open connection — this improves performance
:::

## Directory Data Modification

### Adding Entry

```bsl
DN = "CN=New User,OU=Users,DC=example,DC=com";

Attributes = New Structure;
Attributes.Insert("objectClass", New Array);
Attributes["objectClass"].Add("top");
Attributes["objectClass"].Add("person");
Attributes["objectClass"].Add("organizationalPerson");
Attributes["objectClass"].Add("user");

Attributes.Insert("cn", "New User");
Attributes.Insert("sn", "User");
Attributes.Insert("mail", "user@example.com");

Result = OPI_LDAP.Add(Connection, DN, Attributes);
```

### Modifying Entry

To modify an entry, you need to prepare an array of modifications. Each modification is a structure with fields:
- **operation** — operation type: `add`, `delete`, `replace`
- **attribute** — attribute name
- **values** — array of values

```bsl
DN = "CN=User,OU=Users,DC=example,DC=com";

Modifications = New Array;

// Change email
Modification1 = New Structure;
Modification1.Insert("operation", "replace");
Modification1.Insert("attribute", "mail");
Modification1.Insert("values", New Array);
Modification1["values"].Add("newemail@example.com");
Modifications.Add(Modification1);

// Add phone
Modification2 = New Structure;
Modification2.Insert("operation", "add");
Modification2.Insert("attribute", "telephoneNumber");
Modification2.Insert("values", New Array);
Modification2["values"].Add("+7 (999) 123-45-67");
Modifications.Add(Modification2);

Result = OPI_LDAP.Modify(Connection, DN, Modifications);
```

### Deleting Entry

```bsl
DN = "CN=User to Delete,OU=Users,DC=example,DC=com";

Result = OPI_LDAP.Delete(Connection, DN);
```

### Comparing Attribute Value

The method allows you to check if the attribute value matches the expected one:

```bsl
DN = "CN=User,OU=Users,DC=example,DC=com";
Attribute = "mail";
ExpectedValue = "user@example.com";

Result = OPI_LDAP.Compare(Connection, DN, Attribute, ExpectedValue);
```

## Typical Workflow Scenario

```bsl
// 1. Setup and opening connection
ConnectionParameters = OPI_LDAP.FormConnectionParameters(
    "ldaps://dc.example.com:636",
    "CN=admin,DC=example,DC=com",
    "SecurePassword123",
    30
);

TLSSettings = OPI_LDAP.GetTlsSettings(False);
Connection = OPI_LDAP.CreateConnection(ConnectionParameters, TLSSettings);

Try
    // 2. Search for users
    Base = "DC=example,DC=com";
    Filter = "(&(objectClass=user)(mail=*@example.com))";
    Attributes = New Array;
    Attributes.Add("cn");
    Attributes.Add("mail");
    
    SearchResult = OPI_LDAP.ExecuteSearch(Connection, Base, Filter, Attributes, "subtree");
    
    // 3. Adding new entry
    NewDN = "CN=Ivanov Ivan,OU=Users,DC=example,DC=com";
    NewAttributes = New Structure;
    NewAttributes.Insert("objectClass", New Array);
    NewAttributes["objectClass"].Add("user");
    NewAttributes.Insert("cn", "Ivanov Ivan");
    NewAttributes.Insert("mail", "ivanov@example.com");
    
    AddResult = OPI_LDAP.Add(Connection, NewDN, NewAttributes);
    
    // 4. Modifying entry
    Modifications = New Array;
    Modification = New Structure;
    Modification.Insert("operation", "replace");
    Modification.Insert("attribute", "telephoneNumber");
    Modification.Insert("values", New Array);
    Modification["values"].Add("+7 (495) 123-45-67");
    Modifications.Add(Modification);
    
    ModifyResult = OPI_LDAP.Modify(Connection, NewDN, Modifications);
    
Exception
    // Error handling
    Message(ErrorDescription());
EndTry;

// 5. Closing connection
OPI_LDAP.CloseConnection(Connection);
```
