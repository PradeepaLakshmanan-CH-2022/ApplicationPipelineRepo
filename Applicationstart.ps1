$consoleAppPath = "C:\Hello\AWSCOnsole.dll"
$outputFilePath = "C:\outputfile\output.txt"

# Run the console app DLL and redirect the output to the file
Start-Process -FilePath "dotnet" -ArgumentList "$consoleAppPath" -NoNewWindow -Wait -RedirectStandardOutput $outputFilePath -RedirectStandardError $outputFilePath

# Optionally, you can display the output on the console as well
$consoleOutput = Get-Content -Path $outputFilePath
Write-Host $consoleOutput
