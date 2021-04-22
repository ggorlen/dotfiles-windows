if (Test-Path alias:curl) { 
    remove-item alias:curl
}

if (Test-Path alias:wget) { 
    remove-item alias:wget
}

Set-Alias vi vim
function l { ls -Fo $args }
function ll { ls -Fo $args }

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

function touch($file) {
    echo "" > $file
}

function wsl2 {
    wsl.exe -d Ubuntu-20.04
}

function weather() {
    curl "wttr.in/sfo?n2"
}

function hibernate-later() {
    # hibernate after n minutes
    param([Int32]$minutes)
    
    if ($minutes -le 0) {
        echo "flag -minutes must be provided and > 0"
    }
    else {
        Start-Sleep -Seconds ($minutes * 60)
        shutdown /h
    }
}

