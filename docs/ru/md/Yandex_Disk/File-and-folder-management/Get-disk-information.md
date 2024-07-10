---
sidebar_position: 1
---

# Получить информацию о диске
 Получает информацию о текущем диске



`Функция ПолучитьИнформациюОДиске(Знач Токен) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
  
  Токен = "y0_AgAAAABdylaOAA...";
  Ответ = OPI_YandexDisk.ПолучитьИнформациюОДиске(Токен); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);             //Строка
```
	


```sh title="Пример команды CLI"
    
  oint yadisk ПолучитьИнформациюОДиске --token "y0_AgAAAABdylaOAA..."

```

```json title="Результат"
{
  "user": {
  "login": "bayselonarrend",
  "country": "by",
  "uid": "1573541111",
  "display_name": "bayselonarrend",
  "is_child": false,
  "reg_time": "2024-02-01T22:13:41+00:00"
  },
  "revision": 1707416628219047,
  "system_folders": {
  "photostream": "disk:/Фотокамера/",
  "screenshots": "disk:/Скриншоты/",
  "scans": "disk:/Сканы",
  "messenger": "disk:/Файлы Мессенджера",
  "facebook": "disk:/Социальные сети/Facebook",
  "applications": "disk:/Приложения",
  "downloads": "disk:/Загрузки/",
  "mailru": "disk:/Социальные сети/Мой Мир",
  "attach": "disk:/Почтовые вложения",
  "instagram": "disk:/Социальные сети/Instagram",
  "calendar": "disk:/Материалы встреч",
  "social": "disk:/Социальные сети/",
  "vkontakte": "disk:/Социальные сети/ВКонтакте",
  "google": "disk:/Социальные сети/Google+",
  "odnoklassniki": "disk:/Социальные сети/Одноклассники"
  },
  "unlimited_autoupload_enabled": false,
  "used_space": 73372937,
  "trash_size": 0,
  "reg_time": "2024-02-01T12:13:41+00:00",
  "total_space": 5368709120,
  "is_paid": false,
  "paid_max_file_size": 53687091200,
  "max_file_size": 1073741824
  }
```
