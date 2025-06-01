# Define API endpoint
$apiUrl = "https://jsonplaceholder.typicode.com/posts/1"

# Define log file path
$logFile = "C:\Logs\ApiCallLog.txt"

# Create log directory if it doesn't exist
$logDir = Split-Path $logFile
if (!(Test-Path -Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}

# Function to write to log
function Write-Log {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -Append -FilePath $logFile
}

# Call API and log result
try {
    $response = Invoke-RestMethod -Uri $apiUrl -Method Get
    Write-Log "API call successful. Response: $($response | ConvertTo-Json -Compress)"
} catch {
    Write-Log "API call failed. Error: $_"
}
