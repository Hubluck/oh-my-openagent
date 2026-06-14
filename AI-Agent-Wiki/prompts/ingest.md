# Ingest Prompt

```text
AI-Sessions/raw/에 추가된 자료를 ingest 해줘.

규칙:
- raw 원본은 절대 수정·삭제하지 않는다 (읽기 전용).
- 가공물은 모두 AI-Sessions/wiki/ 아래로.

작업 순서:
1. raw 자료를 읽고 출처/날짜/저자를 파악
2. wiki/sources/<date>-<slug>.md에 요약 문서 생성
   - frontmatter: type: source / source: <원본 경로>
   - Summary / Context / Details / Links
3. 5필터 적용해서 다음으로 확장 여부 판단:
   - 반복 사용 개념 발견 → wiki/concepts/
   - 의사결정 필요/완료 → wiki/decisions/
   - 실패 사례 → wiki/errors/
   - 프로젝트 맥락 → wiki/projects/
4. 새 문서들끼리, 그리고 sources 문서와 [[링크]]로 연결
5. index.md 해당 섹션에 링크 추가
6. log.md에 한 줄 추가

검증 기준: 원본을 모르는 다른 에이전트가 wiki/sources/의 요약만 읽어도 원본의 핵심을 파악할 수 있어야 정상.
```
