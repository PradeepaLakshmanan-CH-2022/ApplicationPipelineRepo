# Stop the console application if it's already running
$processName = "AWSCOnsole.dll"
$runningProcesses = Get-Process -Name $processName -ErrorAction SilentlyContinue
if ($runningProcesses) {
    $runningProcesses | Stop-Process -Force
}

# Specify the path to your console application DLL
$consoleAppPath = "C:\ConsoleApplication\AWSCOnsole.dll"

# Specify the path for the output file
$outputDirectory = "C:\outputfile"
$outputFilePath = Join-Path $outputDirectory "output_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"

# Run the console application and redirect the output to the file
Start-Process -FilePath "dotnet" -ArgumentList $consoleAppPath -NoNewWindow -Wait | Out-File -FilePath $outputFilePath

# Read the output file and display its contents
$outputContent = Get-Content -Path $outputFilePath -Raw
Write-Host "Console application output:"
Write-Host $outputContent
