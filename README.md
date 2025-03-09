# Supabase Gen

A Dart package that generates Flutter repositories and models from your Supabase database schema.

## Features

- Automatically generates Dart model classes from your database tables
- Creates repository classes with methods for CRUD operations
- Maintains relationships between tables
- Type-safe code generation with smart handling of PostgreSQL types
- Comprehensive numeric type conversion for all PostgreSQL numeric formats
- Handles array types, JSON types, and binary data properly
- Easy to configure and use

## New in Version 1.2.0

- **Fixed the int/double type mismatch issue**: Safely handles PostgreSQL numeric/decimal/real types without runtime errors
- **Improved type handling**: Added comprehensive support for all PostgreSQL data types
- **Smart type conversion**: Automatically converts between similar types (int/double/string) safely
- **Enhanced array handling**: Better support for array types with appropriate casting

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dev_dependencies:
  supabase_gen: ^1.2.0