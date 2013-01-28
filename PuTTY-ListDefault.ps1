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

Push-Location
Set-Location HKCU:\Software\SimonTatham\PuTTY\sessions\Default%20Settings

Get-Item . |

Select-Object -ExpandProperty property |

ForEach-Object {
    New-Object psobject -Property @{"property"=$_; "Value" = (Get-ItemProperty -Path . -Name $_).$_}
} |

Format-Table property, value -autoSize -wrap

Pop-Location