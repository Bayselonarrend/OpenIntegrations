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
    IDФайла  = "Z7w4zb94bLtkJDICBfzVuG66f69e921bd";

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
 "url": "https://ub.icq.net/files/get/lFDga2VDbQSu8S1fMckGM0HckGcO5pw1IatUeSyq14d1atPBfiSKDeTIlpw2WS5GibFISvTl5IjyHUiIcJSIXSmIANq18okmSSEhwwBSMtUq3I2zTVQSZ5UyeS5QvCQ1TGCtEIClXoX192J0z1yaM6YIb9MckG/%D0%92%D0%B0%D0%B6%D0%BD%D1%8B%D0%B9%D0%94%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82.docx",
 "ok": true
}
```
