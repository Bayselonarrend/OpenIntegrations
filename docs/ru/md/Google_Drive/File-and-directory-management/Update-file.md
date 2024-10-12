---
sidebar_position: 8
---

# Обновить файл
 Обновляет двоичные данные файла



`Функция ОбновитьФайл(Знач Токен, Знач Идентификатор, Знач Файл, Знач НовоеИмя = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Идентификатор | --object | Строка | Идентификатор обновляемого объекта |
  | Файл | --file | ДвоичныеДанные,Строка | Файл источник обновления |
  | НовоеИмя | --title | Строка | Новое имя файла (если необходимо) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    НовоеИмя      = "Обновленный файл.jpg";
    Идентификатор = "1rjQ1PytDjJVgTIkNK600sQEPGqHDIeWW";
    Файл          = "https://api.athenaeum.digital/test_data/picture2.jpg"; // URL, Двоичные данные или Путь к файлу

    Результат = OPI_GoogleDrive.ОбновитьФайл(Токен, Идентификатор, Файл, НовоеИмя);
```



```sh title="Пример команды CLI"
    
  oint gdrive ОбновитьФайл --token %token% --object "1V0oaZh3qQZ7-wbARC8-vrErAFllsBGSJ" --file %file% --title "Обновленный файл.jpeg"

```

```json title="Результат"
{
 "kind": "drive#file",
 "id": "1M4vzYf2dCgd0n5Ex4Yt-AhzjhZyr13Rr",
 "name": "Обновленный файл.jpg",
 "mimeType": "image/jpeg"
}
```
