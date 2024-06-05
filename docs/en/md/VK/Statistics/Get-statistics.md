---
sidebar_position: 1
---

# Get statistics
 Gets the overall community statistics for a period


*Function GetStatistics(Val StartDate, Val EndDate, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | StartDate | --datefrom | Date | Start date of the period |
 | EndDate | --dateto | Date | End date of the period |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Key-Value Pair - Serialized JSON response from VK

```bsl title="Code example"
	
 
 Response = OPI_VK.GetStatistics(CurrentSessionDate() - 60 * 60 * 24, CurrentSessionDate(), Parameters);
 Response = OPI_Tools.JSONString(Response);
 

	
```

```sh title="CLI command example"
 
 oint vk GetStatistics --datefrom %datefrom% --dateto %dateto% --auth %auth%


```


```json title="Result"

{
 "response": [
 {
 "visitors": {
 "views": 8,
 "sex_age": [
 {
 "count": 0,
 "value": "f;12-18"
 },
 {
 "count": 0,
 "value": "f;18-21"
 },
 {
 "count": 0,
 "value": "f;21-24"
 },
 {
 "count": 0,
 "value": "f;24-27"
 },
 {
 "count": 0,
 "value": "f;27-30"
 },
 {
 "count": 0,
 "value": "f;30-35"
 },
 {
 "count": 0,
 "value": "f;35-45"
 },
 {
 "count": 0,
 "value": "f;45-100"
 },
 {
 "count": 0,
 "value": "m;12-18"
 },
 {
 "count": 0,
 "value": "m;18-21"
 },
 {
 "count": 1,
 "value": "m;21-24"
 },
 {
 "count": 0,
 "value": "m;24-27"
 },
 {
 "count": 0,
 "value": "m;27-30"
 },
 {
 "count": 0,
 "value": "m;30-35"
 },
 {
 "count": 0,
 "value": "m;35-45"
 },
 {
 "count": 0,
 "value": "m;45-100"
 }
 ],
 "sex": [
 {
 "count": 0,
 "value": "f"
 },
 {
 "count": 1,
 "value": "m"
 }
 ],
 "mobile_views": 0,
 "countries": [
 {
 "value": 3,
 "name": "Belarus",
 "count": 1,
 "code": "BY"
 }
 ],
 "visitors": 1,
 "cities": [],
 "age": [
 {
 "count": 0,
 "value": "12-18"
 },
 {
 "count": 0,
 "value": "18-21"
 },
 {
 "count": 1,
 "value": "21-24"
 },
 {
 "count": 0,
 "value": "24-27"
 },
 {
 "count": 0,
 "value": "27-30"
 },
 {
 "count": 0,
 "value": "30-35"
 },
 {
 "count": 0,
 "value": "35-45"
 },
 {
 "count": 0,
 "value": "45-100"
 }
 ]
 },
 "reach": {
 "sex_age": [
 {
 "count": 0,
 "value": "f;12-18"
 },
 {
 "count": 0,
 "value": "f;18-21"
 },
 {
 "count": 0,
 "value": "f;21-24"
 },
 {
 "count": 0,
 "value": "f;24-27"
 },
 {
 "count": 0,
 "value": "f;27-30"
 },
 {
 "count": 0,
 "value": "f;30-35"
 },
 {
 "count": 0,
 "value": "f;35-45"
 },
 {
 "count": 0,
 "value": "f;45-100"
 },
 {
 "count": 0,
 "value": "m;12-18"
 },
 {
 "count": 0,
 "value": "m;18-21"
 },
 {
 "count": 1,
 "value": "m;21-24"
 },
 {
 "count": 0,
 "value": "m;24-27"
 },
 {
 "count": 0,
 "value": "m;27-30"
 },
 {
 "count": 0,
 "value": "m;30-35"
 },
 {
 "count": 0,
 "value": "m;35-45"
 },
 {
 "count": 0,
 "value": "m;45-100"
 }
 ],
 "sex": [
 {
 "count": 0,
 "value": "f"
 },
 {
 "count": 1,
 "value": "m"
 }
 ],
 "reach": 1,
 "mobile_reach": 0,
 "countries": [
 {
 "value": 3,
 "name": "Belarus",
 "count": 1,
 "code": "BY"
 }
 ],
 "reach_subscribers": 1,
 "cities": [],
 "age": [
 {
 "count": 0,
 "value": "12-18"
 },
 {
 "count": 0,
 "value": "18-21"
 },
 {
 "count": 1,
 "value": "21-24"
 },
 {
 "count": 0,
 "value": "24-27"
 },
 {
 "count": 0,
 "value": "27-30"
 },
 {
 "count": 0,
 "value": "30-35"
 },
 {
 "count": 0,
 "value": "35-45"
 },
 {
 "count": 0,
 "value": "45-100"
 }
 ]
 },
 "period_to": 1704671999,
 "period_from": 1704585600
 },
 {
 "visitors": {
 "views": 3,
 "sex_age": [
 {
 "count": 0,
 "value": "f;12-18"
 },
 {
 "count": 0,
 "value": "f;18-21"
 },
 {
 "count": 0,
 "value": "f;21-24"
 },
 {
 "count": 0,
 "value": "f;24-27"
 },
 {
 "count": 0,
 "value": "f;27-30"
 },
 {
 "count": 0,
 "value": "f;30-35"
 },
 {
 "count": 0,
 "value": "f;35-45"
 },
 {
 "count": 0,
 "value": "f;45-100"
 },
 {
 "count": 0,
 "value": "m;12-18"
 },
 {
 "count": 0,
 "value": "m;18-21"
 },
 {
 "count": 1,
 "value": "m;21-24"
 },
 {
 "count": 0,
 "value": "m;24-27"
 },
 {
 "count": 0,
 "value": "m;27-30"
 },
 {
 "count": 0,
 "value": "m;30-35"
 },
 {
 "count": 0,
 "value": "m;35-45"
 },
 {
 "count": 0,
 "value": "m;45-100"
 }
 ],
 "sex": [
 {
 "count": 0,
 "value": "f"
 },
 {
 "count": 1,
 "value": "m"
 }
 ],
 "mobile_views": 0,
 "countries": [
 {
 "value": 3,
 "name": "Belarus",
 "count": 1,
 "code": "BY"
 }
 ],
 "visitors": 1,
 "cities": [],
 "age": [
 {
 "count": 0,
 "value": "12-18"
 },
 {
 "count": 0,
 "value": "18-21"
 },
 {
 "count": 1,
 "value": "21-24"
 },
 {
 "count": 0,
 "value": "24-27"
 },
 {
 "count": 0,
 "value": "27-30"
 },
 {
 "count": 0,
 "value": "30-35"
 },
 {
 "count": 0,
 "value": "35-45"
 },
 {
 "count": 0,
 "value": "45-100"
 }
 ]
 },
 "reach": {
 "sex_age": [
 {
 "count": 0,
 "value": "f;12-18"
 },
 {
 "count": 0,
 "value": "f;18-21"
 },
 {
 "count": 0,
 "value": "f;21-24"
 },
 {
 "count": 0,
 "value": "f;24-27"
 },
 {
 "count": 0,
 "value": "f;27-30"
 },
 {
 "count": 0,
 "value": "f;30-35"
 },
 {
 "count": 0,
 "value": "f;35-45"
 },
 {
 "count": 0,
 "value": "f;45-100"
 },
 {
 "count": 0,
 "value": "m;12-18"
 },
 {
 "count": 0,
 "value": "m;18-21"
 },
 {
 "count": 1,
 "value": "m;21-24"
 },
 {
 "count": 0,
 "value": "m;24-27"
 },
 {
 "count": 0,
 "value": "m;27-30"
 },
 {
 "count": 0,
 "value": "m;30-35"
 },
 {
 "count": 0,
 "value": "m;35-45"
 },
 {
 "count": 0,
 "value": "m;45-100"
 }
 ],
 "sex": [
 {
 "count": 0,
 "value": "f"
 },
 {
 "count": 1,
 "value": "m"
 }
 ],
 "reach": 1,
 "mobile_reach": 0,
 "countries": [
 {
 "value": 3,
 "name": "Belarus",
 "count": 1,
 "code": "BY"
 }
 ],
 "reach_subscribers": 1,
 "cities": [],
 "age": [
 {
 "count": 0,
 "value": "12-18"
 },
 {
 "count": 0,
 "value": "18-21"
 },
 {
 "count": 1,
 "value": "21-24"
 },
 {
 "count": 0,
 "value": "24-27"
 },
 {
 "count": 0,
 "value": "27-30"
 },
 {
 "count": 0,
 "value": "30-35"
 },
 {
 "count": 0,
 "value": "35-45"
 },
 {
 "count": 0,
 "value": "45-100"
 }
 ]
 },
 "period_to": 1704585599,
 "period_from": 1704499200
 }
 ]
 }

```
