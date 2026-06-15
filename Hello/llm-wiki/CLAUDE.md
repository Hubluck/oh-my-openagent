# LLM Wiki — Schema (운영 규칙)

이 파일은 LLM이 이 위키를 **어떻게 유지·관리할지**를 정의하는 설정이다.
(Karpathy의 "LLM Wiki" 패턴 기반)

## 구조

```
llm-wiki/
├── CLAUDE.md        ← (이 파일) 운영 규칙
├── sources/         ← 원본 자료 (절대 수정하지 않음, 사람이 추가)
└── wiki/
    ├── index.md     ← 전체 목차 / 진입점
    ├── log.md       ← 시간순 작업 로그
    ├── concepts/    ← 개념 페이지
    ├── entities/    ← 인물·조직·도구 등 엔티티 페이지
    └── syntheses/   ← 여러 자료를 종합한 정리 페이지
```

## 3가지 핵심 동작 → 스킬로 위임
절차 상세는 각 스킬에 있다 (이 파일은 공통 규칙만 보유).
- **Ingest** (자료 수집) → `/wiki-ingest`
- **Query** (출처 단 답변 + synthesis 승격) → `/wiki-query`
- **Lint** (건강검진, 보고만) → `/wiki-lint`

세 스킬 모두 아래 "페이지 작성 규칙"을 공통 기준으로 따른다.

## 페이지 작성 규칙
- 모든 페이지 상단에 frontmatter: `type`(source|concept|entity|synthesis), `created`, `updated`.
- 페이지 연결은 Obsidian `[[위키링크]]` 사용.
- 한 페이지 = 한 주제. 길어지면 분리한다.
- 사실에는 출처를 붙인다. 추측은 "추정:"으로 표시한다.

## 규모 가이드
- 전체 위키가 ~10만 토큰 이하일 때 가장 잘 작동한다.
- 그 이상 커지면 `syntheses/`로 압축하거나 주제별로 분할한다.
