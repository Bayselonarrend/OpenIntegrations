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
    Токен         = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    НовоеИмя      = "Обновленный файл.jpg";
    Идентификатор = "1A0oqifjQs0coHvFLF4BFr7hCmOJxETDe";
    Файл          = "https://openintegrations.dev/test_data/picture2.jpg"; // URL, Двоичные данные или Путь к файлу

    Результат = OPI_GoogleDrive.ОбновитьФайл(Токен, Идентификатор, Файл, НовоеИмя);
```



```sh title="Пример команды CLI"
    
  oint gdrive ОбновитьФайл --token %token% --object "1V0oaZh3qQZ7-wbARC8-vrErAFllsBGSJ" --file %file% --title "Обновленный файл.jpeg"

```

```json title="Результат"
{
  "mimeType": "image/jpeg",
  "name": "Обновленный файл.jpg",
  "id": "1V0oaZh3qQZ7-wbARC8-vrErAFllsBGSJ",
  "kind": "drive#file"
  }
```
