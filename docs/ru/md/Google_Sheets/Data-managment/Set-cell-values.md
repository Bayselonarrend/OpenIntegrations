---
sidebar_position: 1
---

# Установить значения ячеек
 Устанавливает значения ячеек листа



`Функция УстановитьЗначенияЯчеек(Знач Токен, Знач Книга, Знач СоответствиеЗначений, Знач Лист = "", Знач ОсновноеИзмерение = "COLUMNS") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Книга | --spreadsheet | Строка | ID книги |
  | СоответствиеЗначений | --data | Соответствие Из КлючИЗначение | Данные заполнения, где ключ это имя ячейки вида A1 |
  | Лист | --sheetname | Строка | Имя листа (первый лист по умолчанию) |
  | ОсновноеИзмерение | --dim | Строка | Основное измерение при заполнении диапазона массивом |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен  = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Книга  = "1MxBM0eQ7Vr74F5KqaeAQspPH3oViXUHbl3kDa451cdA";
    Лист   = "Лист2";

    СоответствиеЗначений = Новый Соответствие;
    СоответствиеЗначений.Вставить("A1", "Это A1");
    СоответствиеЗначений.Вставить("A2", "Это A2");
    СоответствиеЗначений.Вставить("B2", "Это B2");
    СоответствиеЗначений.Вставить("B3", "Это B3");
    СоответствиеЗначений.Вставить("A3", "Это A3");
    СоответствиеЗначений.Вставить("A4", "Это A4");
    СоответствиеЗначений.Вставить("B1", "Это B1");
    СоответствиеЗначений.Вставить("B4", "Это B4");

    Результат = OPI_GoogleSheets.УстановитьЗначенияЯчеек(Токен, Книга, СоответствиеЗначений, Лист);
```



```sh title="Пример команды CLI"
    
  oint gsheets УстановитьЗначенияЯчеек --token %token% --spreadsheet "1Pu07Y5UiGVfW4fqfP7tcSQtdSX_2wdm2Ih23zlxJJwc" --data %data% --sheetname "Лист2" --dim %dim%

```

```json title="Результат"
{
 "spreadsheetId": "1DOVr33ZTV_T3AroyEg7gHrpCYHIpV52K_TmXdgpDwgM",
 "totalUpdatedRows": 4,
 "totalUpdatedColumns": 2,
 "totalUpdatedCells": 8,
 "totalUpdatedSheets": 1,
 "responses": [
  {
   "spreadsheetId": "1DOVr33ZTV_T3AroyEg7gHrpCYHIpV52K_TmXdgpDwgM",
   "updatedRange": "'Лист2'!A1",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1DOVr33ZTV_T3AroyEg7gHrpCYHIpV52K_TmXdgpDwgM",
   "updatedRange": "'Лист2'!A2",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1DOVr33ZTV_T3AroyEg7gHrpCYHIpV52K_TmXdgpDwgM",
   "updatedRange": "'Лист2'!B2",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1DOVr33ZTV_T3AroyEg7gHrpCYHIpV52K_TmXdgpDwgM",
   "updatedRange": "'Лист2'!B3",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1DOVr33ZTV_T3AroyEg7gHrpCYHIpV52K_TmXdgpDwgM",
   "updatedRange": "'Лист2'!A3",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1DOVr33ZTV_T3AroyEg7gHrpCYHIpV52K_TmXdgpDwgM",
   "updatedRange": "'Лист2'!A4",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1DOVr33ZTV_T3AroyEg7gHrpCYHIpV52K_TmXdgpDwgM",
   "updatedRange": "'Лист2'!B1",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  },
  {
   "spreadsheetId": "1DOVr33ZTV_T3AroyEg7gHrpCYHIpV52K_TmXdgpDwgM",
   "updatedRange": "'Лист2'!B4",
   "updatedRows": 1,
   "updatedColumns": 1,
   "updatedCells": 1
  }
 ]
}
```
