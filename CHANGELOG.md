## 1.2.0

- Added comprehensive PostgreSQL type handling for all numeric types
- Fixed the int/double type mismatch issue with numeric, decimal, real, float types
- Added safe conversion for all numeric types with automatic handling
- Improved array type detection and handling
- Added support for BigInt conversions for bigint/int8/bigserial types
- Enhanced handling of JSON and binary data types
- Refactored code generator for better maintainability
- Added string to numeric type parsing for more robust handling

## 1.1.0

- Fixed type mismatches with Supabase Flutter SDK v2 query builders
- Improved handling of nullable parameters in foreign key relationships
- Removed all unnecessary type casting in generated code
- Fixed all linter errors in generated repositories
- Enhanced type safety in query method signatures
- Optimized code generation for cleaner output

## 1.0.1

- Fixed compatibility with latest Supabase Flutter SDK query builder types
- Updated query builder chain handling in repositories
- Removed unnecessary type casting in query methods
- Improved foreign key relationship query methods

## 1.0.0

- Initial version.
