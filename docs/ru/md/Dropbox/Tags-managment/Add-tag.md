---
sidebar_position: 2
---

# Добавить тег
 Добавляет новый текстовый тег к файлу или каталогу



`Функция ДобавитьТег(Знач Токен, Знач Путь, Знач Тег) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту, для которого необходимо создать тег |
  | Тег | --tag | Строка | Текст тега |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Тег       = "Важное";
    Токен     = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    Путь      = "/New/mydoc.docx";

    Результат = OPI_Dropbox.ДобавитьТег(Токен, Путь, Тег);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint dropbox ДобавитьТег --token "***" \
              --path "/New/mydoc.docx" \
              --tag "Важное"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox ДобавитьТег ^
              --token "***" ^
              --path "/New/mydoc.docx" ^
              --tag "Важное"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{}
```
