$i = 360
do {
    Write-Host $i
    ping 127.0.0.1
    Sleep 60
    $i--
} while ($i -gt 0)