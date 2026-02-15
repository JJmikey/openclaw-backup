# OpenClaw Backup

備份日期：Sun Feb 15 07:14:03 UTC 2026
來源：Railway

## 檔案結構

- `workspace/` - SOUL.md, USER.md, MEMORY.md, skills 等
- `openclaw-config-redacted.json` - Config（secrets 已 redact）
- `sessions/` - Session history
- `.env.example` - 要填入的 secrets 清單

## 還原步驟

1. 喺新機安裝 OpenClaw
2. Copy workspace/ 去 `~/workspace`
3. 填入 .env.example 的 secrets
4. 用 `openclaw config apply` 載入 config

## Secrets 檢查清單

- [ ] OpenAI API Key
- [ ] Kimi API Key
- [ ] Telegram Bot Tokens (4個)
- [ ] Brave Search API Key
- [ ] NVIDIA API Key
