---
sidebar_position: 4
---

# Backward Compatibility

One of the key objectives in the development of the Open Integration Package is to ensure full backward compatibility — from the very first version up to the latest one. This allows any available distribution version to be upgraded to any other version with minimal risk of breaking existing processes in a specific deployment.

However, there are cases when it becomes necessary to introduce so-called **"breaking changes"** — modifications or fixes that may partially break backward compatibility between the new version of OPI and previous versions. Such changes are listed in this section:

### 1.16.0 -> 1.17.0

**CLI version**: Added support for handling control sequences `\n`, `\r`, `\v`, and `\f` in non-JSON arguments, as well as arguments that are not file paths or URLs. In all argument values containing these sequences, they will be replaced with the corresponding special characters.

### 1.18.0 -> 1.19.0

**All**: Ozon library deprecated methods have been updated due to API-side changes: `GetProductList`, `GetProductCount`, `GetProductCharacteristicDescriptions`, `GetProductPrices`, `GetProductInformation`, `CheckProductImageUpload`. Return values may have changed.

### 1.24.0 -> 1.25.0

**All**: The date and time format has been changed to an ISO 8601-compliant format when retrieving values from the database

### 1.26.0 -> 1.27.0

**All**: The `CreatePoll` method of the VK library has been modified due to [API changes](https://vk.com/@vkappsdev-obnovlyaem-rabotu-metodov-api-wallpost-walledit-i-newsfeed). Ambiguous usage of "Thread" and "Topic" in forum methods of Telegram library has been corrected; Only "Topic" is now used

### 1.28.0 -> 1.29.0

**Ozon**: The Ozon Seller API library has been removed and its support is discontinued. If you are already using this library in your project, you need to preserve it separately before updating

### 1.29.0 -> 1.30.0

**Telegram**: Fixed and unified string decoding and special character replacement processing for all message types. When updating from a previous version, be sure to check the places where the Telegram library is used! You need to manually remove any calls to the DecodeString function if you added such in your code for emoji processing. This procedure is now handled within the library code for all messages.