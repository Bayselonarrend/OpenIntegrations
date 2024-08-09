---
sidebar_position: 4
---

# Get kanban stages
 Get kanban (My Plan) stages info



`Function GetKanbanStages(Val URL, Val EntityID = 0, Val AsAdmin = False, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | EntityID | --entityid | String, Number | ID of kanban owner (group or user) |
 | AsAdmin | --admin | Boolean | Allows you to get stages without checking permissions (for administrators) |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.stages.get](https://dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_get.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2pph8uucc89is6c/";
 
 Result = OPI_Bitrix24.GetKanbanStages(URL,, True);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.GetKanbanStages(URL,,, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetKanbanStages --url "b24-ar17wx.bitrix24.by" --entityid %entityid% --admin %admin% --token "56898d66006e9f06006b12e400000001000..."

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
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "120": {
 "ID": "120",
 "TITLE": "New stage 2",
 "SORT": "1400",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "114": {
 "ID": "114",
 "TITLE": "New stage",
 "SORT": "1500",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "116": {
 "ID": "116",
 "TITLE": "New stage 2",
 "SORT": "1600",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "112": {
 "ID": "112",
 "TITLE": "New stage 2",
 "SORT": "1700",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "108": {
 "ID": "108",
 "TITLE": "New stage 2",
 "SORT": "1800",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "104": {
 "ID": "104",
 "TITLE": "New stage 2",
 "SORT": "1900",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "100": {
 "ID": "100",
 "TITLE": "New stage 2",
 "SORT": "2000",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "96": {
 "ID": "96",
 "TITLE": "New stage 2",
 "SORT": "2100",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "90": {
 "ID": "90",
 "TITLE": "New stage",
 "SORT": "2200",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "92": {
 "ID": "92",
 "TITLE": "New stage 2",
 "SORT": "2300",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "74": {
 "ID": "74",
 "TITLE": "New stage",
 "SORT": "2400",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "76": {
 "ID": "76",
 "TITLE": "New stage 2",
 "SORT": "2500",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "70": {
 "ID": "70",
 "TITLE": "New stage",
 "SORT": "2600",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "72": {
 "ID": "72",
 "TITLE": "New stage 2",
 "SORT": "2700",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "66": {
 "ID": "66",
 "TITLE": "New stage",
 "SORT": "2800",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "68": {
 "ID": "68",
 "TITLE": "New stage 2",
 "SORT": "2900",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "62": {
 "ID": "62",
 "TITLE": "New stage",
 "SORT": "3000",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "64": {
 "ID": "64",
 "TITLE": "New stage 2",
 "SORT": "3100",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "46": {
 "ID": "46",
 "TITLE": "New stage",
 "SORT": "3200",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "48": {
 "ID": "48",
 "TITLE": "New stage 2",
 "SORT": "3300",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "42": {
 "ID": "42",
 "TITLE": "New stage",
 "SORT": "3400",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "44": {
 "ID": "44",
 "TITLE": "New stage 2",
 "SORT": "3500",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "38": {
 "ID": "38",
 "TITLE": "New stage",
 "SORT": "3600",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "40": {
 "ID": "40",
 "TITLE": "New stage 2",
 "SORT": "3700",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "34": {
 "ID": "34",
 "TITLE": "New stage",
 "SORT": "3800",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "36": {
 "ID": "36",
 "TITLE": "New stage 2",
 "SORT": "3900",
 "COLOR": "0026FF",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "2": {
 "ID": "2",
 "TITLE": "Not planned",
 "SORT": "4000",
 "COLOR": "00C4FB",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 },
 "4": {
 "ID": "4",
 "TITLE": "For this week",
 "SORT": "4100",
 "COLOR": "47D1E2",
 "SYSTEM_TYPE": "",
 "ENTITY_ID": "1",
 "ENTITY_TYPE": "U",
 "ADDITIONAL_FILTER": [],
 "TO_UPDATE": [],
 "TO_UPDATE_ACCESS": null
 }
 },
 "time": {
 "start": 1720600362.36054,
 "finish": 1720600362.39851,
 "duration": 0.0379610061645508,
 "processing": 0.00239396095275879,
 "date_start": "2024-07-10T08:32:42+00:00",
 "date_finish": "2024-07-10T08:32:42+00:00",
 "operating_reset_at": 1720600962,
 "operating": 0
 }
}
```
