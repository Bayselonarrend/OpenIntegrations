---
id: Ntfy
sidebar_class_name: Ntfy
keywords: [1C, 1С, 1C:Enterprise, 1C:Enterprise 8.3, API, Integration, Services, Exchange, OneScript, CLI, Ntfy]
---

<img src={require('../../static/img/APIs/Ntfy.png').default} width='64px' />

# Ntfy

import LibraryIntro from '@site/src/components/LibraryIntro';

<LibraryIntro module="OPI_Ntfy" cli="ntfy" use="oint/api/ntfy" lang="en"/>

The `OPI_Ntfy` library is designed for **sending and receiving push notifications** via the Ntfy service in 1C:Enterprise, OneScript, and CLI. This page provides a brief overview of capabilities and typical scenarios; for detailed method signatures, see the child sections of the documentation.

## Getting Started

Ntfy is a simple service for sending notifications to phones, web browsers, and other devices. You can use:

1. **Public server** `ntfy.sh` — free, no registration required, but with limitations
2. **Own Ntfy server** — full control and no limitations

### Using the Public Server

To work with `ntfy.sh`, you just need to choose a unique topic name:

```bsl
Topic = "my_unique_topic_123";
Message = "Hello from 1C!";

Result = OPI_Ntfy.SendMessage("", Topic, Message);
```

:::important
When using the public server, choose a unique topic name to avoid conflicts with other users
:::

### Using Your Own Server

If you have deployed your own Ntfy server, specify its URL:

```bsl
URL = "https://ntfy.example.com";
Topic = "important_notifications";
Message = "Message from own server";

Result = OPI_Ntfy.SendMessage(URL, Topic, Message);
```

### Protecting Topics with Token

For protected topics, use an access token:

```bsl
Token = "tk_your_access_token";
Result = OPI_Ntfy.SendMessage(URL, Topic, Message, Token);
```

## Sending Notifications

### Simple Notification

Basic notification sending requires only a topic and message text:

```bsl
Topic = "news";
Message = "New update available!";

Result = OPI_Ntfy.SendMessage("", Topic, Message);
```

### Notification with Parameters

For advanced capabilities, use additional parameters:

```bsl
Parameters = OPI_Ntfy.GetMessageParametersStructure(True);
Parameters["Title"] = "Important Notification";
Parameters["Priority"] = "high";
Parameters["Tags"] = "warning,urgent";
Parameters["Click"] = "https://example.com";
Parameters["Icon"] = "https://example.com/icon.png";

Result = OPI_Ntfy.SendMessage("", Topic, Message, "", Parameters);
```

### Available Notification Parameters

`GetMessageParametersStructure` returns a structure with the following fields:

- **Title** — notification title
- **Priority** — priority: `min`, `low`, `default`, `high`, `max` or number from 1 to 5
- **Tags** — tags or emoji (string or array of strings)
- **Click** — URL to open when clicking the notification
- **Attach** — attachment URL (image, file)
- **Actions** — action buttons in Ntfy format
- **Delay** — delayed sending (e.g., `10m` or unix timestamp)
- **Email** — email for forwarding the notification
- **Icon** — notification icon URL
- **Markdown** — `True` for formatting text as Markdown

```bsl
Parameters = OPI_Ntfy.GetMessageParametersStructure(True);
Parameters["Title"] = "Report Ready";
Parameters["Priority"] = "high";
Parameters["Tags"] = New Array;
Parameters["Tags"].Add("chart");
Parameters["Tags"].Add("money");
Parameters["Attach"] = "https://example.com/report.pdf";
Parameters["Markdown"] = True;

Message = "**Monthly report** is ready for review!";
Result = OPI_Ntfy.SendMessage("", "reports", Message, "", Parameters);
```

:::tip
Use emoji tags for visual notification highlighting: `warning`, `tada`, `fire`, `bell` and others from the list [docs.ntfy.sh/emojis](https://docs.ntfy.sh/emojis/)
:::

## Receiving Messages

### Getting All Topic Messages

```bsl
Topic = "news";
Messages = OPI_Ntfy.GetMessages("", Topic);
```

### Filtering Messages

Use filter parameters for selective message retrieval:

```bsl
Filter = OPI_Ntfy.GetFilterParametersStructure(True);
Filter["since"] = "ID_of_last_received_message";
Filter["limit"] = "10";

Messages = OPI_Ntfy.GetMessages("", Topic, "", Filter);
```

### Available Filter Parameters

`GetFilterParametersStructure` returns a structure with fields:

- **since** — message ID from which to retrieve history
- **poll** — `True` for long polling (waiting for new message)
- **limit** — maximum number of messages to return

```bsl
Filter = OPI_Ntfy.GetFilterParametersStructure(True);
Filter["poll"] = True; // Wait for new message
Filter["limit"] = "1";

NewMessage = OPI_Ntfy.GetMessages("", Topic, Token, Filter);
```

:::note
When using `poll = True`, the request will wait for a new message to appear in the topic
:::

## Deleting Messages

Message deletion is only possible for **protected topics** with an access token:

```bsl
URL = "https://ntfy.example.com";
Topic = "protected_topic";
MessageID = "abc123def456";
Token = "tk_your_token";

Result = OPI_Ntfy.DeleteMessage(URL, Topic, MessageID, Token);
```

:::important
Message deletion only works for token-protected topics. On the public ntfy.sh server, this feature is unavailable without authorization setup
:::

## Typical Scenario

Example of comprehensive library usage:

```bsl
// 1. Sending notification with parameters
Topic = "monitoring_system";

Parameters = OPI_Ntfy.GetMessageParametersStructure(True);
Parameters["Title"] = "System Error";
Parameters["Priority"] = "urgent";
Parameters["Tags"] = "warning,computer";
Parameters["Email"] = "admin@example.com";

Message = "Critical error detected in data processing module";
Result = OPI_Ntfy.SendMessage("", Topic, Message, "", Parameters);

// 2. Getting latest messages
Filter = OPI_Ntfy.GetFilterParametersStructure(True);
Filter["limit"] = "5";

Messages = OPI_Ntfy.GetMessages("", Topic, "", Filter);

// 3. Processing received messages
For Each Message In Messages Do
    If Message["priority"] = "urgent" Then
        // Process critical messages
    EndIf;
EndDo;
```
