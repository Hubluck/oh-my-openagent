---
type: concept
date: 2026-06-14
status: active
source: 사용자가 공유한 "Claude Code 창시자의 Claude.md" 가이드라인
---

# Claude Code 워크플로우 운영 원칙

## Summary

Claude Code/에이전트가 코딩·과업 수행 시 따라야 하는 메타 운영 원칙. 세 묶음으로 구성: **Workflow Orchestration**(6원칙), **Task Management**(6단계), **Core Principles**(3개).

vault의 [[CLAUDE]] §0 / [[AGENTS]] §0에 이미 들어 있는 Karpathy 4원칙(가정 명시·최소 변경·국소 수정·검증 가능한 성공 기준)과 보완 관계 — Karpathy가 "코딩 시 실수 줄이기"라면 이 가이드는 "워크플로우 자체를 견고하게 만들기".

## Context

언제 적용:
- 3단계 이상의 비자명한 작업
- 아키텍처 결정이 섞인 작업
- 사용자가 버그 리포트를 던졌을 때 (자율 수정)
- 작업이 hacky하게 느껴질 때 (elegance 재검토)

스킵 가능:
- 단일 명령어로 끝나는 사소한 수정
- 명확한 1-step 작업

---

## Details

### A. Workflow Orchestration

1. **Plan Mode Default** — 비자명한 작업(3단계 이상 또는 아키텍처 결정)에는 항상 plan mode 진입. 도중에 어긋나면 즉시 멈추고 재계획. plan은 빌드뿐 아니라 검증 단계에도 사용. 상세 스펙을 먼저 써서 모호함을 줄임.

2. **Subagent Strategy** — 메인 컨텍스트 윈도우를 깨끗하게 유지하기 위해 subagent를 적극 활용. 리서치·탐색·병렬 분석은 subagent로 분리. 복잡한 문제는 subagent를 더 많이 던져서 컴퓨트로 해결. 하나의 subagent에는 하나의 과업만.

3. **Self-Improvement Loop** — 사용자 교정이 있을 때마다 `tasks/lessons.md`에 패턴을 기록. 같은 실수를 막을 규칙을 자기 자신을 위해 작성. 실수율이 떨어질 때까지 가차없이 이터레이션. 세션 시작 시 관련 프로젝트의 lessons 검토.

4. **Verification Before Done** — 작동 증명 없이는 절대 완료 처리 금지. 필요 시 main과 변경분의 동작 차이 비교. "스태프 엔지니어가 승인할 수준인가?" 자문. 테스트·로그·실증으로 정확성 입증.

5. **Demand Elegance (Balanced)** — 비자명한 변경은 잠시 멈춰 "더 우아한 방법이 있는가?" 자문. 수정이 hacky하게 느껴지면 "지금 알고 있는 모든 걸 바탕으로 우아한 솔루션 구현". 단, 단순·자명한 수정은 스킵 (오버엔지니어링 금지). 결과 제출 전 본인 작업을 도전해보기.

6. **Autonomous Bug Fixing** — 버그 리포트를 받으면 바로 수정. 단계별 안내 요구 금지. 로그·에러·실패 테스트를 가리키고 → 그것을 해결. 사용자 입장에서 컨텍스트 스위칭이 0이어야 함. CI 테스트가 실패하면 어떻게 하라는 지시 없이도 가서 고침.

### B. Task Management (6단계)

1. **Plan First** — `tasks/todo.md`에 체크 가능한 항목으로 계획 작성
2. **Verify Plan** — 구현 시작 전 사용자에게 한 번 확인
3. **Track Progress** — 진행 중 항목을 하나씩 완료 표시
4. **Explain Changes** — 단계별로 하이라이트 요약
5. **Document Results** — `tasks/todo.md`에 리뷰 섹션 추가
6. **Capture Lessons** — 교정 후 `tasks/lessons.md` 업데이트

### C. Core Principles (3개)

- **Simplicity First** — 모든 변경은 가능한 한 단순하게. 영향 코드 최소화.
- **No Laziness** — 근본 원인을 찾는다. 임시 땜빵 금지. 시니어 개발자 기준.
- **Minimal Impact** — 변경은 꼭 필요한 부분만 건드린다. 새 버그를 만들지 않는다.

---

## Links

- [[CLAUDE]] §0 — Karpathy 4원칙 (이 vault의 운영 메타)
- [[AGENTS]] §0 — 동일 원칙 (Codex/타 에이전트용)
- [[index]] — vault 전체 지도

## 적용 메모

이 vault에서 `save`/`reference`/`ingest`/`query`/`lint` 명령을 실행할 때, 위 6+6+3 원칙을 운영 베이스로 깔고 작업한다. CLAUDE.md §5의 5필터 저장 규칙은 그대로 유지 (filter 5조건이 더 엄격함).
