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
    Токен         = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    НовоеИмя      = "Обновленный файл.jpg";
    Идентификатор = "1VzNEKCqJX81aWHzQ40wAjcBakKOi_1dr";
    Файл          = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg"; // URL, Двоичные данные или Путь к файлу

    Результат = OPI_GoogleDrive.ОбновитьФайл(Токен, Идентификатор, Файл, НовоеИмя);
```



```sh title="Пример команды CLI"
    
  oint gdrive ОбновитьФайл --token %token% --object "1V0oaZh3qQZ7-wbARC8-vrErAFllsBGSJ" --file %file% --title "Обновленный файл.jpeg"

```

```json title="Результат"
{
 "kind": "drive#file",
 "id": "1Hq_J0B0_SY3JVtP3ZvehUfnwinHMUxdt",
 "name": "Обновленный файл.jpg",
 "mimeType": "image/jpeg"
}
```
