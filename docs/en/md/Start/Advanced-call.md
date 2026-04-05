---
sidebar_position: 4
keywords: [1C, 1C:Enterprise, OneScript, CLI, HTTP, proxy, timeout, advanced call]
---

# Advanced call

For some OPI methods you can use **advanced call** — passing extra settings that are not part of the normal function signature. Usually these are transport settings: proxy, timeout, response shape, and so on.

## 1C:Enterprise and OneScript

Advanced call in 1C and OneScript is available through the `OPI_AdvancedCall` module (in Russian-language builds the module name is `OPI_РасширенныйВызов`):

- **`CallWithSettings`** (`ВызватьСНастройками`) — calls an OPI module method and passes a structure of advanced settings.
- **`GetAvailableSettings`** (`ПолучитьДоступныеНастройки`) — returns a text description of the setting keys available for the selected method.

Example of sending a Telegram text message with a normal call and with advanced call:

```bsl

// Normal call

    Token   = "3129457865:AAFyzNYOAFbu...";
    ChatID  = "123456789";
    Text    = "Message text";

    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text);


// Advanced call

    Parameters = New Array;
    Parameters.Add("3129457865:AAFyzNYOAFbu...");
    Parameters.Add("123456789");
    Parameters.Add("Message text");

    Settings = New Structure;
    Settings.Insert("adv_response", True); // Adds HTTP status code and headers to the function result
    Settings.Insert("timeout"     , 10000); // Changes the HTTP request timeout

    Result = OPI_AdvancedCall.CallWithSettings("OPI_Telegram"
        , "SendTextMessage"
        , Parameters
        , Settings);

```

## CLI

In OInt CLI, use the standard **`--config`** option. Pass a JSON object (as a string) whose fields match the advanced settings you need:

```bash
oint telegram SendTextMessage -t "31294578..." -c "123456789" -x "Text" --config "{'adv_response': true, 'timeout': 1000}"
```

You can see which fields are available for a given method in the documentation, or by running the method with **`--config`** and no value:

```bash
oint telegram SendTextMessage --config
```

## Advanced call in the documentation

For each library function, the advanced call settings are described on its documentation page: open the **Parameters / Advanced call** tab block and switch to **Advanced call**. The **“?”** link next to the tab title opens this overview page.
