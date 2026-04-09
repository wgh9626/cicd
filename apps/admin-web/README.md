# admin-web

A minimal frontend project for CI/CD validation.

## Build

```bash
pnpm install
pnpm run build
```

Build output:
- `dist/index.html`

This project intentionally uses a tiny Node build script so the pipeline can produce a static site without pulling a large frontend framework.
