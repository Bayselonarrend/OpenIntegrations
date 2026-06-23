//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check bsl-legacy-check-string-length

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)

	ЛогоBase64 = ПолучитьЛоготипBase64();

	ФормаHTML = Обработки.OPI_HTMLФорма.Создать().Инициализировать();
	ПодключитьСтилиПанели(ФормаHTML);
	СобратьHTMLПанели(ФормаHTML, ЛогоBase64);

	HTML = ФормаHTML.СгенерироватьHTML();

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Функция ПолучитьЛоготипBase64()

	ЛогоДвоичные = БиблиотекаКартинок.OPI_Logo.ПолучитьДвоичныеДанные();
	ЛогоBase64   = ПолучитьBase64СтрокуИзДвоичныхДанных(ЛогоДвоичные);

	Возврат СтрШаблон("data:image/jpeg;base64,%1", ЛогоBase64);

КонецФункции

&НаСервере
Процедура ПодключитьСтилиПанели(ФормаHTML)

	ФормаHTML
		.УстановитьАтрибутHtml("lang", "ru")
		.УстановитьАтрибутBody("class", "opi-panel")
		.УстановитьСвойствоКласса(".opi-panel", "margin", "0")
		.УстановитьСвойствоКласса(".opi-panel", "padding", "12px")
		.УстановитьСвойствоКласса(".opi-panel", "font-family", "-apple-system, system-ui, ""Segoe UI"", Helvetica, Arial, sans-serif")
		.УстановитьСвойствоКласса(".opi-panel", "font-size", "14px")
		.УстановитьСвойствоКласса(".opi-panel", "line-height", "1.5")
		.УстановитьСвойствоКласса(".opi-panel", "color", "#333333")
		.УстановитьСвойствоКласса(".opi-panel", "background", "#ffffff")
		.УстановитьСвойствоКласса(".opi-panel", "box-sizing", "border-box")
		.УстановитьСвойствоКласса(".opi-panel *, .opi-panel *::before, .opi-panel *::after", "box-sizing", "border-box")
		.УстановитьСвойствоКласса(".opi-shell", "max-width", "960px")
		.УстановитьСвойствоКласса(".opi-shell", "margin", "0 auto")
		.УстановитьСвойствоКласса(".opi-shell", "background", "#ffffff")
		.УстановитьСвойствоКласса(".opi-shell", "border", "1px solid #dddddd")
		.УстановитьСвойствоКласса(".opi-shell", "border-radius", "12px")
		.УстановитьСвойствоКласса(".opi-shell", "box-shadow", "inset 0 1px 3px rgba(255, 255, 255, 0.7), 0 4px 8px rgba(0, 0, 0, 0.1)")
		.УстановитьСвойствоКласса(".opi-shell", "overflow", "hidden")
		.УстановитьСвойствоКласса(".opi-header", "padding", "20px 24px 16px")
		.УстановитьСвойствоКласса(".opi-header", "border-bottom", "1px solid rgba(27, 31, 35, 0.08)")
		.УстановитьСвойствоКласса(".opi-header__wrap", "display", "flex")
		.УстановитьСвойствоКласса(".opi-header__wrap", "align-items", "flex-start")
		.УстановитьСвойствоКласса(".opi-header__icon", "width", "3.4rem")
		.УстановитьСвойствоКласса(".opi-header__icon", "height", "3.4rem")
		.УстановитьСвойствоКласса(".opi-header__icon", "flex-shrink", "0")
		.УстановитьСвойствоКласса(".opi-header__icon", "color", "#004943")
		.УстановитьСвойствоКласса(".opi-header__icon", "margin-right", "1.5rem")
		.УстановитьСвойствоКласса(".opi-header__title", "margin", "0")
		.УстановитьСвойствоКласса(".opi-header__title", "font-size", "1.5rem")
		.УстановитьСвойствоКласса(".opi-header__title", "font-weight", "350")
		.УстановитьСвойствоКласса(".opi-header__title", "color", "#000000")
		.УстановитьСвойствоКласса(".opi-header__title", "line-height", "1.2")
		.УстановитьСвойствоКласса(".opi-header__subtitle", "margin", "0.1rem 0 0")
		.УстановитьСвойствоКласса(".opi-header__subtitle", "font-size", "13px")
		.УстановитьСвойствоКласса(".opi-header__subtitle", "font-weight", "300")
		.УстановитьСвойствоКласса(".opi-header__subtitle", "color", "#555555")
		.УстановитьСвойствоКласса(".opi-header__subtitle", "line-height", "1.35")
		.УстановитьСвойствоКласса(".opi-tabs", "display", "flex")
		.УстановитьСвойствоКласса(".opi-tabs", "padding", "0 16px")
		.УстановитьСвойствоКласса(".opi-tabs", "border-bottom", "1px solid rgba(27, 31, 35, 0.08)")
		.УстановитьСвойствоКласса(".opi-tabs", "background", "#ffffff")
		.УстановитьСвойствоКласса(".opi-tab", "display", "inline-flex")
		.УстановитьСвойствоКласса(".opi-tab", "align-items", "center")
		.УстановитьСвойствоКласса(".opi-tab", "padding", "0.52rem 0.75rem")
		.УстановитьСвойствоКласса(".opi-tab", "margin", "0")
		.УстановитьСвойствоКласса(".opi-tab", "border", "none")
		.УстановитьСвойствоКласса(".opi-tab", "border-bottom", "2px solid transparent")
		.УстановитьСвойствоКласса(".opi-tab", "background", "transparent")
		.УстановитьСвойствоКласса(".opi-tab", "color", "#666666")
		.УстановитьСвойствоКласса(".opi-tab", "font-weight", "350")
		.УстановитьСвойствоКласса(".opi-tab", "cursor", "pointer")
		.УстановитьСвойствоКласса(".opi-tab:hover", "color", "#004943")
		.УстановитьСвойствоКласса(".opi-tab-input", "position", "absolute")
		.УстановитьСвойствоКласса(".opi-tab-input", "opacity", "0")
		.УстановитьСвойствоКласса(".opi-tab-input", "pointer-events", "none")
		.УстановитьСвойствоКласса(".opi-main", "padding", "24px")
		.УстановитьСвойствоКласса(".opi-main", "min-height", "320px")
		.УстановитьСвойствоКласса(".opi-tab-panel", "display", "none")
		.УстановитьСвойствоКласса("#opi-tab-main:checked ~ .opi-main .opi-tab-panel[data-tab=""main""]", "display", "block")
		.УстановитьСвойствоКласса("#opi-tab-addins:checked ~ .opi-main .opi-tab-panel[data-tab=""addins""]", "display", "block")
		.УстановитьСвойствоКласса("#opi-tab-main:checked ~ .opi-tabs label[for=""opi-tab-main""]", "color", "#000000")
		.УстановитьСвойствоКласса("#opi-tab-main:checked ~ .opi-tabs label[for=""opi-tab-main""]", "border-bottom-color", "#004943")
		.УстановитьСвойствоКласса("#opi-tab-main:checked ~ .opi-tabs label[for=""opi-tab-main""]", "font-weight", "400")
		.УстановитьСвойствоКласса("#opi-tab-addins:checked ~ .opi-tabs label[for=""opi-tab-addins""]", "color", "#000000")
		.УстановитьСвойствоКласса("#opi-tab-addins:checked ~ .opi-tabs label[for=""opi-tab-addins""]", "border-bottom-color", "#004943")
		.УстановитьСвойствоКласса("#opi-tab-addins:checked ~ .opi-tabs label[for=""opi-tab-addins""]", "font-weight", "400")
		.УстановитьСвойствоКласса(".opi-hero", "display", "flex")
		.УстановитьСвойствоКласса(".opi-hero", "flex-direction", "column")
		.УстановитьСвойствоКласса(".opi-hero", "align-items", "center")
		.УстановитьСвойствоКласса(".opi-hero", "text-align", "center")
		.УстановитьСвойствоКласса(".opi-hero", "gap", "8px")
		.УстановитьСвойствоКласса(".opi-hero", "padding", "8px 0 20px")
		.УстановитьСвойствоКласса(".opi-logo", "width", "96px")
		.УстановитьСвойствоКласса(".opi-logo", "height", "96px")
		.УстановитьСвойствоКласса(".opi-logo", "border-radius", "20px")
		.УстановитьСвойствоКласса(".opi-logo", "background", "linear-gradient(145deg, #f0f7f6, #ffffff)")
		.УстановитьСвойствоКласса(".opi-logo", "border", "1px solid rgba(0, 73, 67, 0.12)")
		.УстановитьСвойствоКласса(".opi-logo", "display", "flex")
		.УстановитьСвойствоКласса(".opi-logo", "align-items", "center")
		.УстановитьСвойствоКласса(".opi-logo", "justify-content", "center")
		.УстановитьСвойствоКласса(".opi-logo", "overflow", "hidden")
		.УстановитьСвойствоКласса(".opi-logo img", "width", "72px")
		.УстановитьСвойствоКласса(".opi-logo img", "height", "72px")
		.УстановитьСвойствоКласса(".opi-logo img", "object-fit", "contain")
		.УстановитьСвойствоКласса(".opi-hero__title", "margin", "8px 0 0")
		.УстановитьСвойствоКласса(".opi-hero__title", "font-size", "1.65rem")
		.УстановитьСвойствоКласса(".opi-hero__title", "font-weight", "350")
		.УстановитьСвойствоКласса(".opi-hero__title", "color", "#000000")
		.УстановитьСвойствоКласса(".opi-hero__tagline", "margin", "0")
		.УстановитьСвойствоКласса(".opi-hero__tagline", "max-width", "520px")
		.УстановитьСвойствоКласса(".opi-hero__tagline", "font-size", "0.95rem")
		.УстановитьСвойствоКласса(".opi-hero__tagline", "font-weight", "300")
		.УстановитьСвойствоКласса(".opi-hero__tagline", "color", "#666666")
		.УстановитьСвойствоКласса(".opi-version-badge", "display", "inline-block")
		.УстановитьСвойствоКласса(".opi-version-badge", "margin-top", "4px")
		.УстановитьСвойствоКласса(".opi-version-badge", "padding", "4px 10px")
		.УстановитьСвойствоКласса(".opi-version-badge", "border", "1px solid #004943")
		.УстановитьСвойствоКласса(".opi-version-badge", "border-radius", "16px")
		.УстановитьСвойствоКласса(".opi-version-badge", "background", "#ffffff")
		.УстановитьСвойствоКласса(".opi-version-badge", "font-size", "0.85rem")
		.УстановитьСвойствоКласса(".opi-version-badge", "font-weight", "400")
		.УстановитьСвойствоКласса(".opi-version-badge", "white-space", "nowrap")
		.УстановитьСвойствоКласса(".opi-actions", "display", "flex")
		.УстановитьСвойствоКласса(".opi-actions", "flex-wrap", "wrap")
		.УстановитьСвойствоКласса(".opi-actions", "gap", "10px")
		.УстановитьСвойствоКласса(".opi-actions", "justify-content", "center")
		.УстановитьСвойствоКласса(".opi-actions", "margin-top", "16px")
		.УстановитьСвойствоКласса(".opi-button", "appearance", "none")
		.УстановитьСвойствоКласса(".opi-button", "display", "inline-flex")
		.УстановитьСвойствоКласса(".opi-button", "align-items", "center")
		.УстановитьСвойствоКласса(".opi-button", "justify-content", "center")
		.УстановитьСвойствоКласса(".opi-button", "min-height", "34px")
		.УстановитьСвойствоКласса(".opi-button", "padding", "6px 16px")
		.УстановитьСвойствоКласса(".opi-button", "border", "1px solid rgba(27, 31, 35, 0.15)")
		.УстановитьСвойствоКласса(".opi-button", "border-radius", "16px")
		.УстановитьСвойствоКласса(".opi-button", "background", "#ffffff")
		.УстановитьСвойствоКласса(".opi-button", "color", "#24292e")
		.УстановитьСвойствоКласса(".opi-button", "font-size", "14px")
		.УстановитьСвойствоКласса(".opi-button", "font-weight", "400")
		.УстановитьСвойствоКласса(".opi-button", "line-height", "20px")
		.УстановитьСвойствоКласса(".opi-button", "cursor", "pointer")
		.УстановитьСвойствоКласса(".opi-button", "white-space", "nowrap")
		.УстановитьСвойствоКласса(".opi-button:hover", "background", "#f3f4f6")
		.УстановитьСвойствоКласса(".opi-button:hover", "text-decoration", "none")
		.УстановитьСвойствоКласса(".opi-button--primary", "border-color", "#004943")
		.УстановитьСвойствоКласса(".opi-button--primary", "color", "#004943")
		.УстановитьСвойствоКласса(".opi-button--primary:hover", "background", "#f0f7f6")
		.УстановитьСвойствоКласса(".opi-button--primary:hover", "color", "#004943")
		.УстановитьСвойствоКласса(".opi-links", "display", "flex")
		.УстановитьСвойствоКласса(".opi-links", "flex-wrap", "wrap")
		.УстановитьСвойствоКласса(".opi-links", "gap", "12px 18px")
		.УстановитьСвойствоКласса(".opi-links", "justify-content", "center")
		.УстановитьСвойствоКласса(".opi-links", "margin-top", "14px")
		.УстановитьСвойствоКласса(".opi-link", "color", "rgba(0, 73, 67, 0.91)")
		.УстановитьСвойствоКласса(".opi-link", "font-weight", "500")
		.УстановитьСвойствоКласса(".opi-link", "text-decoration", "none")
		.УстановитьСвойствоКласса(".opi-link:hover", "color", "#004943")
		.УстановитьСвойствоКласса(".opi-link:hover", "text-decoration", "underline")
		.УстановитьСвойствоКласса(".opi-section", "margin-top", "24px")
		.УстановитьСвойствоКласса(".opi-toolbar", "display", "flex")
		.УстановитьСвойствоКласса(".opi-toolbar", "flex-wrap", "wrap")
		.УстановитьСвойствоКласса(".opi-toolbar", "gap", "8px")
		.УстановитьСвойствоКласса(".opi-toolbar", "align-items", "center")
		.УстановитьСвойствоКласса(".opi-toolbar", "margin-bottom", "12px")
		.УстановитьСвойствоКласса(".opi-table-wrap", "overflow", "auto")
		.УстановитьСвойствоКласса(".opi-table-wrap", "border", "1px solid rgba(27, 31, 35, 0.15)")
		.УстановитьСвойствоКласса(".opi-table-wrap", "border-radius", "8px")
		.УстановитьСвойствоКласса(".opi-table", "width", "100%")
		.УстановитьСвойствоКласса(".opi-table", "border-collapse", "collapse")
		.УстановитьСвойствоКласса(".opi-table", "font-size", "13px")
		.УстановитьСвойствоКласса(".opi-table th, .opi-table td", "padding", "10px 12px")
		.УстановитьСвойствоКласса(".opi-table th, .opi-table td", "border-bottom", "1px solid rgba(27, 31, 35, 0.08)")
		.УстановитьСвойствоКласса(".opi-table th, .opi-table td", "text-align", "left")
		.УстановитьСвойствоКласса(".opi-table th, .opi-table td", "vertical-align", "middle")
		.УстановитьСвойствоКласса(".opi-table th", "background", "#fafbfc")
		.УстановитьСвойствоКласса(".opi-table th", "font-weight", "500")
		.УстановитьСвойствоКласса(".opi-table th", "color", "#4b5563")
		.УстановитьСвойствоКласса(".opi-table tr:last-child td", "border-bottom", "none")
		.УстановитьСвойствоКласса(".opi-table tr:hover td", "background", "#fafbfc")
		.УстановитьСвойствоКласса(".opi-col-check", "width", "44px")
		.УстановитьСвойствоКласса(".opi-col-check", "text-align", "center")
		.УстановитьСвойствоКласса(".opi-table th.opi-col-check, .opi-table td.opi-col-check", "padding-left", "10px")
		.УстановитьСвойствоКласса(".opi-table th.opi-col-check, .opi-table td.opi-col-check", "padding-right", "10px")
		.УстановитьСвойствоКласса(".opi-checkbox", "width", "16px")
		.УстановитьСвойствоКласса(".opi-checkbox", "height", "16px")
		.УстановитьСвойствоКласса(".opi-checkbox", "accent-color", "#004943")
		.УстановитьСвойствоКласса(".opi-alert", "display", "flex")
		.УстановитьСвойствоКласса(".opi-alert", "gap", "14px")
		.УстановитьСвойствоКласса(".opi-alert", "align-items", "flex-start")
		.УстановитьСвойствоКласса(".opi-alert", "margin", "12px 0 16px")
		.УстановитьСвойствоКласса(".opi-alert", "padding", "12px 14px")
		.УстановитьСвойствоКласса(".opi-alert", "border", "1px solid rgba(27, 31, 35, 0.12)")
		.УстановитьСвойствоКласса(".opi-alert", "border-radius", "8px")
		.УстановитьСвойствоКласса(".opi-alert", "background", "#fafbfc")
		.УстановитьСвойствоКласса(".opi-alert--warning", "border-left", "4px solid #e6a700")
		.УстановитьСвойствоКласса(".opi-alert__icon", "width", "2rem")
		.УстановитьСвойствоКласса(".opi-alert__icon", "height", "2rem")
		.УстановитьСвойствоКласса(".opi-alert__icon", "flex-shrink", "0")
		.УстановитьСвойствоКласса(".opi-alert__icon", "color", "#e6a700")
		.УстановитьСвойствоКласса(".opi-alert__icon", "margin-top", "0.1rem")
		.УстановитьСвойствоКласса(".opi-alert__text", "margin", "0")
		.УстановитьСвойствоКласса(".opi-alert__text", "font-weight", "300")
		.УстановитьСвойствоКласса(".opi-alert__text", "color", "#333333")
		.УстановитьСвойствоКласса(".opi-alert__title", "margin", "0 0 0.5rem")
		.УстановитьСвойствоКласса(".opi-alert__title", "font-weight", "500")
		.УстановитьСвойствоКласса(".opi-alert__steps", "margin", "0")
		.УстановитьСвойствоКласса(".opi-alert__steps", "padding-left", "1.25rem")
		.УстановитьСвойствоКласса(".opi-alert__steps li", "margin", "0.2rem 0");

