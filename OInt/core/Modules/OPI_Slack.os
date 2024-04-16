// MIT License

// Copyright (c) 2023 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off

// Раскомментировать, если выполняется OneScript
#Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область РаботаСЧатами

Функция ОтправитьСообщение(Знач Токен, Знач Канал, Знач Текст) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Канал);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Текст);
    
    URL       = "https://slack.com/api/chat.postMessage";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    Параметры.Вставить("channel", Канал);
    Параметры.Вставить("text"   , Текст);
    
    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);
    
    Возврат Ответ;
    
КонецФункции
    
#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьЗаголовокАвторизации(Знач Токен)

    Заголовки = Новый Соответствие;
    Заголовки.Вставить("Authorization", "Bearer " + Токен);
    Возврат Заголовки;
        
КонецФункции

#КонецОбласти
