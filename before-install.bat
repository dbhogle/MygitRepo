REMAre you running in 32-bit mode?
REM (\SysWOW64\ = 32-bit mode)
if ($PSHOME -like "*SysWOW64*")
{
Write-Warning "Restarting this script under 64-bit Windows PowerShell."
REM Restart this script under 64-bit Windows PowerShell.
REM (\SysNative\ redirects to \System32\ for 64-bit mode)
& (Join-Path ($PSHOME -replace "SysWOW64", "SysNative") powershell.exe) -File `
(Join-Path $PSScriptRoot $MyInvocation.MyCommand) @args
REM Exit 32-bit script.
Exit $LastExitCode
}
REM Install Internet Information Server (IIS).
c:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command Import-Module -Name ServerManager
c:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command Install-WindowsFeature Web-Server