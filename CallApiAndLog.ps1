
$apiUrl = "https://jsonplaceholder.typicode.com/posts/1"


$logFile = "C:\Logs\ApiCallLog.txt"


$logDir = Split-Path $logFile
if (!(Test-Path -Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}


function Write-Log {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -Append -FilePath $logFile
}


try {
    $response = Invoke-RestMethod -Uri $apiUrl -Method Get
    Write-Log "API call successful. Response: $($response | ConvertTo-Json -Compress)"
} catch {
    Write-Log "API call failed. Error: $_"
}
