# Stop the console application if it's already running
$processName = "AWSCOnsole.dll"
$runningProcesses = Get-Process -Name $processName -ErrorAction SilentlyContinue
if ($runningProcesses) {
    $runningProcesses | Stop-Process -Force
}

# Specify the path to your console application DLL
$consoleAppPath = "C:\ConsoleApplication\AWSCOnsole"

# Specify the path for the output file
$outputFilePath = "C:\outputfile\output.txt"

# Run the console application and capture the output
$output = & dotnet $consoleAppPath

# Create the output string
$outputContent = "Console application output:`n"
$outputContent += $output
$outputContent += "`n"

# Write the output to the output file
$outputContent | Out-File -FilePath $outputFilePath -Encoding UTF8

# Read the output file and display its contents
$outputContent = Get-Content -Path $outputFilePath -Raw
Write-Host "Console application output:"
Write-Host $outputContent
