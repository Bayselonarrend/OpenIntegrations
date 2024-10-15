---
sidebar_position: 7
---

# Скоприровать объект
 Копирует файл или каталог



`Функция СкопироватьОбъект(Знач Токен, Знач Идентификатор, Знач НовоеИмя = "", Знач НовыйРодитель = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Идентификатор | --object | Строка | Идентификатор объекта |
  | НовоеИмя | --title | Строка | Новое имя объекта |
  | НовыйРодитель | --catalog | Строка | Новый каталог размещения |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен         = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Идентификатор = "17pGWmj6IhPQB-wRJS3QOzqfqGghLRUGH";
    НовоеИмя      = "Скопированный файл.jpeg";
    НовыйРодитель = "root";

    Результат = OPI_GoogleDrive.СкопироватьОбъект(Токен, Идентификатор, НовоеИмя, НовыйРодитель);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gdrive СкопироватьОбъект --token "***" \
              --object "10MDksSJHfiN5TdiC9iG66f-BjZRTn_s6" \
              --title "Скопированный файл.jpeg" \
              --catalog "root"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gdrive СкопироватьОбъект ^
              --token "***" ^
              --object "10MDksSJHfiN5TdiC9iG66f-BjZRTn_s6" ^
              --title "Скопированный файл.jpeg" ^
              --catalog "root"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "kind": "drive#file",
 "id": "1P8WK9Wn2710HiQYkKzYMFso2FmFenV6d",
 "name": "Скопированный файл.jpeg",
 "mimeType": "image/jpeg"
}
```
