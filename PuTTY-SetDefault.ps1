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

Set-ItemProperty -Path HKCU:\Software\SimonTatham\PuTTY\Sessions\Default%20Settings\ -Name "$propName" -Value "$propValue"
