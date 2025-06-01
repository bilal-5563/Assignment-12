# Assessment Repository

This repository contains automation scripts and solutions for the assignment. Each script is created to fulfill specific infrastructure and automation tasks.
There also some directories which conatines the Dockerfile as well as the source code
## 📁 Contents

- `Setup-WebServer.ps1` — Automates the installation and configuration of a web server (IIS) on Windows.Which is and tried and tested script tested on ubuntu version 24,22
  and Windows 2025 DataCenter Edition and Windows 2019 DataCenter Edition
- Other task files — Additional scripts and configurations related to the assignment.

## ⚙️ Setup-WebServer.ps1

### 🔧 Purpose

Automates the setup of a basic web server using PowerShell on a Windows machine As Well as Linux machine. It performs the following:

1. Installs IIS (Internet Information Services) Or Apache if linux.
2. Opens port 80 on the firewall.
3. Starts the IIS service.
4. Adds a basic `index.html` with the message: `Hello from PowerShell!`.
5. Logs all activities with timestamps to `C:\Logs\setup.log` if Linux var\www\logs.

### ▶️ How to Run

> Make sure you're running PowerShell with Administrator privileges.
> Linux
. First install Powershell
> Copy the powershell script
> run pwsh Setup-WebServer.ps1

Windows
Open power shell as admin powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass (Execute This)
Now run .\Setup-WebServer.ps1

