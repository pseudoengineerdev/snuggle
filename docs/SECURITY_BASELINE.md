# Security Baseline (Phase 0)

## Data Protection Principles

1. Least privilege by default for users, services, and operators.
2. Consent-first sharing for location, battery, and status surfaces.
3. Sensitive fields are classified and access-scoped.
4. Auditability for security-sensitive actions.

## Baseline Controls Implemented

- `helmet` hardening enabled in API bootstrap.
- Strict input validation (`whitelist`, `forbidNonWhitelisted`, `transform`).
- CORS allow-list controlled by environment variable.
- Deterministic care-state logic that blocks legacy state during outages, notification failure, payment issues, or known client bugs.

## Required Next Controls

1. AuthN/AuthZ
- OAuth providers (Apple, Google) + secure token lifecycle.
- Couple-scoped authorization checks on every sensitive endpoint.

2. Secrets
- Runtime secrets from cloud secret manager only.
- No secrets committed in source control.

3. Abuse & Fraud
- Rate limits by IP/account/device and suspicious action throttles.
- Server-authoritative star ledger and idempotency keys for spend events.

4. Privacy & Compliance
- Data export and deletion pipelines.
- Consent history tables for partner-visible toggles.
- Incident runbook and audit event retention policy.

5. Storage
- Signed upload/download URLs.
- Malware and content safety scanning pipeline for media uploads.
