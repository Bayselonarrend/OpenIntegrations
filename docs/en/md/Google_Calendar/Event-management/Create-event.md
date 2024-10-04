---
sidebar_position: 4
---

# Create event
 Creates a new event



`Function CreateEvent(Val Token, Val Calendar, Val EventDescription) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |
  | EventDescription | --props | Map Of KeyAndValue | Event description |

  
  Returns:  String, Arbitrary, HTTPResponse, BinaryData, Undefined - Google server response

<br/>




```bsl title="Code example"
    CurrentDate = OPI_Tools.GetCurrentDate();
    Token       = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Calendar    = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
    Name        = "New event";
    Description = "TestEventDescription";
    Hour        = 3600;

    Image1      = "https://openyellow.neocities.org/test_data/picture.jpg"; // URL, Binary or Path to file
    Image2      = "https://openyellow.neocities.org/test_data/picture2.jpg"; // URL, Binary or Path to file
    Attachments = New Map;

    Attachments.Insert("Image1", Image1);
    Attachments.Insert("Image2", Image2);

    EventDescription = New Map;
    EventDescription.Insert("Description"           , Description);
    EventDescription.Insert("Title"                 , Name);
    EventDescription.Insert("Venue"                 , "InOffice");
    EventDescription.Insert("StartDate"             , CurrentDate);
    EventDescription.Insert("EndDate"               , EventDescription["StartDate"] + Hour);
    EventDescription.Insert("ArrayOfAttachmentURLs" , Attachments);
    EventDescription.Insert("SendNotifications"     , True);

    Result = OPI_GoogleCalendar.CreateEvent(Token, Calendar, EventDescription);
```



```sh title="CLI command example"
    
  oint gcalendar CreateEvent --token %token% --calendar %calendar% --props %props%

```

```json title="Result"
{
 "kind": "calendar#event",
 "etag": "\"3455260701680000\"",
 "id": "nkeonu0b5b3flradhop3ist4vk",
 "status": "confirmed",
 "htmlLink": "https://www.google.com/calendar/event?eid=bmtlb251MGI1YjNmbHJhZGhvcDNpc3Q0dmsgYjA0MjAwMGYwYTRjYzU5ZTk2OWRkOTljZWMzNjk2ZmYwZDI2OWFhZTNkMWRhZjdmMjQ1N2RmMjg4ZmUzMzgzNUBn",
 "created": "2024-09-29T17:19:10Z",
 "updated": "2024-09-29T17:19:10.84Z",
 "summary": "New event",
 "description": "TestEventDescription",
 "location": "InOffice",
 "creator": {
  "email": "bayselonarrend@gmail.com"
 },
 "organizer": {
  "email": "b042000f0a4cc59e969dd99cec3696ff0d269aae3d1daf7f2457df288fe33835@group.calendar.google.com",
  "displayName": "TestCalendar",
  "self": true
 },
 "start": {
  "dateTime": "2024-09-29T23:19:10+03:00",
  "timeZone": "Europe/Moscow"
 },
 "end": {
  "dateTime": "2024-09-30T00:19:10+03:00",
  "timeZone": "Europe/Moscow"
 },
 "iCalUID": "nkeonu0b5b3flradhop3ist4vk@google.com",
 "sequence": 0,
 "reminders": {
  "useDefault": true
 },
 "attachments": [
  {
   "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg",
   "title": "Image1",
   "iconLink": ""
  },
  {
   "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg",
   "title": "Image2",
   "iconLink": ""
  }
 ],
 "eventType": "default"
}
```
