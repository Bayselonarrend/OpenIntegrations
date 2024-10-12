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
    Токен    = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Картинка = "https://api.athenaeum.digital/test_data/picture.jpg";
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
 "kind": "drive#file",
 "id": "1T0kBmfSFAMKbZsYxP0PZtbjs_leFF6nR",
 "name": "Новый файл.jpg",
 "mimeType": "image/jpeg"
}
```
