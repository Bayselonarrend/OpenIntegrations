---
sidebar_position: 10
---

# Get description file 



*Function GetFileDescription() Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|

 
 Returns: Key-Value Pair - File description

```bsl title="Code example"
	
 
 Description = New Map;
 Description.Insert("MIME", "image/jpeg"); // MIME-type uploading file
 Description.Insert("Name", "New file.jpg"); // File name with extension
 Description.Insert("Description", "This is a new file"); // File description
 Description.Insert("Parent", "root"); // ID directory upload or "root" for upload in root
 
 Return Description;
 

	
```

```sh title="CLI command example"
 
 oint gdrive GetFileDescription


```


```json title="Result"



```
