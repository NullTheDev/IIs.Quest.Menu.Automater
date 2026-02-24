# IIs.Quest.Menu.Automater: Implementation & Deployment Protocol

### Project Overview
The IIs.Quest.Menu.Automater is a specialized deployment utility designed to bypass the manual friction associated with low-level Quest 3 memory modification. By consolidating the acquisition of Android Platform Tools, Python environments, and Frida injection binaries, this script provides a standardized entry point for the iis.Quest.Menu exploit. 

This isn't just a "mod installer"—it is an automated system bridge that moves system-level binaries into the headset's temporary partitions to facilitate real-time memory hooking.

---

## ⛔ COMPREHENSIVE DISCLAIMER AND WAIVER OF LIABILITY

**READ CAREFULLY BEFORE INITIALIZING THE SCRIPT.**

The use of this software constitutes an immediate and unconditional agreement to the following terms. If you do not understand or agree to these terms, delete this software immediately.

### 1. Zero Liability and Indemnification
The developers, contributors, and hosters of this repository provide this tool "as-is" for educational and research purposes only. Under no circumstances shall the authors be held liable for any direct, indirect, incidental, or consequential damages. This includes, but is not limited to:
* **Total System Failure (Bricking):** Irreversible software corruption that renders the Quest headset non-functional.
* **Diminished Device Value:** Any loss in resale value due to software modification or system instability.
* **Hardware Degradation:** Unexpected thermal stress or component failure resulting from unauthorized system calls.
* **Account Sanctions:** Any bans, suspensions, or restrictions placed on your Meta/Oculus account as a result of modding.

### 2. No Restoration Guarantee
Modifying a device via ADB (Android Debug Bridge) at the shell level involves shifting files into protected system directories (`/data/local/tmp/`). While this script attempts to be as non-intrusive as possible, there is NO guarantee that a Factory Reset will revert the changes or fix issues caused by improper execution timing. You are performing these actions entirely at your own peril.

### 3. Technical Competency Requirement
By running this script, you certify that you possess a basic understanding of ADB and Android file systems. You acknowledge that "Gorilla Tag" must be in a specific memory state (Cosmetics loaded) before the Frida-Server attempts to hook into the game process. Failure to respect the provided timing prompts is the primary cause of system-level hangs and crashes.

---

## Operational Mechanics: What Is Happening To Your Device?

To maintain transparency, here is exactly what the automater does when executed:

### Phase I: Host Environment Hardening
The script first audits your Windows environment. If it fails to find Python or ADB, it doesn't just ask you to download them—it fetches the official binaries via `curl` and silently pushes them into your System PATH. This ensures that the `frida` command-line tools can communicate with the Quest's internal server without "Command Not Found" errors.

### Phase II: The Binary Payload
The script pushes two primary files to your headset:
1.  **Cheese:** A specialized utility used to prep the environment and verify GPU read/write permissions.
2.  **Frida-Server (Modified):** A background service that stays dormant until a PC-side command tells it to begin memory injection.
Both files are granted `+x` (executable) permissions via the `chmod` command in the Android shell.

### Phase III: The Memory Hook (The "Exploit")
Once the safety checks are cleared, the script triggers a background process on your PC that talks to the `frida-server` on your Quest. It looks for the "Gorilla Tag" process and begins injecting the `gtag.ts` or `frida-il2cpp-bridge.js` scripts. This is the moment of highest risk—if the game isn't fully loaded, the bridge will attempt to hook into non-existent memory addresses, which can lead to a system-wide crash.

---

## Deployment Instructions

1.  **Environment:** Create a dedicated folder. Do not run this directly from a Downloads folder or a nested ZIP.
2.  **Privileges:** Right-click `automater.bat` and **Run as Administrator**. This allows the script to refresh your Windows Environment Variables so you don't have to restart your PC after the Python installation.
3.  **The Handshake:** Connect your Quest via USB. If you prefer Wi-Fi, wait for the timeout and enter your headset's IP address manually.
4.  **The Safety Interlock:** Once you see the red warning screen, put the headset on. Open Gorilla Tag. Go to the stump/mirror. Ensure your cosmetics are visible. Only then should you return to your PC to hit the final keys.

---
**Project Status:** Active Maintenance. 
**Target Platform:** Android-based XR Headsets (v60+ compatible).
