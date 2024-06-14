# Basic Menu Setup with spaces between selection
# 1) Show-Menu Function: This function takes an optional parameter $Title to set the menu's title.
# 2) $options Array: Defines the menu options.
# 3) Display-Menu Function: This inner function clears the host, writes the title, and iterates over the $options array. If the current option index matches $selectedIndex, it highlights the option.
# 4) Adding Lines Between Options: The line Write-Host "" within the for loop adds a blank line between each menu item.
# 5) Key Input Handling: Uses the switch statement to handle up (38), down (40), and enter (13) keys. Adjusts $selectedIndex based on key presses.
# 6) Returning Selected Option: When the Enter key is pressed, the selected option is returned.

function Show-Menu {
    param (
        [string]$Title = 'Menu'
    )

    $options = @(
        'Option 1'
        'Option 2'
        'Option 3'
        'Exit'
    )

    $selectedIndex = 0

    function Show-MenuItems {
        Clear-Host
        Write-Host $Title
        Write-Host '---------------------'
        for ($i = 0; $i -lt $options.Length; $i++) {
            if ($i -eq $selectedIndex) {
                Write-Host "> $($options[$i])" -ForegroundColor Yellow
            } else {
                Write-Host "  $($options[$i])"
            }
            if ($i -lt $options.Length - 1) {
                Write-Host ""  # Add a blank line between menu items
            }
        }
    }

    do {
        Show-MenuItems

        $key = $host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown').VirtualKeyCode

        switch ($key) {
            38 {  # Up Arrow
                if ($selectedIndex -gt 0) {
                    $selectedIndex--
                }
            }
            40 {  # Down Arrow
                if ($selectedIndex -lt $options.Length - 1) {
                    $selectedIndex++
                }
            }
            13 {  # Enter
                return $options[$selectedIndex]
            }
        }
    } while ($true)
}

# Example of using the Show-Menu function
$result = Show-Menu -Title 'Main Menu'
Write-Host "You selected: $result"

Show-Menu