; OVDJE UPIŠI RADNI DIREKTORIJ (U KOJI SI STAVIO/LA PROGRAM)
radni_dir := "C:\ProgramsPortable\wifi_icon"

wifiStatusScript := radni_dir "\CheckWiFiStatus.ps1"
wifiOnIcon := radni_dir "\wifi_on.ico"

; Provera statusa Wi-Fi
CheckWiFiStatus() {
    global wifiStatusScript
    RunWait, powershell.exe -NoProfile -ExecutionPolicy Bypass -File %wifiStatusScript%, , Hide
    return ErrorLevel ; 0 = On, 1 = Off
}

; Postavljanje inicijalne ikone
SetWiFiIcon() {
  status := CheckWiFiStatus()
  if (status = 0)
      Menu, Tray, Icon, %wifiOnIcon%
  else
      Menu, Tray, NoIcon  ; Uklanja ikonu iz taskbara
}

; Automatsko osvežavanje svakih 10 sekundi
SetTimer, RefreshWiFiStatus, 10000

; Funkcija za osvežavanje
RefreshWiFiStatus:
    SetWiFiIcon()
    status := CheckWiFiStatus()
    if (status = 0)
        Menu, Tray, Icon, %wifiOnIcon%
    else
        Menu, Tray, NoIcon  ; Uklanja ikonu iz taskbara
return

; Prvo postavljanje ikone
SetWiFiIcon()

; Drži skriptu aktivnom
#Persistent
Return