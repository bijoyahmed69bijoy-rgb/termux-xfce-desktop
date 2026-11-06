#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$(cd "$(dirname "$0")" && pwd)"

if [ -z "$PREFIX" ] || [ ! -d "$PREFIX" ]; then
    echo "ERROR: Termux is required."
    exit 1
fi

APPLY=false
if [ "${1:-}" = "--apply-defaults" ]; then
    APPLY=true
fi

echo "[1/3] Enabling X11 repository..."
pkg install -y x11-repo
pkg update -y

echo "[2/3] Installing desktop packages..."

pkg install -y \
    tigervnc dbus exo xfconf \
    xfce4-session xfce4-panel xfwm4 xfdesktop \
    xfce4-settings xfce4-terminal xfce4-appfinder \
    xfce4-whiskermenu-plugin thunar \
    thunar-archive-plugin \
    papirus-icon-theme adwaita-icon-theme \
    adwaita-icon-theme-legacy \
    firefox rofi feh openbox xcompmgr

echo "[3/3] Preparing configuration..."

mkdir -p "$HOME/.vnc"
mkdir -p "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml"

if [ "$APPLY" = true ]; then
    BACKUP="$HOME/xfce-desktop-backup-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$BACKUP"

    CONFIG="$HOME/.config/xfce4"

    for f in "$ROOT"/config/xfconf/xfce-perchannel-xml/*.xml; do
        [ -f "$f" ] || continue
        name="$(basename "$f")"

        if [ -f "$CONFIG/xfconf/xfce-perchannel-xml/$name" ]; then
            cp -a "$CONFIG/xfconf/xfce-perchannel-xml/$name" "$BACKUP/"
        fi

        cp "$f" "$CONFIG/xfconf/xfce-perchannel-xml/$name"
    done

    if [ -d "$CONFIG/panel" ]; then
        cp -a "$CONFIG/panel" "$BACKUP/panel"
    fi

    mkdir -p "$CONFIG/panel"
    cp -a "$ROOT/config/panel/." "$CONFIG/panel/"

    if [ -f "$HOME/.vnc/xstartup" ]; then
        cp -a "$HOME/.vnc/xstartup" "$BACKUP/xstartup"
    fi

    cp "$ROOT/config/xstartup" "$HOME/.vnc/xstartup"
    chmod +x "$HOME/.vnc/xstartup"

    echo "Configuration applied."
    echo "Backup location: $BACKUP"
else
    echo "Existing configuration preserved."
    echo "To apply this project's desktop layout, run:"
    echo "bash install.sh --apply-defaults"
fi

echo
echo "Installation finished."
echo "Run: bash start.sh"
