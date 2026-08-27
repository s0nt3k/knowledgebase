$regex = (Get-ItemProperty -Path "HKLM:\Software\s0nt3k\HostnamePolicy").HostnameRegex

if ("A12FWINSV3E00001" -match $regex) {
    Write-Host "Hostname is valid."
} else {
    Write-Host "Invalid hostname."
}
