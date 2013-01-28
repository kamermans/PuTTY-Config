##############################################################################
##
## PuTTY-Config
##
## by Steve Kamerman (http://www.stevekamerman.com/)
##
##############################################################################

<#

.SYNOPSIS

Save / Restore PuTTY configs and batch edit session configs

.EXAMPLE

PS >PuTTY-Config Backup H:\putty.reg
PS >PuTTY-Config Restore H:\putty.reg

PS >PuTTY-Config ListDefaults

PS >PuTTY-Config SetDefault PropName PropValue
PS >PuTTY-Config SetAll PropName PropValue

#>

param(
    [Parameter(Mandatory=$True,Position=1)]
    [string]$propName,

    [Parameter(Mandatory=$True,Position=2)]
    [string]$propValue
)

Push-Location
Set-Location HKCU:\Software\SimonTatham\PuTTY\Sessions

foreach ($session in Get-ChildItem -Name)
{
    $item = Get-ItemProperty -Path .\$session
    if ($item.$propName -ne $propValue)
    {
        Write-Host "$session  old:$($item.$propName); new:$propValue"
        Set-ItemProperty -Path .\$session -Name "$propName" -Value "$propValue"
    }
}

Pop-Location