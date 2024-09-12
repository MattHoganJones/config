#Set-PSDebug -Trace 1
# Default the prompt to the unicorn oh-my-posh theme
oh-my-posh --init --shell pwsh --config "C:\Users\MattHogan-Jones\AppData\Local\Programs\oh-my-posh\themes\star.omp.json" | Invoke-Expression

Import-Module posh-git
Import-Module -Name Terminal-Icons
Import-Module PSReadline
Import-Module PSFzf

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# Helper function to change directory to my repos (e.g. "change to repos")
# Change c:\repos to your usual workspace and everytime you type
# in ctr from PowerShell it will take you directly there.
function ctr { Set-Location c:\repos }

function com { git co main && git pull }

# Helper function to change directory to the company OneDrive
function cod { Set-Location "C:\Users\MattHogan-Jones\OneDrive - Floww Technology Ltd" }

# Helper function to set location to the User Profile directory
function cuserprofile { Set-Location ~ }
Set-Alias ~ cuserprofile -Option AllScope

#function fd { Get-ChildItem . -Attributes Directory | Invoke-Fzf | Set-Location }
function off { Invoke-Fzf | Invoke-Item }

function frg { 
	Invoke-PsFzfRipgrep $args[0] 
}

function gce {
    gh copilot explain $args[0]
}

function fh {
    Invoke-FuzzyHistory
}

function osl { Get-ChildItem -Path .\Source\* -Include *.sln | Select-Object -First 1 | Invoke-Item }

function ohost { Set-Location C:\Windows\System32\drivers\etc }

function cpwd { (Get-Location).Path | Set-Clipboard }

function cgb { git branch --show-current | Set-Clipboard }

function lg { Lazygit }

function lu {
        Invoke-Item $args[0]
    }

Set-PsFzfOption -EnableAliasFuzzySetLocation -EnableAliasFuzzyEdit -EnableAliasFuzzySetEverything

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-PSReadLineKeyHandler -Key Ctrl+Shift+b `
                            -BriefDescription BuildCurrentDirectory `
                            -LongDescription "Build the current directory" `
                            -ScriptBlock {
                                [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
                                [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet build")
                                [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
                            }

Set-PSReadLineKeyHandler -Key Ctrl+Shift+g `
                            -BriefDescription TestCurrentDirectory `
                            -LongDescription "Test the current directory" `
                            -ScriptBlock {
                                [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
                                [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet test")
                                [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
                            }

#Set-PSDebug -Trace 0
