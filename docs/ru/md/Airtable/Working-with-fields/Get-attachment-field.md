---
sidebar_position: 5
---

# Получить поле (файл)
 Получает описание поля файлового типа



`Функция ПолучитьПолеВложения(Знач Наименование) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Наименование | --title | Строка | Наименование поля |

  
  Возвращаемое значение:   Структура -  Описание поля

<br/>




```bsl title="Пример кода"
    Результат = OPI_Airtable.ПолучитьПолеВложения("Вложение");
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint airtable ПолучитьПолеВложения --title "Вложение"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint airtable ПолучитьПолеВложения ^
              --title "Вложение"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "name": "Вложение",
 "type": "multipleAttachments"
}
```
