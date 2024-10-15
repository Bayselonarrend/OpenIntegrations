---
sidebar_position: 6
---

# Отменить публикацию файла
 Запрещает доступ к файлу для внешних пользователей



`Функция ОтменитьПубликациюФайла(Знач Токен, Знач IDФайла) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | IDФайла | --fileid | Строка | ID файла, к которому предоставляется доступ |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Токен    = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    Файл     = "kJU6-a-pT48AAAAAAAAABw";

    Результат = OPI_Dropbox.ОтменитьПубликациюФайла(Токен, Файл);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint dropbox ОтменитьПубликациюФайла --token "***" \
              --fileid "kJU6-a-pT48AAAAAAAAABw"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox ОтменитьПубликациюФайла ^
              --token "***" ^
              --fileid "kJU6-a-pT48AAAAAAAAABw"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{}
```
