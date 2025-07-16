// OneScript: ./OInt/core/Modules/OPI_FTP.os
// Lib: FTP
// CLI: ftp
// Keywords: ftp, ftps

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

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

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

#Область ПрограммныйИнтерфейс

#Область ОсновныеМетоды

// Открыть соединение !NOCLI
// Открывает FTP соединение с указанными настройками
// 
// Параметры:
//  НастройкиFTP - Структура Из КлючИЗначение - Настройки FTP. См. ПолучитьНастройкиFTP                       - set
//  Прокси       - Структура Из КлючИЗначение - Настройки прокси, если необходимо. См ПолучитьНастройкиПрокси - proxy
//  Tls          - Структура Из КлючИЗначение - Настройки TLS, если необходимо. См. ПолучитьНастройкиTls      - tls
//
// Возвращаемое значение:
//  Произвольный - Объект коннектора или соответствие с информацией об ошибке
Функция ОткрытьСоединение(Знач НастройкиFTP, Знач Прокси = Неопределено, Знач Tls = Неопределено) Экспорт
    
    Если ЭтоКоннектор(НастройкиFTP) Тогда
        Возврат НастройкиFTP;
    КонецЕсли;
        
    Коннектор = OPI_Компоненты.ПолучитьКомпоненту("FTP");
    
    УстановкаНастроек = УстановитьНастройкиFtp(Коннектор, НастройкиFTP);
    
    Если Не OPI_Инструменты.ПолучитьИли(УстановкаНастроек, "result", Ложь) Тогда
        Возврат УстановкаНастроек;
    КонецЕсли;
    
    Tls = OPI_Компоненты.УстановитьTls(Коннектор, Tls);

    Если Не OPI_Инструменты.ПолучитьИли(Tls, "result", Ложь) Тогда
        Возврат Tls;
    КонецЕсли;    
    
    УстановитьПрокси = УстановитьНастройкиПрокси(Коннектор, Прокси);

    Если Не OPI_Инструменты.ПолучитьИли(УстановитьПрокси, "result", Ложь) Тогда
        Возврат УстановитьПрокси;
    КонецЕсли; 
    
    Результат = Коннектор.Connect();
    Результат = OPI_Инструменты.JSONВСтруктуру(Результат);
    
    Возврат Результат;
        
КонецФункции

// Это коннектор !NOCLI
// Проверяет, что значение является объектом внешней компоненты для работы с FTP
//
// Параметры:
//  Значение - Произвольный - Значение для проверки - value
//
// Возвращаемое значение:
//  Булево -  Это коннектор
Функция ЭтоКоннектор(Знач Значение) Экспорт

    Возврат Строка(ТипЗнч(Значение)) = "AddIn.OPI_FTP.Main";

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция УстановитьНастройкиFtp(Знач Коннектор, Знач НастройкиFTP)

    ТекстОшибки = "Настройки FTP не являются валидной структурой ключ-значение";
    Настройки   = НастройкиВJson(НастройкиFTP, ТекстОшибки);
    
    Если ТипЗнч(Настройки) = Тип("Соответствие") Тогда
        Возврат Настройки;
    КонецЕсли;
    
    Результат = Коннектор.UpdateSettings(Настройки);
    Результат = OPI_Инструменты.JsonВСтруктуру(Результат);
    
    Возврат Результат;
        
КонецФункции

Функция УстановитьНастройкиПрокси(Знач Коннектор, Знач НастройкиПрокси)

    Если НастройкиПрокси = Неопределено Тогда
        Результат = Новый Соответствие;
        Результат.Вставить("result", Истина);
        Возврат Результат;
    КонецЕсли;
    
    ТекстОшибки = "Настройки прокси не являются валидной структурой ключ-значение";
    Настройки   = НастройкиВJson(НастройкиПрокси, ТекстОшибки);
    
    Если ТипЗнч(Настройки) = Тип("Соответствие") Тогда
        Возврат Настройки;
    КонецЕсли;
    
    Результат = Коннектор.UpdateProxy(Настройки);
    Результат = OPI_Инструменты.JsonВСтруктуру(Результат);
    
    Возврат Результат;
        
КонецФункции

Функция НастройкиВJson(Знач Коллекция, Знач ТекстОшибки)
    
    OPI_ПреобразованиеТипов.ПолучитьКоллекциюКлючИЗначение(Коллекция);
    
    Попытка 
        Результат = OPI_Инструменты.JSONСтрокой(Коллекция);
    Исключение
        
        Результат = Новый Соответствие;
        Результат.Вставить("result", Ложь);
        Результат.Вставить("error" , "Настройки FTP должны содержать только сериализуемые значения");
        
    КонецПопытки;
    
    Возврат Результат;
    
КонецФункции

#КонецОбласти
