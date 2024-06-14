function Show-Menu {
    param (
        [string[]]$menuItems,
        [string]$promptMessage = "Select which language or whether extension packs or other, other prompts themes and formatting options (use arrow keys to navigate and Enter to select):"
    )

    $currentSelection = 0
    [System.Console]::CursorVisible = $false

    while ($true) {
        Clear-Host
        Write-Host $promptMessage
        for ($i = 0; $i -lt $menuItems.Length; $i++) {
            if ($i -eq $currentSelection) {
                Write-Host "=> $($menuItems[$i])" -ForegroundColor Cyan
            } else {
                Write-Host "   $($menuItems[$i])" 
            }
        }

        $key = [System.Console]::ReadKey($true).Key

        switch ($key) {
            'UpArrow' {
                if ($currentSelection -gt 0) {
                    $currentSelection--
                }
            }
            'DownArrow' {
                if ($currentSelection -lt ($menuItems.Length - 1)) {
                    $currentSelection++
                }
            }
            'Enter' {
                [System.Console]::CursorVisible = $true
                return $menuItems[$currentSelection]
            }
        }
    }
}