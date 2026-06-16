# CLAUDE.md — `docs/` 작업 규칙

이 폴더에서 Claude이 작업할 때 따르는 규칙. **공통 스키마의 단일 기준은 `../AGENTS.md`** 이며, 충돌하면 `AGENTS.md`가 우선한다. 이 파일은 `docs/` 특화 요약일 뿐이다.

## 이 폴더의 목적

**재사용 가능한 가공 지식.** 원본(`../raw/`)을 소화해 내 언어로 재구성한 위키 문서를 둔다. 검색·연결·재활용이 쉬워야 한다.

하위 분류: `sources/`(원본 요약) · `concepts/`(개념) · `entities/`(인물·조직·도구) · `analyses/`(여러 자료 종합).

## 절대 규칙

1. **원본을 그대로 옮기지 않는다.** 반드시 재구성·재요약한다. 원문 복붙은 금지(그건 `../raw/`의 역할).
2. **고립 노트 금지.** 모든 페이지는 최소 1개 이상 `[[wikilink]]`로 다른 페이지와 연결한다.
3. **frontmatter 필수:** `type`(source|concept|entity|analysis), `created`, `updated`.
4. **출처 표기 — 페이지 종류에 따라 다르다:**
   - `sources/` 페이지: frontmatter에 `source: raw/sources/<원본>.md` (원본 **경로**)로 명시.
   - `concepts/`·`entities/`·`analyses/` 페이지: 하나의 원본에 고정되지 않으므로 frontmatter `source`를 강제하지 않는다. 대신 **본문에서 근거를 `[[원본요약페이지]]`로 연결**한다(예: `[[사주-메모]]`).

## 파일 명명 규칙

**개념 중심, 날짜 없음.** 검색·회상하기 쉬운 이름.
- 한국어 개념은 그대로: `사주.md`, `웰빙.md`
- 영어/도구명은 kebab-case: `llm-wiki.md`, `andrej-karpathy.md`

```
<개념 또는 주제>.md
```

## 마무리
새 페이지를 만들거나 고치면 상위 `../index.md`·`../log.md`를 갱신한다. 절차 상세는 `/wiki-ingest`·`/wiki-query`·`/wiki-lint` 스킬을 따른다.
