# IIs.Quest.Menu.Automater

⚠️ Important: This project downloads and uses iiDk’s Quest Menu, which is licensed under the GNU GPL v3.  
You are responsible for complying with all GPL terms when using, modifying, or redistributing any part of that component.

GPL v3 license: [https://www.gnu.org/licenses/gpl-3.0.en.html](https://www.gnu.org/licenses/gpl-3.0.en.html)

This repository contains the automation wrapper only. The underlying menu and related binaries belong to their respective authors.

## What This Project Is

IIs.Quest.Menu.Automater is a Windows batch-based automation tool that streamlines the setup and deployment process for Quest-based mod environments.

Instead of manually running dozens of ADB commands, this script:

- Installs required tools if missing (ADB, Python, Frida)
- Connects to the headset over USB or Wi‑Fi
- Pushes required binaries
- Sets execution permissions
- Starts required background services
- Provides a staged confirmation system to reduce user error

It is essentially a convenience wrapper around repetitive setup tasks.

## Legal & Risk Notice

This software is provided as-is, without warranty of any kind.

Using ADB, runtime hooking tools, or injecting into applications on devices like the Meta Quest 3 or Quest 2 is considered unsupported activity by manufacturers and platform holders.

By running this script, you acknowledge:

- There is a non-zero risk of device instability or failure.
- Modifying software may void your warranty.
- Platform bans or account restrictions are possible.
- You are fully responsible for how you use this tool.

The developer of this automation script is not responsible for hardware damage, software corruption, account bans, financial loss, or legal consequences resulting from misuse.

If you are a minor, you should not use this software without permission from a parent or guardian.

## System Requirements

- Windows 10 or 11 (64-bit)
- Administrator privileges
- Meta Quest 2 or Quest 3 with Developer Mode enabled
- USB-C cable or Wi‑Fi debugging enabled
- Internet connection for first-time dependency setup

The script attempts to automatically install missing dependencies such as:
- Android Platform Tools (ADB)
- Python 3.11
- Frida tools

## How To Use

1. Place `automater.bat` in its own folder.
2. Right-click and select “Run as Administrator”.
3. Allow it to install any missing dependencies.
4. Connect your headset and allow USB debugging.
5. Follow the on-screen instructions carefully.
6. When prompted, fully load the game before confirming execution.

Do not rush the confirmation phase. The staged prompts exist to reduce timing-related crashes.

## How It Works (Technical Overview)

**Binary Deployment**  
The script pushes required executables to `/data/local/tmp/`, one of the writable locations on a non-rooted Quest device.

**Permission Setup**  
It applies executable permissions using `chmod +x` so Android can run the binaries.

**Process Launch**  
It launches required background services on the device and initializes the PC-side tooling needed for runtime interaction.

**Automation Layer**  
Instead of manually entering dozens of ADB commands, the script handles connection checks, retries, dependency installation, and staged execution automatically.

## License Clarification

- This automation wrapper may be licensed separately (for example MIT, if you choose).
- Any downloaded GPL components remain under GPL.
- If you redistribute a modified version that includes GPL code, you must follow GPL terms.

When in doubt, read the GPL and comply with it.

Developed for experimentation and automation purposes. Use responsibly.
