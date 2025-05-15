# Supabase Gen Package

## Overview

Supabase Gen is a Dart/Flutter package that automatically generates type-safe models, repositories, and providers from a Supabase PostgreSQL database schema. It simplifies the development workflow by creating consistent data access layer code, allowing developers to focus on building features rather than writing boilerplate code.

## Architecture

The package follows a modular architecture with these key components:

1. **Configuration** - Manages user settings and connection details
2. **Schema Reading** - Introspects database schema from Supabase
3. **Code Generation** - Creates Dart files based on schema and templates
4. **Utilities** - Helper functions for type conversion, string manipulation, and logging

## Configuration

The configuration system allows customization of code generation through:

- `ConfigLoader` - Loads configuration from YAML files
- `ConfigModel` - Represents user configuration settings

Configuration options include:
- Database connection details (local or remote Supabase)
- Output directory paths
- Table inclusions/exclusions
- Custom type mappings
- Repository settings
- Provider generation options

## Schema Reading

The `SchemaReader` supports both local and remote Supabase connections and provides methods to:

1. Fetch table definitions
2. Read column information (name, type, constraints)
3. Detect relationships between tables 
4. Extract default values and constraints

The core classes are:
- `SchemaReader` - Main API for schema introspection
- `TableInfo` - Represents a database table with its columns and relationships

## Code Generation

### Model Generation

The `ModelGenerator` creates Dart classes representing database tables with:

- Strong typing for all fields
- Json serialization/deserialization
- Null safety and default values
- Special handling for PostgreSQL types (geography, jsonb, arrays)
- Support for relationships (one-to-one, one-to-many)

### Repository Generation

The `RepositoryGenerator` creates repository classes that:

- Provide CRUD operations (create, read, update, delete)
- Support filtering, sorting, and pagination
- Handle relationships between tables
- Manage error handling and response parsing
- Support batch operations
- Include count methods for query results

### Provider Generation

The `ProviderGenerator` creates state management providers that:

- Wrap repository methods with state handling
- Provide loading, error, and data states
- Support dependency injection
- Include caching mechanisms
- Handle refresh and pagination

## Utilities

Key utility classes include:

- `TypeConverter` - Maps PostgreSQL types to appropriate Dart types
- `StringUtils` - Handles case conversion and naming conventions
- `Logger` - Provides structured logging for generation process

## Usage

1. Configure the package via `supabase_gen.yaml`
2. Run the generator using CLI or build runner
3. Import the generated files in your application
4. Use the models, repositories, and providers in your business logic

## Workflow Integration

The package integrates with the Flutter/Dart development workflow:
- Works with existing build systems
- Supports incremental generation
- Provides clean API for consuming generated code
- Handles database schema changes gracefully

## Error Handling

Generated code includes robust error handling:
- Type-safe error checking
- Custom exception classes
- Detailed error messages
- Proper null safety implementation