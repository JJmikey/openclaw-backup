# Morning Brief Skill

**Creates personalized morning briefings with calendar reminders and daily summaries**

---

## Metadata

- Name: morning-brief
- Description: Generate personalized morning briefings with calendar reminders, task summaries, and daily agenda
- Version: 1.0.0
- Author: fokzai for Mikey

---

## Example Usage

**Create a morning brief for a specific date:**
```
幫我整個 Morning Brief 2月27號，朝早8點提醒我下午3:45有小提琴課
```

**Create with multiple reminders:**
```
整個 Morning Brief 3月5號，提我朝早有會議，下午有牙科覆診
```

**List upcoming briefs:**
```
有咩 Morning Brief 係未來几日？
```

**Cancel a brief:**
```
取消2月27號個 Morning Brief
```

---

## Configuration (TOOLS.md)

The agent should store recurring preferences in TOOLS.md under `[morning-brief]`:

```
### Morning Brief Settings
- Preferred time: 08:00 HKT
- Include weather: true/false
- Include calendar: true/false
- Include task summary: true/false
- Default reminder time: 8 hours before event
```

---

## Implementation

When user requests a morning brief:

1. **Parse the request**
   - Extract date (e.g., "2月27號", "next Monday")
   - Extract time (default: 08:00 HKT)
   - Extract events/reminders (e.g., "下午3:45小提琴課")

2. **Create cron job**
   - Schedule: `at` the specified date/time
   - Target: main session
   - Payload: System event with formatted brief

3. **Format the brief message**
   - Header: "🇭🇰 Morning Brief - [Date] ([Day])"
   - Events section: "📅 今日重點行程"
   - Calculate hours until event: "仲有 X 個鐘就要..."
   - Footer: "今日有咩想我幫手？"

4. **Store in memory**
   - Log the scheduled brief to memory/YYYY-MM-DD.md
   - Update any recurring settings if changed

---

## Timezone Handling

All times are converted to UTC for cron scheduling:
- HKT (Hong Kong Time) = UTC+8
- 08:00 HKT = 00:00 UTC
- 10:00 HKT = 02:00 UTC

---

## Response Templates

**When creating a brief:**
```
搞掂！✅ 已設定 Morning Brief：
📅 [Date] 朝早8點 → [Event description]
個 reminder 會同你講「[hours]個鐘就要上堂喇，準備好未？」
```

**When listing briefs:**
```
你而家有 [N] 個 Morning Brief：
1. [Date] → [Event]
2. [Date] → [Event]
```

**When removing a brief:**
```
已取消 [Date] 個 Morning Brief。
```

---

## Error Handling

- If date is in the past → "個日期已經過咗喇，你係咪講緊下個月？"
- If time format is unclear → "你想幾點收呢個 brief？預設係朝早8點。"
- If event description is missing → "你想我提你咩事？"

---

## Related Tools

- `cron` - For scheduling the briefs
- `memory/YYYY-MM-DD.md` - For logging scheduled events
- `TOOLS.md` - For storing user preferences
