﻿---
sidebar_position: 6
---

# Добавить файл в задачу
 Прикрепляет файл к выбранной задаче



`Функция ДобавитьФайлВЗадачу(Знач URL, Знач IDЗадачи, Знач IDФайла, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число, Строка | ID задачи |
  | IDФайла | --fileid | Число, Строка | ID Файла |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [tasks.task.files.attach](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_files_attach.php)
:::
<br/>


```bsl title="Пример кода"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЗадачи = "2262";
    IDФайла  = "11778";

    Результат = OPI_Bitrix24.ДобавитьФайлВЗадачу(URL, IDЗадачи, IDФайла);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";
    IDЗадачи  = "2264";

    Результат = OPI_Bitrix24.ДобавитьФайлВЗадачу(URL, IDЗадачи, IDФайла, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ДобавитьФайлВЗадачу --url "b24-ar17wx.bitrix24.by" --task "502" --fileid "2480" --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "attachmentId": 3574
 },
 "time": {
  "start": 1728409735.33635,
  "finish": 1728409735.39912,
  "duration": 0.0627679824829102,
  "processing": 0.0372891426086426,
  "date_start": "2024-10-08T20:48:55+03:00",
  "date_finish": "2024-10-08T20:48:55+03:00",
  "operating_reset_at": 1728410335,
  "operating": 0
 }
}
```
