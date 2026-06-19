// OneScript: ./OInt/formats/7z/Modules/OPI_7z.os
// Lib: 7z
// CLI: 7z
// Keywords: 7z, 7-Zip

// DocsCategory: Formats
// DocsNameRU: 7z
// DocsNameEN: 7z

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

#Использовать "../../../tools/main"
#Использовать "../../../tools/http"


#Область ПрограммныйИнтерфейс

#Область Архивация

// Архивировать каталог
// Запаковывает файлы указанного каталога в архив
//
// Параметры:
//  Каталог    - Строка                        - Путь к каталогу для запаковки                                  - src
//  ПутьАрхива - Строка                        - Путь сохранения архива. Как двоичные данные, если не заполнено - dest
//  Настройки  - Соответствие Из КлючИЗначение - Доп. настройки. См. ПолучитьСтруктуруНастроекАрхивации         - settings
//
// Возвращаемое значение:
//  ДвоичныеДанные, Соответствие Из КлючИЗначение - Информация о выполнении или двоичные данные архива
Функция АрхивироватьКаталог(Знач Каталог, Знач ПутьАрхива = "", Знач Настройки = Неопределено) Экспорт

    Возврат OPI_УниверсальныйАрхиватор.АрхивироватьКаталог("7z", Каталог, ПутьАрхива, Настройки);

КонецФункции

// Разархивировать каталог
// Распаковывает 7z-архив в указанный каталог
//
// Параметры:
//  ПутьАрхива        - Строка - Путь к архиву                 - src
//  КаталогНазначения - Строка - Путь каталога для распаковки  - dest
//  Пароль            - Строка - Пароль архива, если требуется - password
//
// Возвращаемое значение:
//  Соответствие Из КлючИЗначение - Информация о выполнении
Функция РазархивироватьКаталог(Знач ПутьАрхива, Знач КаталогНазначения, Знач Пароль = "") Экспорт

    Возврат OPI_УниверсальныйАрхиватор.РазархивироватьКаталог("7z", ПутьАрхива, КаталогНазначения, Пароль);

КонецФункции

// Получить структуру настроек архивации
// Получает структуру с дополнительными настройками архивации данных
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

    СтруктураНастроек.Вставить("password"         , "<пароль архива, если необходимо>");
    СтруктураНастроек.Вставить("method"           , "<метод сжатия: Lzma2 (по ум.), Lzma, Bzip2, Ppmd, Copy>");
    СтруктураНастроек.Вставить("level"            , "<уровень сжатия: 0-9 (6 по ум.)>");
    СтруктураНастроек.Вставить("solid"            , "<сжатие одним потоком: Истина/Ложь (по ум.)>");
    СтруктураНастроек.Вставить("encrypt_header"   , "<шифровать заголовок: Истина (по ум., при наличии пароля)/Ложь>");
    СтруктураНастроек.Вставить("threads"          , "<число потоков LZMA2 (по ум. 1)>");
    СтруктураНастроек.Вставить("chunk_size"       , "<размер чанка при threads > 1>");
    СтруктураНастроек.Вставить("dictionary_size"  , "<размер словаря LZMA2>");
    СтруктураНастроек.Вставить("ppmd_order "      , "<порядок модели (для Ppmd)>");
    СтруктураНастроек.Вставить("ppmd_memory "     , "<память в байтах (для Ppmd)>");
    СтруктураНастроек.Вставить("filters"          , "<массив фильтров: X86, PPC, IA64, ARM, ARM64, ARM_THUMB, SPARC, RISCV, DELTA>");
    СтруктураНастроек.Вставить("delta_distance"   , "<расстояние для фильтра DELTA, если используется (по ум. 1)>");

    Если Пустая Тогда
        СтруктураНастроек = OPI_Инструменты.ОчиститьКоллекциюРекурсивно(СтруктураНастроек);
    КонецЕсли;

    //@skip-check constructor-function-return-section
    Возврат СтруктураНастроек;

КонецФункции

#КонецОбласти

#КонецОбласти


#Region Alternate

Function ArchiveDirectory(Val Directory, Val ArchivePath = "", Val Settings = Undefined) Export
    Return АрхивироватьКаталог(Directory, ArchivePath, Settings);
EndFunction

Function UnarchiveDirectory(Val ArchivePath, Val DestinationDirectory, Val Password = "") Export
    Return РазархивироватьКаталог(ArchivePath, DestinationDirectory, Password);
EndFunction

Function GetArchivingSettingsStructure(Val Clear = False, Val AsMap = False) Export
    Return ПолучитьСтруктуруНастроекАрхивации(Clear, AsMap);
EndFunction

#EndRegion