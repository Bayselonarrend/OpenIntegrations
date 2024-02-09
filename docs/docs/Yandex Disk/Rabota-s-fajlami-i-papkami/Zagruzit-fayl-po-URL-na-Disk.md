---
sidebar_position: 4
---

# Загрузить файл по URL на Диск
Загружает файл на Диск, получая его по указанному URL

*Функция ЗагрузитьФайлПоURL(Знач Токен, Знач Путь, Знач Адрес) Экспорт*

  | Параметр | Тип | Назначение |
  |-|-|-|
  | Токен | Строка | Токен доступа |
  | Путь | Строка | Путь сохранения файла на Диске |
  | Адрес | Строка | URL файла |
  
  Вовзращаемое значение: Соответствие - сериализованный JSON ответа от Yandex

```bsl title="Пример кода"
			
    Токен = "y0_AgAAAABdylaOAA...";   
    Путь  = "/Альпака.png";
    Адрес = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/Media/logo.png";

    Ответ = OPI_YandexDisk.ЗагрузитьФайлПоURL(Токен, Путь, Адрес); //Соответствие
    Ответ = OPI_Инструменты.JSONСтрокой(Ответ);                    //Строка

```

![Результат](img/2.png)

```json title="Результат"

{
 "templated": false,
 "method": "GET",
 "href": "https://cloud-api.yandex.net/v1/disk/operations/b78a7ef2dd49971aa22e5e72f2e615db885da9947d7c61b2822de23a99e855a1"
}

```
