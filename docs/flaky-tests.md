# Flaky tests playbook

## Triage
- Reproduce locally with trace and logs
- Identify root cause: timing, data, environment, or product bug
- Create a small repro and fix at the right layer

## Quarantine
- Tag flaky tests and move to a separate job
- Keep flaky suite visible with a clear owner
- Track time to fix and close the loop

## Retries policy
- Avoid blanket retries
- Allow limited retries only for known unstable infra
- Retried tests must log the root cause ticket
