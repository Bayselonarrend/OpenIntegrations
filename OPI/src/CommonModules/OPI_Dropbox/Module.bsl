// Расположение OS: ./OInt/core/Modules/OPI_Dropbox.os
// Библиотека: Dropbox
// Команда CLI: dropbox

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

// BSLLS:IncorrectLineBreak-off

// Раскомментировать, если выполняется OneScript
// #Использовать "../../tools"

#Область ПрограммныйИнтерфейс

#Область РаботаСФайлами

Функция ЗагрузитьФайл(Знач Токен, Знач Файл, Знач Путь, Знач Перезаписывать = Ложь) Экспорт
    
    OPI_ПреобразованиеТипов.ПолучитьДвоичныеДанные(Файл);
    OPI_ПреобразованиеТипов.ПолучитьБулево(Перезаписывать);
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Путь);
    
    Режим     = ?(Перезаписывать, "overwrite", "add");
    Размер    = Файл.Размер();
    Граница   = 50000000;
        
    Если Размер > Граница Тогда
        Ответ = ЗагрузитьБольшойФайл(Токен, Файл, Путь, Режим);
    Иначе
        Ответ = ЗагрузитьМалыйФайл(Токен, Файл, Путь, Режим);
    КонецЕсли;
    
    Возврат Ответ;
    
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьЗаголовкиЗапроса(Знач Токен, Знач Параметры = "")
    
    OPI_ПреобразованиеТипов.ПолучитьСтроку(Токен);
        
    Заголовки = Новый Соответствие;
    Заголовки.Вставить("Authorization"  , "Bearer " + Токен);
    
    Если ЗначениеЗаполнено(Параметры) Тогда
        
        JSON = OPI_Инструменты.JSONСтрокой(Параметры, "Нет");
        JSON = СтрЗаменить(JSON, Символы.ВК + Символы.ПС, "");

        Заголовки.Вставить("Dropbox-API-Arg", JSON);
    
    КонецЕсли;
    
    Возврат Заголовки;
    
КонецФункции

Функция ЗагрузитьБольшойФайл(Знач Токен, Знач Файл, Знач Путь, Знач Режим)
    
    Заголовки = ПолучитьЗаголовкиЗапроса(Токен);
    
    Возврат "";
    
КонецФункции

Функция ЗагрузитьМалыйФайл(Знач Токен, Знач Файл, Знач Путь, Знач Режим)
    
    URL       = "https://content.dropboxapi.com/2/files/upload";
    
    Параметры = Новый Структура("autorename,mode,mute,path,strict_conflict", Ложь, Режим, Ложь, Путь, Ложь);    
    Заголовки = ПолучитьЗаголовкиЗапроса(Токен, Параметры);

    Ответ = OPI_Инструменты.PostBinary(URL, Файл, Заголовки);
    
    Возврат Ответ;
    
КонецФункции

#КонецОбласти