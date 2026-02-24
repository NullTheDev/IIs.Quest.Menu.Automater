# IIs.Quest.Menu.Automater

A modular ADB utility designed for the Quest 3 modding environment. This tool provides an automated pipeline for the deployment of the Cheese binary, Frida-Server, and the iis.Quest.Menu exploit.

---

## ⚠️ Disclaimer and Waiver of Liability

**BY USING THIS SOFTWARE, YOU ACKNOWLEDGE AND AGREE TO THE FOLLOWING:**

1. **Assumption of Risk:** This tool interacts with your device's firmware and system memory at a low level. Using this software carries a risk of software "bricking," system instability, or the requirement of a factory reset.
2. **No Warranty:** This software is provided "as is" without any warranty of any kind. The author(s) and contributor(s) are **NOT responsible** for any damage, data loss, hardware failure, or diminished value of your device.
3. **Usage Responsibility:** You are solely responsible for ensuring that your headset is in the correct state (Gorilla Tag running, cosmetics loaded) before proceeding. Any failure to follow instructions that results in a non-functional device is the sole responsibility of the user.
4. **Modding Consequences:** Modding your device may void your manufacturer warranty or result in account-related actions by the platform provider. Proceed at your own discretion.

---

## What This Tool Does

This automater is designed to eliminate the manual complexity of setting up a Quest modding environment. It performs the following technical operations:

### 1. Environment Preparation
* **Dependency Check:** Scans your PC for `curl`, `adb`, and `python`.
* **Silent Installation:** If missing, it downloads and installs the Android Platform Tools and Python 3.11, automatically injecting them into your Windows System PATH.
* **Frida Bridge:** Installs the `frida-tools` Python package to allow your PC to communicate with the headset's memory.

### 2. Device Deployment
* **Binary Transfer:** Pushes the `cheese` and `frida-server` binaries to the Quest's `/data/local/tmp/` directory (the standard location for executable Android tools).
* **Permission Mapping:** Executes `chmod +x` via ADB shell to grant the system permission to run these files as programs.
* **Service Initialization:** Launches the `frida-server` in a background thread on the headset.

### 3. Exploit Execution
* **Safety Interlock:** Blocks execution until the user manually confirms three times that the target application (Gorilla Tag) is in a stable, loaded state.
* **Payload Injection:** Triggers the `run.bat` from the iis.Quest.Menu repository in a minimized state to begin the memory injection process.

---

## Installation and Usage

1.  **Preparation:** Place `automater.bat` in a new, empty folder on your Desktop.
2.  **Execution:** Run the script as **Administrator**. This is necessary for the script to update your System Environment Variables (PATH) so Python can be used immediately.
3.  **Initialization:** The script will download approximately 100MB of tools. Ensure you have an active internet connection.
4.  **Connection:** Plug in your Quest 3. If the script does not detect it within 10 seconds, you will be prompted to enter the headset's local IP address (found in your Quest Wi-Fi settings).
5.  **Finalization:** Once the "Safety Check" screen appears, follow the instructions on the headset before touching the keyboard.

---

## Technical Specifications
* **Target Architecture:** ARM64 (Quest 2, Quest 3, Quest Pro)
* **Host OS:** Windows 10/11 (x64)
* **Interface:** ANSI-Colorized Command Line Interface

---
*Developed for the Quest Modding Community. Use responsibly.*
