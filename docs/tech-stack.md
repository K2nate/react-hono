# Technology Stack

## Core

### Monorepo Management
- **Turborepo** - Build system for JavaScript and TypeScript monorepos

### Package Manager
- **pnpm** - Fast, disk space efficient package manager

## Frontend (apps/web)

### Build Tools
- **Vite** - Next generation frontend tooling

### UI Framework
- **React** - JavaScript library for building user interfaces
- **React DOM** - React package for working with the DOM

### Compiler
- **SWC** - Rust-based platform for the Web (via @vitejs/plugin-react-swc)

### Language
- **TypeScript** - JavaScript with syntax for types

## Backend (apps/api)

### Framework
- **Hono** - Small, simple, and fast web framework

### Runtime Platform
- **Cloudflare Workers** - Serverless execution environment
- **Wrangler** - CLI tool for building with Cloudflare Workers

### Language
- **TypeScript** - JavaScript with syntax for types

## Testing

### Test Framework
- **Vitest** - Next generation testing framework

### Test Environment
- **jsdom** - JavaScript implementation of the WHATWG DOM and HTML standards

### Coverage
- **Istanbul** - JavaScript code coverage tool (via @vitest/coverage-istanbul)

### Coverage Reporting
- **nyc** - Istanbul's command line interface

## Development Tools

### Code Quality
- **Biome** - One toolchain for web projects (formatter and linter)

### Git Hooks
- **Husky** - Modern native git hooks
- **lint-staged** - Run linters on git staged files

### Language
- **TypeScript** - JavaScript with syntax for types

## Shared Packages

### Test Configuration (packages/vitest-config)
- **@repo/vitest-config** - Shared Vitest configuration for all packages