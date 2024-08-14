---
sidebar_position: 4
---

# Create poll
 Creates a poll with answer options



`Function CreatePoll(Val Question, Val AnswersArray, Val Image = "", Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Question | --question | String | Poll question |
  | AnswersArray | --options | Array of String | Array of answer options |
  | Image | --picture | String, BinaryData | Poll image |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    Question   = "What's your favorite color?";

    OptionArray = New Array;
    OptionArray.Add("Red");
    OptionArray.Add("Yellow");
    OptionArray.Add("Green");

    Result = OPI_VK.CreatePoll(Question, OptionArray, , Parameters);
```



```sh title="CLI command example"
    
  oint vk CreatePoll --question "What's your favorite color?" --options %options% --picture %picture% --auth "GetVKParameters()"

```

```json title="Result"
{
  "response": {
  "post_id": 2127
  }
  }
```
