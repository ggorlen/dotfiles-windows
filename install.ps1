# install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

foreach ($package in get-content "packages\essential.txt") {
    cinst $package -y
}

foreach ($package in get-content "packages\node.txt") {
    node i -g $package
}

foreach ($package in get-content "packages\python.txt") {
    node i -g $package
}
