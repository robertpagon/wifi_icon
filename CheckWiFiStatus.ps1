$iskljuceno = netsh wlan show networks | FIND "powered down" /I /C
if ($iskljuceno -eq 0) {
    Write-Host "Wi-Fi On"
    exit 0
} else {
    Write-Host "Wi-Fi Off"
    exit 1
}