КонецПроцедуры

&НаСервере
Процедура СобратьHTMLПанели(ФормаHTML, ЛогоBase64)

	СобратьОболочкуПанели(ФормаHTML);
	СобратьВкладкуГлавная(ФормаHTML, ЛогоBase64, OPI_Инструменты.ВерсияОПИ());
	СобратьВкладкуКомпоненты(ФормаHTML, СформироватьСтрокиТаблицыКомпонент());

КонецПроцедуры

&НаСервере
Процедура СобратьОболочкуПанели(ФормаHTML)

	ФормаHTML
		.ВставитьЭлемент("shell", "div")
		.ДобавитьКласс("opi-shell")
		.ВставитьДочернийЭлемент("header", "header")
		.ДобавитьКласс("opi-header")
		.ВставитьДочернийЭлемент("header-wrap", "div")
		.ДобавитьКласс("opi-header__wrap")
		.ВставитьДочернийЭлемент("header-icon", "#raw", Ложь, ТекстИконкиШестерни())
		.УстановитьТекущийЭлемент("header-wrap")
		.ВставитьДочернийЭлемент("header-text", "div")
		.ВставитьДочернийЭлемент("header-title", "h1", , "Панель управления расширением ОПИ")
		.ДобавитьКласс("opi-header__title")
		.УстановитьТекущийЭлемент("header-text")
		.ВставитьДочернийЭлемент("header-subtitle", "p", , "Основная информация и настройки Открытого пакета интеграций")
		.ДобавитьКласс("opi-header__subtitle")
		.УстановитьТекущийЭлемент("shell")
		.ВставитьДочернийЭлемент("tab-main", "input", Ложь)
		.УстановитьАтрибут("type", "radio")
		.УстановитьАтрибут("name", "opi-tab")
		.УстановитьАтрибут("id", "opi-tab-main")
		.УстановитьАтрибут("checked", "checked")
		.ДобавитьКласс("opi-tab-input")
		.УстановитьТекущийЭлемент("shell")
		.ВставитьДочернийЭлемент("tab-addins", "input", Ложь)
		.УстановитьАтрибут("type", "radio")
		.УстановитьАтрибут("name", "opi-tab")
		.УстановитьАтрибут("id", "opi-tab-addins")
		.ДобавитьКласс("opi-tab-input")
		.УстановитьТекущийЭлемент("shell")
		.ВставитьДочернийЭлемент("tabs", "nav")
		.УстановитьАтрибут("aria-label", "Разделы панели")
		.ДобавитьКласс("opi-tabs")
		.ВставитьДочернийЭлемент("tab-label-main", "label", , "Главная")
		.УстановитьАтрибут("for", "opi-tab-main")
		.ДобавитьКласс("opi-tab")
		.УстановитьТекущийЭлемент("tabs")
		.ВставитьДочернийЭлемент("tab-label-addins", "label", , "Внешние компоненты OnClient")
		.УстановитьАтрибут("for", "opi-tab-addins")
		.ДобавитьКласс("opi-tab")
		.УстановитьТекущийЭлемент("shell")
		.ВставитьДочернийЭлемент("main", "main")
		.ДобавитьКласс("opi-main");

