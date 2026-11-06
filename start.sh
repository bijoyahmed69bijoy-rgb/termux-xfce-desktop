#!/data/data/com.termux/files/usr/bin/bash
set -e

if ! command -v vncserver >/dev/null 2>&1; then
    echo "TigerVNC is missing. Run bash install.sh"
    exit 1
fi

if [ ! -f "$HOME/.vnc/passwd" ] && \
   [ ! -f "$HOME/.config/tigervnc/passwd" ]; then
    echo "Set your VNC password first:"
    vncpasswd
fi

vncserver :1 -localhost yes -geometry 1280x720 -depth 24

echo "VNC desktop started at 127.0.0.1:5901"
