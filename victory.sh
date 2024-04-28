#!/bin/bash
# Finish Setup my Nobara Linux
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
echo -e "     ██   ██╗   █████╗    ██████╗   █████╗ ██████╗  █████╗      "
echo -e "     ███  ██║  ██    ██╗  ██    ██╗██╔══██╗██   ██╗██╔══██╗     "
echo -e "     ██║█ ██║ ██      ██╗ ██████╔═╝███████║██████╔╝███████║     "
echo -e "     ██║ ███║  ██    ██╔╝ ██    ██╗██║  ██║██║  ██║██║  ██║     "
echo -e "     ██║  ██║   ██████╔╝  ██████╔═╝██║  ██║██║  ██║██║  ██║     "
echo -e "     ╚═╝  ╚═╝   ╚═════╝   ╚═════╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝     "
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
echo -e "     ██   ██╗   █████╗    ██████╗   █████╗ ██████╗  █████╗      "
echo -e "     ███  ██║  ██    ██╗  ██    ██╗██╔══██╗██   ██╗██╔══██╗     "
echo -e "     ██║█ ██║ ██      ██╗ ██████╔═╝███████║██████╔╝███████║     "
echo -e "     ██║ ███║  ██    ██╔╝ ██    ██╗██║  ██║██║  ██║██║  ██║     "
echo -e "     ██║  ██║   ██████╔╝  ██████╔═╝██║  ██║██║  ██║██║  ██║     "
echo -e "     ╚═╝  ╚═╝   ╚═════╝   ╚═════╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝     "
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
	   echo "Starting VictoryNobara install script."
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
	sudo dnf update -y;
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
	'gnome-clocks'
	'gnome-maps'
	'simple-scan'
	'gnome-weather'
	'gnome-boxes'
	'totem'
	'rhythmbox'
	#'blender'
	#'mediawriter'
	'gameconqueror'
	'inkscape'
	#'kdenlive'
	#'obs-studio'
	'scummvm'
	'gnome-shell-extension-arc-menu'
	'gnome-shell-extension-dash-to-panel'
	'gnome-shell-extension-desktop-icons'


	)

for PKG in "${PKGS[@]}"; do
    echo "REMOVING: ${PKG}"
    sudo dnf remove "$PKG" -y
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
#'autoconf' # build
#'automake' # build
'autojump'
'breeze-cursor-theme'
'bpytop'
'celluloid' # video players
#'dkms'
#'dnf-plugins-core'
'chrome-gnome-shell'
'dconf-editor'
'discord'
'filelight'
'fira-code-fonts'
#'flex'
'gimp' # Photo editing
'gparted' # partition management
'gwenview'
'gydl'
#'haveged'
'htop'
'inxi'
#'kcodecs'
'kernel-devel'
'kmail'
'kmag'
#'layer-shell-qt'
#'lzop'
#'m4'
'mono-complete'
#'nodejs'
#'npm'
'ncdu'
'NetworkManager'
#'meson'
'onboard'
#'patch'
#'pkgconf'
'powerline-fonts'
'progress'
'remmina'
'snapper'
'stacer'
'starship'
'swtpm'
'terminator'
'terminus-font'
'timeshift'
'tldr'
'trash-cli'
'unrar'
#'util-linux-user'
'ufw'
'variety'
'@virtualization'
#'wireplumber'
'youtube-dl'
'gnome-shell-extension-dash-to-dock'
'gnome-shell-extension-caffeine'
#'gnome-shell-extension-vitals-git'
#'gnome-shell-extension-gnome-ui-tune'
#'gnome-shell-extension-impatience-git'
#'gnome-shell-extension-no-annoyance-git'
#'gnome-shell-extension-tiling-assistant'
#'gnome-shell-extension-extension-list'


)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo dnf install "$PKG" -y
done

	
	# Flatpaks
	#flatpak install flathub com.system76.Popsicle -y
    flatpak install flathub com.bitwarden.desktop -y
	flatpak install flathub com.usebottles.bottles -y
	#flatpak install flathub com.brave.Browser -y
	flatpak install flathub nl.hjdskes.gcolor3 -y
	flatpak install flathub io.github.shiftey.Desktop -y
	flatpak install flathub org.prismlauncher.PrismLauncher -y
	flatpak install flathub com.simplenote.Simplenote -y
    flatpak install flathub com.vscodium.codium -y
	sleep 3s

	#Extensions

	#Tiling-Assistant
	cd ~
	git clone https://github.com/Leleat/Tiling-Assistant.git && cd Tiling-Assistant/scripts
	chmod +x build.sh
	./build.sh -i
	sleep 3s

	#Extension-list
	cd ~
	git clone https://github.com/tuberry/extension-list.git && cd extension-list
	make && make install
	sleep 3s

	#Tray-Icons-Reloaded
	cd ~
	git clone https://github.com/MartinPL/Tray-Icons-Reloaded.git
	mv $HOME/Tray-Icons-Reloaded ~/.local/share/gnome-shell/extensions/trayIconsReloaded@selfmade.pl
	sleep 3s

	#Gnome 4x Overview UI Tune
	cd ~
	git clone https://github.com/axxapy/gnome-ui-tune.git
	mv $HOME/gnome-ui-tune ~/.local/share/gnome-shell/extensions/gnome-ui-tune@itstime.tech
	sleep 3s

	#Vitals
	cd ~
	git clone https://github.com/corecoding/Vitals.git
	mv $HOME/Vitals ~/.local/share/gnome-shell/extensions/Vitals@CoreCoding.com
	sleep 3s
	check_exit_status
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
    cp -r $HOME/VictoryNobara/configs/* $HOME/.config/
    echo
	# enable pre configured bashrc file
    mv $HOME/.config/bashrc $HOME/.config/.bashrc
    mv $HOME/.config/.bashrc $HOME
    echo
	# create a face icon
    mv $HOME/.config/face $HOME/.config/.face
    mv $HOME/.config/.face $HOME
	echo
	# enable VM services
	sudo systemctl start libvirtd
	echo
	sudo systemctl enable libvirtd
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
		echo "----     VictoryNobara part 1      ----"
		echo "----     has been installed!       ----"
		echo "---------------------------------------"
		echo
		
		echo Restart 
		echo or 
		echo restart gnome shell 
		echo & 
		echo run script 2, victory-finish.sh
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
hostname
mirror
update
debloat
install
backgrounds
configs
restart
