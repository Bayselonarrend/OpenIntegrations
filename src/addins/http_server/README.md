# HTTP/WebSocket Server для 1С

Компонента (cdylib) HTTP и WebSocket сервера для интеграции с 1С:Предприятие.

## Возможности

- HTTP сервер для обработки REST API запросов
- WebSocket сервер для двунаправленной коммуникации
- Асинхронная обработка запросов через Axum
- Интеграция с BinaryVault для передачи больших данных
- Логирование через common-logs
- Использует common-server для переиспользования серверной логики

## Архитектура

Проект построен на базе `common-server` и использует те же паттерны, что и `tcp_server`:

- `backend.rs` - Backend с использованием макросов из common-server
- `server.rs` - Логика HTTP/WebSocket сервера на Axum
- `lib.rs` - 1С интерфейс (cdylib)

## Методы

### Start(port, config_json, logger_config_json)
Запускает HTTP/WebSocket сервер на указанном порту.

### Stop()
Останавливает сервер.

### HandleRequest(timeout_ms)
Получает следующий HTTP запрос из очереди.

### SendResponse(request_id, status_code, body)
Отправляет HTTP ответ на запрос.

### GetWebSocketMessage(connection_id, timeout_ms)
Получает сообщение из WebSocket соединения.

### SendWebSocketMessage(connection_id, message)
Отправляет сообщение в WebSocket соединение.

### CloseWebSocket(connection_id)
Закрывает WebSocket соединение.

### GetConnectionsList()
Возвращает список активных WebSocket соединений.

### RetrieveBinaryFromVault(vault_key)
Извлекает бинарные данные из vault.

### GetLogs(count)
Получает последние записи из лога.

## Сборка

```bash
cargo build --release --manifest-path http_server/Cargo.toml
```

Результат: `http_server/target/release/opi_httpserver.dll`

## Использование из 1С

```1c
Сервер = Новый ВнешняяКомпонента("opi_httpserver.dll");

// Запуск сервера
Конфиг = Новый Структура;
Конфиг.Вставить("cors", Истина);

Результат = Сервер.Start(8080, ПреобразоватьВJSON(Конфиг), "");

// Обработка запросов
Пока Истина Цикл
    Запрос = Сервер.HandleRequest(5000);
    Если Запрос.result Тогда
        // Обработать запрос
        Ответ = ПолучитьОтвет(Запрос);
        Сервер.SendResponse(Запрос.requestId, 200, Ответ);
    КонецЕсли;
КонецЦикла;

// WebSocket
Сообщение = Сервер.GetWebSocketMessage("connection-id", 1000);
Сервер.SendWebSocketMessage("connection-id", ДанныеДляОтправки);
```

## Зависимости

- axum - HTTP/WebSocket фреймворк
- tokio - Async runtime
- common-server - Общая серверная логика
- common-binary - BinaryVault для больших данных
- common-logs - Логирование

## Статус

🚧 В разработке - базовая структура создана, требуется доработка:
- Полная реализация обработки HTTP ответов
- Обработка входящих WebSocket сообщений
- Тесты
- Примеры использования
