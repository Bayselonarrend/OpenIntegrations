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
    Токен         = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Идентификатор = "17pGWmj6IhPQB-wRJS3QOzqfqGghLRUGH";

    Результат = OPI_GoogleDrive.УдалитьОбъект(Токен, Идентификатор);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gdrive УдалитьОбъект --token "***" \
              --object "1MfKvl7trDfRoyFRzXV_ZaCEbx6SQWq49"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gdrive УдалитьОбъект ^
              --token "***" ^
              --object "1MfKvl7trDfRoyFRzXV_ZaCEbx6SQWq49"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
null
```
