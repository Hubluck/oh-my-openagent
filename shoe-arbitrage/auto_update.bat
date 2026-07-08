@echo off
REM 신발 아비트리지 보드 - 매일 자동 업데이트 (Windows, 작업 스케줄러용)
REM 감시 폴더의 새 xlsx를 스냅샷으로 반영하고 board.html을 갱신합니다. (AI 사용 안 함 = 한도 무관)
REM
REM 설치:
REM   1) 아래 WATCH_DIR / PATTERN 를 본인 환경에 맞게 수정
REM   2) 작업 스케줄러 > 기본 작업 만들기 > 매일 17:10 > 프로그램 시작 > 이 .bat 선택
REM      "시작 위치"에 이 폴더 경로를 넣어주세요.

setlocal
set "WATCH_DIR=%USERPROFILE%\Downloads"
set "PATTERN=*.xlsx"

cd /d "%~dp0"

where python >nul 2>nul && (set "PY=python") || (set "PY=py")

echo [%date% %time%] sync 시작 (감시: %WATCH_DIR%) >> auto_update.log
%PY% build.py sync --from "%WATCH_DIR%" --pattern "%PATTERN%" >> auto_update.log 2>&1
echo [%date% %time%] 완료 >> auto_update.log
endlocal
