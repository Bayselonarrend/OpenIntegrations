---
sidebar_position: 7
---

# Get user fields structure
 Gets the field structure for creating or modifying user information



`Function GetUserFieldsStructure(Val URL, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [user.fields](https://dev.1c-bitrix.ru/rest_help/users/user_fields.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetUserFieldsStructure(URL);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "ec4dc366006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetUserFieldsStructure(URL, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetUserFieldsStructure --url "b24-ar17wx.bitrix24.by" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "ID": "ID",
  "XML_ID": "Innotшнandй toод",
  "ACTIVE": "Аtoтandinbutwithть",
  "NAME": "Name",
  "LAST_NAME": "LastName",
  "SECOND_NAME": "Отчеwithтinо",
  "TITLE": "User list",
  "EMAIL": "E-Mail",
  "LAST_LOGIN": "Afterдняя аinторfromацandя",
  "DATE_REGISTER": "Date регandwithтрацandand",
  "TIME_ZONE": "TIME_ZONE",
  "IS_ONLINE": "IS_ONLINE",
  "TIME_ZONE_OFFSET": "TIME_ZONE_OFFSET",
  "TIMESTAMP_X": "TIMESTAMP_X",
  "LAST_ACTIVITY_DATE": "LAST_ACTIVITY_DATE",
  "PERSONAL_GENDER": "Toл",
  "PERSONAL_PROFESSION": "Профеwithwithandя",
  "PERSONAL_WWW": "Домашняя withтранandчtoа",
  "PERSONAL_BIRTHDAY": "Date рожденandя",
  "PERSONAL_PHOTO": "Photoграфandя",
  "PERSONAL_ICQ": "ICQ",
  "PERSONAL_PHONE": "Лandчный телефон",
  "PERSONAL_FAX": "Фаtowith",
  "PERSONAL_MOBILE": "Лandчный мобandльный",
  "PERSONAL_PAGER": "Пейджер",
  "PERSONAL_STREET": "Улandца прожandinанandя",
  "PERSONAL_CITY": "Город прожandinанandя",
  "PERSONAL_STATE": "Region / toрай",
  "PERSONAL_ZIP": "Toчтоinый andндеtowith",
  "PERSONAL_COUNTRY": "Страto",
  "PERSONAL_MAILBOX": "Toчтоinый ящandto",
  "PERSONAL_NOTES": "Доtoлнandтельные заметtoand",
  "WORK_PHONE": "Phone toомпанandand",
  "WORK_COMPANY": "Kомпанandя",
  "WORK_POSITION": "Shouldwithть",
  "WORK_DEPARTMENT": "Отдел",
  "WORK_WWW": "Website toомпанandand",
  "WORK_FAX": "WORK_FAX",
  "WORK_PAGER": "WORK_PAGER",
  "WORK_STREET": "WORK_STREET",
  "WORK_MAILBOX": "WORK_MAILBOX",
  "WORK_CITY": "Город work",
  "WORK_STATE": "WORK_STATE",
  "WORK_ZIP": "WORK_ZIP",
  "WORK_COUNTRY": "WORK_COUNTRY",
  "WORK_PROFILE": "WORK_PROFILE",
  "WORK_LOGO": "WORK_LOGO",
  "WORK_NOTES": "WORK_NOTES",
  "UF_SKYPE_LINK": "Link to чат in Skype",
  "UF_ZOOM": "Zoom",
  "UF_EMPLOYMENT_DATE": "Date прandнятandя to работу",
  "UF_TIMEMAN": "Timekeeping",
  "UF_DEPARTMENT": "Toдразделенandя",
  "UF_INTERESTS": "Andнтереwithы",
  "UF_SKILLS": "Nаinыtoand",
  "UF_WEB_SITES": "Другandе withайты",
  "UF_XING": "Xing",
  "UF_LINKEDIN": "LinkedIn",
  "UF_FACEBOOK": "Facebook",
  "UF_TWITTER": "Twitter",
  "UF_SKYPE": "Skype",
  "UF_DISTRICT": "Район",
  "UF_PHONE_INNER": "Inнутреннandй телефон",
  "USER_TYPE": "USER_TYPE"
  },
  "time": {
  "start": 1722328384.61197,
  "finish": 1722328384.64683,
  "duration": 0.0348641872406006,
  "processing": 0.000688076019287109,
  "date_start": "2024-07-30T08:33:04+00:00",
  "date_finish": "2024-07-30T08:33:04+00:00",
  "operating_reset_at": 1722328984,
  "operating": 0
  }
  }
```
