<#
.SYNOPSIS
    Generates and validates hostnames using s0nt3k's 15-character convention.

FORMAT:
    CCCCOOOODDXRIIIII

    CCCC  = 4-digit HEX customer ID
    OOOO  = 4-char OS ID
    DD    = 2-char device type
    X     = 1-digit criticality code (0-4)
    R     = 1-letter redundancy level (A-F)
    IIIII = 5-char unique identifier
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$CustomerHexId,      # 4 hex chars, e.g. A12F

    [Parameter(Mandatory=$true)]
    [string]$OsId,               # 4 chars, e.g. WINS, LNXG

    [Parameter(Mandatory=$true)]
    [string]$DeviceType,         # 2 chars, e.g. WS, LT, SV

    [Parameter(Mandatory=$true)]
    [ValidateSet('0','1','2','3','4')]
    [string]$CriticalityCode,    # 0=Standard,1=Sensitive,2=Public,3=Mission,4=Life-safety

    [Parameter(Mandatory=$true)]
    [ValidateSet('A','B','C','D','E','F')]
    [string]$RedundancyLevel,    # A=None,B=Basic,C=Clustered,D=Distributed,E=Enterprise,F=Fault-tolerant

    [Parameter(Mandatory=$true)]
    [string]$UniqueId            # 5 alphanumeric chars
)

# Hostname regex (same as registry value)
$HostnameRegex = '^[A-Fa-f0-9]{4}[A-Za-z0-9]{4}[A-Za-z0-9]{2}[0-4][A-F][A-Za-z0-9]{5}$'

function Validate-SegmentLengths {
    param(
        [string]$CustomerHexId,
        [string]$OsId,
        [string]$DeviceType,
        [string]$UniqueId
    )

    if ($CustomerHexId.Length -ne 4) {
        throw "CustomerHexId must be exactly 4 characters (hex)."
    }
    if ($OsId.Length -ne 4) {
        throw "OsId must be exactly 4 characters."
    }
    if ($DeviceType.Length -ne 2) {
        throw "DeviceType must be exactly 2 characters."
    }
    if ($UniqueId.Length -ne 5) {
        throw "UniqueId must be exactly 5 characters."
    }
}

# Validate segment lengths
Validate-SegmentLengths -CustomerHexId $CustomerHexId -OsId $OsId -DeviceType $DeviceType -UniqueId $UniqueId

# Build hostname
$Hostname = "$CustomerHexId$OsId$DeviceType$CriticalityCode$RedundancyLevel$UniqueId"

# Validate against regex
if ($Hostname -match $HostnameRegex) {
    Write-Host "Generated hostname: $Hostname" -ForegroundColor Green
} else {
    Write-Host "Generated hostname is INVALID: $Hostname" -ForegroundColor Red
    Write-Host "Does not match pattern: $HostnameRegex" -ForegroundColor Yellow
}

return $Hostname
