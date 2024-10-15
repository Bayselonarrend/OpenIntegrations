---
sidebar_position: 3
---

# Получить список комментариев
 Получает список всех комментариев объекта



`Функция ПолучитьСписокКомментариев(Знач Токен, Знач ИДОбъекта) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | ИДОбъекта | --object | Строка | Идентификатор объекта |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Идентификатор = "17pGWmj6IhPQB-wRJS3QOzqfqGghLRUGH";

    Результат = OPI_GoogleDrive.ПолучитьСписокКомментариев(Токен, Идентификатор);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gdrive ПолучитьСписокКомментариев --token "***" \
              --object "1MfKvl7trDfRoyFRzXV_ZaCEbx6SQWq49"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gdrive ПолучитьСписокКомментариев ^
              --token "***" ^
              --object "1MfKvl7trDfRoyFRzXV_ZaCEbx6SQWq49"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "kind": "drive#commentList",
 "comments": [
  {
   "id": "AAABW19Pq0I",
   "kind": "drive#comment",
   "createdTime": "2024-10-08T17:42:33.807Z",
   "modifiedTime": "2024-10-08T17:42:33.807Z",
   "replies": [],
   "author": {
    "displayName": "Антон Титовец",
    "kind": "drive#user",
    "me": true,
    "photoLink": "//lh3.googleusercontent.com/a/ACg8ocKYttNv2CZ-cTTuE90Zmht_PwnGc0YnjM1IUllXsTVORfZFVPU=s50-c-k-no"
   },
   "deleted": false,
   "htmlContent": "Текст комментария",
   "content": "Текст комментария"
  }
 ]
}
```
