# ============================================================
#  build.ps1 — Tistory 스킨 빌드 스크립트
#  src/ 하위 파일들을 합쳐 skin.html + skin.css 생성
#  실행: .\build.ps1
# ============================================================

$base = $PSScriptRoot

# ── HTML 소스 파일 순서 ──────────────────────────────────────
$htmlFiles = @(
    "src\html\01_head.html",
    "src\html\02_onboarding.html",
    "src\html\03_loader.html",
    "src\html\04_notices.html",
    "src\html\05_list.html",
    "src\html\06_cover-types.html",
    "src\html\07_article.html",
    "src\html\08_sidebar.html",
    "src\html\09_navigation.html",
    "src\html\10_onboarding-script.html"
)

# ── CSS 소스 파일 순서 ──────────────────────────────────────
$cssFiles = @(
    "src\css\vendor.css",
    "src\css\_base.css",
    "src\css\_codeblock.css",
    "src\css\_onboarding.css",
    "src\css\_list-article.css",
    "src\css\_sidebar.css"
)

# ── HTML 빌드 ───────────────────────────────────────────────
Write-Host "`n🔨 skin.html 빌드 중..." -ForegroundColor Cyan
$htmlContent = $htmlFiles | ForEach-Object {
    $path = Join-Path $base $_
    if (-not (Test-Path $path)) {
        Write-Host "  ❌ 파일 없음: $_" -ForegroundColor Red
        return
    }
    Get-Content $path -Encoding UTF8
}
$htmlContent | Set-Content (Join-Path $base "skin.html") -Encoding UTF8
Write-Host "  ✅ skin.html 생성 완료 ($($htmlContent.Count)줄)" -ForegroundColor Green

# ── CSS 빌드 ────────────────────────────────────────────────
Write-Host "`n🔨 skin.css 빌드 중..." -ForegroundColor Cyan
$cssContent = $cssFiles | ForEach-Object {
    $path = Join-Path $base $_
    if (-not (Test-Path $path)) {
        Write-Host "  ❌ 파일 없음: $_" -ForegroundColor Red
        return
    }
    Get-Content $path -Encoding UTF8
}
$cssContent | Set-Content (Join-Path $base "skin.css") -Encoding UTF8
Write-Host "  ✅ skin.css 생성 완료 ($($cssContent.Count)줄)" -ForegroundColor Green

Write-Host "`n🎉 빌드 완료! Tistory 관리자에 업로드하세요.`n" -ForegroundColor Yellow
