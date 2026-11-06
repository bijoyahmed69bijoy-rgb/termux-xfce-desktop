Termux XFCE Desktop

A simple, pre-configured XFCE desktop environment for Termux.

This project brings together existing Termux packages and desktop components to make running an XFCE graphical desktop on Android easier and more convenient.

About This Project

This project does not create any new Linux packages, desktop environments, themes, or applications.

Instead, it combines existing software and configurations into one organized setup so users can install and run a graphical Linux desktop environment through Termux with less manual configuration.

The main goal is to make the XFCE desktop experience easier to set up, configure, and use on Android devices.

What This Project Provides

- XFCE 4 desktop environment
- TigerVNC server configuration
- Pre-configured top panel and bottom dock
- Application launchers
- Whisker application menu
- Papirus icon theme
- Adwaita theme
- Firefox browser
- Thunar file manager
- XFCE Terminal
- Rofi application launcher
- Pre-configured desktop settings
- Installation, startup, and shutdown scripts

Credits & Acknowledgements

Important: This project does not claim ownership of any third-party software or packages used here.

All applications, packages, desktop components, themes, and tools belong to their respective original developers and maintainers.

This project simply brings existing components together and provides a convenient configuration and installation method.

Special thanks to:

- Termux Developers — for the Termux environment.
- XFCE Project — for the XFCE desktop environment.
- TigerVNC Developers — for VNC server technology.
- Papirus Development Team — for the Papirus icon theme.
- Adwaita Developers — for the Adwaita theme.
- adi1090x — for the Termux desktop project that served as a reference.

All original software licenses and copyrights remain with their respective owners.

Requirements

- Android device
- Termux
- Internet connection
- A VNC Viewer application
- Recommended: 4 GB RAM or more
- Sufficient free storage space

No root access is required.
***
Installation Guide
***
Step 1: Install Termux

Install Termux from a trusted source:

- "Termux on F-Droid" (https://f-droid.org/packages/com.termux/)
- "Termux on GitHub" (https://github.com/termux/termux-app)

Open Termux and update its packages:
```
pkg update && pkg upgrade -y
```
Step 2: Install Git
```
pkg install git -y
```
Step 3: Clone This Repository
```
git clone https://github.com/bijoyahmed69bijoy-rgb/termux-xfce-desktop.git
```
Enter the project directory:
```
cd termux-xfce-desktop
```
Step 4: Install XFCE Desktop

Run:
```
bash install.sh --apply-defaults
```
The installer will:

1. Enable the Termux X11 repository.
2. Update package information.
3. Install the required desktop packages.
4. Prepare the XFCE configuration.
5. Apply the included desktop layout.
6. Back up existing configurations before replacing them.

Installation time depends on your internet connection and device.

Step 5: Set VNC Password

On the first setup, run:
```
vncpasswd
```
Create a password for your VNC connection.

Step 6: Start the Desktop
```
bash start.sh
```
The VNC server will start on:
```
127.0.0.1:5901
```
Step 7: Connect Using VNC Viewer

1. Install a VNC Viewer application.
2. Open the application.
3. Add a new connection.
4. Enter:

127.0.0.1:5901

5. Connect using the password you created.

Your XFCE desktop should now appear.
~~~~
Desktop Controls

Start Desktop

bash start.sh

Stop Desktop

bash stop.sh

Reapply Desktop Configuration

bash install.sh --apply-defaults

Reapplying the configuration creates a backup of existing settings first.
~~~~
Project Structure
```
termux-xfce-desktop/
│
├── config/
│   ├── panel/
│   ├── xfconf/
│   └── xstartup
│
├── install.sh
├── start.sh
├── stop.sh
├── README.md
└── .gitignore
```
Important Notes

- This project is designed for Termux.
- Root access is not required.
- A VNC Viewer application is required to view the desktop.
- The VNC server is configured to listen on localhost only.
- Installation requires an internet connection.
- Performance depends on the Android device and available resources.
- Existing XFCE configurations are backed up before applying the included settings.

Disclaimer

This project is provided for educational and personal use.

The project maintainer is not the creator of the third-party packages, applications, desktop environment, or themes included in this setup.

All trademarks, software, and related rights belong to their respective owners.

Use this project at your own discretion and follow the licenses of the original software.

License

This project's original scripts and configuration files are provided under the MIT License.

Third-party software remains subject to its own licenses.

---

Designed & Configured by Entity_Yubraj

Bringing existing tools together to make XFCE desktop setup on Termux easier.
