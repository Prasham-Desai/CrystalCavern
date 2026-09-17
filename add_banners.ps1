$ErrorActionPreference = "Stop"

$base64 = "LS0tCgo8ZGl2IGFsaWduPSJjZW50ZXIiPgo8c3ViPkJ1aWx0IHdpdGggw6LCncKkw6/CuMKPIHVzaW5nIFVucmVhbCBFbmdpbmUgNTwvc3ViPgo8YnI+PGJyPgo8aW1nIHNyYz0iSW1hZ2VzL2dpdGh1Yi1yZWFkbWUtYmFubmVyLnN2ZyIgYWx0PSJDcmVhdG9yIFNpZ25hdHVyZSBCYW5uZXIiLz4KPC9kaXY+"
$bytes = [Convert]::FromBase64String($base64)
$footer = [System.Text.Encoding]::UTF8.GetString($bytes)
$footerReplaced = $footer -replace "Images/github-readme-banner.svg", "ScreenShots/github-readme-banner.svg"

$parentDir = "C:\Users\prash\Desktop\Peronal Projects\UE5"
$sourceSvg = "$parentDir\CrystalCavern\ScreenShots\github-readme-banner.svg"

$dirs = Get-ChildItem -Path $parentDir -Directory

foreach ($dir in $dirs) {
    $readmePath = Join-Path $dir.FullName "README.md"
    if (Test-Path $readmePath) {
        Write-Host "Processing $($dir.Name)..."
        
        $content = [System.IO.File]::ReadAllText($readmePath, [System.Text.Encoding]::UTF8)
        
        if ($content -match "github-readme-banner\.svg") {
            Write-Host "  Banner already exists in $($dir.Name). Skipping append."
        } else {
            $screenshotsDir = Join-Path $dir.FullName "ScreenShots"
            if (-not (Test-Path $screenshotsDir)) {
                New-Item -ItemType Directory -Path $screenshotsDir | Out-Null
            }
            $targetSvg = Join-Path $screenshotsDir "github-readme-banner.svg"
            if ($sourceSvg -ne $targetSvg) {
                Copy-Item -Path $sourceSvg -Destination $targetSvg -Force
            }
            
            $footerToAppend = ""
            if (-not $content.EndsWith("`n")) {
                $footerToAppend += "`n`n"
            } else {
                $footerToAppend += "`n"
            }
            $footerToAppend += $footerReplaced
            
            [System.IO.File]::AppendAllText($readmePath, $footerToAppend, [System.Text.Encoding]::UTF8)
            Write-Host "  Banner appended to $($dir.Name)."
        }
        
        Write-Host "  Committing and pushing $($dir.Name)..."
        git -C $dir.FullName add .
        $status = git -C $dir.FullName status --porcelain
        if ($status) {
            git -C $dir.FullName commit -m "Add Signature To Readme"
            git -C $dir.FullName push
        } else {
            Write-Host "  No changes to commit for $($dir.Name)."
        }
    }
}
