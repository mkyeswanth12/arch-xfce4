#!/bin/bash

if [ $UID -ne 0 ]
  then
echo "Run as a Root!!!"
else

if ping -q -c 1 -W 1 google.com > /dev/null
  then

echo "Adding Garuda Repo'chaotic-aur':"

        pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
        pacman-key --lsign-key FBA220DFC880C036
        pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

        echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
        pacman -Sy
        if [ $? -ne 0 ]
            then
        echo $?"Error Updating/Adding Chaotic-aur:"
        exit
        else
        echo "Added Chaotic-aur:"
        fi


    echo "Installing ZSH"
    sleep 3s
    pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting
    mv -f /tmp/arch-xfce4/zshrc /home/admin/.zshrc
    mv -f /tmp/arch-xfce4/zshrc_root /root/.zshrc
    touch /home/admin/.zsh_history /root/.zsh_history
    chsh -s /usr/bin/zsh
    echo "Installing Brave & ProtonVPN"
    pacman -S brave protonvpn-cli
    #echo "Configuring ProtonVPN"
    #sleep 1s
    #echo "login using 17btrct023"
    #su - admin -c 'whoami'
    #su - admin -c 'protonvpn-cli login 17btrct023 and $USER'
    #su - admin -c 'protonvpn-cli c -f'

#      git clone https://github.com/mkyeswanth12/arch-xfce4.git  /tmp/arch-xfce4/
#
#
#
	echo "Settingup Themes and icons"
	sleep 1s
	echo "Adding icons and Themes"
	unzip /tmp/arch-xfce4/Kali-Dark.zip > /dev/null
	tar -xzvf /tmp/arch-xfce4/blackarch-icons.tgz > /dev/null

	mv -f /tmp/arch-xfce4/blackarch-icons /usr/share/icons/
	mv -f /tmp/arch-xfce4/Kali-Dark /usr/share/themes/
#
    echo "Installing polybar"
	pacman -S polybar ttf-font-awesome ttf-font-awesome-4 ttf-font-icons ttf-font-logos dstat
	
	git clone https://github.com/mkyeswanth12/My_Polybar_Conf.git /tmp/polybar/
	cp /tmp/polybar/polybar.conf /home/admin/.config/polybar/config
	echo "Done"
	sleep 3s
else
  echo "Error: The network is down, Check Your Network And try Again."
  fi
fi
