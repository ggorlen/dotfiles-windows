if ((Get-Command cinst).Path -eq $null) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

cinst (get-content "packages\essential.txt") -y
refreshenv

cpan (get-content "packages\perl.txt")
npm i -g (get-content "packages\node.txt")
python -m pip install (get-content "packages\python.txt")

$profile = "$env:USERPROFILE\Documents\WindowsPowerShell"

if (!(Test-Path $profile)) {
    mkdir $profile
}

copy Microsoft.PowerShell_profile.ps1 "$profile\Microsoft.PowerShell_profile.ps1"
