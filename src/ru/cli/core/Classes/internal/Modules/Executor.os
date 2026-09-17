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

#Использовать "../../../../../oint/tools/main"
#Использовать "../../../../../oint/tools/http"

Перем КонтекстВыполнения;

Функция ПолучитьХешСуммуПоследнейСборки() Экспорт
	Возврат OPI_Инструменты.ПолучитьХешСуммуПоследнейСборки();
КонецФункции

Процедура ВыполнитьСкрипт(Знач Скрипт, Ответ, Знач Конфигурация = Неопределено, Знач Контекст = Неопределено) Экспорт
	
	Если КонтекстВыполнения = Неопределено Тогда
		КонтекстВыполнения = Новый Соответствие;
	КонецЕсли;
	
	НормализованныеНастройки = OPI_РасширенныйВызов.НормализоватьНастройки(Конфигурация);
	ЕстьКонтекст             = Контекст <> Неопределено;
	
	Если ЕстьКонтекст Тогда
		UUIDКонтекста = ПрименитьКонтекст(Скрипт, Контекст);
	КонецЕсли;
	
	OPI_РасширенныйВызов.УстановитьНастройки(НормализованныеНастройки);
	Выполнить(Скрипт);
	OPI_РасширенныйВызов.УдалитьНастройки();
	
	Если ЕстьКонтекст Тогда
		КонтекстВыполнения.Удалить(UUIDКонтекста);
	КонецЕсли;

КонецПроцедуры

Функция ПрименитьКонтекст(Скрипт, Знач Контекст)
	
	UUID = Строка(Новый УникальныйИдентификатор);
	КонтекстВыполнения.Вставить(UUID, Контекст);

	ШаблонПеременной     = СтрШаблон("КонтекстВыполнения[""%1""][""%%1""]", UUID);
	ШаблонИдентификатора = """%1""";
	
	Для Каждого ПеременнаяКонтекста Из Контекст Цикл
		
		Скрипт = СтрЗаменить(Скрипт
			, СтрШаблон(ШаблонИдентификатора, ПеременнаяКонтекста.Ключ)
			, СтрШаблон(ШаблонПеременной, ПеременнаяКонтекста.Ключ));
			
	КонецЦикла;
		
	Возврат UUID;

КонецФункции