# AI Agent Wiki Index

이 문서는 vault 전체의 지도입니다. 에이전트는 중요한 wiki 문서를 만들거나 갱신한 뒤 이 문서에 링크를 추가해야 합니다.

---

## Start Here

- [[START_HERE]] — 첫 실행 프롬프트
- [[CLAUDE]] — Claude Code용 운영 규약
- [[AGENTS]] — Codex 등 기타 에이전트용 운영 규약
- [[README]] — 템플릿 개요
- [[TEMPLATE_MANIFEST]] — 템플릿 매니페스트
- [[log]] — 작업 로그

---

## Command Reference (자연어 트리거)

| 명령 | 자연어 예시 |
|---|---|
| `save` | "옵시디언에 저장해줘" |
| `reference` | "옵시디언 참조" |
| `ingest` | "raw 자료 정리해줘" |
| `query` | "위키에서 X 찾아줘" |
| `lint` | "위키 점검해줘" |

자세한 규칙: [[CLAUDE]] §2, [[AGENTS]] §3

---

## Vault Structure

```text
AI-Agent-Wiki/
├── CLAUDE.md            (Claude Code 운영 규약)
├── AGENTS.md            (Codex 등 운영 규약)
├── index.md             (이 파일)
├── log.md               (작업 로그)
├── START_HERE.md        (첫 실행 프롬프트)
├── README.md
├── prompts/             (상황별 프롬프트)
└── AI-Sessions/
    ├── raw/             (불변 원본 — 읽기 전용)
    ├── conversations/   (세션 인수인계)
    └── wiki/
        ├── sources/     (raw 요약)
        ├── concepts/    (반복 사용 개념)
        ├── decisions/   (의사결정)
        ├── errors/      (실패/리스크)
        ├── projects/    (프로젝트 맥락)
        ├── design/      (디자인 가이드)
        └── dev-tasks/   (개발 태스크)
```

---

## Save Filter (저장 전 5체크)

1. **재사용성** — 반복해서 재사용될 정보인가?
2. **인수인계성** — 이어받을 사람이 반드시 읽어야 하는가?
3. **결정 추적성** — 근거와 결정권자 추적이 필요한가?
4. **리스크 기록성** — 다시 반복하면 안 되는 실패인가?
5. **공통 규칙성** — 팀이 공유해야 하는 규칙·가이드인가?

자세한 적용 방식: [[CLAUDE]] §5

---

## Projects

아직 등록된 프로젝트가 없습니다.

<!-- 프로젝트가 생기면 아래 형식으로 추가:
- [[AI-Sessions/wiki/projects/프로젝트명]] — 한 줄 설명
-->

---

## Decisions

아직 등록된 의사결정이 없습니다.

<!-- 추가 형식:
- YYYY-MM-DD [[AI-Sessions/wiki/decisions/결정명]] — 결정권자 / 한 줄 요약
-->

---

## Sources

아직 등록된 source 문서가 없습니다.

---

## Concepts

아직 등록된 concept 문서가 없습니다.

---

## Errors / Lessons

아직 등록된 error 문서가 없습니다.

---

## Design

아직 등록된 design 문서가 없습니다.

---

## Dev Tasks

아직 등록된 dev-task 문서가 없습니다.

---

## Prompt Library

- [[prompts/first-setup]]
- [[prompts/save]]
- [[prompts/query]]
- [[prompts/ingest]]
- [[prompts/lint]]
