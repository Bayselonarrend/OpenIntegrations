---
sidebar_position: 2
---

# Get post statistics
 Gets statistics in terms of posts



`Function GetPostStatistics(Val PostIDsArray, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | PostIDsArray | --posts | Array of String,Number | Array of post IDs |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Array of Arbitrary - Array of post statistics data

<br/>




```bsl title="Code example"
 Parameters = GetVKParameters();
 
 ArrayOfPosts = New Array;
 ArrayOfPosts.Add(214);
 ArrayOfPosts.Add(215);
 
 Result = OPI_VK.GetPostStatistics(ArrayOfPosts, Parameters);
```
	


```sh title="CLI command example"
 
 oint vk GetPostStatistics --posts %posts% --auth %auth%

```

```json title="Result"
[
 {
 "ad_report": 0,
 "ad_coverage": 0,
 "ad_to_group": 0,
 "ad_unsubscribe": 0,
 "ad_hide": 0,
 "ad_join_group": 0,
 "ad_subscribers": 0,
 "ad_links": 0,
 "ad_views": 0,
 "reach_viral": 0,
 "reach_total": 1,
 "reach_ads": 0,
 "report": 0,
 "join_group": 0,
 "links": 0,
 "unsubscribe": 0,
 "hide": 0,
 "reach_subscribers": 1,
 "to_group": 1,
 "post_id": 214
 },
 {
 "ad_report": 0,
 "ad_coverage": 0,
 "ad_to_group": 0,
 "ad_unsubscribe": 0,
 "ad_hide": 0,
 "ad_join_group": 0,
 "ad_subscribers": 0,
 "ad_links": 0,
 "ad_views": 0,
 "reach_viral": 0,
 "reach_total": 1,
 "reach_ads": 0,
 "report": 0,
 "join_group": 0,
 "links": 0,
 "unsubscribe": 0,
 "hide": 0,
 "reach_subscribers": 1,
 "to_group": 0,
 "post_id": 215
 }
 ]
```
