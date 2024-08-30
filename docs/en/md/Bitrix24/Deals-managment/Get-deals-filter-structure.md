---
sidebar_position: 7
---

# Get deals filter structure
 Returns the field structure for filtering deals in the GetDealsList method



`Function GetDealsFilterStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Structure of KeyAndValue - Fields structure

<br/>




```bsl title="Code example"
    Result = OPI_Bitrix24.GetDealsFilterStructure();
```



```sh title="CLI command example"
    
  oint bitrix24 GetDealsFilterStructure --empty %empty%

```

```json title="Result"
{
 "ID": "<Deal identifier>",
 "ASSIGNED_BY_ID": "<responsible person identifier>",
 "BEGINDATE": "<start date>",
 "CATEGORY_ID": "<direction identifier>",
 "CLOSEDATE": "<completion date>",
 "COMPANY_ID": "<company identifier>",
 "CONTACT_ID": "<contact identifier>",
 "CREATED_BY_ID": "<author identifier>",
 "CURRENCY_ID": "<currency identifier>",
 "DATE_CREATE": "<date of creation>",
 "DATE_MODIFY": "<date of change>",
 "IS_NEW": "<new deal flag (Y|N)>",
 "IS_RECURRING": "<is pattern (Y|N)>",
 "IS_RETURN_CUSTOMER": "<reused lead flag (Y|N)>",
 "LEAD_ID": "<linked lead identifier>",
 "MODIFY_BY_ID": "<author ID of the last change>",
 "MOVED_BY_ID": "<identifier of the author of moving the deal to the current stage>",
 "MOVED_TIME": "<date of moving the deal to the current stage>",
 "OPENED": "<feature is available for all (Y|N)>",
 "OPPORTUNITY": "<expected amount>",
 "PROBABILITY": "<probability>",
 "REQUISITE_ID": "<prop identifier>",
 "STAGE_ID": "<stage identifier>",
 "TITLE": "<deal name (can be searched using the template [%_])>",
 "TYPE_ID": "<deal type>"
}
```
