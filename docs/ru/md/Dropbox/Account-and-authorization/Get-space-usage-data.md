---
sidebar_position: 5
---

# Получить данные использования пространства
 Получает информацию о количестве использованного дискового пространства



`Функция ПолучитьДанныеИспользованияПространства(Знач Токен) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";

    Результат = OPI_Dropbox.ПолучитьДанныеИспользованияПространства(Токен);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint dropbox ПолучитьДанныеИспользованияПространства --token "***"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox ПолучитьДанныеИспользованияПространства ^
              --token "***"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "used": 1477704605,
 "allocation": {
  ".tag": "individual",
  "allocated": 2147483648
 }
}
```
