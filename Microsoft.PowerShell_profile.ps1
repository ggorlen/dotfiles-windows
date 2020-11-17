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

# TODO
function t {
    wsl.exe -d Ubuntu-20.04 ~/bin/t
}
