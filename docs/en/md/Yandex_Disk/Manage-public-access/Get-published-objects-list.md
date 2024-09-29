---
sidebar_position: 3
---

# Get list of published objects.
 Gets a list of published objects



`Function GetPublishedObjectsList(Val Token, Val Count = 0, Val OffsetFromStart = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Count | --amount | Number | Number of returned objects |
  | OffsetFromStart | --offset | Number | Offset for getting objects not from the beginning of the list |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Yandex

<br/>




```bsl title="Code example"
    Token           = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Count           = 2;
    OffsetFromStart = 1;

    Result = OPI_YandexDisk.GetPublishedObjectsList(Token, Count, OffsetFromStart);
```



```sh title="CLI command example"
    
  oint yadisk GetPublishedObjectsList --token "y0_AgAAAABdylaOAA..." --amount %amount% --offset %offset%

```

```json title="Result"
{
 "items": [
  {
   "antivirus_status": "clean",
   "public_key": "lzUqwAcU+PlMrKbzcxhks09qmXiWowXTBvUgesT7NxgPfIAvkNlDx1N5dnN4RI6hq/J6bpmRyOJonT3VoXnDag==",
   "public_url": "https://yadi.sk/i/Ato4XjVRIb4nVw",
   "name": "0b5585af-2bca-43cf-9d3a-decc63db8821.png",
   "exif": {},
   "created": "2024-06-02T16:49:58+03:00",
   "size": 225883,
   "resource_id": "1573541518:12e7259ce9e080f16c6d3b5207184744d8c7ef4084fee37e6f8aa72906003f9f",
   "modified": "2024-06-02T16:49:58+03:00",
   "mime_type": "image/png",
   "comment_ids": {
    "private_resource": "1573541518:12e7259ce9e080f16c6d3b5207184744d8c7ef4084fee37e6f8aa72906003f9f",
    "public_resource": "1573541518:12e7259ce9e080f16c6d3b5207184744d8c7ef4084fee37e6f8aa72906003f9f"
   },
   "sizes": [
    {
     "url": "https://downloader.disk.yandex.ru/disk/cb9c1b6220aa701370d2607c716f304443035c06ae76eafaa3908bc0dc5809dd/66f9c414/gwThwhLBKYvLhQCNnqAHituHMr72DpUpd6C6-9w911vW8ivir0rElI21oNjVEQFTesbLx_asncX9gQFzcTfYww%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=225883&hid=7c41e6147b7dd41ea3cc2d615f42bcb7&media_type=image&tknv=v2&etag=403262e03464796e99ff362e913e9a4d",
     "name": "ORIGINAL"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a24eaaac73d08a894eba2cc6ddee821b76f6d5878e011583921f5f629baa59d6/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2",
     "name": "DEFAULT"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a24eaaac73d08a894eba2cc6ddee821b76f6d5878e011583921f5f629baa59d6/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXXS&crop=0",
     "name": "XXXS"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a24eaaac73d08a894eba2cc6ddee821b76f6d5878e011583921f5f629baa59d6/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXS&crop=0",
     "name": "XXS"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a24eaaac73d08a894eba2cc6ddee821b76f6d5878e011583921f5f629baa59d6/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XS&crop=0",
     "name": "XS"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a24eaaac73d08a894eba2cc6ddee821b76f6d5878e011583921f5f629baa59d6/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0",
     "name": "S"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a24eaaac73d08a894eba2cc6ddee821b76f6d5878e011583921f5f629baa59d6/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=M&crop=0",
     "name": "M"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a24eaaac73d08a894eba2cc6ddee821b76f6d5878e011583921f5f629baa59d6/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=L&crop=0",
     "name": "L"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a24eaaac73d08a894eba2cc6ddee821b76f6d5878e011583921f5f629baa59d6/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XL&crop=0",
     "name": "XL"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a24eaaac73d08a894eba2cc6ddee821b76f6d5878e011583921f5f629baa59d6/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXL&crop=0",
     "name": "XXL"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a24eaaac73d08a894eba2cc6ddee821b76f6d5878e011583921f5f629baa59d6/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXXL&crop=0",
     "name": "XXXL"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a24eaaac73d08a894eba2cc6ddee821b76f6d5878e011583921f5f629baa59d6/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0",
     "name": "C"
    }
   ],
   "file": "https://downloader.disk.yandex.ru/disk/ee5a83b8fa47b8e37b6c68277c869398b17d6c197d7688ef775cb3c258524e37/66f9c414/gwThwhLBKYvLhQCNnqAHituHMr72DpUpd6C6-9w911vW8ivir0rElI21oNjVEQFTesbLx_asncX9gQFzcTfYww%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=attachment&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=225883&hid=7c41e6147b7dd41ea3cc2d615f42bcb7&media_type=image&tknv=v2&etag=403262e03464796e99ff362e913e9a4d",
   "media_type": "image",
   "preview": "https://downloader.disk.yandex.ru/preview/a24eaaac73d08a894eba2cc6ddee821b76f6d5878e011583921f5f629baa59d6/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0b5585af-2bca-43cf-9d3a-decc63db8821.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0",
   "path": "disk:/0b5585af-2bca-43cf-9d3a-decc63db8821.png",
   "sha256": "9ff374c811f9545ca1f55c890c72d583f8abab4a689a733b13e2f32069fa330a",
   "type": "file",
   "md5": "403262e03464796e99ff362e913e9a4d",
   "revision": 1717336203287577
  },
  {
   "antivirus_status": "clean",
   "public_key": "MSeNtB4sL4oM/DMiMUqGGdAxiEkFI7EStMcjgb9PMJR2xYUasH+IJFEqziFNXjfRq/J6bpmRyOJonT3VoXnDag==",
   "public_url": "https://yadi.sk/i/LIWuPUAfQz2AAg",
   "name": "0cd21557-08ba-496c-ba35-503833fa5bd6.png",
   "exif": {},
   "created": "2024-06-01T19:54:41+03:00",
   "size": 225883,
   "resource_id": "1573541518:c7bf5f5709e3dd9b00a7ccd2a82952842d87b2fbe03994f9e3db437adb801275",
   "modified": "2024-06-01T19:54:41+03:00",
   "mime_type": "image/png",
   "comment_ids": {
    "private_resource": "1573541518:c7bf5f5709e3dd9b00a7ccd2a82952842d87b2fbe03994f9e3db437adb801275",
    "public_resource": "1573541518:c7bf5f5709e3dd9b00a7ccd2a82952842d87b2fbe03994f9e3db437adb801275"
   },
   "sizes": [
    {
     "url": "https://downloader.disk.yandex.ru/disk/6740d037158b3db8d97b0a2f42c8108b3f6841598c37c8f0ee912b5626560d94/66f9c414/gwThwhLBKYvLhQCNnqAHituHMr72DpUpd6C6-9w911vW8ivir0rElI21oNjVEQFTesbLx_asncX9gQFzcTfYww%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=225883&hid=7c41e6147b7dd41ea3cc2d615f42bcb7&media_type=image&tknv=v2&etag=403262e03464796e99ff362e913e9a4d",
     "name": "ORIGINAL"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a1752acf54f1a3cdcc545523e57f3b56de1e78d4ab8bbb608152445a2202b043/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2",
     "name": "DEFAULT"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a1752acf54f1a3cdcc545523e57f3b56de1e78d4ab8bbb608152445a2202b043/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXXS&crop=0",
     "name": "XXXS"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a1752acf54f1a3cdcc545523e57f3b56de1e78d4ab8bbb608152445a2202b043/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXS&crop=0",
     "name": "XXS"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a1752acf54f1a3cdcc545523e57f3b56de1e78d4ab8bbb608152445a2202b043/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XS&crop=0",
     "name": "XS"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a1752acf54f1a3cdcc545523e57f3b56de1e78d4ab8bbb608152445a2202b043/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0",
     "name": "S"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a1752acf54f1a3cdcc545523e57f3b56de1e78d4ab8bbb608152445a2202b043/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=M&crop=0",
     "name": "M"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a1752acf54f1a3cdcc545523e57f3b56de1e78d4ab8bbb608152445a2202b043/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=L&crop=0",
     "name": "L"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a1752acf54f1a3cdcc545523e57f3b56de1e78d4ab8bbb608152445a2202b043/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XL&crop=0",
     "name": "XL"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a1752acf54f1a3cdcc545523e57f3b56de1e78d4ab8bbb608152445a2202b043/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXL&crop=0",
     "name": "XXL"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a1752acf54f1a3cdcc545523e57f3b56de1e78d4ab8bbb608152445a2202b043/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=XXXL&crop=0",
     "name": "XXXL"
    },
    {
     "url": "https://downloader.disk.yandex.ru/preview/a1752acf54f1a3cdcc545523e57f3b56de1e78d4ab8bbb608152445a2202b043/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0",
     "name": "C"
    }
   ],
   "file": "https://downloader.disk.yandex.ru/disk/881f7b46e7d82edd29871d94e3948234f4d0e524d5ab827cadf670adabab6a9f/66f9c414/gwThwhLBKYvLhQCNnqAHituHMr72DpUpd6C6-9w911vW8ivir0rElI21oNjVEQFTesbLx_asncX9gQFzcTfYww%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=attachment&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&fsize=225883&hid=7c41e6147b7dd41ea3cc2d615f42bcb7&media_type=image&tknv=v2&etag=403262e03464796e99ff362e913e9a4d",
   "media_type": "image",
   "preview": "https://downloader.disk.yandex.ru/preview/a1752acf54f1a3cdcc545523e57f3b56de1e78d4ab8bbb608152445a2202b043/inf/agGl7FsmrZi_rLwSr_YZE-iLFMsE0Kg4uy9w7SmAoFzz2voeU1keULK7rWnCo1I_pYaH_RrgTTgD4CfIchHW3Q%3D%3D?uid=1573541518&filename=0cd21557-08ba-496c-ba35-503833fa5bd6.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=1573541518&tknv=v2&size=S&crop=0",
   "path": "disk:/0cd21557-08ba-496c-ba35-503833fa5bd6.png",
   "sha256": "9ff374c811f9545ca1f55c890c72d583f8abab4a689a733b13e2f32069fa330a",
   "type": "file",
   "md5": "403262e03464796e99ff362e913e9a4d",
   "revision": 1717260886231743
  }
...
```
