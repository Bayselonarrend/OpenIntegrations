// OneScript: ./OInt/tests/Modules/OPIt_Core.os

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

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UnusedParameters-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:UsingHardcodePath-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:DeprecatedMessage-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off
// BSLLS:CommentedCode-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UnreachableCode-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:NestedFunctionInParameters-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:MagicDate-off
// BSLLS:MissingParameterDescription-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:MethodSize-off
// BSLLS:NestedConstructorsInStructureDeclaration-off
// BSLLS:NumberOfValuesInStructureConstructor-off
// BSLLS:UsingHardcodeSecretInformation-off
// BSLLS:SpaceAtStartComment-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

#Использовать oint
#Использовать asserts
#Использовать "internal"

// Для YaxUnit

Процедура ИсполняемыеСценарии() Экспорт

    OPI_СписокТестовКлиентСервер.СформироватьТестыЯкс("Core");

КонецПроцедуры

// Для Asserts

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт

    Возврат OPI_ПолучениеДанныхТестов.СформироватьТестыАссертс("Core");

КонецФункции

#Область СлужебныйПрограммныйИнтерфейс

#Область ЗапускаемыеТесты

Процедура ПроверитьСоответствиеИБПоследнейСборке() Экспорт

    СуммаСборки = OPI_Инструменты.ПолучитьХешСуммуПоследнейСборки();

    URL = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/refs/heads/main/service/last_build_hash.txt";

    СуммаПоследний = OPI_ЗапросыHTTP
        .НовыйЗапрос()
        .Инициализировать(URL)
        .ОбработатьЗапрос("GET")
        .ВернутьОтветКакСтроку(Ложь, Истина);

    OPI_ПолучениеДанныхТестов.Обработать(СуммаСборки, "Core", "ПроверитьСоответствиеИБПоследнейСборке", , СуммаПоследний);

КонецПроцедуры

Процедура ПроверитьРасширенныйВызов() Экспорт

    ПараметрыТеста = Новый Структура;
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Telegram_Token" , ПараметрыТеста);
    OPI_ПолучениеДанныхТестов.ПараметрВКоллекцию("Telegram_FileID", ПараметрыТеста);

    РасширенныйВызов_ВызватьСНастройками(ПараметрыТеста);
    РасширенныйВызов_ПолучитьДоступныеНастройки();
    РасширенныйВызов_ВызовВФЗ(ПараметрыТеста);

КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область АтомарныеТесты

Процедура РасширенныйВызов_ВызватьСНастройками(ПараметрыФункции)

    Токен = ПараметрыФункции["Telegram_Token"];

    Параметры = Новый Массив;
    Параметры.Добавить(Токен);

    Настройки = Новый Структура("adv_response", Истина);

    Результат = OPI_РасширенныйВызов.ВызватьСНастройками("OPI_Telegram"
        , "ПолучитьИнформациюБота"
        , Параметры
        , Настройки);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Core", "ВызватьСНастройками");

КонецПроцедуры

Процедура РасширенныйВызов_ПолучитьДоступныеНастройки()

    Результат = OPI_РасширенныйВызов.ПолучитьДоступныеНастройки("OPI_Telegram", "ПолучитьИнформациюБота");

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Core", "ПолучитьДоступныеНастройки");

КонецПроцедуры

Процедура РасширенныйВызов_ВызовВФЗ(ПараметрыФункции)

    Токен   = ПараметрыФункции["Telegram_Token"];
    IDФайла = ПараметрыФункции["Telegram_FileID"];

    Параметры = Новый Массив;
    Параметры.Добавить(Токен);

    Настройки = Новый Структура("adv_response, dontwait"
        , Истина
        , Истина);

    Результат = OPI_РасширенныйВызов.ВызватьСНастройками("OPI_Telegram"
        , "ПолучитьИнформациюБота"
        , Параметры
        , Настройки);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Core", "ВызовВФЗ");

    Параметры = Новый Массив;
    Параметры.Добавить(Токен);
    Параметры.Добавить(IDФайла);

    Настройки = Новый Структура("dontwait", Истина);

    Результат = OPI_РасширенныйВызов.ВызватьСНастройками("OPI_Telegram"
        , "СкачатьФайл"
        , Параметры
        , Настройки);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Core", "ВызовВФЗ", "ВозвратДД");

    Настройки = Новый Структура("adv_response, dontwait"
        , Истина
        , Истина);

    Результат = OPI_РасширенныйВызов.ВызватьСНастройками("OPI_Telegram"
        , "СкачатьФайл"
        , Параметры
        , Настройки);

    OPI_ПолучениеДанныхТестов.Обработать(Результат, "Core", "ВызовВФЗ", "ВозвратДДСтруктура");

КонецПроцедуры

#КонецОбласти

#КонецОбласти



#Region Alternate

Procedure CheckIBToLastBuildCompliance() Export
    ПроверитьСоответствиеИБПоследнейСборке();
EndProcedure

Procedure ValidateAdvancedCall() Export
    ПроверитьРасширенныйВызов();
EndProcedure

#EndRegion