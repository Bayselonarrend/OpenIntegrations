---
sidebar_position: 3
---

# Создать подборку товаров
 Создает пустую подборку товаров



`Функция СоздатьПодборкуТоваров(Знач Название, Знач Картинка, Знач Основная = Ложь, Знач Скрытая = Ложь, Знач Параметры = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Название | --title | Строка | Название подборки |
  | Картинка | --picture | Строка,ДвоичныеДанные | Файл картинки |
  | Основная | --main | Булево | Основная |
  | Скрытая | --hidden | Булево | Скрытая |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK

<br/>




```bsl title="Пример кода"
    Параметры = ПолучитьПараметрыВК();

    Название = "Тестовая подборка";
    Картинка = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg";
    Основная = Истина;
    Скрытая  = Ложь;

    Результат = OPI_VK.СоздатьПодборкуТоваров(Название
        , Картинка
        , Основная
        , Скрытая
        , Параметры);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint vk СоздатьПодборкуТоваров --title "Тестовая подборка" \
              --picture "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg" \
              --main true \
              --hidden false \
              --auth "{'access_token':'***','owner_id':'-218861756','app_id':'51694790','group_id':'218861756'}"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint vk СоздатьПодборкуТоваров ^
              --title "Тестовая подборка" ^
              --picture "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg" ^
              --main true ^
              --hidden false ^
              --auth "{'access_token':'***','owner_id':'-218861756','app_id':'51694790','group_id':'218861756'}"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "response": {
  "market_album_id": 125,
  "albums_count": 66
 }
}
```
