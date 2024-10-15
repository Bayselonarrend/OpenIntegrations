---
sidebar_position: 5
---

# Загрузить файл по URL
 Загружает файл на облачный диск, получая его по указанному URL



`Функция ЗагрузитьФайлПоURL(Знач Токен, Знач URLФайла, Знач Путь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | URLФайла | --url | Строка | URL источник файла |
  | Путь | --path | Строка | Путь сохранения на Dropbox |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Путь  = "/New/url_doc.docx";
    Токен = "sl.B-uquz3utwEHepKzyqLBfnFvmY1EWTYDus5LDjT5ux5srp9PJRtr7CvMv20nVl2rRGC3K4J_X5...";
    URL   = "https://api.athenaeum.digital/test_data/document.docx";

    Результат = OPI_Dropbox.ЗагрузитьФайлПоURL(Токен, URL, Путь);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint dropbox ЗагрузитьФайлПоURL --token "***" \
              --url "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx" \
              --path "/New/url_doc.docx"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox ЗагрузитьФайлПоURL ^
              --token "***" ^
              --url "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx" ^
              --path "/New/url_doc.docx"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 ".tag": "async_job_id",
 "async_job_id": "4Z3HR2PdMNAAAAAAAAAAAQ"
}
```
