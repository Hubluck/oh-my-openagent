# CLAUDE.md — Vault Root 운영 지도

이 볼트(Obsidian) 루트에는 **서로 독립적으로 운영되는 여러 영역**이 섞여 있다.
이 파일의 목적은 단 하나: **"무엇이 어느 폴더에 있고, 새 작업물은 어디에 두며, 어디는 건드리면 안 되는지"** 를 한눈에 정하는 것.

각 영역은 자체 규칙 파일을 가진다. **그 영역에서 일할 때는 먼저 해당 규칙 파일을 읽고 그 규칙을 따른다.** 이 루트 파일은 그 규칙들보다 위가 아니라, 영역으로 가는 **라우팅 안내**일 뿐이다.

---

## 0. 작업 전 원칙 (공통)

1. **가정을 드러내라.** 어느 영역의 작업인지 모호하면 멈추고 묻는다. 조용히 추측해서 엉뚱한 폴더에 쓰지 않는다.
2. **최소·국소 변경.** 요청된 결과에 필요한 가장 작은 변경만. 대상이 아닌 영역의 index/log/문서는 건드리지 않는다.
3. **읽기 전용 존중.** 아래 표에서 `raw/` · `00_Raw/`로 표시된 원본 자료는 **수정·삭제하지 않는다.** 가공물은 항상 새 문서로 만든다.
4. **검증 한 줄.** 작업이 끝나면 "어떻게 확인하면 정상인지"를 한 줄로 보고한다.

---

## 1. 폴더 지도

| 폴더 | 무엇인가 | 규칙 파일 (먼저 읽기) | 새 작업물 위치 / 주의 |
|---|---|---|---|
| `_company/` | 1인 기업 OS. AI 에이전트(ceo·developer·designer·writer 등)의 공유 메모리·세션·승인 워크플로 | `_company/_shared/_system.md` | 산출물은 `sessions/<ts>/`. 공유 기억은 `_shared/`. `00_Raw/`는 읽기 전용. `_agents/*/config.md`는 시크릿(절대 커밋/노출 금지) |
| `Hello/` | Karpathy 패턴 LLM 위키 (이 폴더 자체가 위키 루트) | `Hello/AGENTS.md` | 원본은 `Hello/raw/`(불변), 가공된 위키 문서는 `Hello/docs/`(sources·concepts·entities·analyses). 운영은 `/wiki-ingest`·`/wiki-query`·`/wiki-lint` 스킬 |
| `AI-Agent-Wiki/` | 또 다른 LLM 위키 (자체 CLAUDE.md 보유, AI 에이전트 주제) | `AI-Agent-Wiki/CLAUDE.md` | 원본 `AI-Sessions/raw/`(불변), 가공 `AI-Sessions/wiki/`. `save`/`reference`/`ingest`/`query`/`lint` 명령 규약 |
| `knowledge/` | 범용 지식 베이스 (raw → notes 2계층) | `knowledge/index.md` | 원본 `knowledge/raw/`(불변), 가공 노트 `knowledge/notes/`. 노트 상단에 `source:` 출처 명시 |
| `video/` | Remotion(React) 영상 프로젝트. **코드 프로젝트** — 위키 아님 | `video/README.md`, `video/package.json` | `node_modules`는 `.gitignore`. 코드 작업은 `video/src/`. 여기서는 위키 규칙 적용 안 함 |
| `data/` | 런타임 상태 저장소(`state_store.db`, `stream_store`) | — | **자동 생성 데이터.** 직접 편집하지 않는다 |
| `indox.html` | 단독 정적 HTML(랜딩/메모성) | — | 독립 파일. 어느 위키에도 속하지 않음 |
| `company_state.json` | `_company` 진행 상태 카운터 | — | 자동 갱신. 손으로 고치지 않음 |

> `무제.md`(빈 파일), `_archive/`류는 스크래치/폐기 보관소다. 위키 대상이 아니다.

---

## 2. "이거 저장해줘" 라우팅 규칙

새 내용을 어디에 둘지 헷갈릴 때 순서대로 판단한다:

1. **에이전트 회사 업무(브랜딩·기획·세션 산출물)** → `_company/`
2. **AI 에이전트 주제의 정제 지식** → `AI-Agent-Wiki/`
3. **일반 주제의 위키성 지식** → `Hello/`
4. **출처 있는 자료 정리 노트** → `knowledge/`
5. **영상 제작 코드** → `video/`

어디에도 깔끔히 안 맞으면 **묻는다.** 임의로 루트에 흩뿌리지 않는다.

---

## 3. 절대 규칙

- 모든 `raw/` · `00_Raw/` 원본은 **읽기 전용**. 가공은 항상 별도 가공 폴더에 새 문서로.
- `_agents/*/config.md`, API 키·토큰·비밀번호·고객 개인정보는 **저장/커밋/노출 금지** (사용자가 명시 요청하지 않는 한).
- 한 영역 작업이 다른 영역의 index/log/링크를 깨뜨렸다면, 그 끊긴 링크만 직접 보강한다.

---

## 4. Git / 동기화 메모

- 이 볼트는 obsidian-git가 **약 10분마다 `dev` 브랜치에 로컬 자동 커밋**만 한다 (원격 push/pull 없음). 노트 보존용이다.
- `video/`는 **자체 `.git`을 가진 별도 저장소**다. 볼트 git과 혼동하지 말 것.
- 커밋·푸시는 사용자가 명시적으로 요청할 때만.
