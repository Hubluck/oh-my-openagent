# Save Prompt

```text
이번 작업 내용을 옵시디언에 저장해줘.

1. CLAUDE.md §5와 AGENTS.md §4의 5필터를 적용해서 ✅/❌ 체크 표를 만들어줘.
   - [ ] 재사용성
   - [ ] 인수인계성
   - [ ] 결정 추적성
   - [ ] 리스크 기록성
   - [ ] 공통 규칙성

2. 통과 항목이 1개 이상이면:
   - 적절한 wiki 카테고리 판단 (sources / concepts / decisions / errors / projects / design / dev-tasks)
   - 문서 형식 (frontmatter + Summary / Context / Details / Links) 적용해서 생성
   - index.md 해당 섹션에 링크 추가
   - log.md에 한 줄 추가

3. 통과 항목이 0개면:
   - 저장하지 않는다고 보고
   - 사유 한 줄
   - 필요하면 conversations/에만 남기는 옵션 제시

검증 기준: 만든 문서를 열었을 때 5필터 통과 사유와 결정 근거가 한눈에 보여야 정상.
```
