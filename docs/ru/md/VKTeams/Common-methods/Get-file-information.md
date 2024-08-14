---
sidebar_position: 3
---

# Получить информацию о файле
 Получает информацию о файле по его ID



`Функция ПолучитьИнформациюОФайле(Знач Токен, Знач IDФайла) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен бота |
  | IDФайла | --fileid | Строка, Число | ID Файла |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK Teams

<br/>

:::tip
Метод в документации API: [GET /files/getInfo](https://teams.vk.com/botapi/#/files/get_files_getInfo)
:::
<br/>


```bsl title="Пример кода"
    Токен    = "001.3501506236.091...";
    IDФайла  = "sXhpbA5K2ZCOdG5ROIfRan66ba356d1bd";

    Результат = OPI_VKTeams.ПолучитьИнформациюОФайле(Токен, IDФайла);
```



```sh title="Пример команды CLI"
    
  oint vkteams ПолучитьИнформациюОФайле --token %token% --fileid %fileid%

```

```json title="Результат"
{
 "filename": "ВажныйДокумент.docx",
 "size": 24071,
 "type": "application",
 "url": "https://ub.icq.net/files/get/XrJ30TgJvcpZoiAEu1MC46e1MCbBs3NXwqSkBiZgCEkXOsNmPmAnw2XXpEM4WXMcylct3N2s3XwyMI5Cj7GDKtY6FmpmOHLgYC2xUanmVRf4gtn0zVatipXHgtriTJACrKfemXbqJuLCNOYZJieYS72mwqu1MC/%D0%92%D0%B0%D0%B6%D0%BD%D1%8B%D0%B9%D0%94%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82.docx",
 "ok": true
}
```
