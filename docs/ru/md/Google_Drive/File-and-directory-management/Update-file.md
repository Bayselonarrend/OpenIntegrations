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
    Токен         = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    НовоеИмя      = "Обновленный файл.jpg";
    Идентификатор = "14hysfOxsStktI4JZEXRiSZ9Rl69wNJwX";
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
