---
sidebar_position: 8
---

# Обновить файл
 Обновляет двоичные данные файла



`Функция ОбновитьФайл(Знач Токен, Знач Идентификатор, Знач Файл, Знач НовоеИмя = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Идентификатор | --object | Строка | Идентификатор обновляемого объекта |
  | Файл | --file | ДвоичныеДанные,Строка | Файл источник обновления |
  | НовоеИмя | --title | Строка | Новое имя файла (если необходимо) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    НовоеИмя      = "Обновленный файл.jpg";
    Идентификатор = "17pGWmj6IhPQB-wRJS3QOzqfqGghLRUGH";
    Файл          = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg"; // URL, Двоичные данные или Путь к файлу

    Результат = OPI_GoogleDrive.ОбновитьФайл(Токен, Идентификатор, Файл, НовоеИмя);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gdrive ОбновитьФайл --token "***" \
              --object "10MDksSJHfiN5TdiC9iG66f-BjZRTn_s6" \
              --file "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg" \
              --title "Обновленный файл.jpg"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gdrive ОбновитьФайл ^
              --token "***" ^
              --object "10MDksSJHfiN5TdiC9iG66f-BjZRTn_s6" ^
              --file "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg" ^
              --title "Обновленный файл.jpg"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "kind": "drive#file",
 "id": "1M4vzYf2dCgd0n5Ex4Yt-AhzjhZyr13Rr",
 "name": "Обновленный файл.jpg",
 "mimeType": "image/jpeg"
}
```
