---
type: concept
created: 2026-06-15
updated: 2026-06-15
---

# RAG (Retrieval-Augmented Generation)

> 질의 시점에 외부 문서를 검색해 LLM 답변에 끼워 넣는 방식.

## LLM Wiki와의 비교
[[karpathy-llm-wiki]]에 따르면, **sub-100k 토큰(≈ 밀집 150~200페이지)** 규모에서는 [[llm-wiki]] 방식이 RAG보다 더 안정적이고 단순하다:
- 벡터DB·임베딩 파이프라인·청킹 튜닝이 **불필요**
- 고립된 스니펫이 아니라 코퍼스 **전역에 걸친 추론** 가능
- 200k~1M+ 컨텍스트 윈도우 확대로 점점 더 현실적

RAG가 꼭 필요해지는 건 위키 전체가 컨텍스트에 안 들어가는 **수백만 토큰** 규모부터다.

## 관련
- 비교: [[llm-wiki]]
- 종합: [[llm-wiki-vs-rag]]
- 출처: [[karpathy-llm-wiki]]
