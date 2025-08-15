# Directory Structure

## Overview

This project is a monorepo configured with Turborepo and pnpm workspaces.

```
.
├── apps/               # Application packages
│   ├── api/           # Backend API (Hono + Cloudflare Workers)
│   └── web/           # Frontend application (React + Vite)
├── packages/          # Shared packages
│   └── vitest-config/ # Shared test configuration
└── docs/              # Project documentation
```

## apps/api - Backend API

Serverless API built with Hono + Cloudflare Workers.

```
apps/api/
├── src/
│   ├── index.ts        # Entry point
│   └── *.test.ts       # Test files
├── dist/               # Build output
├── package.json        # Package configuration
├── tsconfig.json       # TypeScript configuration
├── vitest.config.ts    # Test configuration
└── wrangler.jsonc      # Cloudflare Workers configuration
```

### Key Directories
- **src/** - Source code
  - API endpoints and business logic
  - Test files (*.test.ts)
- **dist/** - Build artifacts

## apps/web - Frontend Application

Web application built with React + Vite.

```
apps/web/
├── src/
│   ├── assets/         # Static assets
│   ├── App.tsx         # Main component
│   ├── App.css         # Application styles
│   ├── main.tsx        # Entry point
│   ├── index.css       # Global styles
│   └── *.test.ts       # Test files
├── public/             # Public directory
├── dist/               # Build output
├── index.html          # HTML template
├── package.json        # Package configuration
├── tsconfig.json       # TypeScript configuration
├── vite.config.ts      # Vite configuration
└── vitest.config.ts    # Test configuration
```

### Key Directories
- **src/** - Source code
  - React components and logic
  - Styling (CSS)
  - Type definitions and utilities
- **public/** - Static files
  - Files copied as-is during build
- **dist/** - Build artifacts

## packages/vitest-config - Shared Test Configuration

Shared Vitest configuration package used across the monorepo.

```
packages/vitest-config/
├── src/
│   ├── configs/                    # Configuration files
│   │   ├── base-config.ts         # Base configuration
│   │   └── ui-config.ts           # UI configuration
│   ├── scripts/                    # Utility scripts
│   │   └── collect-json-outputs.ts # Coverage collection
│   └── index.ts                    # Exports
├── dist/                           # Build output
├── package.json                    # Package configuration
├── tsconfig.json                   # TypeScript configuration
└── turbo.json                      # Turbo configuration
```

### Key Directories
- **src/configs/** - Vitest configurations
  - Base configuration and UI-specific configuration
  - Coverage configuration
- **src/scripts/** - Helper scripts
  - Test result collection and processing

## Other Key Files

### Root Directory
- **package.json** - Monorepo root configuration
- **pnpm-workspace.yaml** - pnpm workspace configuration
- **turbo.json** - Turborepo configuration
- **biome.json** - Biome (formatter/linter) configuration
- **.husky/** - Git hooks configuration

### Configuration Files
- **tsconfig.json** - TypeScript configuration for each package
- **vitest.config.ts** - Test configuration for each package
- **vite.config.ts** - Vite build configuration (web app)
