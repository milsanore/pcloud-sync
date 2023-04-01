$Path = "."

$files = Get-ChildItem $Path -Recurse | Sort-Object -Descending CreationTime
foreach ($f in $files){
    Write-Host $f.FullName $f.Length
    Get-Content -Path $f.FullName | out-null
}
