---
sidebar_position: 10
---

# Создать папку
 Создает пустой каталог по выбранному пути



`Функция СоздатьПапку(Знач Токен, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Целевой путь создания каталога |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен     = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    Путь      = "/Новый каталог";

    Результат = OPI_Dropbox.СоздатьПапку(Токен, Путь);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint dropbox СоздатьПапку --token "***" \
              --path "/Новый каталог"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox СоздатьПапку ^
              --token "***" ^
              --path "/Новый каталог"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "metadata": {
  "name": "Новый каталог",
  "path_lower": "/новый каталог",
  "path_display": "/Новый каталог",
  "id": "id:kJU6-a-pT48AAAAAAAAcXQ"
 }
}
```
