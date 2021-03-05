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

# FIXME
function bc-play-collection($url) {
    curl -sS "https://bandcamp.com/ggorlen" `
    | xmllint --html --xpath "//*[@id='pagedata']/@data-blob" 2> $null  - `
    | sed 's/^ data-blob=\"\|\"$//g' `
    | perl -MHTML::Entities -pe 'decode_entities($_);' `
    | jq '{fan_id: .fan_data.fan_id, older_than_token: .wishlist_data.last_token, count: 10}' `
    | curl -sS -X POST -H "Content-Type: Application/JSON" `
      --data-binary "@-" https://bandcamp.com/api/fancollection/1/collection_items `
    | jq -r .items[].item_url `
    | xargs curl -sS `
    | xmllint --html --xpath "//script[@data-tralbum]/@data-tralbum" 2> $null - `
    | sed 's/^ data-tralbum=\"\|\"$//g' `
    | perl -MHTML::Entities -pe 'decode_entities($_);' `
    | jq -r '.trackinfo[].file."mp3-128"' `
    | mpv -no-video --playlist=-
}

