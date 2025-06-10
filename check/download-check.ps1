# If check-bin.exe already exists, skip download
if (Test-Path "check-bin.exe") {
  Write-Host "check binary already exists, skipping download."
  exit 0
}
$asset = "check.exe"
$version = $args[0]
if ($version) {
  $releaseUrl = "https://api.github.com/repos/devopsifyco/check-cli/releases/tags/$version"
} else {
  $releaseUrl = "https://api.github.com/repos/devopsifyco/check-cli/releases/latest"
}
$response = Invoke-RestMethod -Uri $releaseUrl
$downloadUrl = $response.assets | Where-Object { $_.name -eq $asset } | Select-Object -ExpandProperty browser_download_url
if (-not $downloadUrl) {
  Write-Error "Could not find download URL for $asset"
  exit 1
}
Invoke-WebRequest -Uri $downloadUrl -OutFile "check-bin.exe" 