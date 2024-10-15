---
sidebar_position: 3
---

# Получить превью
 Получает PDF или HTML превью объекта (только для токументов)



`Функция ПолучитьПревью(Знач Токен, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту |

  
  Возвращаемое значение:   ДвоичныеДанные - превью документа

<br/>




```bsl title="Пример кода"
    Токен     = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    Путь      = "/New/mydoc.docx";

    Результат = OPI_Dropbox.ПолучитьПревью(Токен, Путь);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint dropbox ПолучитьПревью --token "***" \
              --path "/New/mydoc.docx"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox ПолучитьПревью ^
              --token "***" ^
              --path "/New/mydoc.docx"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
НЕ JSON: 25 50 44 46 2D 31 2E 35 0D 0A 25 B5 B5 B5 B5 0D 0A 31 20 30 20 6F 62 6A 0D 0A 3C 3C 2F 54 79 70 65 2F 43 61 74 61 6C 6F 67 2F 50 61 67 65 73 20 32 20 30 20 52 2F 4C 61 6E 67 28 65 6E 2D 55 53…
```
