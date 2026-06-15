---
type: source
created: 2026-06-15
updated: 2026-06-15
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

## 파생 페이지
- 개념: [[llm-wiki]], [[ingest-query-lint]], [[rag]]
- 엔티티: [[andrej-karpathy]]
