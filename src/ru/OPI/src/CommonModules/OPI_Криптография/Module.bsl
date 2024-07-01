// OneScript: ./OInt/tools/Modules/internal/Modules/OPI_Криптография.os

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
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Область СлужебныйПрограммныйИнтерфейс

#Область БСП

///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

Функция HMACSHA256(Знач Ключ, Знач Данные) Экспорт
    
    Возврат HMAC(Ключ, Данные, ХешФункция.SHA256, 64);
    
КонецФункции

Функция Хеш(ДвоичныеДанные, Тип) Экспорт
    
    Хеширование = Новый ХешированиеДанных(Тип);
    Хеширование.Добавить(ДвоичныеДанные);
    
    Возврат Хеширование.ХешСумма;
        
КонецФункции

Функция HMAC(Знач Ключ, Знач Данные, Тип, РазмерБлока) Экспорт
    
    Дважды = 2;
    
    Если Ключ.Размер() > РазмерБлока Тогда
        Ключ = Хеш(Ключ, Тип);
    КонецЕсли;
    
    Если Ключ.Размер() <= РазмерБлока Тогда
        Ключ = ПолучитьHexСтрокуИзДвоичныхДанных(Ключ);
        Ключ = Лев(Ключ + ПовторитьСтроку("00", РазмерБлока), РазмерБлока * Дважды);
    КонецЕсли;
    
    Ключ = ПолучитьБуферДвоичныхДанныхИзДвоичныхДанных(ПолучитьДвоичныеДанныеИзHexСтроки(Ключ));
    
    Ipad = ПолучитьБуферДвоичныхДанныхИзHexСтроки(ПовторитьСтроку("36", РазмерБлока));
    Opad = ПолучитьБуферДвоичныхДанныхИзHexСтроки(ПовторитьСтроку("5c", РазмерБлока));
    
    Ipad.ЗаписатьПобитовоеИсключительноеИли(0, Ключ);
    Ikeypad = ПолучитьДвоичныеДанныеИзБуфераДвоичныхДанных(ipad);
    
    Opad.ЗаписатьПобитовоеИсключительноеИли(0, Ключ);
    Okeypad = ПолучитьДвоичныеДанныеИзБуфераДвоичныхДанных(opad);
    
    Возврат Хеш(СклеитьДвоичныеДанные(okeypad, Хеш(СклеитьДвоичныеДанные(ikeypad, Данные), Тип)), Тип);
    
КонецФункции

Функция СклеитьДвоичныеДанные(ДвоичныеДанные1, ДвоичныеДанные2) Экспорт
    
    МассивДвоичныхДанных = Новый Массив;
    МассивДвоичныхДанных.Добавить(ДвоичныеДанные1);
    МассивДвоичныхДанных.Добавить(ДвоичныеДанные2);
    
    Возврат СоединитьДвоичныеДанные(МассивДвоичныхДанных);
    
КонецФункции

Функция ПовторитьСтроку(Строка, Количество) Экспорт
    
    Части = Новый Массив(Количество);
    
    Для К = 1 По Количество Цикл
        Части.Добавить(Строка);
    КонецЦикла;

    Возврат СтрСоединить(Части, "");
    
КонецФункции

#КонецОбласти

#КонецОбласти
