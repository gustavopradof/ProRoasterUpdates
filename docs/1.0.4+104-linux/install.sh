#!/bin/bash
APP_DIR=$(dirname "$(readlink -f "$0")")
ICON_PATH="$APP_DIR/data/icon.png"
EXEC_PATH="$APP_DIR/modbus_linux"

# Create the .desktop file in the user's applications directory
mkdir -p ~/.local/share/applications

cat > ~/.local/share/applications/pro_roaster.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Pro Roaster
Comment=Pro Roaster Application
Exec="$EXEC_PATH"
Icon="$ICON_PATH"
Terminal=false
Categories=Utility;
EOF

# Update the desktop database to refresh the menu
if command -v update-desktop-database &> /dev/null; then
    update-desktop-database ~/.local/share/applications
fi

echo "Pro Roaster installed successfully!"
echo "You should now see the app in your system menu with the correct icon."
