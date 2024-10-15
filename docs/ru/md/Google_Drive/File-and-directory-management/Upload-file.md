---
sidebar_position: 4
---

# Загрузить файл
 Загружает файл на диск



`Функция ЗагрузитьФайл(Знач Токен, Знач Файл, Знач Описание) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Файл | --file | ДвоичныеДанные,Строка | Загружаемый файл |
  | Описание | --props | Соответствие Из КлючИЗначение | JSON описания или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен    = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Картинка = "https://api.athenaeum.digital/test_data/picture.jpg";
    Каталог  = "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM";

    Описание = OPI_GoogleDrive.ПолучитьОписаниеФайла();
    Описание.Вставить("Родитель", Каталог);

    Результат = OPI_GoogleDrive.ЗагрузитьФайл(Токен, Картинка, Описание);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint gdrive ЗагрузитьФайл --token "***" \
              --file "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg" \
              --props "{'MIME':'image/jpeg','Имя':'Новый файл.jpg','Описание':'Это новый файл','Родитель':'191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM'}"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gdrive ЗагрузитьФайл ^
              --token "***" ^
              --file "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg" ^
              --props "{'MIME':'image/jpeg','Имя':'Новый файл.jpg','Описание':'Это новый файл','Родитель':'191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM'}"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "kind": "drive#file",
 "id": "1T0kBmfSFAMKbZsYxP0PZtbjs_leFF6nR",
 "name": "Новый файл.jpg",
 "mimeType": "image/jpeg"
}
```