КонецПроцедуры

&НаСервере
Процедура СобратьВкладкуГлавная(ФормаHTML, ЛогоBase64, ВерсияОПИ)

	ФормаHTML
		.УстановитьТекущийЭлемент("main")
		.ВставитьДочернийЭлемент("panel-main", "section")
		.УстановитьАтрибут("data-tab", "main")
		.ДобавитьКласс("opi-tab-panel")
		.ВставитьДочернийЭлемент("hero", "div")
		.ДобавитьКласс("opi-hero")
		.ВставитьДочернийЭлемент("logo", "div")
		.УстановитьАтрибут("id", "opi-logo")
		.ДобавитьКласс("opi-logo")
		.ВставитьДочернийЭлемент("logo-img", "img", Ложь)
		.УстановитьАтрибут("src", ЛогоBase64)
		.УстановитьАтрибут("alt", "ОПИ")
		.УстановитьТекущийЭлемент("hero")
		.ВставитьДочернийЭлемент("hero-title", "h2", , "Открытый пакет интеграций")
		.ДобавитьКласс("opi-hero__title")
		.УстановитьТекущийЭлемент("hero")
		.ВставитьДочернийЭлемент("hero-tagline", "p", , "Набор инструментов интеграции с популярными сервисами и технологиями")
		.ДобавитьКласс("opi-hero__tagline")
		.УстановитьТекущийЭлемент("hero")
		.ВставитьДочернийЭлемент("hero-version", "span", , СтрШаблон("Версия %1", ВерсияОПИ))
		.УстановитьАтрибут("id", "opi-version")
		.ДобавитьКласс("opi-version-badge")
		.УстановитьТекущийЭлемент("panel-main")
		.ВставитьДочернийЭлемент("main-actions", "div")
		.УстановитьАтрибут("id", "opi-main-actions")
		.ДобавитьКласс("opi-actions");

	ВставитьКнопкуПанели(ФормаHTML, "main-actions", "opi-btn-docs", "Документация");

	ФормаHTML
		.УстановитьТекущийЭлемент("panel-main")
		.ВставитьДочернийЭлемент("main-links", "div")
		.УстановитьАтрибут("id", "opi-main-links")
		.ДобавитьКласс("opi-links");

	ВставитьСсылкуПанели(ФормаHTML, "main-links", "opi-link-license-ru", "Лицензия (русский)");
	ВставитьСсылкуПанели(ФормаHTML, "main-links", "opi-link-license-en", "Лицензия (english)");
	ВставитьСсылкуПанели(ФормаHTML, "main-links", "opi-link-github", "GitHub");
	ВставитьСсылкуПанели(ФормаHTML, "main-links", "opi-link-sourcecraft", "SourceCraft");

