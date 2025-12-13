function scan_directory_for_cyrillic(directory_path, extensions, translation_dict_path)
    local results = {}
    
    local translation_dict = {}
    if translation_dict_path then
        translation_dict = load_translation_dictionary(translation_dict_path)
    end
    
    local normalized_extensions = {}
    for _, ext in ipairs(extensions) do
        if string.sub(ext, 1, 1) ~= "." then
            ext = "." .. ext
        end
        normalized_extensions[string.lower(ext)] = true
    end
    
    local files = get_all_files(directory_path)
    
    for _, file_path in ipairs(files) do
        local file_ext = string.lower(get_file_extension(file_path))
        if normalized_extensions[file_ext] then
            local cyrillic_lines = scan_file_for_cyrillic_with_dict(file_path, false, translation_dict)
            for i, line in ipairs(cyrillic_lines) do
                local key = file_path .. ":" .. i
                results[key] = line
            end
        end
    end
    
    local seen_values = {}
    local deduplicated = {}
    
    for key, value in pairs(results) do
        if not seen_values[value] then
            seen_values[value] = true
            deduplicated[key] = value
        end
    end
    
    return deduplicated
end

function get_all_files(directory_path)
    local files = {}
    local command
    
    if package.config:sub(1,1) == '\\' then
        -- Windows
        command = 'dir "' .. directory_path .. '" /s /b /a-d'
    else
        -- Unix/Linux
        command = 'find "' .. directory_path .. '" -type f'
    end
    
    local handle = io.popen(command)
    if handle then
        for line in handle:lines() do
            table.insert(files, line)
        end
        handle:close()
    end
    
    return files
end

function get_file_extension(filename)
    local ext = filename:match("^.+(%..+)$")
    return ext or ""
end

function load_translation_dictionary(json_path)
    local file = io.open(json_path, "r")
    if not file then
        return {}
    end
    
    local content = file:read("*all")
    file:close()
    
    local dict = {}
    for key, value in string.gmatch(content, '"([^"]+)"%s*:%s*"([^"]+)"') do
        dict[key] = value
    end

    return dict
end

function table_length(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

-- Экранирование специальных символов для string.gsub
function escape_pattern(text)
    return string.gsub(text, "([%.%+%-%*%?%[%]%^%$%(%)%%])", "%%%1")
end

function has_untranslated_cyrillic(line, translation_dict)
    local cleaned_line = line
    
    for key, value in pairs(translation_dict) do
        if has_cyrillic(key) then
            local escaped_key = escape_pattern(key)
            cleaned_line = string.gsub(cleaned_line, escaped_key, "")
        end
        if has_cyrillic(value) then
            local escaped_value = escape_pattern(value)
            cleaned_line = string.gsub(cleaned_line, value, "")
        end
    end
    
    return has_cyrillic(cleaned_line)
end

function scan_file_for_cyrillic_with_dict(file_path, show_progress, translation_dict)
    local cyrillic_lines = {}
    
    local file = io.open(file_path, "r")
    if not file then
        return cyrillic_lines
    end
    
    for line in file:lines() do

        if has_cyrillic(line) then
            if table_length(translation_dict) == 0 or has_untranslated_cyrillic(line, translation_dict) then
                table.insert(cyrillic_lines, line)
            end
        end
    end
    
    file:close()
    return cyrillic_lines
end

function scan_file_for_cyrillic(file_path, show_progress)
    return scan_file_for_cyrillic_with_dict(file_path, show_progress, {})
end

function has_cyrillic(text)
    for i = 1, string.len(text) do
        local byte = string.byte(text, i)
        if byte >= 208 and byte <= 209 then
            local next_byte = string.byte(text, i + 1)
            if next_byte then
                local unicode = (byte - 208) * 64 + (next_byte - 128)
                if (unicode >= 16 and unicode <= 47) or  -- А-Я
                   (unicode >= 48 and unicode <= 79) or  -- а-я  
                   unicode == 81 or unicode == 113 then  -- Ё, ё
                    return true
                end
            end
        end
    end
    return false
end
