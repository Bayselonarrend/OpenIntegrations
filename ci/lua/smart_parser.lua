local separators = {" ", "\t", "\n", "(", ")", "[", "]", "{", "}", ",", ".", ";", ":", "=", "+", "-", "*", "/", "\\", "!", "?", "@", "#", "%", "^", "&", "_", "|"}

function parse_string_to_words(input_string)
    local words = {}
    
    if string.match(input_string, "^// !OInt") then
        return words
    end
    
    if string.match(input_string, "^//") then
        return parse_comment(input_string)
    end
    
    if string.find(input_string, '"') then
        return parse_expression(input_string)
    end
    
    return parse_code_line(input_string)
end

function parse_comment(comment_string)
    local words = {}
    
    local clean_comment = string.gsub(comment_string, "^%s*//+%s*", "")
    
    if string.find(clean_comment, "!DISABLED!") or string.find(clean_comment, "!CODE!") then
        return words
    end
    
    clean_comment = string.gsub(clean_comment, " %- ", " | ")
    clean_comment = string.gsub(clean_comment, ": %[", " | ")
    
    local parts = split_string(clean_comment, "|")
    for _, part in ipairs(parts) do
        local normalized = normalize_word(part)
        if normalized ~= "" then
            if has_cyrillic_in_phrase(normalized) then
                local exists = false
                for _, existing in ipairs(words) do
                    if existing == normalized then
                        exists = true
                        break
                    end
                end
                if not exists then
                    table.insert(words, normalized)
                end
            end
        end
    end
    
    return words
end

function has_cyrillic_in_phrase(text)
    local cyrillic_pattern = "[а-яё]"
    return string.find(string.lower(text), cyrillic_pattern) ~= nil
end

function parse_expression(expression_string)
    local words = {}
    local current_pos = 1
    local in_quotes = false
    local in_tag = false
    local current_word = ""
    
    while current_pos <= string.len(expression_string) do
        local char = string.sub(expression_string, current_pos, current_pos)
        
        if char == '"' then
            if in_quotes then

                if current_word ~= "" then
                    add_word_if_valid(words, current_word)
                    current_word = ""
                end
                in_quotes = false
            else

                if current_word ~= "" then
                    parse_and_add_code_words(words, current_word)
                    current_word = ""
                end
                in_quotes = true
            end
        elseif char == '<' and not in_quotes then
            if current_word ~= "" then
                parse_and_add_code_words(words, current_word)
                current_word = ""
            end
            in_tag = true
            current_word = char
        elseif char == '>' and not in_quotes then
            current_word = current_word .. char
            if in_tag then
                add_word_if_valid(words, current_word)
                current_word = ""
                in_tag = false
            else

                if current_word ~= "" then
                    parse_and_add_code_words(words, current_word)
                    current_word = ""
                end
            end
        elseif in_quotes then

            current_word = current_word .. char
        elseif in_tag then

            current_word = current_word .. char
        else

            if is_separator(char) then
                if current_word ~= "" then
                    add_word_if_valid(words, current_word)
                    current_word = ""
                end
            else
                current_word = current_word .. char
            end
        end
        
        current_pos = current_pos + 1
    end
    
    -- Добавляем последнее слово
    if current_word ~= "" then
        if in_quotes or in_tag then
            add_word_if_valid(words, current_word)
        else
            parse_and_add_code_words(words, current_word)
        end
    end
    
    return words
end

-- Парсинг обычной строки кода
function parse_code_line(code_string)
    local words = {}
    parse_and_add_code_words(words, code_string)
    return words
end

-- Разбор кода на слова по разделителям
function parse_and_add_code_words(words, text)
    local current_word = ""
    
    for i = 1, string.len(text) do
        local char = string.sub(text, i, i)
        
        if is_separator(char) then
            if current_word ~= "" then
                add_word_if_valid(words, current_word)
                current_word = ""
            end
        else
            current_word = current_word .. char
        end
    end
    
    if current_word ~= "" then
        add_word_if_valid(words, current_word)
    end
end

-- Добавление слова если оно валидное
function add_word_if_valid(words, word)
    word = normalize_word(word)
    
    if word == "" or not has_cyrillic(word) then
        return
    end
    
    -- Проверяем, нет ли уже такого слова
    for _, existing in ipairs(words) do
        if existing == word then
            return
        end
    end
    
    table.insert(words, word)
end

-- Нормализация слова - убираем спецсимволы в начале и конце
function normalize_word(word)
    word = trim_string(word)
    
    -- Убираем URL из фразы
    word = remove_urls(word)
    
    -- Убираем спецсимволы в начале и конце, но оставляем внутри
    local edge_symbols = {"(", ")", "[", "]", "{", "}", "<", ">", ",", ".", ";", ":", "=", "+", "-", "*", "/", "\\", "!", "?", "@", "#", "$", "%", "^", "&", "|", "\"", "'", "_"}
    
    local cleaned = false
    while not cleaned do
        local start_removed = false
        local end_removed = false
        
        -- Убираем символы в начале
        for _, symbol in ipairs(edge_symbols) do
            if string.sub(word, 1, 1) == symbol then
                word = string.sub(word, 2)
                start_removed = true
                break
            end
        end
        
        -- Убираем символы в конце
        if string.len(word) > 0 then
            for _, symbol in ipairs(edge_symbols) do
                if string.sub(word, -1) == symbol then
                    word = string.sub(word, 1, -2)
                    end_removed = true
                    break
                end
            end
        end
        
        -- Если ничего не убрали, значит очистка завершена
        if not start_removed and not end_removed then
            cleaned = true
        end
        
        -- Защита от бесконечного цикла
        if string.len(word) == 0 then
            break
        end
    end
    
    return trim_string(word)
end

-- Удаление URL из текста (только в начале и конце)
function remove_urls(text)
    local original_text = text
    text = trim_string(text)
    
    -- Простые паттерны для URL в начале и конце
    text = string.gsub(text, "^https?://[^%s]+", "")  -- http/https в начале
    text = string.gsub(text, "^ftp://[^%s]+", "")     -- ftp в начале  
    text = string.gsub(text, "^www%.[^%s]+", "")      -- www в начале
    text = string.gsub(text, "https?://[^%s]+$", "")  -- http/https в конце
    text = string.gsub(text, "ftp://[^%s]+$", "")     -- ftp в конце
    text = string.gsub(text, "www%.[^%s]+$", "")      -- www в конце
    
    -- Убираем лишние пробелы только если действительно удалили URL
    if text ~= original_text then
        text = string.gsub(text, "%s+", " ")
    end
    
    return trim_string(text)
end

-- Проверка, является ли символ разделителем
function is_separator(char)
    for _, sep in ipairs(separators) do
        if char == sep then
            return true
        end
    end
    return false
end

-- Разделение строки по разделителю
function split_string(str, delimiter)
    local parts = {}
    local current_part = ""
    
    for i = 1, string.len(str) do
        local char = string.sub(str, i, i)
        if char == delimiter then
            if current_part ~= "" then
                table.insert(parts, current_part)
                current_part = ""
            end
        else
            current_part = current_part .. char
        end
    end
    
    if current_part ~= "" then
        table.insert(parts, current_part)
    end
    
    return parts
end

-- Удаление пробелов в начале и конце
function trim_string(str)
    return string.gsub(str, "^%s*(.-)%s*$", "%1")
end

-- Проверка наличия кириллицы
function has_cyrillic(text)
    local cyrillic_pattern = "[а-яё]"
    return string.find(string.lower(text), cyrillic_pattern) ~= nil
end