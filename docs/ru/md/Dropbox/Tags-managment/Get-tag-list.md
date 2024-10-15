---
sidebar_position: 1
---

# Получить список тегов
 Получает список тегов выбранных файлов



`Функция ПолучитьСписокТегов(Знач Токен, Знач Пути) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Пути | --paths | Строка, Массив Из Строка | Путь или набору путей к файлам |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";

    МассивПутей = Новый Массив;
    МассивПутей.Добавить("/New/Dogs.mp3");
    МассивПутей.Добавить("/New/mydoc.docx");

    Результат = OPI_Dropbox.ПолучитьСписокТегов(Токен, МассивПутей);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint dropbox ПолучитьСписокТегов --token "***" \
              --paths "/New/mydoc.docx"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox ПолучитьСписокТегов ^
              --token "***" ^
              --paths "/New/mydoc.docx"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "paths_to_tags": [
  {
   "path": "/New/Dogs.mp3",
   "tags": []
  },
  {
   "path": "/New/mydoc.docx",
   "tags": [
    {
     ".tag": "user_generated_tag",
     "tag_text": "важное"
    }
   ]
  }
 ]
}
```
