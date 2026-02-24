# IIs.Quest.Menu.Automater Technical Deployment and Liability Framework Protocol

### Section 1: Preamble and Scope of Application
The IIs.Quest.Menu.Automater (hereinafter "the Utility") is a specialized technical script designed for the automation of secondary binary deployment within the Android-based Extended Reality (XR) architecture, specifically targeting the Meta Quest 3 hardware and its underlying software environment. This document serves as both a technical specification and a mandatory, legally binding agreement between the person executing the software (hereinafter "the User") and the developer(s) and contributor(s) of this repository (hereinafter "the Providers"). The Utility is intended for advanced developers and researchers. It is not a consumer-grade application, and its execution involves system-level modifications that bypass standard operating system safety protocols.

### Section 2: COMPREHENSIVE WAIVER OF LIABILITY AND ASSUMPTION OF RISK
THIS SECTION CONSTITUTES A TOTAL RELEASE OF ALL CLAIMS. BY DOWNLOADING, CLONING, OR EXECUTING THE UTILITY, THE USER ACKNOWLEDGES THAT THEY ARE ENGAGING IN HIGH-RISK HARDWARE MODIFICATION. THE USER VOLUNTARILY ASSUMES ALL RISKS, KNOWN AND UNKNOWN, ASSOCIATED WITH THE EXECUTION OF ADB (ANDROID DEBUG BRIDGE) COMMANDS, SHELL SCRIPTS, AND MEMORY INJECTION TOOLS.

THE PROVIDERS SHALL NOT BE HELD LIABLE FOR ANY DAMAGES WHATSOEVER, INCLUDING BUT NOT LIMITED TO:
A. TOTAL SYSTEM MALFUNCTION OR PERMANENT NON-FUNCTIONAL STATE (BRICKING): THE USER ACKNOWLEDGES THAT WRITING TO SYSTEM DIRECTORIES SUCH AS /DATA/LOCAL/TMP/ AND ALTERING EXECUTION PERMISSIONS CAN LEAD TO KERNEL PANICS, BOOT LOOPS, AND PERMANENT FIRMWARE CORRUPTION.
B. DIMINUTION OF FINANCIAL VALUE: THE USER EXPRESSLY WAIVES THE RIGHT TO SEEK COMPENSATION FOR THE LOSS OF RESALE VALUE, WARRANTY VOIDANCE, OR THE LOSS OF ELIGIBILITY FOR OFFICIAL TECHNICAL SUPPORT FROM THE ORIGINAL EQUIPMENT MANUFACTURER (OEM).
C. ACCOUNT SANCTIONS AND ASSET LOSS: THE USE OF THE UTILITY TO MODIFY THIRD-PARTY APPLICATIONS SUCH AS GORILLA TAG IS A BREACH OF MOST PLATFORM TERMS OF SERVICE. THE PROVIDERS ARE NOT RESPONSIBLE FOR THE PERMANENT BANNING OF META/OCULUS ACCOUNTS, THE LOSS OF PURCHASED SOFTWARE LIBRARIES, STORE CREDITS, OR SOCIAL NETWORKING ACCESS.
D. INTELLECTUAL PROPERTY CLAIMS: THE USER ASSUMES ALL LEGAL RESPONSIBILITY FOR ANY INFRINGEMENT CLAIMS BROUGHT BY THIRD-PARTY DEVELOPERS (E.G., ANOTHER AXIOM) RESULTING FROM THE USE OF THIS UTILITY.

THE USER AGREES TO INDEMNIFY, DEFEND, AND HOLD HARMLESS THE PROVIDERS FROM AND AGAINST ANY AND ALL LOSSES, DAMAGES, LIABILITIES, DEFICIENCIES, CLAIMS, ACTIONS, JUDGMENTS, SETTLEMENTS, INTEREST, AWARDS, PENALTIES, FINES, COSTS, OR EXPENSES OF WHATEVER KIND, INCLUDING REASONABLE ATTORNEYS' FEES, ARISING FROM OR RELATING TO THE USER'S USE OR MISUSE OF THE UTILITY.

### Section 3: Technical Specifications and Host-Side Modifications
To ensure total transparency and informed consent, the User must understand the following technical operations. Upon execution, the Utility audits the host Windows environment for the presence of the Android Debug Bridge (ADB), Python 3.11+, and Curl. If these are not found, the Utility will perform a silent, unattended installation of these tools. Specifically, for the ARM64 chipset of the Quest 3, the Utility ensures that the PC-side Frida-Tools match the architectural requirements of the remote server. 

The Utility modifies the Windows System Environment Variables (PATH) to allow for immediate command-line execution. This is a system-wide change on the host machine. On the target device (the Quest 3), the Utility pushes binaries to the temporary partition. These files are then granted "755" or "+x" permissions. The User acknowledges that these files remain in the headset's storage until a manual deletion or factory reset occurs.

### Section 4: Behavioral Protocol for Memory Injection and IL2CPP Stabilization
The successful execution of the iis.Quest.Menu exploit requires a precise synchronization between the host PC and the headset's RAM. The target application, Gorilla Tag, utilizes the IL2CPP (Intermediate Language to C++) backend. During the startup sequence, the application must unpack and load metadata into the system's memory. 

The User is strictly prohibited from proceeding with the final injection phase until they have visually confirmed that the "Gorilla Tag" application has finished its loading sequence, including the rendering of cosmetics and the mirror-room textures. Attempting to hook the memory process while the game is in a transition state (loading screens) will cause the Frida-Server to point to invalid memory addresses. This will result in a fatal segmentation fault, potentially causing a hard lock of the Quest 3 Operating System. The User accepts that they are the final arbiter of safety and that the script's confirmation prompts are a mandatory manual barrier to prevent device failure.

### Section 5: Python Versioning and Chipset Architecture Requirements
This Utility is optimized for the ARM64 (Advanced RISC Machines) architecture used in the Qualcomm Snapdragon XR2 Gen 2 chipset found within the Quest 3. Due to the specific instruction sets required for memory hooking on this architecture, the host machine must utilize Python versions that support the latest Frida-Tools (Frida 16.x or higher). Any attempt to utilize deprecated versions of these tools or incompatible architectures may result in "Illegal Instruction" errors, which can destabilize the headset's background services and require a full hardware reboot.

### Section 6: No Agency or Relationship
The execution of this software does not create any form of attorney-client, agency, partnership, or joint venture relationship between the User and the Providers. The User acts as an independent entity. This document is the entire agreement between the parties regarding the subject matter and supersedes all prior or contemporaneous communications, whether electronic, oral, or written.

### Section 7: Severability and Governing Law
If any provision of this document is held to be invalid, illegal, or unenforceable, the validity, legality, and enforceability of the remaining provisions shall not be affected or impaired. This agreement shall be governed by the principles of common law and the specific statutes regarding digital modification and software automation.

### Section 8: Final Declaration
BY CONTINUING TO USE THIS SOFTWARE, YOU CONFIRM THAT YOU HAVE READ THIS PAGES-LONG DOCUMENT IN ITS ENTIRETY, THAT YOU FULLY UNDERSTAND THE RISKS OF BRICKING YOUR HARDWARE OR LOSING YOUR DIGITAL ACCOUNTS, AND THAT YOU VOLUNTARILY CHOOSE TO PROCEED WITH NO RECOURSE AGAINST THE PROVIDERS. YOU ARE THE SOLE OPERATOR OF YOUR DESTINY.
