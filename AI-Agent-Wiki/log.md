# Agent Work Log

이 파일은 에이전트 작업 로그입니다. 중요한 `save`, `ingest`, `reference`, `lint` 작업이 끝날 때 한 줄씩 추가합니다.

**중요 작업의 기준**: wiki 문서를 새로 만들었거나, 결정/실패를 기록했거나, 구조 변경을 했을 때. 단순 조회(`query`, `reference`)만 한 경우는 로그하지 않습니다.

## 형식

```text
YYYY-MM-DD HH:mm | command | summary | linked files
```

예시:

```text
2026-06-14 10:00 | save | 랜딩페이지 톤앤매너 결정 기록 | wiki/decisions/landing-tone.md, wiki/design/voice-guide.md
2026-06-14 11:30 | ingest | 6/14 회의 녹취록 → 요약 1건 | raw/2026-06-14-meeting.md → wiki/sources/2026-06-14-meeting-summary.md
2026-06-14 14:00 | lint | 끊긴 링크 2건 수정, 5필터 미통과 문서 1건 conversations로 이동 | index.md, wiki/concepts/draft-note.md
```

---

## Log

<!-- 새 항목은 아래에 시간순으로 추가 -->

2026-06-14 | init | Hello vault(개인용)에 템플릿 v1.0.0 적용 + Karpathy 원칙 + `reference` 명령 + 5필터 체크리스트 (회사용 _company wiki와 분리 운영) | CLAUDE.md, AGENTS.md, index.md, log.md
2026-06-14 | save | Claude Code 창시자 워크플로우 운영 원칙 저장 (5필터: 3/5 통과 — 재사용성/인수인계성/공통규칙성) | wiki/concepts/claude-code-workflow-principles.md, index.md
