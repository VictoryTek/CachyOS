#!/bin/bash
# Finish Setup my CachyOS Linux
# Ver. 1.2

#####################################################################
#  ____    ____  __                                                 #
#  \   \  /   / |__| ____ ________    ____    _______ ___  ___      #
#   \   \/   /  ___ |   _|\__   __\ /   _  \ |  __   |\  \/  /      #
#    \      /  |   ||  |_   |  |   |   |_|  ||  | |__| \   /        #
#     \____/   |___||____|  |__|    \_____ / |__|       |_|         #
#                                                                   #
# Victory Linux Install script                                      #
# https://github.com/VictoryLinux                                   #
#####################################################################


echo -e "----------------------------------------------------------------"
echo -e "  ____    ____  __                                              "
echo -e "  \   \  /   / |__| ____ ________    ____    _______ ___  ___   "
echo -e "   \   \/   /  ___ |   _|\__   __\ /   _  \ |  __   |\  \/  /   "
echo -e "    \      /  |   ||  |_   |  |   |   |_|  ||  | |__| \   /     "
echo -e "     \____/   |___||____|  |__|    \_____ / |__|       |_|      "
echo -e "                                                                "
echo -e "----------------------------------------------------------------"
echo -e "          █████╗    █████╗   █████╗  ██╗ ██╗██╗   ██╗           "
echo -e "        ██     ██╗ ██╔══██╗ ██    ██╗██║ ██║ ██╗ ██╔╝           "
echo -e "       ██          ███████║██        ██████║  ████╔╝            "
echo -e "        ██     ██║ ██║  ██║ ██    ██║██║ ██║   ██╔╝             "
echo -e "         ███████╔╝ ██║  ██║  ██████╔╝██║ ██║   ██║              "
echo -e "         ╚══════╝  ╚═╝  ╚═╝  ╚═════╝ ╚═╝ ╚═╝   ╚═╝              "
echo -e "----------------------------------------------------------------"

# Make sure each command executes properly
check_exit_status() {

	if [ $? -eq 0 ]
	then
		echo
		echo "Success"
		echo
	else
		echo
		echo "[ERROR] Update Failed! Check the errors and try again"
		echo
		
		read -p "The last command exited with an error. Exit script? (y/n) " answer

            if [ "$answer" == "y" ]
            then
                exit 1
            fi
	fi
}

function greeting() {
	clear
	
echo "+-----------------------------------------------------------------+"
echo "|-------   Hello, $USER. Let's setup Victory-Edition.  -----------|"
echo "+-----------------------------------------------------------------+"
echo -e "----------------------------------------------------------------"
echo -e "  ____    ____  __                                              "
echo -e "  \   \  /   / |__| ____ ________    ____    _______ ___  ___   "
echo -e "   \   \/   /  ___ |   _|\__   __\ /   _  \ |  __   |\  \/  /   "
echo -e "    \      /  |   ||  |_   |  |   |   |_|  ||  | |__| \   /     "
echo -e "     \____/   |___||____|  |__|    \_____ / |__|       |_|      "
echo -e "                                                                "
echo -e "----------------------------------------------------------------"
echo -e "          █████╗    █████╗   █████╗  ██╗ ██╗██╗   ██╗           "
echo -e "        ██     ██╗ ██╔══██╗ ██    ██╗██║ ██║ ██╗ ██╔╝           "
echo -e "       ██          ███████║██        ██████║  ████╔╝            "
echo -e "        ██     ██║ ██║  ██║ ██    ██║██║ ██║   ██╔╝             "
echo -e "          ██████╔╝ ██║  ██║  ██████╔╝██║ ██║   ██║              "
echo -e "          ╚═════╝  ╚═╝  ╚═╝  ╚═════╝ ╚═╝ ╚═╝   ╚═╝              "
echo -e "----------------------------------------------------------------"
echo -e " DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK. "
echo -e "----------------------------------------------------------------"

echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "++++++++         This is NOT a silent install           ++++++++"
echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

	
#	sleep 5s
	echo "ARE YOU READY TO START? [y,n]"
	read input

	# did we get an input value?
	if [ "$input" == "" ]; then

	   echo "Nothing was entered by the user"

	# was it a y or a yes?
	elif [[ "$input" == "y" ]] || [[ "$input" == "yes" ]]; then

	   echo "You replied $input, you are ready to start"
	   echo
	   echo "Starting CachyOS install & config script."
	   echo
	   sleep 3s

	# treat anything else as a negative response
	else

	   echo "You replied $input, you are not ready"
	   echo
	   exit 1

fi

	echo
	
	check_exit_status
}

# Updating 
function update() {

	echo "###########################"
	echo "|        Updating         |"
	echo "###########################"
	echo
	sleep 6s
	echo	
	sudo pacman -Syu --noconfirm;
	echo
	check_exit_status
}

# Removing unwanted pre-installed packages
function debloat() {

	echo "#############################"
	echo "|        Debloating         |"
	echo "#############################"
	echo

	sleep 6s

	PKGS=(
    'totem'
    'cachyos-fish-config'
    'octopi'
	'meld'

	)

for PKG in "${PKGS[@]}"; do
    echo "REMOVING: ${PKG}"
    sudo pacman -Rs "$PKG" --noconfirm
done
	echo
	check_exit_status
}

