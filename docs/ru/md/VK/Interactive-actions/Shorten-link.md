---
sidebar_position: 5
---

# Сократить ссылку
 Создает сокращенный URL из обычного



`Функция СократитьСсылку(Знач URL, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL для сокращения |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:  Строка - Сокращенный URL

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыВК();

    Результат = OPI_VK.СократитьСсылку("https://github.com/Bayselonarrend/OpenIntegrations", Параметры);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint vk СократитьСсылку --url "https://github.com/Bayselonarrend/OpenIntegrations" \
              --auth "{'access_token':'***','owner_id':'-218861756','app_id':'51694790','group_id':'218861756'}"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint vk СократитьСсылку ^
              --url "https://github.com/Bayselonarrend/OpenIntegrations" ^
              --auth "{'access_token':'***','owner_id':'-218861756','app_id':'51694790','group_id':'218861756'}"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
"https://vk.cc/ctL1sM"
```
