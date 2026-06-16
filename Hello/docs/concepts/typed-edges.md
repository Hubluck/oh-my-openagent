---
type: concept
created: 2026-06-15
updated: 2026-06-15
---

# Typed Edges (타입 있는 관계 링크)

> 페이지 간 관계에 **종류(rel)** 를 붙여 frontmatter에 기록하는 방식. 모순을 자동 해소하지 않고 *보존*하기 위한 장치.

## 설명
일반 `[[위키링크]]`는 "연결됨"만 표현한다. typed edge는 관계의 성격을 명시한다:

```yaml
relates_to:
  - page: "Some Author"
    rel: contradicts
  - page: "Another Work"
    rel: extends
```

- **모순 보존**: 특히 인문학 도메인에서 상충하는 주장을 강제로 합치지 않고 둘 다 남긴다.
- **Lint과의 관계**: [[ingest-query-lint]]의 lint는 기존 모순을 결함으로 보지 않고, 오히려 *표시되지 않은* 모순을 찾아낸다.

## 관련
- 상위: [[llm-wiki]]
- 동작: [[ingest-query-lint]]
- 출처: [[karpathy-llm-wiki]]
