if ! [ $(id -u) = 0 ]; then
   echo "Please run this script with sudo." >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi

# Define XIM as input method
echo 'export GTK_IM_MODULE="xim"' >> /home/$real_user/.profile
echo 'export QT_IM_MODULE="xim"' >> /home/$real_user/.profile

# Copy .XCompose file to user folder
cp ./files/US-International-XCompose /home/$real_user/.XCompose

# Replace keymap to user Windows standard
cp ./files/US-International-xkb /usr/share/X11/xkb/symbols/us

echo 'Please change your keyboard layout to English (US, intl., with dead keys)'
echo 'And then restart your computer.'
