# Test strategy

## Purpose
Balance risk coverage, feedback speed, and maintainability.

## Test pyramid
- Unit tests: fastest, highest volume
- API and service tests: stable integration signal
- UI tests: thin layer for critical flows

## Risk approach
- Prioritize revenue, security, and data integrity paths
- Map tests to product risks, not just features
- Keep the suite small and high-signal

## Environments
- Local: fast dev feedback
- CI: deterministic, gated merges
- Staging: prod-like confidence checks
