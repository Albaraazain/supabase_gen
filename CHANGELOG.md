## 1.3.0

- Added proper handling of UUID primary keys to prevent "invalid input syntax for type uuid" errors
- Made UUID primary key fields nullable in generated models
- Made UUID primary key fields optional in model constructors
- Modified toJson() method to only include UUID primary keys when they're not null
- Added UUID class for better type safety and validation
- Fixed DateTime handling in toJson() method to properly handle null values
- Updated repository generator to handle nullable UUID primary keys
- Fixed handling of duplicate column names in database tables
- Fixed handling of duplicate primary keys in database tables
- Improved code generation to only include \_toDouble helper method when needed
- Fixed dead null-aware expressions in DateTime handling
- Improved documentation for UUID handling

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
