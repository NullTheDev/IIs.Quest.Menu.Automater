# IIs.Quest.Menu.Automater: Implementation & Deployment Protocol

### Quick Navigation
* [SECTION A: MANDATORY LEGAL DISCLAIMER](#section-a-mandatory-binding-legal-disclaimer)
* [SECTION B: SYSTEM REQUIREMENTS](#section-b-technical-specifications)
* [SECTION C: INSTALLATION GUIDE](#section-c-deployment-instructions)
* [SECTION D: TECHNICAL ARCHITECTURE](#section-d-operational-mechanics)

---

## SECTION A: MANDATORY BINDING LEGAL DISCLAIMER
### THE "IRON-CLAD" WAIVER OF LIABILITY

**BY UTILIZING THIS SOFTWARE, YOU ARE ENTERING INTO A BINDING AGREEMENT. READ THIS SECTION IN ITS ENTIRETY.**

The IIs.Quest.Menu.Automater (hereinafter "the Utility") is provided "as-is" without any express or implied warranties. The developer(s), contributor(s), and host(s) (hereinafter "the Providers") hereby disclaim all liability for any hardware damage, software corruption, or financial loss resulting from the use or misuse of this code.

#### I. Assumption of Absolute Risk
The User acknowledges that the Meta Quest 3 is a sophisticated piece of hardware with proprietary firmware. Engaging in ADB-level modifications and memory injection is an inherently "unsupported" activity. By executing the script, the User accepts a non-zero risk of "Bricking"—a state in which the device becomes permanently non-functional. The Providers are not responsible for providing recovery tools, hardware replacement, or technical support in the event of a system failure.

#### II. Waiver of Financial and Property Claims
The User expressly waives any right to seek damages for:
1. **Device Depreciation:** Any loss in resale value caused by software modification.
2. **Warranty Voidance:** Most manufacturers consider ADB-level system tampering as grounds for immediate warranty termination.
3. **Asset Loss:** The Providers are not liable for the loss of Meta/Oculus accounts, purchased software libraries, or social standing within the VR community resulting from platform bans.

#### III. Indemnification
The User agrees to indemnify and hold harmless the Providers from any legal actions brought by third parties (including, but not limited to, game developers like Another Axiom) arising from the User's activity. You are the sole operator of this software; you bear the sole responsibility for its consequences.

#### IV. Parental and Guardian Notice
If the User is a minor, the legal guardian assumes all financial and hardware risks associated with this software. The Providers do not target this software toward children and assume that any user possesses the technical competency to understand these warnings.

---

## SECTION B: TECHNICAL SPECIFICATIONS
### PC & HEADSET REQUIREMENTS

To maintain stability and prevent the aforementioned risks, the following environment is required:

* **Host OS:** Windows 10 or 11 (64-bit).
* **Permissions:** Administrator privileges (required for System PATH modification).
* **Hardware:** Meta Quest 3 / Quest 2 (Developer Mode must be enabled via the Meta Quest mobile app).
* **Python Version:** 3.11.x (The script will attempt to install this if missing).
* **Architecture:** ARM64 (Optimized for the Snapdragon XR2 Gen 2 chipset).

---

## SECTION C: DEPLOYMENT INSTRUCTIONS
### HOW TO RUN THE AUTOMATER

1.  **Isolation:** Place the `automater.bat` file in its own folder on your Desktop. Do not run it from inside a .zip file.
2.  **Execution:** Right-click `automater.bat` and select **Run as Administrator**.
3.  **Initialization:** The script will check for ADB, Python, and Frida. If they are missing, it will download them silently. Do not close the window during this phase.
4.  **Connection:** Connect your Quest 3 to your PC via a high-quality USB-C cable. If prompted inside the headset, select "Allow USB Debugging."
5.  **The Safety Interlock:** Once the script pushes the files, a **RED WARNING SCREEN** will appear on your PC.
    * **STOP:** Put on your headset.
    * **LAUNCH:** Open Gorilla Tag.
    * **LOAD:** Wait in the stump until your cosmetics are visible in the mirror.
    * **CONFIRM:** Return to the PC and complete the 3-stage keypress confirmation.

---

## SECTION D: OPERATIONAL MECHANICS
### UNDER THE HOOD

This Utility functions as a sophisticated wrapper for the following technical operations:

#### 1. Binary Deployment
The script utilizes the `adb push` command to move `cheese` and `frida-server` into the `/data/local/tmp/` directory. This is one of the few partitions on a non-rooted Quest that allows for executable file permissions.

#### 2. Permission Mapping
By executing `chmod +x`, the script converts these raw files into runnable programs. Without this step, the Android OS would block the Frida-Server from starting.

#### 3. IL2CPP Hooking
The script triggers a PC-side Frida process that targets the `com.AnotherAxiom.GorillaTag` process. It uses a specialized bridge to hook into the game’s IL2CPP (C++) code in real-time. This is why the game **must** be loaded; if the memory addresses aren't populated, the hook has nothing to grab onto, leading to a system crash.

#### 4. Background Persistence
The Frida-Server is launched with a trailing `&` symbol, allowing it to run as a "daemon" (background process). This ensures the mod menu stays active even after the initial script window is closed.

---
*Developed for the Quest Modding Community. Proceed with Caution.*
