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
    Token       = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Calendar    = "9776ffc9103041e891559c22442cd210f397ca598957939d3a9fa15edfccfd62@group.calendar.google.com";
    Name        = "New event";
    Description = "TestEventDescription";
    Hour        = 3600;

    Image1      = "https://api.athenaeum.digital/test_data/picture.jpg"; // URL, Binary or Path to file
    Image2      = "https://api.athenaeum.digital/test_data/picture2.jpg"; // URL, Binary or Path to file
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
 "etag": "\"3456908679760000\"",
 "id": "7rfbn0fb8nai4i7v4l435tgl1c",
 "status": "confirmed",
 "htmlLink": "https://www.google.com/calendar/event?eid=N3JmYm4wZmI4bmFpNGk3djRsNDM1dGdsMWMgNjA2MTNkNTNjNDY3MGFiZGNlZWMzZTc2OTNjYTQ3NWIwZTg4ZGMxNjc4ZGI3MjEwNTIxMzU2YjQ5NDBhNjE0OEBn",
 "created": "2024-10-09T06:12:19Z",
 "updated": "2024-10-09T06:12:19.88Z",
 "summary": "New event",
 "description": "TestEventDescription",
 "location": "InOffice",
 "creator": {
  "email": "bayselonarrend@gmail.com"
 },
 "organizer": {
  "email": "60613d53c4670abdceec3e7693ca475b0e88dc1678db7210521356b4940a6148@group.calendar.google.com",
  "displayName": "TestCalendar",
  "self": true
 },
 "start": {
  "dateTime": "2024-10-09T12:12:19+03:00",
  "timeZone": "Europe/Moscow"
 },
 "end": {
  "dateTime": "2024-10-09T13:12:19+03:00",
  "timeZone": "Europe/Moscow"
 },
 "iCalUID": "7rfbn0fb8nai4i7v4l435tgl1c@google.com",
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
