# Bug Report: /status shows incorrect version from config instead of actual runtime version

## Problem
The `/status` command displays the version from `config.meta.lastTouchedVersion` instead of the actual installed OpenClaw version.

## Current Behavior
- `/status` shows: `OpenClaw 2026.2.10 (4baa433)`
- Actual code version: `2026.2.15` (confirmed via `git log` and `package.json`)
- Config shows: `"lastTouchedVersion": "2026.2.10"`

## Expected Behavior
`/status` should display the actual runtime version by checking:
- `package.json` version field, OR
- Git commit SHA

Not the `lastTouchedVersion` from config metadata.

## Steps to Reproduce
1. Install OpenClaw 2026.2.10
2. Update to newer version (e.g., 2026.2.15) via `openclaw update`
3. Restart gateway
4. Run `/status`
5. Observe it still shows 2026.2.10

## Environment
- Platform: Railway (container deployment)
- Deployment: Docker/container
- Update method: `openclaw update.run` via gateway restart

## Additional Context
The `lastTouchedVersion` field in config is designed for config migration tracking, not for reporting the current running version. When the container restarts with new code, this metadata field doesn't automatically update unless the user manually edits and saves the config via the Control UI.

## Suggested Fix
Make `/status` read version from:
1. `package.json` directly, OR
2. Git commit at runtime

Instead of relying on `config.meta.lastTouchedVersion`.
