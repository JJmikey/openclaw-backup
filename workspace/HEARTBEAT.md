# HEARTBEAT.md

# Keep this file empty (or with only comments) to skip heartbeat API calls.

# Add tasks below when you want the agent to check something periodically.

## Memory 維護檢查（每 3-4 日一次）
- 檢查 memory/*.md 檔案數量
- 如果 >= 10 個 daily files → 提醒用戶考慮每週壓縮 cron job
- 如果 >= 30 個 daily files → 提醒用戶考慮 QMD
- 參考 MEMORY.md #memory-維護策略 嘅啟動條件
