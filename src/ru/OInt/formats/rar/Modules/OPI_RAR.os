// OneScript: ./OInt/formats/rar/Modules/OPI_RAR.os
// Lib: rar
// CLI: rar
// Keywords: rar, unrar

// DocsCategory: Formats
// DocsNameRU: rar
// DocsNameEN: rar

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

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
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:LineLength-off
// BSLLS:CommonModuleNameClientServer-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Область ПрограммныйИнтерфейс

#Область Разархивирование

// Разархивировать каталог
// Распаковывает RAR-архив в указанный каталог
//
// Параметры:
//  Архив             - Строка, ДвоичныеДанные - Путь к архиву на диске или двоичные данные                      - src
//  КаталогНазначения - Строка                 - Путь каталога для распаковки. В соответствие, если не заполнено - dest
//  Пароль            - Строка                 - Пароль архива, если требуется                                   - password
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Информация о выполнении
Функция РазархивироватьКаталог(Знач Архив, Знач КаталогНазначения = "", Знач Пароль = "") Экспорт

    Возврат OPI_УниверсальныйАрхиватор.Разархивировать("rar", Архив, КаталогНазначения, Пароль);

КонецФункции

// Разархивировать файлы
// Распаковывает выбранные файлы из RAR-архива по списку путей
//
// Параметры:
//  Архив             - Строка, ДвоичныеДанные - Путь к архиву на диске или двоичные данные                      - src
//  Пути              - Массив Из Строка       - Полные пути файлов внутри архива                                - paths
//  КаталогНазначения - Строка                 - Путь каталога для распаковки. В соответствие, если не заполнено - dest
//  Пароль            - Строка                 - Пароль архива, если требуется                                   - password
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Информация о выполнении или описание выбранных файлов
Функция РазархивироватьФайлы(Знач Архив, Знач Пути, Знач КаталогНазначения = "", Знач Пароль = "") Экспорт

    Возврат OPI_УниверсальныйАрхиватор.РазархивироватьФайлы("rar", Архив, Пути, КаталогНазначения, Пароль);

КонецФункции

// Получить структуру настроек архивации
// Получает структуру с дополнительными настройками распаковки
//
// Параметры:
//  Пустая          - Булево - Истина > структура с пустыми значениями, Ложь > в значениях будут описания полей - empty
//  КакСоответствие - Булево - Истина > возвращает поля фильтра как соответствие                                - map
//
// Возвращаемое значение:
//  Структура Из КлючИЗначение - Структура полей
Функция ПолучитьСтруктуруНастроекАрхивации(Знач Пустая = Ложь, Знач КакСоответствие = Ложь) Экспорт

    OPI_ПреобразованиеТипов.ПолучитьБулево(Пустая);
    OPI_ПреобразованиеТипов.ПолучитьБулево(КакСоответствие);

    Если КакСоответствие Тогда
        СтруктураНастроек = Новый Соответствие;
    Иначе
        СтруктураНастроек = Новый Структура;
    КонецЕсли;

    СтруктураНастроек.Вставить("password", "<пароль архива, если необходимо>");

    Если Пустая Тогда
        СтруктураНастроек = OPI_Инструменты.ОчиститьКоллекциюРекурсивно(СтруктураНастроек);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураНастроек;

КонецФункции

#КонецОбласти

#Область ПолучениеМетаданных

// Получить список файлов
// Получает иерархический список файлов и каталогов архива
//
// Параметры:
//  Архив  - Строка, ДвоичныеДанные - Путь к архиву на диске или двоичные данные - src
//  Пароль - Строка                 - Пароль архива, если требуется              - password
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Информация о файлах в архиве
Функция ПолучитьСписокФайлов(Знач Архив, Знач Пароль = "") Экспорт

    Возврат OPI_УниверсальныйАрхиватор.ПолучитьСписокФайлов("rar", Архив, Пароль);

КонецФункции

// Получить метаданные
// Получает метаданные и плоский список файлов архива
//
// Параметры:
//  Архив  - Строка, ДвоичныеДанные - Путь к архиву на диске или двоичные данные - src
//  Пароль - Строка                 - Пароль архива, если требуется              - password
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Информация об архиве
Функция ПолучитьМетаданные(Знач Архив, Знач Пароль = "") Экспорт

    Возврат OPI_УниверсальныйАрхиватор.ПолучитьМетаданные("rar", Архив, Пароль);

КонецФункции

#КонецОбласти

#КонецОбласти


#Region Alternate

Function UnarchiveDirectory(Val Archive, Val DestinationDirectory = "", Val Password = "") Export
    Return РазархивироватьКаталог(Archive, DestinationDirectory, Password);
EndFunction

Function UnpackFiles(Val Archive, Val Paths, Val DestinationDirectory = "", Val Password = "") Export
    Return РазархивироватьФайлы(Archive, Paths, DestinationDirectory, Password);
EndFunction

Function GetArchivingSettingsStructure(Val Clear = False, Val AsMap = False) Export
    Return ПолучитьСтруктуруНастроекАрхивации(Clear, AsMap);
EndFunction

Function GetFilesList(Val Archive, Val Password = "") Export
    Return ПолучитьСписокФайлов(Archive, Password);
EndFunction

Function GetMetadata(Val Archive, Val Password = "") Export
    Return ПолучитьМетаданные(Archive, Password);
EndFunction

#EndRegion