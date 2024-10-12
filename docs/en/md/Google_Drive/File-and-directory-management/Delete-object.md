---
sidebar_position: 9
---

# Delete object
 Deletes file or directory by ID



`Function DeleteObject(Val Token, Val Identifier) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Identifier | --object | String | Identifier of the object to delete |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Identifier = "1U8hhtaSXcxZuojGLumLYODMBspUV501s";

    Result = OPI_GoogleDrive.DeleteObject(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gdrive DeleteObject --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```

```json title="Result"
null
```
