#!/bin/bash
# OpenClaw Backup Script for GitHub
# 會自動 redact 敏感資料

BACKUP_DIR="/tmp/openclaw-backup-$(date +%Y%m%d)"
mkdir -p "$BACKUP_DIR"

echo "🦞 開始備份 OpenClaw..."

# 1. 備份 workspace（safe，冇 secrets）
echo "📁 備份 workspace..."
cp -r /data/workspace "$BACKUP_DIR/"

# 2. 備份 config（但要 redact secrets）
echo "⚙️  備份 config（redact 敏感資料）..."
cat /data/.openclaw/openclaw.json | \
  sed 's/"apiKey": "[^"]*"/"apiKey": "__REDACTED__"/g' | \
  sed 's/"botToken": "[^"]*"/"botToken": "__REDACTED__"/g' | \
  sed 's/"token": "[^"]*"/"token": "__REDACTED__"/g' > \
  "$BACKUP_DIR/openclaw-config-redacted.json"

# 3. 備份 memory（如果有的話）
if [ -d "/data/.openclaw/agents/main/sessions" ]; then
  echo "🧠 備份 sessions..."
  cp -r /data/.openclaw/agents/main/sessions "$BACKUP_DIR/"
fi

# 4. 建立 .env.example（記錄要填咩 secrets）
cat > "$BACKUP_DIR/.env.example" << 'EOF'
# OpenClaw Secrets - 手動填入
OPENAI_API_KEY=sk-...
KIMI_API_KEY=...
TELEGRAM_BOT_TOKEN_LOBSTER=...
TELEGRAM_BOT_TOKEN_FOKZAI=...
TELEGRAM_BOT_TOKEN_PINGPING=...
TELEGRAM_BOT_TOKEN_FAATZAI=...
BRAVE_API_KEY=...
NVIDIA_API_KEY=...
EOF

# 5. 建立 README
cat > "$BACKUP_DIR/README.md" << EOF
# OpenClaw Backup

備份日期：$(date)
來源：Railway

## 檔案結構

- \`workspace/\` - SOUL.md, USER.md, MEMORY.md, skills 等
- \`openclaw-config-redacted.json\` - Config（secrets 已 redact）
- \`sessions/\` - Session history
- \`.env.example\` - 要填入的 secrets 清單

## 還原步驟

1. 喺新機安裝 OpenClaw
2. Copy workspace/ 去 \`~/workspace\`
3. 填入 .env.example 的 secrets
4. 用 \`openclaw config apply\` 載入 config

## Secrets 檢查清單

- [ ] OpenAI API Key
- [ ] Kimi API Key
- [ ] Telegram Bot Tokens (4個)
- [ ] Brave Search API Key
- [ ] NVIDIA API Key
EOF

echo ""
echo "✅ 備份完成！位置：$BACKUP_DIR"
echo ""
echo "📋 接下來："
echo "1. cd $BACKUP_DIR"
echo "2. git init"
echo "3. git add ."
echo "4. git commit -m 'OpenClaw backup'"
echo "5. git remote add origin https://github.com/你的username/openclaw-backup.git"
echo "6. git push -u origin main"
