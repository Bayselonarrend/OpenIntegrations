﻿---
sidebar_position: 5
---

# Удалить задачу
 Удаляет задачу по ID



`Функция УдалитьЗадачу(Знач URL, Знач IDЗадачи, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЗадачи | --task | Число,Строка | ID задачи |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [tasks.task.delete](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_delete.php)
:::
<br/>


```bsl title="Пример кода"
  URL      = "https://b24-ar17wx.bitrix24.by/rest/1/f2pph8uucc89is6c/";
  IDЗадачи = "1078";
  
  Результат = OPI_Bitrix24.УдалитьЗадачу(URL, IDЗадачи);
  
  URL       = "b24-ar17wx.bitrix24.by";
  Токен     = "fe3fa966006e9f06006b12e400000001000...";
  IDЗадачи  = "1080";
  
  Результат = OPI_Bitrix24.УдалитьЗадачу(URL, IDЗадачи, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 УдалитьЗадачу --url "b24-ar17wx.bitrix24.by" --task "170" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": {
  "task": true
 },
 "time": {
  "start": 1718473350.68409,
  "finish": 1718473350.80999,
  "duration": 0.125902891159058,
  "processing": 0.0892560482025146,
  "date_start": "2024-06-15T17:42:30+00:00",
  "date_finish": "2024-06-15T17:42:30+00:00",
  "operating_reset_at": 1718473950,
  "operating": 0
 }
}
```
