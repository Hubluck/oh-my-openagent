---
type: concept
created: 2026-06-15
updated: 2026-06-15
---

# RAG (Retrieval-Augmented Generation)

> 질의 시점에 외부 문서를 검색해 LLM 답변에 끼워 넣는 방식.

## LLM Wiki와의 비교
[[karpathy-llm-wiki]]에 따르면, **~10만 토큰 이하의 작은 규모**에서는 [[llm-wiki]] 방식이 RAG보다 더 안정적이고 단순하다(검색 정확도 의존도가 낮고 지식이 미리 구조화돼 있어서). 규모가 커지면 RAG/분할이 다시 필요해질 수 있다.

## 관련
- 비교: [[llm-wiki]]
- 종합: [[llm-wiki-vs-rag]]
- 출처: [[karpathy-llm-wiki]]
