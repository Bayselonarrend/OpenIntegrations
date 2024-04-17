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
// #Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область УправлениеИНастройки

Функция ПолучитьИнформациюОБоте(Знач Токен) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    
    URL       = "https://slack.com/api/auth.test";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Ответ = OPI_Инструменты.Get(URL, , Заголовки);
    
    Возврат Ответ;

КонецФункции

Функция ПолучитьСписокРабочихОбластей(Знач Токен) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    
    URL       = "https://slack.com/api/auth.teams.list";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Ответ = OPI_Инструменты.Get(URL, , Заголовки);
    
    Возврат Ответ;

КонецФункции


#КонецОбласти

#Область РаботаСЧатами

Функция ОтправитьСообщение(Знач Токен, Знач Канал, Знач Текст, Знач МассивБлоков = "") Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Канал);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Текст);
    
    ЕстьБлоки = ЗначениеЗаполнено(МассивБлоков);
    
    URL       = "https://slack.com/api/chat.postMessage";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    Параметры.Вставить("channel", Канал);
    Параметры.Вставить("text"   , Текст);
    
    Если ЕстьБлоки Тогда
        OPI_ПреобразованиеТипов.ПолучитьКоллекцию(МассивБлоков);
        Параметры.Вставить("blocks" , МассивБлоков);
    КонецЕсли;
    
    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);
    
    Возврат Ответ;
    
КонецФункции

Функция УдалитьСообщение(Знач Токен, Знач Канал, Знач Отметка) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Канал);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Отметка);
    
    URL       = "https://slack.com/api/chat.delete";
    Заголовки = ПолучитьЗаголовокАвторизации(Токен);
    
    Параметры = Новый Структура;
    Параметры.Вставить("channel", Канал);
    Параметры.Вставить("ts"     , Отметка);

    Ответ = OPI_Инструменты.Post(URL, Параметры, Заголовки);
    
    Возврат Ответ;

КонецФункции
    
#КонецОбласти

#Область ФормированиеБлоков

Функция СформироватьБлокКартинку(Знач URL, Знач АльтернативныйТекст = "") Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(URL);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(АльтернативныйТекст);
    
    Блок    = Новый Соответствие;
    
    Блок.Вставить("type"     , "image");
    Блок.Вставить("image_url", URL);
    Блок.Вставить("alt_text" , АльтернативныйТекст);
    
    Возврат Блок;
    
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