КонецПроцедуры

&НаСервере
Процедура СобратьВкладкуКомпоненты(ФормаHTML, СтрокиТаблицы)

	ФормаHTML
		.УстановитьТекущийЭлемент("main")
		.ВставитьДочернийЭлемент("panel-addins", "section")
		.УстановитьАтрибут("data-tab", "addins")
		.ДобавитьКласс("opi-tab-panel")
		.ВставитьДочернийЭлемент("addins-toolbar", "div")
		.УстановитьАтрибут("id", "opi-addins-toolbar")
		.ДобавитьКласс("opi-toolbar");

	ВставитьКнопкуПанели(ФормаHTML, "addins-toolbar", "opi-btn-select-all", "Выделить все");
	ВставитьКнопкуПанели(ФормаHTML, "addins-toolbar", "opi-btn-deselect-all", "Снять все");
	ВставитьКнопкуПанели(ФормаHTML, "addins-toolbar", "opi-btn-refresh-list", "Обновить список");
	ВставитьКнопкуПанели(ФормаHTML, "addins-toolbar", "opi-btn-install-addins", "Установить компоненты на клиенте");
	ВставитьКнопкуПанели(ФормаHTML, "addins-toolbar", "opi-btn-open-cache", "Открыть каталог кэша");

	ФормаHTML
		.УстановитьТекущийЭлемент("panel-addins")
		.ВставитьДочернийЭлемент("addins-alert", "div")
		.ДобавитьКласс("opi-alert")
		.ДобавитьКласс("opi-alert--warning")
		.ВставитьДочернийЭлемент("addins-alert-icon", "#raw", Ложь, ТекстИконкиПредупреждения())
		.УстановитьТекущийЭлемент("addins-alert")
		.ВставитьДочернийЭлемент("addins-alert-text", "div")
		.ДобавитьКласс("opi-alert__text")
		.ВставитьДочернийЭлемент("addins-alert-title", "p", , "Порядок обновления компонент на клиенте при обновлении расширения на новую версию:")
		.ДобавитьКласс("opi-alert__title")
		.УстановитьТекущийЭлемент("addins-alert-text")
		.ВставитьДочернийЭлемент("addins-alert-steps", "ol")
		.ДобавитьКласс("opi-alert__steps")
		.ВставитьДочернийЭлемент("addins-step-1", "li", , "Открыть каталог внешних компонент (ExtCompT) при помощи кнопки «Открыть каталог кэша» или вручную")
		.УстановитьТекущийЭлемент("addins-alert-steps")
		.ВставитьДочернийЭлемент("addins-step-2", "li", , "Удалить файлы компонент ОПИ (с префиксом AddIn.OPI_)")
		.УстановитьТекущийЭлемент("addins-alert-steps")
		.ВставитьДочернийЭлемент("addins-step-3", "li", , "Перезапустить приложение и вернутся в данную обработку")
		.УстановитьТекущийЭлемент("addins-alert-steps")
		.ВставитьДочернийЭлемент("addins-step-4", "li", , "Выделить необходимые компоненты и нажать «Установить компоненты на клиенте»")
		.УстановитьТекущийЭлемент("panel-addins")
		.ВставитьДочернийЭлемент("addins-table-wrap", "div")
		.ДобавитьКласс("opi-table-wrap")
		.ВставитьДочернийЭлемент("addins-table", "table")
		.УстановитьАтрибут("id", "opi-addins-table")
		.ДобавитьКласс("opi-table")
		.ВставитьДочернийЭлемент("addins-thead", "thead")
		.ВставитьДочернийЭлемент("addins-head-row", "tr")
		.ВставитьДочернийЭлемент("addins-head-check", "#raw", Ложь
			, "<th class=""opi-col-check""><input type=""checkbox"" class=""opi-checkbox"" id=""opi-addins-check-all"" aria-label=""Выделить все""></th>")
		.УстановитьТекущийЭлемент("addins-head-row")
		.ВставитьДочернийЭлемент("addins-head-name", "th", , "Имя")
		.УстановитьТекущийЭлемент("addins-head-row")
		.ВставитьДочернийЭлемент("addins-head-cfg", "th", , "Версия в конфигурации")
		.УстановитьТекущийЭлемент("addins-head-row")
		.ВставитьДочернийЭлемент("addins-head-client", "th", , "Версия клиента")
		.УстановитьТекущийЭлемент("addins-table")
		.ВставитьДочернийЭлемент("addins-tbody", "tbody")
		.УстановитьАтрибут("id", "opi-addins-body");

	Для Каждого СтрокаКомпоненты Из СтрокиТаблицы Цикл
		ВставитьСтрокуКомпоненты(ФормаHTML, СтрокаКомпоненты);
	КонецЦикла;

