# Assessment Repository

This repository contains automation scripts and solutions for the assignment. Each script is created to fulfill specific infrastructure and automation tasks.
There also some directories which conatines the Dockerfile as well as the source code
## 📁 Contents

- `Setup-WebServer.ps1` — Automates the installation and configuration of a web server (IIS) on Windows And Apache on Linux Debian Based Distributions. it is and tried and tested script tested on ubuntu version 24,22
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

 Linux
1. First install Powershell
2. Copy the powershell script
3. run pwsh Setup-WebServer.ps1

Windows
1. Make sure you're running PowerShell with Administrator privileges.
2. Open power shell as admin powershell
3. Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass (Execute This)
4. Now run .\Setup-WebServer.ps1



## ⚙️ Static Website with nginx (Dockerfile)

### 🔧 Purpose
1. Created a Dockerfile which uses the nginx image
2.which have a custome index.html
3.Also Have an HEALTHCHECK instruction for certain intervals

### ▶️ How to Run

1. clone the repo or Copy the code to your local machine
2. then install docker if not installed
3. then run docker build -t <"your image tag nag name"> . 
4. then after building verify with docker ps -a 
5. now  docker run -d -p(localMachinPort):(ConatinerPort) <Image-Name>
6. Now go the the browser and Search <Your-Public-ip>:<Port>