# Installing Packages
function install() {

	echo "###############################"
	echo "|     Installing Packages.    |"
	echo "###############################"
	echo

    sleep 6s

	PKGS=(
	'alacarte'
	'bitwarden'
	'brave-bin'
	'breeze'
	'bpytop'
	'celluloid' # video players
	'dconf-editor'
	'discord'
	'filelight'
	'flatpak'
	'ttf-fira-code'
	'gamemode'
	'gimp' # Photo editing
	'gnome-browser-connector'
	'gparted' # partition management
	'gwenview'
	'kmail'
	'kmag'
	'mpv'
	'mono'
	'ncdu'
	'meson'
	'popsicle'
	'prismlauncher'
	'progress'
	'rustdesk'
	'snap-pac'
	'starship'
	'swtpm'
	'tailscale'
	'terminator'
	'ttf-terminus-nerd'
	'trash-cli'
	'ufw'
	'variety'
	'virtualbox'
	'yay'
	'gnome-shell-extensions'
	'gnome-shell-extension-appindicator'
	'gnome-shell-extension-dash-to-dock'
	'gnome-shell-extension-caffeine'
	'gnome-shell-extension-vitals'
	'gnome-shell-extension-gnome-ui-tune-git'

)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm
done

# Installing AUR Packages

	PKGS=(
	'autojump'
	'bibata-cursor-theme'
	'gnome-shell-extension-tiling-assistant'
	'gnome-shell-extension-background-logo'
	'kora-icon-theme'
	'pamac-aur'
	'pamac-cli'
	'realvnc-vnc-viewer'

)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    yay -S "$PKG" --noconfirm
done

# Flatpaks

	flatpak install flathub io.github.shiftey.Desktop -y
	flatpak install flathub com.mattjakeman.ExtensionManager -y
	flatpak install flathub com.simplenote.Simplenote -y
	flatpak install flathub com.vscodium.codium -y
	sleep 3s

}

# Put the wallpaper
function backgrounds() {

	echo "#########################################"
	echo "|     Setting up Favorite Wallpaper.    |"
	echo "#########################################"
	echo
	sleep 6s
	cd ~/
    	git clone https://gitlab.com/dwt1/wallpapers.git

	check_exit_status
}

#
function configs() {
	
	echo "##################################"
	echo "|     Setting Format changes.    |"
	echo "##################################"
	echo
	sleep 6s
   	echo
    export PATH=$PATH:~/.local/bin
    cp -r $HOME/CachyOS/configs/* $HOME/.config/
    echo
	# enable pre configured bashrc file
    mv $HOME/.config/bashrc $HOME/.config/.bashrc
    mv $HOME/.config/.bashrc $HOME
    echo
	# create a face icon
    mv $HOME/.config/face $HOME/.config/.face
    mv $HOME/.config/.face $HOME
	echo

	cd $HOME/CachyOS/
	git clone https://github.com/daniruiz/flat-remix
	git clone https://github.com/daniruiz/flat-remix-gtk
	#mkdir -p ~/.icons && mkdir -p ~/.themes
#	cp -r flat-remix/Flat-Remix* ~/.icons/ && cp -r flat-remix-gtk/themes/Flat-Remix* ~/.themes/
	sudo mv flat-remix/Flat-Remix* /usr/share/icons/ 
	sudo mv flat-remix-gtk/themes/Flat-Remix* /usr/share/themes/
	rm -rf ~/flat-remix flat-remix-gtk
	#gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-GTK-Blue-Dark"
	gsettings set org.gnome.desktop.interface icon-theme "kora"
	echo
	gsettings set org.gnome.shell favorite-apps "['brave-browser.desktop', 'cachy-browser.desktop', 'org.gnome.Nautilus.desktop', 'terminator.desktop', 'cachyos-hello.desktop', 'com.simplenote.Simplenote.desktop', 'virtualbox.desktop', 'net.lutris.desktop', 'org.prismlauncher.Prismlauncher.desktop', 'steam.desktop', 'com.vscodium.codium.desktop', 'discord.desktop']"
	gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
	gsettings set org.gnome.desktop.interface clock-format '12h'   
	gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
	gsettings set org.gnome.desktop.screensaver lock-enabled false
	echo
	    
	check_exit_status
}

#EXTENSIONS
function extensions() {

	echo "#####################################"
	echo "|     Enabling Gnome Extensions.    |"
	echo "#####################################"
	gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
	gnome-extensions enable caffeine@patapon.info
	gnome-extensions enable dash-to-dock@micxgx.gmail.com
	gnome-extensions enable tiling-assistant@leleat-on-github
	gnome-extensions enable gnome-ui-tune@itstime.tech
	gnome-extensions enable background-logo@fedorahosted.org
	gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
	gnome-extensions enable pamac-updates@manjaro.org
	gnome-extensions enable window-list@gnome-shell-extensions.gcampax.github.com


	check_exit_status
}

#CLEAN UP
function clean-up() {
	
	echo "##################################"
	echo "|     Cleaning up Left Overs.    |"
	echo "##################################"
	echo
	sleep 6s
	sudo rm -rf /usr/share/backgrounds/gnome
	echo
	sudo rm -rf /usr/share/backgrounds/workstation
	echo
	check_exit_status
}

# finish
function restart() {
	read -p "Are You ready to restart now? (y/n) " answer 

            if [ "$answer" == "y" ]
            then
            	cecho
		echo "---------------------------------------"
		echo "----   CachyOS install & config    ----"
		echo "----        has completed!         ----"
		echo "---------------------------------------"
		echo
		
		echo Restart 
		echo or 
		echo restart gnome shell 
		echo
		check_exit_status
		
		echo
		echo "Restarting in 15s"
		sleep 15s
                shutdown -r now

            if [ "$answer" == "n" ]
            then
		exit 1

            fi
        fi

}

greeting
update
debloat
install
backgrounds
configs
#extensions
clean-up
restart
