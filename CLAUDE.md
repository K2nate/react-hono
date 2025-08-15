# Instructions for Claude Code

## Primary Language
Please respond in **Japanese** unless explicitly requested otherwise.

### Language Guidelines for Code and Documentation
1. **Technical Documentation**: Write all documentation, source code comments, and JSDoc in **English** unless explicitly instructed otherwise
2. **User-Facing Text**: Create application display text (UI strings, messages, labels) in **Japanese** by default

## Project Overview
This is a monorepo project using Turborepo with pnpm workspaces.

For detailed project information, please refer to:
- @docs/tech-stack.md - Complete list of technologies used in this project
- @docs/directory-structure.md - Detailed monorepo structure and directory organization

## Development Guidelines

### Before Making Changes
1. Always read existing code to understand current conventions and patterns
2. Check `package.json` files to verify available dependencies
3. Follow existing code style and naming conventions

### Code Quality
- Run type checking: `pnpm check-types`
- Run linter and formatter: `pnpm biome:check`
- Fix linting issues: `pnpm biome:fix`
- Run tests: `pnpm test`

### Testing
- Write tests for new features and bug fixes
- Use Vitest for all test files
- Place test files next to source files with `.test.ts` or `.test.tsx` extension

### Git Workflow
- Do NOT commit changes unless explicitly requested
- When asked to commit, ensure all tests pass and linting is clean

### Monorepo Structure
See @docs/directory-structure.md for detailed directory structure information.

### Available Commands
- `pnpm dev` - Start development servers
- `pnpm build` - Build all packages
- `pnpm test` - Run all tests
- `pnpm check-types` - Type check all packages
- `pnpm biome:check` - Check code formatting and linting
- `pnpm biome:fix` - Auto-fix formatting and linting issues

## Important Notes
- This project uses TypeScript throughout
- Biome is used for both formatting and linting
- All packages should follow the established patterns
- When creating new files, follow existing directory structure patterns