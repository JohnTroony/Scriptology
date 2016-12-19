#!/bin/bash
# John Troon
# Numix XFCE theme installer - Postintall Script


## Install Numix GTK Theme
apt-get install -y numix-gtk-theme  

## Get Numix Icons and install
wget https://codeload.github.com/numixproject/numix-icon-theme-circle/zip/master

unzip numix-icon-theme-circle-master.zip

cd numix-icon-theme-circle-master

mkdir ~/.icons

mv -rf Numix-Circle ~/.icons
mv -fr Numix-Circle-Light ~/.icons

cd .. && rm -fr numix-icon-theme-circle-master

## Use Numix Light Icons
xfconf-query -c xsettings -p /Net/ThemeName -s "Numix Light"
xfconf-query -c xfwm4 -p /general/theme -s "Numix Light"


## Fix LibreOffice Know Issues

cat > ~/.gtkrc-libreoffice << EOF

style "libreoffice-scrollbar" {
GtkScrollbar::trough-border = 3
}

widget_class "*" style "libreoffice-scrollbar"

EOF

GTK2_RC_FILES=$HOME/.gtkrc-libreoffice libreoffice5.2

echo -e "We are Done!\n"