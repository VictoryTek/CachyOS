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

greeting
extensions