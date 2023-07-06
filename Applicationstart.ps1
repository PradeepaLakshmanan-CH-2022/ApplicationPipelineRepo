# Stop the console application if it's already running
# Set the application path

Get-Process -Name "AWSCOnsole.dll" -ErrorAction SilentlyContinue | Stop-Process -Force

# Specify the path to your console application executable
$consoleAppPath = "C:\Hello\AWSCOnsole.dll"



# Specify the path for the output file
$outputFilePath = "C:\outputfile\output.txt"

# Run the console application and redirect the output to a file
Start-Process -FilePath "dotnet" -ArgumentList "run", "--no-restore", "--no-build", "--project", $consoleAppPath, "--", ">", $outputFilePath -NoNewWindow -Wait

# Read the output file and display its contents
$outputContent = Get-Content -Path $outputFilePath -Raw
Write-Host "Console application output:"
Write-Host $outputContent
