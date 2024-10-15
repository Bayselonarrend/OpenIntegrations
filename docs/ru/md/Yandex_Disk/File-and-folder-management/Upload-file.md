﻿---
sidebar_position: 10
---

# Загрузить файл
 Загружает файл на диск по заданному пути



`Функция ЗагрузитьФайл(Знач Токен, Знач Путь, Знач Файл, Знач Перезаписывать = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь для сохранение файла на Диске |
  | Файл | --file | Строка,ДвоичныеДанные | Файл для загрузки |
  | Перезаписывать | --rewrite | Булево | Перезаписывать, если файл с таким именем уже существует |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

<br/>




```bsl title="Пример кода"
    Путь1     = "/" + Строка(Новый УникальныйИдентификатор) + ".png";
    Путь2     = "/" + Строка(Новый УникальныйИдентификатор) + ".png";

    Токен    = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Картинка = "https://api.athenaeum.digital/test_data/picture.jpg"; // URL

    ИВФ      = ПолучитьИмяВременногоФайла("png"); // Путь
    КопироватьФайл(Картинка, ИВФ);

    Результат = OPI_YandexDisk.ЗагрузитьФайл(Токен, Путь1, Картинка, Истина);

    Результат = OPI_YandexDisk.ЗагрузитьФайл(Токен, Путь2, ИВФ, Истина);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint yadisk ЗагрузитьФайл --token "***" \
              --path "/4f1954c8-c1db-4fd5-810d-bc0042ea7c3b.png" \
              --file "C:\Users\Administrator\AppData\Local\Temp\w5swc4j5i1g.png" \
              --rewrite true
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint yadisk ЗагрузитьФайл ^
              --token "***" ^
              --path "/4f1954c8-c1db-4fd5-810d-bc0042ea7c3b.png" ^
              --file "C:\Users\Administrator\AppData\Local\Temp\w5swc4j5i1g.png" ^
              --rewrite true
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{}
```
