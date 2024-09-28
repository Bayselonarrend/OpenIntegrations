---
sidebar_position: 4
---

# Загрузить файл
 Загружает файл на диск



`Функция ЗагрузитьФайл(Знач Токен, Знач Файл, Знач Описание) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Файл | --file | ДвоичныеДанные,Строка | Загружаемый файл |
  | Описание | --props | Соответствие Из КлючИЗначение | JSON описания или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен    = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Картинка = "https://openintegrations.dev/test_data/picture.jpg";
    Каталог  = "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM";

    Описание = OPI_GoogleDrive.ПолучитьОписаниеФайла();
    Описание.Вставить("Родитель", Каталог);

    Результат = OPI_GoogleDrive.ЗагрузитьФайл(Токен, Картинка, Описание);
```



```sh title="Пример команды CLI"
    
  oint gdrive ЗагрузитьФайл --token %token% --file %file% --props %props%

```

```json title="Результат"
{
  "mimeType": "image/jpeg",
  "name": "Новый файл.jpg",
  "id": "16hPGNTMmbnXhz_g0vjGbrLP19h56RwIg",
  "kind": "drive#file"
  }
```
