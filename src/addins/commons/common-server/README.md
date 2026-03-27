# common-server

Общая библиотека для создания серверных компонентов с асинхронной обработкой в отдельном потоке.

## Компоненты

### Backend

Generic backend паттерн для управления tokio runtime в отдельном потоке с обработкой команд через mpsc канал.

```rust
use common_server::Backend;

enum MyCommand {
    DoSomething { data: String, response: Sender<String> },
    Shutdown,
}

let backend = Backend::new("my_backend".to_string(), |rt, rx| {
    while let Ok(cmd) = rx.recv() {
        match cmd {
            MyCommand::DoSomething { data, response } => {
                let result = rt.block_on(async {
                    // async work here
                    format!("Processed: {}", data)
                });
                let _ = response.send(result);
            }
            MyCommand::Shutdown => break,
        }
    }
});

// Send commands
backend.send(MyCommand::DoSomething { 
    data: "test".to_string(), 
    response: tx 
}).unwrap();
```

### ConnectionManager

Управление соединениями с round-robin обработкой сообщений, автоматическим удалением старых соединений при переполнении очереди.

```rust
use common_server::ConnectionManager;

struct MyConnection {
    data: String,
}

let mut manager = ConnectionManager::new(10, None); // queue_size = 10

// Add connection
let id = ConnectionManager::<MyConnection>::generate_id();
manager.add(id.clone(), MyConnection { data: "test".to_string() });

// Get connection
manager.get_mut(&id, |conn| {
    conn.data = "updated".to_string();
});

// Round-robin iteration
let ids = manager.get_ids_round_robin();

// Remove inactive connections
let removed = manager.retain(|_id, conn| {
    // return true to keep, false to remove
    !conn.data.is_empty()
});
```

### MessageHandler

Хелпер для работы с сообщениями через BinaryVault с автоматическим созданием JSON ответов.

```rust
use common_server::MessageHandler;
use common_binary::vault::BinaryVault;

let vault = BinaryVault::new();
let handler = MessageHandler::new(vault);

// Store message and create success response
let response = handler.success_response(
    "conn_123".to_string(),
    vec![1, 2, 3],
    "127.0.0.1:8080".to_string(),
    true
);

// Create error response
let error = MessageHandler::error_response("Connection failed");

// Create timeout response
let timeout = MessageHandler::timeout_response();
```

### AsyncWaiter

Хелпер для ожидания результата с таймаутом и polling.

```rust
use common_server::AsyncWaiter;

let waiter = AsyncWaiter::new(5000); // 5 seconds timeout

let result = waiter.wait_for(|| {
    // Try to get result
    // Return Some(value) when ready, None to continue waiting
    Some(42)
}).await;

match result {
    Ok(value) => println!("Got: {}", value),
    Err(()) => println!("Timeout"),
}
```

## Использование

Добавьте в `Cargo.toml`:

```toml
[dependencies]
common-server = { path = "../commons/common-server" }
```

## Примеры

См. `tcp_server` для полного примера использования всех компонентов.
