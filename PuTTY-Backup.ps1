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

PS >PuTTY-Backup H:\putty.reg
PS >PuTTY-Restore H:\putty.reg

PS >PuTTY-ListDefault PropName PropValue

PS >PuTTY-SetDefault PropName PropValue
PS >PuTTY-SetAll PropName PropValue

#>

param(
    [Parameter(Mandatory=$True,Position=1)]
    [string]$filePath
)

regedit /ea $filePath HKEY_CURRENT_USER\Software\SimonTatham\PuTTY