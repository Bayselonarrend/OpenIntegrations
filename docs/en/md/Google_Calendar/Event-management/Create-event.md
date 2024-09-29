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
    Token       = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Calendar    = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";
    Name        = "New event";
    Description = "TestEventDescription";
    Hour        = 3600;

    Image1      = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg"; // URL, Binary or Path to file
    Image2      = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg"; // URL, Binary or Path to file
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

```