КонецПроцедуры

&НаСервере
Процедура ВставитьКнопкуПанели(ФормаHTML, IDРодителя, IDКнопки, ТекстКнопки)

	ФормаHTML
		.УстановитьТекущийЭлемент(IDРодителя)
		.ВставитьДочернийЭлемент(IDКнопки, "#raw", Ложь
			, СтрШаблон("<button type=""button"" class=""opi-button"" id=""%2"">%1</button>", ТекстКнопки, IDКнопки));

КонецПроцедуры

&НаСервере
Процедура ВставитьСсылкуПанели(ФормаHTML, IDРодителя, IDСсылки, ТекстСсылки)

	ФормаHTML
		.УстановитьТекущийЭлемент(IDРодителя)
		.ВставитьДочернийЭлемент(IDСсылки, "#raw", Ложь
			, СтрШаблон("<a href=""#"" class=""opi-link"" id=""%2"">%1</a>", ТекстСсылки, IDСсылки));

КонецПроцедуры

&НаСервере
Процедура ВставитьСтрокуКомпоненты(ФормаHTML, СтрокаКомпоненты)

	Идентификатор = СтрокаКомпоненты.ИмяКомпоненты;
	ТекстСтроки   = СтрШаблон(
		"<tr data-component=""%1""><td class=""opi-col-check""><input type=""checkbox"" class=""opi-checkbox"" id=""opi-addin-%1""></td><td>%2</td><td>%3</td><td>%4</td></tr>"
		, Идентификатор
		, СтрокаКомпоненты.ИмяКомпоненты
		, СтрокаКомпоненты.ВерсияКонфигурации
		, СтрокаКомпоненты.ВерсияКлиента);

	ФормаHTML
		.УстановитьТекущийЭлемент("addins-tbody")
		.ВставитьДочернийЭлемент("addin-row-" + Идентификатор, "#raw", Ложь, ТекстСтроки);

