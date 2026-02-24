# IIs.Quest.Menu.Automater

A modular ADB utility designed for the Quest 3 modding environment. This tool automates the deployment of Cheese, Frida-Server, and the iis.Quest.Menu exploit.

---

## Features
* **Dependency Management:** Automatically detects and installs ADB, Python, and Frida-Tools.
* **Automated Deployment:** Fetches necessary binaries and pushes them to the headset.
* **Connection Logic:** Supports USB auto-discovery and manual IP entry for Wi-Fi debugging.
* **Safety Protocol:** Mandatory confirmation sequence to ensure game stability before execution.

---

## Installation and Usage
1. Download `automater.bat` to a dedicated folder.
2. Run the script as Administrator to allow for Python path configuration.
3. Wait for the initialization of local files.
4. Connect the headset and follow the on-screen instructions.

> [!IMPORTANT]
> To prevent system instability or software bricks, Gorilla Tag must be running with all cosmetics loaded before the final exploit phase is triggered.

---

## Technical Details
* **Environment:** Windows 10/11
* **Headset:** Quest 3 (Developer Mode Enabled)
* **Execution:** Background Frida-Server injection with silent run.bat execution.

---

## Maintenance
The script creates a `temp_exploit` directory and local platform-tools upon first run. These are required for the script to function.

---
*Quest Modding Utility*
