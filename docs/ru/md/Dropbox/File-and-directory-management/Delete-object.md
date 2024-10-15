---
sidebar_position: 7
---

# Удалить объект
 Удаляет объект с облачного диска



`Функция УдалитьОбъект(Знач Токен, Знач Путь, Знач Безвозвратно = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Путь | --path | Строка | Путь к объекту удаления |
  | БезВозвратно | --permanently | Строка | Удалить объект без возможности востановления |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    Путь      = "/New/pic.png";
    Токен     = "sl.B-uquz3utwEHepKzyqLBfnFvmY1EWTYDus5LDjT5ux5srp9PJRtr7CvMv20nVl2rRGC3K4J_X5...";

    Результат = OPI_Dropbox.УдалитьОбъект(Токен, Путь);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint dropbox УдалитьОбъект --token "***" \
              --path "/Новый каталог"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint dropbox УдалитьОбъект ^
              --token "***" ^
              --path "/Новый каталог"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "metadata": {
  ".tag": "file",
  "name": "pic.png",
  "path_lower": "/new/pic.png",
  "path_display": "/New/pic.png",
  "id": "id:kJU6-a-pT48AAAAAAAAcWQ",
  "client_modified": "2024-10-08T17:44:58Z",
  "server_modified": "2024-10-08T17:45:38Z",
  "rev": "623fab496638abd841553",
  "size": 2114023,
  "is_downloadable": true,
  "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
 }
}
```
