# Tistory Skin — 개발 가이드

## 📁 프로젝트 구조

```
tistory-skin/
├── skin.html          ← 🚀 배포용 (build.ps1로 자동 생성)
├── skin.css           ← 🚀 배포용 (build.ps1로 자동 생성)
├── build.ps1          ← 빌드 스크립트
├── package.json
│
└── src/               ← ✏️ 여기서 개발!
    ├── html/
    │   ├── 01_head.html              # <head> 태그 (메타, 폰트, 스크립트 링크)
    │   ├── 02_onboarding.html        # 온보딩 랜딩 페이지 HTML
    │   ├── 03_loader.html            # 로딩 스피너
    │   ├── 04_notices.html           # s_t3 래퍼 + 글로벌 헤더 + 공지 + 방명록
    │   ├── 05_list.html              # 글 목록 섹션
    │   ├── 06_cover-types.html       # 커버 레이아웃 타입 (수정 드뭄)
    │   ├── 07_article.html           # 포스트 퍼마링크 + 페이지네이션
    │   ├── 08_sidebar.html           # 사이드바
    │   ├── 09_navigation.html        # 상단/하단 네비게이션 바
    │   └── 10_onboarding-script.html # 온보딩 JS 스크립트
    │
    └── css/
        ├── vendor.css                # ⚠️ 서드파티 (수정 금지)
        ├── _base.css                 # Tistory 기본 UI 오버라이드
        ├── _codeblock.css            # 코드블럭 스타일
        ├── _onboarding.css           # 온보딩 전체 스타일
        ├── _list-article.css         # 목록/아티클 스타일
        └── _sidebar.css              # 사이드바 스타일
```

---

## ⚡ 개발 워크플로우

### 1. 파일 편집
`src/` 하위 파일을 자유롭게 수정합니다.

### 2. 빌드 (배포 파일 생성)
```powershell
.\build.ps1
```
→ `skin.html`, `skin.css` 자동 생성

### 3. Tistory 업로드
- **스킨 편집**: 관리자 → 꾸미기 → 스킨 편집 → HTML/CSS 붙여넣기
- **스킨 업로드**: 관리자 → 꾸미기 → 스킨 변경 → ZIP 업로드

---

## 🗺️ HTML 파일별 역할

| 파일 | 줄 수 | 역할 |
|------|-------|------|
| `01_head.html` | 57 | 메타태그, CDN 링크, skinOptions 변수 |
| `02_onboarding.html` | 207 | 랜딩 히어로, 카테고리 그리드, 최신글 |
| `03_loader.html` | 3 | 전체화면 로딩 스피너 |
| `04_notices.html` | 93 | 공지사항(목록+퍼마링크), 방명록, 태그 클라우드 |
| `05_list.html` | 31 | 카테고리/검색 결과 목록 |
| `06_cover-types.html` | 1,249 | 모든 커버 레이아웃 타입 정의 |
| `07_article.html` | 171 | 포스트, TOC, 댓글, 이전/다음 팝업 |
| `08_sidebar.html` | 106 | 프로필, 검색, 카테고리, 소셜 |
| `09_navigation.html` | 30 | 스크롤바, 상단툴바, 다크모드 버튼 |
| `10_onboarding-script.html` | 338 | 타이핑/파티클/RSS 렌더링 JS |

## 🎨 CSS 파일별 역할

| 파일 | 줄 수 | 역할 |
|------|-------|------|
| `vendor.css` | 5,696 | TailwindCSS + FontAwesome + lazysizes + Swiper |
| `_base.css` | 307 | Tistory 기본 UI 보정 |
| `_codeblock.css` | 132 | 코드블럭 하이라이터 스타일 |
| `_onboarding.css` | 1,183 | 랜딩 페이지 전체 스타일 |
| `_list-article.css` | 291 | 목록, 포스트 카드, 페이지네이션 |
| `_sidebar.css` | 663 | 사이드바 전체 스타일 |

---

## 📌 자주 수정하는 부분

### 온보딩 커스텀
- **타이핑 단어 변경**: `10_onboarding-script.html` → `var WORDS = [...]`
- **수강 시작일 변경**: `10_onboarding-script.html` → `var START_DATE = '2025-09-06'`
- **히어로 텍스트**: `02_onboarding.html` → `.onboarding-hero` 섹션
- **배경 비디오**: `02_onboarding.html` → `src="YOUR_VIDEO_URL_HERE.mp4"`
- **카테고리 카드**: `02_onboarding.html` → `.onboarding-cat-grid` (아이콘, 링크, 글 수)

### 사이드바 커스텀
- **소셜 링크**: `08_sidebar.html` → `.sb-social` (GitHub URL, Email 주소)
- **프로필 문구**: `08_sidebar.html` → `.sb-profile-desc`
- **소개**: `08_sidebar.html` → `.sb-status` (직책 등)

### 스타일 커스텀
- **온보딩 색상/레이아웃**: `src/css/_onboarding.css`
- **사이드바 색상**: `src/css/_sidebar.css`
- **포스트 목록 스타일**: `src/css/_list-article.css`
