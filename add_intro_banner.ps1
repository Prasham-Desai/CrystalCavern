$ErrorActionPreference = "Stop"

$sourceIntroSvg = "C:\Users\prash\Desktop\Peronal Projects\UE5\CrystalCavern\ScreenShots\github-intro-banner.svg"
$dirs = Get-ChildItem ..\ -Directory
foreach ($dir in $dirs) {
    if (-not (Test-Path "$($dir.FullName)\.git")) { continue }
    $readme = "$($dir.FullName)\README.md"
    if (Test-Path $readme) {
        $content = [System.IO.File]::ReadAllText($readme, [System.Text.Encoding]::UTF8)
        
        $newContent = $content -replace "\s*<sub>Built with .*?(using|in) Unreal Engine 5(\.6)?</sub>(\s*<br/?>\s*<br/?>\s*)?", "`n"
        
        if ($newContent -notmatch "github-intro-banner\.svg") {
            $gitPath = git -C $dir.FullName ls-files "*github-readme-banner.svg*" | Select-Object -First 1
            if ($gitPath) {
                $screenshotsFolder = Split-Path $gitPath -Parent
            } else {
                $screenshotsFolder = "ScreenShots"
            }
            
            # replace backslash with forward slash just in case Split-Path returns backslash
            $screenshotsFolder = $screenshotsFolder -replace "\\", "/"
            
            $targetFolder = Join-Path $dir.FullName $screenshotsFolder
            if (-not (Test-Path $targetFolder)) {
                New-Item -ItemType Directory -Path $targetFolder | Out-Null
            }
            $targetSvg = Join-Path $targetFolder "github-intro-banner.svg"
            
            if ($sourceIntroSvg -ne $targetSvg) {
                Copy-Item -Path $sourceIntroSvg -Destination $targetSvg -Force
            }
            
            git -C $dir.FullName add "$screenshotsFolder/github-intro-banner.svg"
            
            $introHtml = "<div align=`"center`">`n  <img src=`"$screenshotsFolder/github-intro-banner.svg`" width=`"100%`" alt=`"Intro Banner`"/>`n</div>`n`n"
            $newContent = $introHtml + $newContent
        }
        
        if ($content -cne $newContent) {
            Write-Host "Updating $($dir.Name)..."
            [System.IO.File]::WriteAllText($readme, $newContent, [System.Text.Encoding]::UTF8)
            git -C $dir.FullName add README.md
            git -C $dir.FullName commit -m "Add intro banner and remove footer text"
            git -C $dir.FullName push
        }
    }
}
