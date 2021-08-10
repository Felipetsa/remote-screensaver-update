$computers = Get-Content 'C:\Users\USERNAME\Desktop\Screensaver\Comps.txt' #Computer list (one per row)

#$source = "\\SERVERNAME\Screensaver\Pictures\*.*" #Get pictures from a location on the network
$source = "C:\Users\USERNAME\Desktop\Screensaver\Pictures\*.*" # Get pictures stored locally

$DriveLetter = "C" #Drive Letter
$Path = "Screensaver" #Folder name

$dt = Get-Date

foreach ($computer in $computers) {    
    if (test-Connection -Cn $computer -quiet) {
        New-Item -Path \\$computer\$DriveLetter$\$Path -type directory -Force                        
        Remove-Item "\\$computer\$DriveLetter$\$Path\*.*" -Recurse -Force
        Copy-Item $source -Destination "\\$computer\$DriveLetter$\$Path" -Recurse -Force
        "$dt - $computer accesssed" | Out-File -FilePath "C:\Users\USERNAME\Desktop\Screensaver\CompletedComps.txt" -Append #Log of successfully updated/accessed computers
    } else {
        "$dt - $computer is not online or does not exist" | Out-File -FilePath "C:\Users\USERNAME\Desktop\Screensaver\FailedComps.txt" -Append #Log of computers not updated/successfully accessed
    }
 
}