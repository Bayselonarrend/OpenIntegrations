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