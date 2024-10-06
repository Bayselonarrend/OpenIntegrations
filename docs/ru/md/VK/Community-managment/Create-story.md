---
sidebar_position: 7
---

# Создать историю
 Создает историю из картинки



`Функция СоздатьИсторию(Знач Картинка, Знач URL = "", Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Картинка | --picture | Строка,ДвоичныеДанные | Фон истории |
  | URL | --url | Строка | URL для кнопки под историей |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыВК();
    URL       = "https://github.com/Bayselonarrend/OpenIntegrations";

    Картинка  = "https://openyellow.neocities.org/test_data/picture.jpg";       // URL, Путь к файлу или Двоичные данные
    ИВФ       = ПолучитьИмяВременногоФайла("png");
    КопироватьФайл(Картинка, ИВФ);
    Картинка  = Новый ДвоичныеДанные(ИВФ);

    Результат = OPI_VK.СоздатьИсторию(Картинка , URL, Параметры);

    Результат = OPI_VK.СоздатьИсторию(ИВФ, , Параметры);
```



```sh title="Пример команды CLI"
    
  oint vk СоздатьИсторию --picture "https://openintegrations.dev/test_data/picture.jpg" --url %url% --auth %auth%

```

```json title="Результат"
{
 "response": {
  "count": 1,
  "items": [
   {
    "id": 456239988,
    "owner_id": -218861756,
    "access_key": "story",
    "can_comment": 1,
    "can_reply": 1,
    "can_see": 1,
    "can_like": true,
    "can_share": 1,
    "can_hide": 1,
    "date": 1728224111,
    "expires_at": 1728310511,
    "link": {
     "text": "Ещё",
     "url": "https://github.com/Bayselonarrend/OpenIntegrations"
    },
    "photo": {
     "album_id": -81,
     "date": 1728224111,
     "id": 457248946,
     "owner_id": -218861756,
     "sizes": [
      {
       "height": 56,
       "type": "s",
       "width": 75,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/ZOZMO9kwhQnqbAhmfx5j6H7Xgzc16GztQzwSb5Tudx7kVCCBXWn-yVP5yrZ5ry6zvdW_pgPLVBQkAxZ5gOFZihJS.jpg?size=75x56&quality=95&type=story"
      },
      {
       "height": 97,
       "type": "m",
       "width": 130,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/-L6rpEDBnatkQPfqnIfjZF-hzrXFW5TVoz9kmWF-gW2dYAMu1DOdEV97fKN90N0vsxxfhaUGrX2D6qwk95zp3Stm.jpg?size=130x97&quality=95&type=story"
      },
      {
       "height": 192,
       "type": "j",
       "width": 256,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/V2aCPQixAPZz_RBbXwmg7j0v8fJxOrh_mF2CodBoSyVmWEoru_NgEwrzfD__1HtvS7bRjUPCkYNPPiJvipjlm5WK.jpg?size=256x192&quality=95&type=story"
      },
      {
       "height": 453,
       "type": "x",
       "width": 604,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/S07oD5VSLfvsiJ94PiCdindbwY8K-pi4PbHol2x0ji1TFseYJfDDIGwriwZWso6Yh5lhoHqV08a2bdgqL4CZuNBa.jpg?size=604x453&quality=95&type=story"
      },
      {
       "height": 605,
       "type": "y",
       "width": 807,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/O9N1RYKmkTgu1pDMGZBrzJUL5CVbFjTj7A0In5nmcSBeqROTSlq5sPTmV29Wtr25-_W9zguCXAD3Cvd0LmCtzJsz.jpg?size=807x605&quality=95&type=story"
      },
      {
       "height": 960,
       "type": "z",
       "width": 1280,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/GUCJo1XkZj_RrdpJHruVHtqdoPu3Q1qY1PlJ7A0ahEn3vB7etWTMaLmqnxfnxpzeXIYeXh43-9GAQyKESPgBsmhg.jpg?size=1280x960&quality=95&type=story"
      },
      {
       "height": 1920,
       "type": "w",
       "width": 2560,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/GVLj1qDG4Fn4gm2vAWe-MkGG5sM_CcuEsTkDFR5NXBBA5EMuNIsPnfWZC6rHolUO-9PFGTbYDqeAR4DMWgx2rddz.jpg?size=2560x1920&quality=95&type=story"
      }
     ],
     "text": "",
     "user_id": 100,
     "web_view_token": "432ce52dd94d8acd09",
     "has_tags": false
    },
    "replies": {
     "count": 0,
     "new": 0
    },
    "track_code": "story/3AAQAdLy9G9EAs4bMat0A84nNfHkBAAFoAagB6AIAA==",
    "type": "photo",
    "views": 0,
    "likes_count": 0,
    "reaction_set_id": "reactions",
    "no_sound": false,
    "can_ask": 0,
    "can_ask_anonymous": 0,
    "narratives_count": 0,
    "can_use_in_narrative": true
   }
  ]
 }
}
```
