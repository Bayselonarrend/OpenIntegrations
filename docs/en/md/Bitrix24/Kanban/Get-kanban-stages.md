---
sidebar_position: 4
---

# Get kanban stages
 Get kanban (My Plan) stages info



`Function GetKanbanStages(Val URL, Val EntityID = 0, Val AsAdmin = False, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | EntityID | --entityid | String, Number | ID of kanban owner (group or user) |
  | AsAdmin | --admin | Boolean | Allows you to get stages without checking permissions (for administrators) |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.stages.get](https://dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_get.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetKanbanStages(URL, , True);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetKanbanStages(URL, , , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetKanbanStages --url "b24-ar17wx.bitrix24.by" --entityid %entityid% --admin %admin% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "20": {
  "ID": "20",
  "TITLE": "New stage",
  "SORT": "100",
  "COLOR": "0026FF",
  "SYSTEM_TYPE": "NEW",
  "ENTITY_ID": "1",
  "ENTITY_TYPE": "U",
  "ADDITIONAL_FILTER": [],
  "TO_UPDATE": [],
  "TO_UPDATE_ACCESS": null
  },
  "24": {
  "ID": "24",
  "TITLE": "Name",
  "SORT": "200",
  "COLOR": "75d900",
  "SYSTEM_TYPE": "",
  "ENTITY_ID": "1",
  "ENTITY_TYPE": "U",
  "ADDITIONAL_FILTER": [],
  "TO_UPDATE": [],
  "TO_UPDATE_ACCESS": null
  },
  "16": {
  "ID": "16",
  "TITLE": "New stage",
  "SORT": "300",
  "COLOR": "0026FF",
  "SYSTEM_TYPE": "",
  "ENTITY_ID": "1",
  "ENTITY_TYPE": "U",
  "ADDITIONAL_FILTER": [],
  "TO_UPDATE": [],
  "TO_UPDATE_ACCESS": null
  },
  "18": {
  "ID": "18",
  "TITLE": "New stage 2",
  "SORT": "400",
  "COLOR": "0026FF",
  "SYSTEM_TYPE": "",
  "ENTITY_ID": "1",
  "ENTITY_TYPE": "U",
  "ADDITIONAL_FILTER": [],
  "TO_UPDATE": [],
  "TO_UPDATE_ACCESS": null
  },
  "12": {
  "ID": "12",
  "TITLE": "New stage",
  "SORT": "500",
  "COLOR": "0026FF",
  "SYSTEM_TYPE": "",
  "ENTITY_ID": "1",
  "ENTITY_TYPE": "U",
  "ADDITIONAL_FILTER": [],
  "TO_UPDATE": [],
  "TO_UPDATE_ACCESS": null
  },
  "14": {
  "ID": "14",
  "TITLE": "New stage 2",
  "SORT": "600",
  "COLOR": "0026FF",
  "SYSTEM_TYPE": "",
  "ENTITY_ID": "1",
  "ENTITY_TYPE": "U",
  "ADDITIONAL_FILTER": [],
  "TO_UPDATE": [],
  "TO_UPDATE_ACCESS": null
  },
  "8": {
  "ID": "8",
  "TITLE": "New stage",
  "SORT": "700",
  "COLOR": "0026FF",
  "SYSTEM_TYPE": "",
  "ENTITY_ID": "1",
  "ENTITY_TYPE": "U",
  "ADDITIONAL_FILTER": [],
  "TO_UPDATE": [],
  "TO_UPDATE_ACCESS": null
  },
  "10": {
  "ID": "10",
  "TITLE": "New stage 2",
  "SORT": "800",
  "COLOR": "0026FF",
  "SYSTEM_TYPE": "",
  "ENTITY_ID": "1",
  "ENTITY_TYPE": "U",
  "ADDITIONAL_FILTER": [],
  "TO_UPDATE": [],
  "TO_UPDATE_ACCESS": null
  },
  "6": {
  "ID": "6",
  "TITLE": "New stage",
  "SORT": "900",
  "COLOR": "0026FF",
  "SYSTEM_TYPE": "",
  "ENTITY_ID": "1",
  "ENTITY_TYPE": "U",
  "ADDITIONAL_FILTER": [],
  "TO_UPDATE": [],
  "TO_UPDATE_ACCESS": null
  },
  "130": {
  "ID": "130",
  "TITLE": "New stage",
  "SORT": "1000",
  "COLOR": "0026FF",
  "SYSTEM_TYPE": "",
  "ENTITY_ID": "1",
  "ENTITY_TYPE": "U",
  "ADDITIONAL_FILTER": [],
  "TO_UPDATE": [],
  "TO_UPDATE_ACCESS": null
  },
  "132": {
  "ID": "132",
  "TITLE": "New stage 2",
  "SORT": "1100",
  "COLOR": "0026FF",
  "SYSTEM_TYPE": "",
  "ENTITY_ID": "1",
  "ENTITY_TYPE": "U",
  "ADDITIONAL_FILTER": [],
  "TO_UPDATE": [],
  "TO_UPDATE_ACCESS": null
  },
  "122": {
  "ID": "122",
  "TITLE": "New stage",
  "SORT": "1200",
  "COLOR": "0026FF",
  "SYSTEM_TYPE": "",
  "ENTITY_ID": "1",
  "ENTITY_TYPE": "U",
  "ADDITIONAL_FILTER": [],
  "TO_UPDATE": [],
  "TO_UPDATE_ACCESS": null
  },
  "124": {
  "ID": "124",
  "TITLE": "New stage 2",
  "SORT": "1300",
...
```
