---
sidebar_position: 2
---

# Получить подборки по ID
 Получить список подборок по массиву ID



`Функция ПолучитьПодборкиПоИД(Знач Подборки, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Подборки | --sels | Строка, Массив Из Строка | ID подборок |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыВК();
    Подборка  = "125";

    Результат = OPI_VK.ПолучитьПодборкиПоИД(Подборка, Параметры);
```



```sh title="Пример команды CLI"
    
  oint vk ПолучитьПодборкиПоИД --sels %sels% --auth %auth%

```

```json title="Результат"
{
 "response": {
  "count": 1,
  "items": [
   {
    "id": 127,
    "owner_id": -218861756,
    "title": "Измененная подборка",
    "count": 0,
    "updated_time": 1728325823,
    "is_main": false,
    "is_hidden": false,
    "photo": {
     "album_id": -53,
     "date": 1728325822,
     "id": 457249002,
     "owner_id": -218861756,
     "sizes": [
      {
       "height": 56,
       "type": "s",
       "width": 75,
       "url": "https://sun9-13.userapi.com/s/v1/ig2/sZX7hJgRri6ADTtsINe_YPKWTPbMohSjvQ9qeRfps79zZNHTkmKB_esnoMYwm-XrBnksMOk7FJgjpNQRf5xISTUD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=75x56"
      },
      {
       "height": 97,
       "type": "m",
       "width": 130,
       "url": "https://sun9-13.userapi.com/s/v1/ig2/sZX7hJgRri6ADTtsINe_YPKWTPbMohSjvQ9qeRfps79zZNHTkmKB_esnoMYwm-XrBnksMOk7FJgjpNQRf5xISTUD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=130x97"
      },
      {
       "height": 453,
       "type": "x",
       "width": 604,
       "url": "https://sun9-13.userapi.com/s/v1/ig2/sZX7hJgRri6ADTtsINe_YPKWTPbMohSjvQ9qeRfps79zZNHTkmKB_esnoMYwm-XrBnksMOk7FJgjpNQRf5xISTUD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=604x453"
      },
      {
       "height": 605,
       "type": "y",
       "width": 807,
       "url": "https://sun9-13.userapi.com/s/v1/ig2/sZX7hJgRri6ADTtsINe_YPKWTPbMohSjvQ9qeRfps79zZNHTkmKB_esnoMYwm-XrBnksMOk7FJgjpNQRf5xISTUD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=807x605"
      },
      {
       "height": 960,
       "type": "z",
       "width": 1280,
       "url": "https://sun9-13.userapi.com/s/v1/ig2/sZX7hJgRri6ADTtsINe_YPKWTPbMohSjvQ9qeRfps79zZNHTkmKB_esnoMYwm-XrBnksMOk7FJgjpNQRf5xISTUD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=1280x960"
      },
      {
       "height": 1920,
       "type": "w",
       "width": 2560,
       "url": "https://sun9-13.userapi.com/s/v1/ig2/sZX7hJgRri6ADTtsINe_YPKWTPbMohSjvQ9qeRfps79zZNHTkmKB_esnoMYwm-XrBnksMOk7FJgjpNQRf5xISTUD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=2560x1920"
      },
      {
       "height": 97,
       "type": "o",
       "width": 130,
       "url": "https://sun9-13.userapi.com/s/v1/ig2/sZX7hJgRri6ADTtsINe_YPKWTPbMohSjvQ9qeRfps79zZNHTkmKB_esnoMYwm-XrBnksMOk7FJgjpNQRf5xISTUD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=130x97"
      },
      {
       "height": 150,
       "type": "p",
       "width": 200,
       "url": "https://sun9-13.userapi.com/s/v1/ig2/sZX7hJgRri6ADTtsINe_YPKWTPbMohSjvQ9qeRfps79zZNHTkmKB_esnoMYwm-XrBnksMOk7FJgjpNQRf5xISTUD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=200x150"
      },
      {
       "height": 240,
       "type": "q",
       "width": 320,
       "url": "https://sun9-13.userapi.com/s/v1/ig2/sZX7hJgRri6ADTtsINe_YPKWTPbMohSjvQ9qeRfps79zZNHTkmKB_esnoMYwm-XrBnksMOk7FJgjpNQRf5xISTUD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=320x240"
      },
      {
       "height": 382,
       "type": "r",
       "width": 510,
       "url": "https://sun9-13.userapi.com/s/v1/ig2/sZX7hJgRri6ADTtsINe_YPKWTPbMohSjvQ9qeRfps79zZNHTkmKB_esnoMYwm-XrBnksMOk7FJgjpNQRf5xISTUD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu&cs=510x382"
      }
     ],
     "text": "",
     "user_id": 100,
     "web_view_token": "3016de7532df4f3e81",
     "has_tags": false,
     "orig_photo": {
      "height": 1920,
      "type": "base",
      "url": "https://sun9-13.userapi.com/s/v1/ig2/sZX7hJgRri6ADTtsINe_YPKWTPbMohSjvQ9qeRfps79zZNHTkmKB_esnoMYwm-XrBnksMOk7FJgjpNQRf5xISTUD.jpg?quality=95&as=32x24,48x36,72x54,108x81,160x120,240x180,360x270,480x360,540x405,640x480,720x540,1080x810,1280x960,1440x1080,2560x1920&from=bu",
      "width": 2560
     }
    }
   }
  ]
 }
}
```
