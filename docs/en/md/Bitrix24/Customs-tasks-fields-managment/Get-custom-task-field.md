---
sidebar_position: 4
---

# Gets a custom task field
 Get custom task field data



`Function GetCustomTaskField(Val URL, Val FieldID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | FieldID | --fieldid | String, Number | Field ID for retrieval |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.item.userfield.get](https://dev.1c-bitrix.ru/rest_help/tasks/task/userfield/get.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 FieldID = "";
 
 Result = OPI_Bitrix24.GetCustomTaskField(URL, FieldID);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 FieldID = "";
 
 Result = OPI_Bitrix24.GetCustomTaskField(URL, FieldID, );
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetCustomTaskField --url %url% --fieldid %fieldid% --token %token%

```

```json title="Result"
{
 "result": {
 "ID": "261",
 "ENTITY_ID": "TASKS_TASK",
 "FIELD_NAME": "UF_TEXT_FIELD",
 "USER_TYPE_ID": "string",
 "XML_ID": "NEW_TEXT_FIELD",
 "SORT": "100",
 "MULTIPLE": "N",
 "MANDATORY": "N",
 "SHOW_FILTER": "N",
 "SHOW_IN_LIST": "Y",
 "EDIT_IN_LIST": "Y",
 "IS_SEARCHABLE": "N",
 "SETTINGS": {
 "SIZE": 20,
 "ROWS": 1,
 "REGEXP": "",
 "MIN_LENGTH": 0,
 "MAX_LENGTH": 0,
 "DEFAULT_VALUE": ""
 },
 "EDIT_FORM_LABEL": {
 "ar": "",
 "br": "",
 "de": "",
 "en": "Updated field",
 "fr": "",
 "id": "",
 "it": "",
 "ja": "",
 "la": "",
 "ms": "",
 "pl": "",
 "ru": "Izmenennoe pole",
 "sc": "",
 "tc": "",
 "th": "",
 "tr": "",
 "ua": "",
 "vn": ""
 },
 "LIST_COLUMN_LABEL": {
 "ar": "Text field",
 "br": "Text field",
 "de": "Text field",
 "en": "Text field",
 "fr": "Text field",
 "id": "Text field",
 "it": "Text field",
 "ja": "Text field",
 "la": "Text field",
 "ms": "Text field",
 "pl": "Text field",
 "ru": "Text field",
 "sc": "Text field",
 "tc": "Text field",
 "th": "Text field",
 "tr": "Text field",
 "ua": "Text field",
 "vn": "Text field"
 },
 "LIST_FILTER_LABEL": {
 "ar": "Text field",
 "br": "Text field",
 "de": "Text field",
 "en": "Text field",
 "fr": "Text field",
 "id": "Text field",
 "it": "Text field",
 "ja": "Text field",
 "la": "Text field",
 "ms": "Text field",
 "pl": "Text field",
 "ru": "Text field",
 "sc": "Text field",
 "tc": "Text field",
 "th": "Text field",
 "tr": "Text field",
 "ua": "Text field",
 "vn": "Text field"
 },
 "ERROR_MESSAGE": {
 "ar": "Text field",
 "br": "Text field",
 "de": "Text field",
 "en": "Text field",
 "fr": "Text field",
 "id": "Text field",
 "it": "Text field",
 "ja": "Text field",
 "la": "Text field",
 "ms": "Text field",
 "pl": "Text field",
 "ru": "Text field",
 "sc": "Text field",
 "tc": "Text field",
 "th": "Text field",
 "tr": "Text field",
 "ua": "Text field",
 "vn": "Text field"
 },
 "HELP_MESSAGE": {
 "ar": "Text field",
 "br": "Text field",
 "de": "Text field",
 "en": "Text field",
 "fr": "Text field",
 "id": "Text field",
 "it": "Text field",
 "ja": "Text field",
 "la": "Text field",
 "ms": "Text field",
 "pl": "Text field",
 "ru": "Text field",
 "sc": "Text field",
 "tc": "Text field",
 "th": "Text field",
 "tr": "Text field",
 "ua": "Text field",
 "vn": "Text field"
 }
 },
 "total": 0,
 "time": {
 "start": 1722114797.9059,
 "finish": 1722114797.92375,
 "duration": 0.0178542137145996,
 "processing": 0.000695943832397461,
 "date_start": "2024-07-27T21:13:17+00:00",
 "date_finish": "2024-07-27T21:13:17+00:00",
 "operating_reset_at": 1722115397,
 "operating": 0
 }
}
```
