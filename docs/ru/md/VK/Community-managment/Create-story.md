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
    "id": 456239990,
    "owner_id": -218861756,
    "access_key": "story",
    "can_comment": 1,
    "can_reply": 1,
    "can_see": 1,
    "can_like": true,
    "can_share": 1,
    "can_hide": 1,
    "date": 1728281314,
    "expires_at": 1728367714,
    "link": {
     "text": "Ещё",
     "url": "https://github.com/Bayselonarrend/OpenIntegrations"
    },
    "photo": {
     "album_id": -81,
     "date": 1728281313,
     "id": 457248965,
     "owner_id": -218861756,
     "sizes": [
      {
       "height": 56,
       "type": "s",
       "width": 75,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/SuDl6DeGyCsYQqbXUc75lR6qeJFJrh1bbzaBN3WxL5JCvuMHXRetj0f2AB8L40GP2sZWUAxOMcCNhyaf6N4gVa4z.jpg?size=75x56&quality=95&type=story"
      },
      {
       "height": 97,
       "type": "m",
       "width": 130,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/I87DqaSZVV8z1T9i7WrNMjZUbZCz9FbntTdPCiE_M6vMKAmOeZJmZW1gnjYmzq1B1jFk26SSF1Ou2vXwaJuOXgyf.jpg?size=130x97&quality=95&type=story"
      },
      {
       "height": 192,
       "type": "j",
       "width": 256,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/BUL1hAQr_9PwBGYOPNfCSeZdB2UENnqKl6witaLpXiviKvV-_tpHVbmCCU71NfABPwdQdQhcnDZX-W6-H05gtn4r.jpg?size=256x192&quality=95&type=story"
      },
      {
       "height": 453,
       "type": "x",
       "width": 604,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/W9i8Nd3fJLIRGcwqOWn85yyTVOwDgnKIgMThlyGfy5flQphLQQzbueSSQvAblabrh6GC995__ZwyWH8SNWdxpqYJ.jpg?size=604x453&quality=95&type=story"
      },
      {
       "height": 605,
       "type": "y",
       "width": 807,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/3Gph_FaZWCMjgcyW2lhgEi-JyRlu6zI8Zh_yt0I7vbFwaRFVS_4AeDNO2hw_1zNmMKG-lMiuGrCAgpr_Laqv0GJG.jpg?size=807x605&quality=95&type=story"
      },
      {
       "height": 960,
       "type": "z",
       "width": 1280,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/LANFNM4xJGuKS5oRwTE281VNZX1brG-LiM5ojwVKGeIK1ZOHv2SvYv9yp-YywFhI8xbMGBVahXZLdaK1vK7RjKEb.jpg?size=1280x960&quality=95&type=story"
      },
      {
       "height": 1920,
       "type": "w",
       "width": 2560,
       "url": "https://sun56-1.userapi.com/s/v1/ig2/bx2VyoR_3C77lXWu2yXtetqENfGIqNFEdyP6S7xAOcz-rimexg9hq_DXE281Dhhs3yk5XqLjm2JCrSbj64UFB26t.jpg?size=2560x1920&quality=95&type=story"
      }
     ],
     "text": "",
     "user_id": 100,
     "web_view_token": "e58890d731e7403d83",
     "has_tags": false
    },
    "replies": {
     "count": 0,
     "new": 0
    },
    "track_code": "story/3AAQAdLy9G9EAs4bMat2A84nNfHkBAAFoAagB6AIAA==",
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
