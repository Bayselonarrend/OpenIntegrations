---
sidebar_position: 11
---

# Загрузить фото на сервер
 Загружает фото на сервер для его дальнейшего использования



`Функция ЗагрузитьФотоНаСервер(Знач Картинка, Знач Параметры = "", Знач Вид = "Пост") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Картинка | --file | Строка, ДвоичныеДанные | Файл картинки |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |
  | Вид | --type | Строка | Вид загрузки (Пост, Товар, История, Опрос, Прочее) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от VK

<br/>




```bsl title="Пример кода"
  Картинка = "https://openintegrations.dev/test_data/picture.jpg"; // URL, Путь или Двоичные данные
  
  ИВФ = ПолучитьИмяВременногоФайла("png");
  КопироватьФайл(Картинка, ИВФ);
  
  ЗагрузкаКартинки = OPI_VK.ЗагрузитьФотоНаСервер(Картинка, Параметры);
  ЗагрузкаКартинки = OPI_VK.ЗагрузитьФотоНаСервер(ИВФ, Параметры);
```



```sh title="Пример команды CLI"
    
  oint vk ЗагрузитьФотоНаСервер --file %file% --auth %auth% --type %type%

```

```json title="Результат"
{
  "response":[
    {
      "album_id":289219319,
      "date":1673516629,
      "id":457239023,
      "owner_id":743784474,
      "sizes":[{"height":50,"type":"s","width":75,"url":"https:\/\/sun9-west.userapi.com\/sun9-45\/s\/v1\/ig2\/Vus7E6r8jZjgv5E9bnuM6fbvL9U_NP4-goegNOaEy8t4Z1DnzofjER9exwblecB6Hxb3EUbWv7lQvxdRaErZGoT3.jpg?size=75x50&quality=96&type=album"},{"height":87,"type":"m","width":130,"url":"https:\/\/sun9-west.userapi.com\/sun9-45\/s\/v1\/ig2\/JTtJ-M4Y1Md4nbNyY6QNKBjs9xleCGkDwGw-NuMvLV0DKfQrPb_xN7QcfazSTrBcZ-_JzsJ21pTuLI7Slr8m9HcB.jpg?size=130x87&quality=96&type=album"},{"height":402,"type":"x","width":604,"url":"https:\/\/sun9-west.userapi.com\/sun9-45\/s\/v1\/ig2\/2DBzUBeOMpydPcypQFkirgj6g9mzsj8le0qsrWQ_lPX3zNQN1229bLivxf26ya-91HF9D57exLSnkSnJwUxJdUBN.jpg?size=604x402&quality=96&type=album"},{"height":537,"type":"y","width":807,"url":"https:\/\/sun9-west.userapi.com\/sun9-45\/s\/v1\/ig2\/Biye5eNVG4UA_ymuN60MU6Qp26yO7rYp0WB-ch55oxkaATpXs4Kmqqznz1keCYHg_BHyvPhyrSGyK3zRK29LoVKH.jpg?size=807x537&quality=96&type=album"},{"height":852,"type":"z","width":1280,"url":"https:\/\/sun9-west.userapi.com\/sun9-45\/s\/v1\/ig2\/O-BkqGyWMw2ZKcOyYz8sH543Ihkws7mAn6x76JYh0mVW2MCR9x9eig_AS6gT6OLeySlvewx5oyri1Ejj0uNhJuKo.jpg?size=1280x852&quality=96&type=album"},{"height":1704,"type":"w","width":2560,"url":"https:\/\/sun9-west.userapi.com\/sun9-45\/s\/v1\/ig2\/o5klH0kpqicWBkDGQl_ch2j8VRpW69xrnq_PXw823wrMYc2qnXQLuDZeECtcKSaka1gfCpP9smoz7XwGAMDTk7vo.jpg?size=2560x1704&quality=96&type=album"},{"height":87,"type":"o","width":130,"url":"https:\/\/sun9-west.userapi.com\/sun9-45\/s\/v1\/ig2\/JTtJ-M4Y1Md4nbNyY6QNKBjs9xleCGkDwGw-NuMvLV0DKfQrPb_xN7QcfazSTrBcZ-_JzsJ21pTuLI7Slr8m9HcB.jpg?size=130x87&quality=96&type=album"},{"height":133,"type":"p","width":200,"url":"https:\/\/sun9-west.userapi.com\/sun9-45\/s\/v1\/ig2\/dFvcZ_sYZeMJtmvotINsevf_0x4KbDxo-jcrZojRQtebIKvM0juMU9U9NjybaidOukkrImr2CWcW8u6IHdlceWKD.jpg?size=200x133&quality=96&type=album"},{"height":213,"type":"q","width":320,"url":"https:\/\/sun9-west.userapi.com\/sun9-45\/s\/v1\/ig2\/GglL_Kv0x1_rnPwXwtTPZUMFg9sT_JB9xUSUeNvNIRapPRhGvQbQAaCwD57WBhUKU8sPD6-BhyadPIXaALqERkS1.jpg?size=320x213&quality=96&type=album"},{"height":340,"type":"r","width":510,"url":"https:\/\/sun9-west.userapi.com\/sun9-45\/s\/v1\/ig2\/LnQwirb-SUb689R2k90Q8MwuwHJ0tfO03a0IkCeXObaQERRE2-UUyLBCTTLme2qkLcxXAekHVbkLMEZhRq5E6Ggr.jpg?size=510x340&quality=96&crop=2,0,2556,1704&type=album"}],
      "text":"",
      "has_tags":false
    }
  ]
}
```
