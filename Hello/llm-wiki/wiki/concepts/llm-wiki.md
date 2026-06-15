---
type: concept
created: 2026-06-15
updated: 2026-06-15
---

# LLM Wiki

> LLM이 점진적으로 만들고 유지하는, 서로 링크된 마크다운 지식베이스. 원본 자료와 사용자 사이의 "지속적 기억" 층.

## 설명
전통적 위키는 사람이 유지보수를 귀찮아해서 방치된다. LLM Wiki는 그 잡일(요약·링크·일관성)을 LLM에게 맡겨, 자료를 넣을수록 지식이 **누적(compound)** 되게 한다.

구성은 3개 층:
1. **Raw Sources** — 사람이 모으는 불변 원본 ([[andrej-karpathy]]가 강조: 큐레이션은 사람 몫)
2. **Wiki** — LLM이 만드는 페이지(요약·개념·엔티티·종합·index·log)
3. **Schema** — 운영 규칙 설정 파일

## 관련
- 동작 방식: [[ingest-query-lint]]
- 비교 대상: [[rag]]
- 종합: [[llm-wiki-vs-rag]]
- 출처: [[karpathy-llm-wiki]]
