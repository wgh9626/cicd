# go-service

A minimal Go web service for CI/CD validation.

## Endpoints

- `GET /` → `hello from go-service`
- `GET /healthz` → `ok`

## Run locally

```bash
go run ./cmd/main.go
```

Default port: `8080` (override with `PORT`).
