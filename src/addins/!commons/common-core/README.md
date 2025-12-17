# common-core

Общая библиотека для создания 1С Native API расширений с автоматической защитой от panic.

## Возможности

- ✅ **Trait ValueType** - универсальный trait для работы с типами 1С
- ✅ **Макрос impl_raw_addin!** - автоматическая генерация RawAddin impl
- ✅ **Защита от panic** - автоматический перехват panic и возврат ошибки в 1С
- ✅ **Логирование** - опциональное логирование всех panic
- ✅ **Нет boilerplate** - весь повторяющийся код генерируется макросом

## Установка

Добавь в `Cargo.toml`:

```toml
[dependencies]
common-core = { path = "../!commons/common-core" }
```

## Использование

### Базовое использование

**Было (старый способ):**

```rust
// src/core/mod.rs
pub mod getset;

use addin1c::{name, RawAddin, Variant};
use crate::component::{METHODS, PROPS, get_params_amount, cal_func, AddIn};

impl RawAddin for AddIn {
    fn register_extension_as(&mut self) -> &'static [u16] {
        name!("Main")
    }
    // ... 20+ строк boilerplate кода ...
    fn call_as_func(&mut self, num: usize, params: &mut [Variant], ret_value: &mut Variant) -> bool {
        cal_func(self, num, params).get_value(ret_value)
    }
}

impl std::ops::Index<usize> for AddIn {
    // ... ещё код ...
}

impl std::ops::IndexMut<usize> for AddIn {
    // ... ещё код ...
}
```

**Стало (новый способ):**

```rust
// src/core/mod.rs
pub use common_core::getset;

use common_core::impl_raw_addin;
use crate::component::{AddIn, METHODS, PROPS, get_params_amount, cal_func};

impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);
```

Всё! Одна строка макроса заменяет весь boilerplate код.

### С логированием panic

Если хочешь логировать все panic в файл:

```rust
use common_core::impl_raw_addin_with_logging;
use crate::component::{AddIn, METHODS, PROPS, get_params_amount, cal_func};

impl_raw_addin_with_logging!(
    AddIn, 
    METHODS, 
    PROPS, 
    get_params_amount, 
    cal_func, 
    "D:\\my_addon_panic.log"
);
```

## Что генерирует макрос

Макрос автоматически генерирует:

1. **Полную реализацию RawAddin** - все 15+ методов
2. **Защиту от panic** - `catch_unwind` в `call_as_func`
3. **Index/IndexMut** - для доступа к полям через `self[index]`
4. **Обработку ошибок** - извлечение сообщения из `Any` panic
5. **Опциональное логирование** - запись всех panic в файл

## Защита от panic

Макрос автоматически оборачивает `call_as_func` в `catch_unwind`:

```rust
fn call_as_func(&mut self, num: usize, params: &mut [Variant], ret_value: &mut Variant) -> bool {
    let result = std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| {
        cal_func(self, num, params)
    }));
    
    match result {
        Ok(value) => value.get_value(ret_value),
        Err(panic_info) => {
            // Извлекаем сообщение из panic
            let error_msg = if let Some(s) = panic_info.downcast_ref::<&str>() {
                format!("Internal error (panic): {}", s)
            } else if let Some(s) = panic_info.downcast_ref::<String>() {
                format!("Internal error (panic): {}", s)
            } else {
                "Internal error: unknown panic occurred".to_string()
            };
            
            // Возвращаем ошибку в 1С вместо краша
            ret_value.set_str(&error_msg);
            true
        }
    }
}
```

Это означает, что:
- ❌ **Нет краша 1С** - даже если происходит panic
- ✅ **Информативные ошибки** - пользователь видит, что произошло
- ✅ **Легко отлаживать** - можно включить логирование

## Требования

В `Cargo.toml` должно быть:

```toml
[profile.release]
panic = "unwind"  # НЕ "abort"!
```

Это необходимо для работы `catch_unwind`.

## Миграция существующих проектов

1. Добавь зависимость `common-core`
2. Замени содержимое `src/core/mod.rs` на одну строку макроса
3. Удали `src/core/getset.rs` (теперь используется из common-core)
4. Убедись, что `panic = "unwind"` в Cargo.toml

## Пример полной структуры проекта

```
my-addon/
├── Cargo.toml
├── src/
│   ├── lib.rs
│   ├── core/
│   │   └── mod.rs          # Только макрос, 3 строки
│   └── component/
│       ├── mod.rs           # METHODS, PROPS, AddIn, cal_func, get_params_amount
│       └── ...
```

**src/core/mod.rs:**
```rust
pub use common_core::getset;
use common_core::impl_raw_addin;
use crate::component::{AddIn, METHODS, PROPS, get_params_amount, cal_func};

impl_raw_addin!(AddIn, METHODS, PROPS, get_params_amount, cal_func);
```

Готово!

## Преимущества

1. **Меньше кода** - 3 строки вместо 50+
2. **Меньше ошибок** - нет дублирования кода между проектами
3. **Автоматическая защита** - все проекты автоматически защищены от panic
4. **Легко обновлять** - изменения в одном месте применяются ко всем проектам
5. **Единообразие** - все проекты используют одинаковую логику

## Лицензия

MIT
