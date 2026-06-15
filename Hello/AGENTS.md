# LLM Wiki — Schema (운영 규칙)

이 파일은 LLM이 이 위키를 **어떻게 유지·관리할지**를 정의하는 설정이다.
(Karpathy의 "LLM Wiki" 패턴 기반)

## 구조

이 볼트 **루트 자체가 위키**다 (2026-06-15 승격).

```
<vault root>/
├── AGENTS.md        ← (이 파일) 운영 규칙 / 스키마
├── index.md         ← 전체 목차 / 진입점
├── log.md           ← 시간순 작업 로그
├── inbox.md         ← 미처리 캡처(아직 ingest 안 된 메모·링크)
├── raw/             ← 원본(불변, 사람이 추가). LLM은 읽기만.
│   ├── sources/     ← 원본 문서(아티클·논문·메모)
│   └── assets/      ← 이미지·드로잉 등 첨부
├── wiki/            ← LLM 생성물
│   ├── sources/     ← 원본의 요약 페이지 (raw/sources 한 건당 하나)
│   ├── concepts/    ← 개념 페이지
│   ├── entities/    ← 인물·조직·도구 등 엔티티 페이지
│   └── analyses/    ← 여러 자료를 종합·분석한 페이지
└── _archive/        ← 빈/폐기 스크래치 보관 (위키 대상 아님)
```

핵심 구분: **`raw/` = 원본(불변)**, **`wiki/` = LLM이 만든 지식**. 특히 `raw/sources/`(원본)와 `wiki/sources/`(그 요약)를 혼동하지 말 것.

목표 레이아웃 참고 이미지:
![[wiki-structure-mockup.png]]

## 3가지 핵심 동작 → 스킬로 위임
절차 상세는 각 스킬에 있다 (이 파일은 공통 규칙만 보유).
- **Ingest** (자료 수집) → `/wiki-ingest`
- **Query** (출처 단 답변 + synthesis 승격) → `/wiki-query`
- **Lint** (건강검진, 보고만) → `/wiki-lint`

세 스킬 모두 아래 "페이지 작성 규칙"을 공통 기준으로 따른다.

## 페이지 작성 규칙
- 모든 페이지 상단에 frontmatter: `type`(source|concept|entity|analysis), `created`, `updated`.
- 페이지 연결은 Obsidian `[[위키링크]]` 사용 (파일명 기준이라 폴더 이동에도 안 깨짐).
- 한 페이지 = 한 주제. 길어지면 분리한다.
- 사실에는 출처를 붙인다. 추측은 "추정:"으로 표시한다.
- 이미지는 `raw/assets/`에 두고 본문에서 참조한다.

## 규모 가이드
- 전체 위키가 ~10만 토큰 이하일 때 가장 잘 작동한다.
- 그 이상 커지면 `wiki/analyses/`로 압축하거나 주제별로 분할한다.
