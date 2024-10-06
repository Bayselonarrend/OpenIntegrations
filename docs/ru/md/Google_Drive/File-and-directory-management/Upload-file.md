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
    Токен    = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Картинка = "https://openyellow.neocities.org/test_data/picture.jpg";
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
 "id": "1Zzs9l2aMP8tCEXbA4GGiMjbMFgUduv_G",
 "name": "Новый файл.jpg",
 "mimeType": "image/jpeg"
}
```
