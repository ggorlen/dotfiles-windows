if (Test-Path alias:curl) { 
    remove-item alias:curl
}

if (Test-Path alias:wget) { 
    remove-item alias:wget
}

Set-Alias vi vim
Set-Alias l ls
Set-Alias ll ls

# Navigation
function .. { cd .. }
function ... { Set-Location ..\.. }
function .... { Set-Location ..\..\.. }
function ..... { Set-Location ..\..\..\.. }
function ...... { Set-Location ..\..\..\..\.. }
function ~ { Set-Location ~ }
function home { cd $env:USERPROFILE }
function dt { Set-Location ~\Desktop }
function docs { Set-Location ~\Documents }
function dl { Set-Location ~\Downloads }
Set-Alias -Name cd -Value pushd -Option AllScope
Set-Alias -Name bd -Value popd -Option AllScope

function wsl2 {
    wsl.exe -d Ubuntu-20.04
}

