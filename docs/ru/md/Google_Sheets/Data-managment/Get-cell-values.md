---
sidebar_position: 3
---

# Получить значения ячеек
 Получает значения ячеек таблицы



`Функция ПолучитьЗначенияЯчеек(Знач Токен, Знач Книга, Знач МассивЯчеек = "", Знач Лист = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | ID книги |
  | МассивЯчеек | --cells | Массив из Строка | Массив ячеек вида А1 для получения (весь лист, если не заполнено) |
  | Лист | --sheetname | Строка | Имя листа (первый лист по умолчанию) |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен  = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Книга  = "1O3ZKBO8P6IhCsFCYl-QRW_7Kjp2DQWef2234pjZmsBg";
    Лист   = "Лист2";

    МассивЯчеек = Новый Массив;
    МассивЯчеек.Добавить("B2");
    МассивЯчеек.Добавить("A3");
    МассивЯчеек.Добавить("B4");

    Результат = OPI_GoogleSheets.ПолучитьЗначенияЯчеек(Токен, Книга, МассивЯчеек, Лист);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```sh
            oint gsheets ПолучитьЗначенияЯчеек --token "***" \
              --spreadsheet "1uEI_ZOtSAh0GjXirtipg57MUMetFmf1OUElyN8o-UPg" \
              --sheetname "Лист2"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gsheets ПолучитьЗначенияЯчеек ^
              --token "***" ^
              --spreadsheet "1uEI_ZOtSAh0GjXirtipg57MUMetFmf1OUElyN8o-UPg" ^
              --sheetname "Лист2"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "spreadsheetId": "1DOVr33ZTV_T3AroyEg7gHrpCYHIpV52K_TmXdgpDwgM",
 "valueRanges": [
  {
   "range": "'Лист2'!B2",
   "majorDimension": "ROWS",
   "values": [
    [
     "Это B2"
    ]
   ]
  },
  {
   "range": "'Лист2'!A3",
   "majorDimension": "ROWS",
   "values": [
    [
     "Это A3"
    ]
   ]
  },
  {
   "range": "'Лист2'!B4",
   "majorDimension": "ROWS",
   "values": [
    [
     "Это B4"
    ]
   ]
  }
 ]
}
```