КонецПроцедуры

&НаСервере
Функция СформироватьСтрокиТаблицыКомпонент()

	ТаблицаКомпонент = Новый ТаблицаЗначений;
	ТаблицаКомпонент.Колонки.Добавить("ИмяКомпоненты");
	ТаблицаКомпонент.Колонки.Добавить("ВерсияКонфигурации");
	ТаблицаКомпонент.Колонки.Добавить("ВерсияКлиента");

	СписокКомпонент = OPI_УправлениеРасширением.ПолучитьСписокВерсийКомпонент();

	Для Каждого ДанныеКомпоненты Из СписокКомпонент Цикл

		НоваяСтрока = ТаблицаКомпонент.Добавить();
		ЗаполнитьЗначенияСвойств(НоваяСтрока, ДанныеКомпоненты);

	КонецЦикла;

	Возврат ТаблицаКомпонент;

КонецФункции

&НаСервере
Функция ТекстИконкиШестерни()

	Возврат "<svg class=""opi-header__icon"" xmlns=""http://www.w3.org/2000/svg"" fill=""none"" viewBox=""0 0 24 24"" stroke-width=""1.5"" stroke=""currentColor"" stroke-linecap=""round"" stroke-linejoin=""round"" aria-hidden=""true""><path d=""M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 0 1 1.37.49l1.296 2.247a1.125 1.125 0 0 1-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 0 1 0 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 0 1-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 0 1-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 0 1-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 0 1-1.369-.49l-1.297-2.247a1.125 1.125 0 0 1 .26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 0 1 0-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 0 1-.26-1.43l1.297-2.247a1.125 1.125 0 0 1 1.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281Z""/><path d=""M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z""/></svg>";

КонецФункции

&НаСервере
Функция ТекстИконкиПредупреждения()

	Возврат "<svg class=""opi-alert__icon"" xmlns=""http://www.w3.org/2000/svg"" fill=""none"" viewBox=""0 0 24 24"" stroke-width=""1.5"" stroke=""currentColor"" stroke-linecap=""round"" stroke-linejoin=""round"" aria-hidden=""true""><path d=""M11.25 11.25l.041-.02a.75.75 0 0 1 1.063.852l-.708 2.836a.75.75 0 0 0 1.063.853l.041-.021M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9-3.75h.008v.008H12V8.25Z""/></svg>";

КонецФункции

#КонецОбласти
