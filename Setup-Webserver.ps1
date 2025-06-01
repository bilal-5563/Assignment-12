# to detect the os
$myWindows = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)


function Log {
    param ($message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Add-Content -Path $logPath
}


if ($myWindows) {
    $logPath = "C:\Logs\setup.log"
    $webFolder = "C:\inetpub\wwwroot"
} else {
    $logPath = "/var/log/setup.log"
    $webFolder = "/var/www/html"
}

$logDir = Split-Path $logPath
if (-not (Test-Path $logDir)) {
    New-Item -Path $logDir -ItemType Directory -Force | Out-Null
}

Log "Detected OS: $($([System.Runtime.InteropServices.RuntimeInformation]::OSDescription))"
Log "Is Windows: $myWindows"
Log "Script started."

if ($myWindows) {
    Log "Detected Windows OS."

    # Install IIS
    Log "Installing IIS..."
    Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools | Out-Null
    Log "IIS installation complete."

    
    Log "Opening port 80 in firewall..."
    New-NetFirewallRule -DisplayName "HTTP Port 80" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 80 -ErrorAction SilentlyContinue | Out-Null
    Log "Port 80 rule added."

    Log "Starting IIS service..."
    Start-Service W3SVC
    Log "IIS service started."

   
    Log "Creating index.html in $webFolder"
    "Hello from PowerShell!" | Set-Content -Path "$webFolder\index.html"
    Log "index.html created."

    
    Log "Opening browser..."
    Start-Process "http://localhost"
} else {
    Log "Detected Linux OS."

   
    Log "Updating package list..."
    apt-get update -y | Out-Null

    # Install Apache
    Log "Installing Apache..."
    apt-get install apache2 -y | Out-Null
    Log "Apache installed."

 
    if (Get-Command ufw -ErrorAction SilentlyContinue) {
        Log "Opening port 80 via ufw..."
        ufw allow 80/tcp | Out-Null
        Log "Port 80 opened via ufw."
    } else {
        Log "ufw not installed. Skipping firewall rule."
    }

    # Start Apache
    Log "Starting Apache service..."
    systemctl start apache2
    Log "Apache started."

  
    Log "Creating index.html in $webFolder"
    echo "Hello from PowerShell!" | tee "$webFolder/index.html" | Out-Null
    Log "index.html created."
}

Log "Setup completed successfully."
