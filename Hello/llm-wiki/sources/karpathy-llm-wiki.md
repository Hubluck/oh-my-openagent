---
type: source
created: 2026-06-15
updated: 2026-06-15 (재독 보강)
url: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
author: Andrej Karpathy
---

# (Source) Karpathy — LLM Wiki: A Personal Knowledge System

> 출처: [gist.github.com/karpathy/442a6bf...](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
> 저자: [[andrej-karpathy]]

## 3줄 요약
- 나와 원본 자료 사이에 **LLM이 직접 관리하는 마크다운 지식베이스**를 둔다.
- 매번 처음부터 검색·요약하는 대신, 서로 링크된 위키 페이지를 쌓아 지식이 **누적**된다.
- 사람은 자료 큐레이션과 비판적 사고에 집중하고, 링크·일관성 유지 같은 잡일은 LLM이 맡는다.

## 핵심 포인트
- **3개 층**: Raw Sources(원본, 사람이 큐레이션) / Wiki(LLM 생성 페이지) / Schema(운영 규칙, CLAUDE.md 같은 설정).
- **3개 동작**: [[ingest-query-lint]] — Ingest(수집·통합), Query(출처 단 답변), Lint(건강검진).
- 좋은 Query 답변은 **영구 위키 페이지로 승격**된다.
- **~10만 토큰 이하 규모**에선 [[rag]]보다 안정적이고 단순하다.

## 추가 디테일 (2026-06-15 재독으로 보강)
- **디렉터리 관례**: 원본은 `raw/`(이미지는 `raw/assets/`), 위키는 `wiki/`. 스키마는 `CLAUDE.md`/`AGENTS.md`.
  - 참고: 본 볼트는 `raw/` 대신 `sources/`를 쓴다 (구현상 차이, 의미는 동일).
- **페이지 종류**: source 요약 / 엔티티 / 개념 / 도메인 전체 overview / index / log.
- **log 형식**: append-only, 파싱 가능한 헤더 `## [YYYY-MM-DD] operation | Title`.
- **Ingest 규모감**: 자료 하나가 기존 **10~15개 페이지**를 건드릴 수 있다.
- **충돌 처리**: frontmatter에 **typed edges**(`relates_to: rel: contradicts/extends`)로 모순을 *보존*. → [[typed-edges]]
- **규모 근거**: sub-100k 토큰 ≈ **밀집 150~200페이지**. 벡터DB/임베딩/청킹 불필요, 전역 추론 가능. → [[rag]]
- **설계 원칙**: 증분 컴파일 / 누적 아티팩트 / append-only / 멱등성 / 출처 기반 의미 식별. → [[llm-wiki]]
- **도구**: Obsidian(Web Clipper·graph view·Dataview) + Git(버전·되돌리기). 대규모는 qmd(BM25+벡터).

## 파생 페이지
- 개념: [[llm-wiki]], [[ingest-query-lint]], [[rag]], [[typed-edges]]
- 엔티티: [[andrej-karpathy]]
