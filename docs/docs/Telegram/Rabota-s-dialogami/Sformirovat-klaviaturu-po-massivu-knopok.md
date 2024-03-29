---
sidebar_position: 12
---

# Сформировать клавиатуру по массиву кнопок
Формирует простую JSON клавиатуру из массив кнопок для сообщения или нижней панели


*Функция СформироватьКлавиатуруПоМассивуКнопок(Знач МассивКнопок, Знач ПодСообщением = Ложь, Знач ОднаПодОдной = Истина) Экспорт*

  | Параметр | Тип | Назначение |
  |-|-|-|
  | МассивКнопок | Массив из Строка | Массив кнопок |
  | ПодСообщением | Булево (необяз.) | Истина - кнопки будут прикреплены под сообщением, Ложь - в виде клавиатуры на нижней панели. По умолчанию - Ложь |
  | ОднаПодОдной | Булево (необяз.) | Истина - кнопки выводятся одна под одной, Ложь - в строку друг за другом. По умолчанию - Истина|
  | Клавиатура | Строка (необяз.) | JSON клавиатуры. См.Сформировать клавиатуру по массиву кнопок |
  
  Вовзращаемое значение: Строка - JSON клавиатуры


```bsl title="Пример кода"
	
	МассивКнопок = Новый Массив;
	МассивКнопок.Добавить("Отлично");
	МассивКнопок.Добавить("Нормально");
	МассивКнопок.Добавить("Плохо");
	
	Клавиатура = OPI_Telegram.СформироватьКлавиатуруПоМассивуКнопок(МассивКнопок, Истина, Истина); 
	
```



```json title="Результат"

{
   "inline_keyboard":[
      [
         {
            "text":"\u041E\u0442\u043B\u0438\u0447\u043D\u043E",
            "callback_data":"\u041E\u0442\u043B\u0438\u0447\u043D\u043E"
         }
      ],
      [
         {
            "text":"\u041D\u043E\u0440\u043C\u0430\u043B\u044C\u043D\u043E",
            "callback_data":"\u041D\u043E\u0440\u043C\u0430\u043B\u044C\u043D\u043E"
         }
      ],
      [
         {
            "text":"\u041F\u043B\u043E\u0445\u043E",
            "callback_data":"\u041F\u043B\u043E\u0445\u043E"
         }
      ]
   ],
   "rows":1
}

```
