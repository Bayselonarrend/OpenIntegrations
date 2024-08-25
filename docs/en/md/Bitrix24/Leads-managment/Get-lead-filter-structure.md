---
sidebar_position: 7
---

# Get lead filter structure
 Returns the field structure for filtering leads in the GetLeadsList method



`Function GetLeadFilterStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Structure of KeyAndValue - Fields structure

<br/>




```bsl title="Code example"
    Result = OPI_Bitrix24.GetLeadFilterStructure();
```



```sh title="CLI command example"
    
  oint bitrix24 GetLeadFilterStructure --empty %empty%

```

```json title="Result"
{
 "ID": "<lead identifier>",
 "ASSIGNED_BY_ID": "<responsible person identifier",
 "COMPANY_ID": "<company identifier>",
 "COMPANY_TITLE": "<company name>",
 "CONTACT_ID": "<contact identifier>",
 "CREATED_BY_ID": "<author identifier>",
 "CURRENCY_ID": "<currency identifier>",
 "DATE_CLOSED": "<closing date>",
 "DATE_CREATE": "<date of creation>",
 "DATE_MODIFY": "<date of change>",
 "EMAIL": "<email address>",
 "HAS_EMAIL": "<email address is filled in (Y|N)>",
 "HAS_PHONE": "<phone number is filled in (Y|N)>",
 "IS_RETURN_CUSTOMER": "<repeat lead (Y|N)>",
 "MODIFY_BY_ID": "<author ID of the last change>",
 "MOVED_BY_ID": "<identifier of the author of moving the lead to the current stage>",
 "MOVED_TIME": "<date of moving the lead to the current stage>",
 "OPENED": "<feature is available for all (Y|N)>",
 "OPPORTUNITY": "<expected amount>",
 "STATUS_ID": "<status identifier>",
 "TITLE": "<lead name (can be searched by template [%_])>"
}
```
