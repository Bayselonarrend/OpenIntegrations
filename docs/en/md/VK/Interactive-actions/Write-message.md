---
sidebar_position: 3
---

# Write a message
 Write a message to a user in the community's dialog



`Function WriteMessage(Val Text, Val UserID, Val Communitytoken, Val Keyboard = "", Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Text | --text | String | Message text |
  | UserID | --user | String | Recipient user ID |
  | Communitytoken | --ct | String | Community chat bot token, which can be obtained in the settings |
  | Keyboard | --keyboard | String | JSON keyboard. See FormKeyboard |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    Text           = "Message from autotest";
    UserID         = "657846756";
    Communitytoken = "vk1.a.IzbBGUkYUvrNfMt_sknCcC66hyYifL0U1Bb8CVYCNFBUVfpsJtzZ_K5LwCzURr2_uCzEaP_AK1QmInp9sGp7fu_CtEDSipFWFXJo0y8I...";

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");

    Keyboard = OPI_VK.FormKeyboard(ButtonArray);
    Result   = OPI_VK.WriteMessage(Text, UserID, Communitytoken, Keyboard, Parameters);
```



```sh title="CLI command example"
    
  oint vk WriteMessage --text "Message from autotest" --user "657846756" --ct "vk1.a.IzbBGUkYUvrNfMt_sknCcC66hyYifL0U1Bb8CVYCNFBUVfpsJtzZ_K5LwCzURr2_uCzEaP_AK1QmInp9sGp7fu_CtEDSipFWFXJo0y8I..." --keyboard %keyboard% --auth "GetVKParameters()"

```

```json title="Result"
  {
  "response": 7
  }

```
