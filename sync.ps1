$Path = "."

# display progress bar
function writeProgress {
    param (
        [int]$i,
        [int]$fileCount,
        [string]$fileName,
        [decimal]$duration
    )
    $progress = [math]::Round($i/$fileCount * 100, 0)
    Write-Progress `
        -Activity "fetching files" `
        -Status "(${i}/${fileCount}) (${duration}sec) $fileName" `
        -PercentComplete $progress
}

cls
$fileCount = Get-ChildItem $Path -Recurse | Measure-Object
$files = Get-ChildItem $Path -Recurse | Sort-Object -Descending CreationTime
$i = 0
foreach ($f in $files){
    $i++
    $stopwatch = [system.diagnostics.stopwatch]::StartNew()
    Get-Content -Path $f.FullName | out-null
    $stopwatch.Stop()
    $totalSecs = "{0:n1}" -f [math]::Round($stopwatch.Elapsed.TotalSeconds, 1)
    writeProgress $i $fileCount.Count $f.FullName $totalSecs
}
