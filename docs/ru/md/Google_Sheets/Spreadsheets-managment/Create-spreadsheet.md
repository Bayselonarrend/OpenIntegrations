﻿---
sidebar_position: 1
---

# Создать книгу
 Создает новую книгу



`Функция СоздатьКнигу(Знач Токен, Знач Наименование, Знач МассивИменЛистов) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Наименование | --title | Строка | Наименование |
  | МассивИменЛистов | --sheets | Массив из Строка | Массив имен для добавления новых листов в книгу |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен        = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Наименование = "Тестовая таблица";

    МассивЛистов = Новый Массив;
    МассивЛистов.Добавить("Лист1");
    МассивЛистов.Добавить("Лист2");

    Результат = OPI_GoogleSheets.СоздатьКнигу(Токен, Наименование, МассивЛистов);
```



```sh title="Пример команды CLI"
    
  oint gsheets СоздатьКнигу --token %token% --title "Тестовая таблица" --sheets %sheets%

```

```json title="Результат"
{
 "spreadsheetId": "10X8iuovjxQu8ZmOZ-r1d9dO5bxLqh25FVttLvk2-Uzg",
 "properties": {
  "title": "Тестовая таблица",
  "locale": "ru_RU",
  "autoRecalc": "ON_CHANGE",
  "timeZone": "Etc/GMT",
  "defaultFormat": {
   "backgroundColor": {
    "red": 1,
    "green": 1,
    "blue": 1
   },
   "padding": {
    "top": 2,
    "right": 3,
    "bottom": 2,
    "left": 3
   },
   "verticalAlignment": "BOTTOM",
   "wrapStrategy": "OVERFLOW_CELL",
   "textFormat": {
    "foregroundColor": {},
    "fontFamily": "arial,sans,sans-serif",
    "fontSize": 10,
    "bold": false,
    "italic": false,
    "strikethrough": false,
    "underline": false,
    "foregroundColorStyle": {
     "rgbColor": {}
    }
   },
   "backgroundColorStyle": {
    "rgbColor": {
     "red": 1,
     "green": 1,
     "blue": 1
    }
   }
  },
  "spreadsheetTheme": {
   "primaryFontFamily": "Arial",
   "themeColors": [
    {
     "colorType": "TEXT",
     "color": {
      "rgbColor": {}
     }
    },
    {
     "colorType": "BACKGROUND",
     "color": {
      "rgbColor": {
       "red": 1,
       "green": 1,
       "blue": 1
      }
     }
    },
    {
     "colorType": "ACCENT1",
     "color": {
      "rgbColor": {
       "red": 0.25882354,
       "green": 0.52156866,
       "blue": 0.95686275
      }
     }
    },
    {
     "colorType": "ACCENT2",
     "color": {
      "rgbColor": {
       "red": 0.91764706,
       "green": 0.2627451,
       "blue": 0.20784314
      }
     }
    },
    {
     "colorType": "ACCENT3",
     "color": {
      "rgbColor": {
       "red": 0.9843137,
       "green": 0.7372549,
       "blue": 0.015686275
      }
     }
    },
    {
     "colorType": "ACCENT4",
     "color": {
      "rgbColor": {
       "red": 0.20392157,
       "green": 0.65882355,
       "blue": 0.3254902
      }
     }
    },
    {
     "colorType": "ACCENT5",
     "color": {
      "rgbColor": {
       "red": 1,
       "green": 0.42745098,
       "blue": 0.003921569
      }
     }
    },
    {
     "colorType": "ACCENT6",
     "color": {
      "rgbColor": {
       "red": 0.27450982,
       "green": 0.7411765,
       "blue": 0.7764706
      }
     }
    },
    {
     "colorType": "LINK",
     "color": {
      "rgbColor": {
       "red": 0.06666667,
       "green": 0.33333334,
       "blue": 0.8
      }
     }
    }
   ]
  }
 },
 "sheets": [
  {
   "properties": {
    "sheetId": 118631051,
    "title": "Лист1",
    "index": 0,
    "sheetType": "GRID",
    "gridProperties": {
     "rowCount": 1000,
     "columnCount": 26
    }
   }
  },
  {
   "properties": {
    "sheetId": 1715306798,
    "title": "Лист2",
    "index": 1,
    "sheetType": "GRID",
    "gridProperties": {
     "rowCount": 1000,
     "columnCount": 26
    }
   }
  }
 ],
 "spreadsheetUrl": "https://docs.google.com/spreadsheets/d/10X8iuovjxQu8ZmOZ-r1d9dO5bxLqh25FVttLvk2-Uzg/edit"
}
```
