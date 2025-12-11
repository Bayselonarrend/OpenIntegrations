-- Загружаем парсер
dofile("smart_parser.lua")

-- Тестируем строку с точкой
local test_string = '     | (##|#color=Зеленый) "       + ТаблицаПараметров[0].ОписаниеМетода;'
print("Тестируем строку с точкой: " .. test_string)
local result = parse_string_to_words(test_string)
print("Результат:")
for i, word in ipairs(result) do
    print("  " .. i .. ": '" .. word .. "'")
end

-- Тестируем части отдельно
print("\nТестируем части:")
print("ТаблицаПараметров - кириллица:", has_cyrillic("ТаблицаПараметров"))
print("ОписаниеМетода - кириллица:", has_cyrillic("ОписаниеМетода"))
print("0 - кириллица:", has_cyrillic("0"))

-- Проверим нормализацию
print("\nПроверим нормализацию:")
print("До: 'ТаблицаПараметров[0].ОписаниеМетода'")
print("После: '" .. normalize_word("ТаблицаПараметров[0].ОписаниеМетода") .. "'")