---
type: log
created: 2026-06-15
updated: 2026-06-15
---

# 🪵 작업 로그 (시간순)

새 항목은 위에 추가한다. 형식: `YYYY-MM-DD — 동작 — 요약`

- 2026-06-15 — ingest — 무제 3.md(주식 스크린샷 34장) 처리 → 무제 3.md→주식매매-원본.md, 요약 [[주식매매-메모]] + 개념 [[주도주]]·[[테마주]]·[[조건검색]] 생성, inbox 완료 처리
- 2026-06-15 — lint-fix — 웰빙 원본 이름 통일(무제 2.md→웰빙-원본.md, [[웰빙-메모]] 경로 갱신); 미처리 원본 분류: junk 2개(202605301844·나의 맥락)→_archive, 무제 3·6은 [[inbox]] 등재
- 2026-06-15 — dedup+ingest — 사주 중복 정리(무제 1.md→사주-원본.md 보존, 2026-05-30.md→_archive) 후 ingest → 요약 [[사주-메모]] + 개념 [[사주]]·[[오행]]·[[십성]] 생성, index 갱신
- 2026-06-15 — ingest — raw/sources/무제 2.md(웰빙) 수집 → 요약 [[웰빙-메모]] + 개념 [[웰빙]]·[[워라밸]] 생성, index 갱신 (/wiki-ingest 첫 실전 테스트)
- 2026-06-15 — promote — 위키를 볼트 루트로 승격(llm-wiki/ 제거). 루트 흩어진 파일 정리: 내용 노트 8개→raw/sources, 이미지·드로잉·스크린샷→raw/assets, 빈 스크래치 21개→_archive, 빈 폴더 제거. AGENTS·스킬 경로 갱신
- 2026-06-15 — asset — raw/assets/wiki-structure-mockup.png 추가, [[AGENTS]] 구조 섹션에 임베드
- 2026-06-15 — restructure — Karpathy 레이아웃으로 재배치: CLAUDE.md→[[AGENTS]], raw/(sources·assets)와 wiki/sources 분리, syntheses→analyses, index·log·[[inbox]] 최상단, 스킬 경로 갱신
- 2026-06-15 — refactor — Ingest/Query/Lint 절차를 스킬(.claude/skills/wiki-*)로 분리, CLAUDE.md 슬림화
- 2026-06-15 — ingest(보강) — [[karpathy-llm-wiki]] 재독 → source·[[ingest-query-lint]]·[[rag]]·[[llm-wiki]] 디테일 추가, 신규 개념 [[typed-edges]] 생성
- 2026-06-15 — lint — 역링크 누락(#1) 수정: [[rag]]·[[llm-wiki]] → [[llm-wiki-vs-rag]] 역링크 추가
- 2026-06-15 — query — "LLM Wiki vs RAG" 질의 → 답변을 [[llm-wiki-vs-rag]]로 승격, index 갱신
- 2026-06-15 — ingest — [[karpathy-llm-wiki]] 수집 → 개념 3개([[llm-wiki]], [[ingest-query-lint]], [[rag]]) + 엔티티 1개([[andrej-karpathy]]) 생성, index 갱신
- 2026-06-15 — init — LLM 위키 골격 생성 ([[index]], [[AGENTS]])
