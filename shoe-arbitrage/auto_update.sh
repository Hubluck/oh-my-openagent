#!/usr/bin/env bash
# 신발 아비트리지 보드 — 매일 자동 업데이트 (macOS / Linux, cron용)
#
# 감시 폴더에 그날 새 xlsx가 떨어지면 → 스냅샷으로 반영 → board.html 갱신.
# Claude(AI)를 전혀 안 쓰므로 사용량 한도와 무관.
#
# 설치:
#   1) 아래 "설정" 3줄을 본인 환경에 맞게 수정
#   2) chmod +x auto_update.sh
#   3) crontab -e 로 아래 한 줄 추가 (매일 17:10 실행 예)
#        10 17 * * * /경로/shoe-arbitrage/auto_update.sh >> /경로/shoe-arbitrage/auto_update.log 2>&1

set -euo pipefail

# ===== 설정 (여기만 고치세요 · 환경변수로도 덮어쓸 수 있음) =====
WATCH_DIR="${WATCH_DIR:-$HOME/Downloads}"   # 매일 새 xlsx가 떨어지는 폴더
PATTERN="${PATTERN:-*.xlsx}"                # 파일 이름 패턴 (예: "*통합표*.xlsx" 로 좁히면 안전)
GIT_PUSH="${GIT_PUSH:-no}"                  # "yes" 면 갱신 후 git 커밋+푸시(다른 기기/온라인 공유용)
# ==============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# 파이썬 찾기 (cron의 PATH는 최소한이라 절대경로까지 시도)
PY=""
for c in python3 python /usr/local/bin/python3 /opt/homebrew/bin/python3 /usr/bin/python3; do
  if command -v "$c" >/dev/null 2>&1; then PY="$(command -v "$c")"; break; fi
done
if [ -z "$PY" ]; then echo "[$(date '+%F %T')] !! python3 를 찾지 못했습니다. 스크립트 상단에 절대경로를 지정하세요."; exit 1; fi

echo "[$(date '+%F %T')] sync 시작 · 감시=$WATCH_DIR 패턴=$PATTERN"
"$PY" build.py sync --from "$WATCH_DIR" --pattern "$PATTERN"

if [ "$GIT_PUSH" = "yes" ]; then
  git add data board.html 2>/dev/null || true
  if ! git diff --cached --quiet 2>/dev/null; then
    git commit -m "chore(shoe-arbitrage): 자동 업데이트 $(date '+%F')" || true
    git push || echo "[$(date '+%F %T')] (push 실패 — 자격증명 확인)"
  fi
fi
echo "[$(date '+%F %T')] 완료"
