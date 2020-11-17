if ((Get-Command cinst).Path -eq $null) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

foreach ($package in get-content "packages\essential.txt") {
    cinst $package -y
}

foreach ($package in get-content "packages\node.txt") {
    node i -g $package
}

foreach ($package in get-content "packages\python.txt") {
    python3 -m pip install $package
}

foreach ($package in get-content "packages\perl.txt") {
    cpanm $package
}

$profile = "$env:USERPROFILE\Documents\WindowsPowerShell"

if (!(Test-Path $profile)) {
    mkdir $profile
}

copy Microsoft.PowerShell_profile.ps1 "$profile\Microsoft.PowerShell_profile.ps1"
