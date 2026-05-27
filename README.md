# Snuggle

Snuggle is a private, cozy relationship companion for couples with mood rituals, shared care companions, widgets, memories, and secure chat.

This repository now contains the founding engineering baseline:

- `apps/mobile`: Flutter iOS/Android app shell with a premium UI direction and launch theme system.
- `apps/api`: NestJS API scaffold with strict request validation, secure defaults, and tested companion state logic.
- `docs`: architecture, security, and implementation foundation docs.

## Product Guardrails

- Privacy is a feature: consent-first permissions and secure defaults.
- Cost-effective scaling: Cloud Run + PostgreSQL + Redis architecture.
- Server-authoritative game economy and care state transitions.
- Reliability before growth: testable domain rules and clear rollout phases.

## Local Start

### Mobile

```bash
cd apps/mobile
flutter run
```

### API

```bash
cd apps/api
cp .env.example .env
npm run start:dev
```

### API Quality Checks

```bash
cd apps/api
npm run lint
npm test
npm run test:e2e
npm run build
```
