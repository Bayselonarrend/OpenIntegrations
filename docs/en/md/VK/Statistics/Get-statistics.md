---
sidebar_position: 1
---

# Get statistics
 Gets the overall community statistics for a period



`Function GetStatistics(Val StartDate, Val EndDate, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | StartDate | --datefrom | Date | Start date of the period |
  | EndDate | --dateto | Date | End date of the period |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    CurrentDate = OPI_Tools.GetCurrentDate();
    StartDate   = BegOfDay(CurrentDate);
    EndDate     = EndOfDay(StartDate);

    Result = OPI_VK.GetStatistics(StartDate, EndDate, Parameters);
```



```sh title="CLI command example"
    
  oint vk GetStatistics --datefrom "BegOfDay(CurrentDate)" --dateto "EndOfDay(StartDate)" --auth "GetVKParameters()"

```

```json title="Result"
{
 "response": [
  {
   "activity": {
    "comments": 5,
    "likes": 5
   },
   "period_from": 1728086400,
   "period_to": 1728172799,
   "reach": {
    "age": [
     {
      "value": "12-18",
      "count": 0
     },
     {
      "value": "18-21",
      "count": 0
     },
     {
      "value": "21-24",
      "count": 1
     },
     {
      "value": "24-27",
      "count": 0
     },
     {
      "value": "27-30",
      "count": 0
     },
     {
      "value": "30-35",
      "count": 0
     },
     {
      "value": "35-45",
      "count": 0
     },
     {
      "value": "45-100",
      "count": 0
     }
    ],
    "cities": [],
    "countries": [
     {
      "code": "BY",
      "count": 1,
      "name": "Беларусь",
      "value": 3
     }
    ],
    "mobile_reach": 1,
    "reach": 1,
    "reach_subscribers": 1,
    "sex": [
     {
      "value": "f",
      "count": 0
     },
     {
      "value": "m",
      "count": 1
     }
    ],
    "sex_age": [
     {
      "value": "f;12-18",
      "count": 0
     },
     {
      "value": "f;18-21",
      "count": 0
     },
     {
      "value": "f;21-24",
      "count": 0
     },
     {
      "value": "f;24-27",
      "count": 0
     },
     {
      "value": "f;27-30",
      "count": 0
     },
     {
      "value": "f;30-35",
      "count": 0
     },
     {
      "value": "f;35-45",
      "count": 0
     },
     {
      "value": "f;45-100",
      "count": 0
     },
     {
      "value": "m;12-18",
      "count": 0
     },
     {
      "value": "m;18-21",
      "count": 0
     },
     {
      "value": "m;21-24",
      "count": 1
     },
     {
      "value": "m;24-27",
      "count": 0
     },
     {
      "value": "m;27-30",
      "count": 0
     },
     {
      "value": "m;30-35",
      "count": 0
     },
     {
      "value": "m;35-45",
      "count": 0
     },
     {
      "value": "m;45-100",
      "count": 0
     }
    ]
   },
   "visitors": {
    "cities": [],
    "countries": [
     {
      "code": "RU",
      "count": 2,
      "name": "Россия",
      "value": 1
     }
    ],
    "mobile_views": 0,
    "views": 2,
    "visitors": 2
   }
  },
  {
   "activity": {
...
```
