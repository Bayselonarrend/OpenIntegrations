-- Модуль для рекурсивного сканирования файлов на наличие кириллицы
local lfs = require("lfs")

-- Основная функция сканирования
function scan_directory_for_cyrillic(directory_path, extensions)
    local results = {}
    
    -- Нормализуем расширения (добавляем точку если нет)
    local normalized_extensions = {}
    for _, ext in ipairs(extensions) do
        if string.sub(ext, 1, 1) ~= "." then
            ext = "." .. ext
        end
        normalized_extensions[string.lower(ext)] = true
    end
    
    -- Рекурсивно сканируем директорию
    scan_directory_recursive(directory_path, normalized_extensions, results)
    
    return results
end

-- Рекурсивное сканирование директории
function scan_directory_recursive(path, extensions, results)
    local attr = lfs.attributes(path)
    if not attr then
        print("Ошибка: не удается получить доступ к " .. path)
        return
    end
    
    if attr.mode == "directory" then
        -- Сканируем содержимое директории
        for file in lfs.dir(path) do
            if file ~= "." and file ~= ".." then
                local file_path = path .. "/" .. file
                scan_directory_recursive(file_path, extensions, results)
            end
        end
    elseif attr.mode == "file" then
        -- Проверяем расширение файла
        local file_ext = string.lower(get_file_extension(path))
        if extensions[file_ext] then
            -- Сканируем файл на кириллицу
            local cyrillic_found = scan_file_for_cyrillic(path)
            if #cyrillic_found > 0 then
                table.insert(results, {
                    file = path,
                    cyrillic_strings = cyrillic_found
                })
            end
        end
    end
end

-- Получение расширения файла
function get_file_extension(filename)
    local ext = filename:match("^.+(%..+)$")
    return ext or ""
end

-- Сканирование файла на наличие кириллицы
function scan_file_for_cyrillic(file_path)
    local cyrillic_strings = {}
    
    local file = io.open(file_path, "r")
    if not file then
        print("Ошибка: не удается открыть файл " .. file_path)
        return cyrillic_strings
    end
    
    local line_number = 0
    for line in file:lines() do
        line_number = line_number + 1
        
        if has_cyrillic(line) then
            table.insert(cyrillic_strings, {
                line_number = line_number,
                content = line
            })
        end
    end
    
    file:close()
    return cyrillic_strings
end

-- Проверка наличия кириллицы в строке
function has_cyrillic(text)
    local cyrillic_pattern = "[а-яё]"
    return string.find(string.lower(text), cyrillic_pattern) ~= nil
end

-- Функция для красивого вывода результатов
function print_scan_results(results)
    if #results == 0 then
        print("Кириллица не найдена в файлах с указанными расширениями.")
        return
    end
    
    print("Найдено файлов с кириллицей: " .. #results)
    print(string.rep("=", 50))
    
    for _, result in ipairs(results) do
        print("Файл: " .. result.file)
        print("Строк с кириллицей: " .. #result.cyrillic_strings)
        
        -- Показываем первые 3 строки с кириллицей
        local max_lines = math.min(3, #result.cyrillic_strings)
        for i = 1, max_lines do
            local line_info = result.cyrillic_strings[i]
            print("  Строка " .. line_info.line_number .. ": " .. string.sub(line_info.content, 1, 100))
        end
        
        if #result.cyrillic_strings > 3 then
            print("  ... и еще " .. (#result.cyrillic_strings - 3) .. " строк")
        end
        
        print(string.rep("-", 30))
    end
end

-- Функция для получения только списка файлов с кириллицей
function get_files_with_cyrillic(directory_path, extensions)
    local results = scan_directory_for_cyrillic(directory_path, extensions)
    local files = {}
    
    for _, result in ipairs(results) do
        table.insert(files, result.file)
    end
    
    return files
end

-- Функция для подсчета общего количества строк с кириллицей
function count_cyrillic_lines(directory_path, extensions)
    local results = scan_directory_for_cyrillic(directory_path, extensions)
    local total_files = #results
    local total_lines = 0
    
    for _, result in ipairs(results) do
        total_lines = total_lines + #result.cyrillic_strings
    end
    
    return {
        files_count = total_files,
        lines_count = total_lines
    }
end