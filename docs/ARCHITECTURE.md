# Snuggle Architecture Foundation

## System Scope

- Mobile app: Flutter for primary UX with native widget layers for iOS/Android.
- Backend API: NestJS on Cloud Run.
- Data: PostgreSQL as system of record, Redis for ephemeral/realtime state.
- Storage: object storage for memory media.
- Push: APNs + FCM.

## Founding Technical Decisions

1. Server-authoritative state for stars, companion care, and shared inventory.
2. Privacy boundaries are explicit:
   - E2EE private chat payloads are unreadable by server.
   - Gameplay/economy/permissions remain server-readable for correctness and abuse protection.
3. Widget and status systems are latest-known snapshots, not guaranteed real-time streams.
4. Location/battery sharing are opt-in, revocable, and timestamped.

## API Module Shape (Current Baseline)

- `health`: uptime and liveliness
- `moods`: mood check-ins and recent list
- `care`: deterministic companion state preview logic
- `couples`: relationship profile placeholder
- `memories`: memory rule surface placeholder

## Near-Term Additions

1. Authentication and couple pairing domain with invite lifecycle.
2. PostgreSQL schema and migrations.
3. Permission center APIs + audit log.
4. E2EE chat transport and envelope key model.
5. Job queue for notifications and ritual triggers.
