$ErrorActionPreference = "Stop"

$BGREEN = [ConsoleColor]::Green
$BRED = [ConsoleColor]::Red
$YELLOW = [ConsoleColor]::Yellow
$CYAN = [ConsoleColor]::Cyan
$NC = [ConsoleColor]::White

# command to run be like
# powershell.exe -File script.ps1 absolute_path_where_to_search old_file_regex new_file_absolute_path

$absolute_path_where_to_search = $args[0]
$old_file = $args[1]

try {
    $absolute_new_file_path = $args[2]
    $replaced_file = (Split-Path -Leaf $absolute_new_file_path)
} catch {
    Write-Host "Please Provide Absolute Path Of New File" -ForegroundColor $BRED
    exit
}

$paths = (Get-ChildItem $absolute_path_where_to_search -Recurse -File -Exclude ".metadata", "Eclipse.app" | Where-Object {$_.Name -like $old_file}).FullName

$total_instances = $paths.Count

Write-Host "`n Found in $total_instances files..." -ForegroundColor $BGREEN
foreach ($path in $paths) {
    Write-Host "$path"
}
Write-Host $NC

while ($true) {
    $yn = Read-Host "Do you wish replace file (y/n)?"
    switch -regex ($yn) {
        "^[Yy]" { break }
        "^[Nn]" { exit }
        default { Write-Host "Please answer y or n." }
    }
}

if ($paths.Count -ne 0) {
    foreach ($path in $paths) {
        $file = Split-Path -Leaf $path
        # Write-Host "New path: $($path -replace $file, $replaced_file)"
        Copy-Item $absolute_new_file_path ($path -replace $file, $replaced_file) -Force | Remove-Item -Force
    }

    Write-Host "Process Completed !!" -ForegroundColor $BGREEN
} else {
    Write-Host "No Files To Replace :)" -ForegroundColor $CYAN
}