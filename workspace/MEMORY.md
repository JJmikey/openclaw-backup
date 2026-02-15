# MEMORY.md - 長期記憶

_龍蝦仔嘅 curated 記憶 — 值得記住嘅嘢_

---

## 👤 關於 Mikey

- **名稱**: Mikey
- **Telegram ID**: 6579305341
- **溝通風格**: 廣東話 / 香港式 / 直接唔囉嗦
- **偏好**: 簡潔、高效、可靠

---

## 🤖 Agents

### 龍蝦仔 (Main)
- **身份**: 主 agent
- **Model**: Kimi K2.5 (kimi-coding/k2p5)
- **Emoji**: 🦞
- **Telegram**: @lobsterboyy_bot
- **用途**: 日常對話、協調其他 agents

### 福仔 (Fok Zai)
- **身份**: NVIDIA sub-agent
- **Model**: NVIDIA Kimi K2.5 (nvidia/moonshotai/kimi-k2.5)
- **Emoji**: 🧧
- **Telegram**: @fok_zai_bot
- **用途**: Heavy lifting、複雜任務、Moltbook 互動
- **Group Policy**: `open`（會回覆所有人）
- **Moltbook Profile**: https://moltbook.com/u/LobsterLobster

### 平平 (Ping Ping)
- **身份**: NVIDIA sub-agent（MiniMax）
- **Model**: NVIDIA MiniMax M2.1 (nvidia/minimaxai/minimax-m2.1)
- **Emoji**: ⚖️
- **Telegram**: @pingping_bot
- **用途**: 測試 MiniMax model

### 發仔 (Faat Zai)
- **身份**: NVIDIA sub-agent（Step-3.5 Flash）
- **Model**: NVIDIA stepfun-ai/step-3.5-flash
- **Emoji**: 💰
- **Telegram**: @faat_zai_bot
- **用途**: 測試 Step-3.5 Flash model

---

## 🔧 重要設定

### Model 註冊
要喺兩個地方加新 model：
1. `models.providers.nvidia.models` - API 詳情
2. `agents.defaults.models` - Agent 可用 alias

### Sub-agent 預設
```
agents.defaults.subagents.model = "nvidia/moonshotai/kimi-k2.5"
```

### Group Chat Mention Patterns
- 龍蝦仔: `@lobsterboyy_bot`, "龍蝦仔"
- 福仔: `@fok_zai_bot`, "福仔"
- 平平: `@pingping_bot`, "平平"
- 發仔: `@faat_zai_bot`, "發仔"

---

## 🔑 API Keys 位置

| Service | 位置 |
|---------|------|
| Brave Search | 直接喺 config |
| NVIDIA | 直接喺 config |
| Moltbook | `.secrets/moltbook.md` |

---

## 📅 重要日期

- **2026-02-12**: 第三次 setup 完成，福仔、平平誕生
- **2026-02-13**: 發仔誕生，OpenClaw 2026.2.12 新版本發佈

---

## 💡 經驗教訓

1. **Model not allowed error** → 要加去 `agents.defaults.models`
2. **Moltbook rate limit** → 30 分鐘一個 post
3. **Gateway restart** → 改 config 後要 kill process 等佢自己 restart
4. **Group chat 回覆** → 要設定 `mentionPatterns` 區分唔同 agents

---

## 📝 待辦 / 跟進

- [ ] 整理 .secrets/ 夾結構
- [ ] 考慮用 QMD 做 advanced memory search
- [ ] 試連接 IRC channel
- [ ] 安裝有用嘅 skills（GitHub、AgentMail）

---

## 🔄 Memory 維護策略

### 每週壓縮 Cron Job
**現況：** 未需要，手動 review 足夠

**啟動條件（滿足其一即可）：**
- [ ] Daily files 超過 10 個
- [ ] 有長期 project 橫跨多個禮拜
- [ ] 用戶主動要求自動化

**實施時機：** 達到條件後，開 cron job 自動：
1. 讀取過去 7 日 memory files
2. 摘要重要內容
3. 更新 MEMORY.md
4. 封存舊 daily logs

### QMD (Vector Search)
**現況：** File-based memory 已足夠

**啟動條件（滿足其一即可）：**
- [ ] Daily logs 超過 30 個（約一個月）
- [ ] 經常需要 search 返舊對話搵資料
- [ ] 想自動 tag / 分類重要內容
- [ ] 需要 semantic search 過往 context

**實施時機：** 達到條件後，考慮安裝 QMD 做：
- Vector-based memory search
- Auto-tagging
- Cross-reference 相關對話

---

_最後更新: 2026-02-14_
