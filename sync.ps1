$Path = "."

$files = Get-ChildItem $Path -Recurse
foreach ($f in $files){
    Write-Host $f.FullName $f.Length
    Get-Content -Path $f.FullName > Out-Null
}
