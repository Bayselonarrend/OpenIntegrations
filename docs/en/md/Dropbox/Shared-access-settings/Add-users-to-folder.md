---
sidebar_position: 4
---

# Add users to folder
 Grants external users access to the directory



`Function AddUsersToFolder(Val Token, Val FolderID, Val EmailAddresses, Val ViewOnly = True) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | FolderID | --folder | String | ID of the public catalog (shared folder ID) |
  | EmailAddresses | --emails | String, Array of String | List of email addresses of users being added |
  | ViewOnly | --readonly | Boolean | Prohibits file editing for the external user |

  
  Returns:  Undefined - empty response

<br/>




```bsl title="Code example"
    Token  = "sl.B-q5XQaxJtwx0uMZIwtpBtvwgWmplxOVWNQyY1gbKG31NYy3fDHqe4IuADj33al8uD1l3FYARn...";
    Email  = "h5bk6ft62s@privaterelay.appleid.com";
    Folder = "11721182785"; // shared_folder_id

    Result = OPI_Dropbox.AddUsersToFolder(Token, Folder, Email, False);
```



```sh title="CLI command example"
    
  oint dropbox AddUsersToFolder --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --folder %folder% --emails %emails% --readonly %readonly%

```

```json title="Result"
{}
```
