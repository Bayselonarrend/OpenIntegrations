---
sidebar_position: 9
---

# Удалить объект
 Удаляет файл или каталог по ID



`Функция УдалитьОбъект(Знач Токен, Знач Идентификатор) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Идентификатор | --object | Строка | Идентификатор объекта для удаления |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Идентификатор = "1U8hhtaSXcxZuojGLumLYODMBspUV501s";

    Результат = OPI_GoogleDrive.УдалитьОбъект(Токен, Идентификатор);
```



```sh title="Пример команды CLI"
    
  oint gdrive УдалитьОбъект --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```

```json title="Результат"
null
```
