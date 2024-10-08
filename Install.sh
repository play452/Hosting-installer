#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
reset='\033[0m'

display_main_menu() {
    echo -e "${red}* play452 and Contributers${reset}"
    echo -e "${green}Please note that I am not affiliated with any of these projects.${reset}"
    echo "What do you want to install?"
    echo "1. Skyport"
    echo "2. Skyportd"
    echo "3. HydrenDashboard"
    echo "4. Exit"
    read -p "Enter your choice: " choice
    return $choice
}

display_installation_method_menu() {
    echo "How do you want to install $1?"
    echo "1. Localhost (Still you can install it with Cloudflare Tunnels)"
    echo "2. Exit"
    read -p "Enter your choice: " method_choice
    return $method_choice
}

while true; do
    display_main_menu
    case $choice in
        1)
            display_installation_method_menu "Skyport"
            case $method_choice in
                1)
                    cd ~
                    bash <(curl -s https://raw.githubusercontent.com/hydrenlabs/Skyport-Installer/main/install.sh)
                    ;;
                4)
                    exit
                    ;;
                *)
                    echo "Invalid choice"
                    ;;
            esac
            ;;
        2)
            display_installation_method_menu "Skyportd"
read -p "Enter the Configure Command: " user_command

case $method_choice in
    1)
        echo "Installing Skyportd ..."
        git clone https://github.com/skyportlabs/skyportd.git && cd skyportd && npm install 
        $user_command 
        npm i -g pm2 
        pm2 start index.js --name daemon
        ;;
    4)
        exit
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

        3)
            display_installation_method_menu "HydrenDashboard"
            case $method_choice in
                1)
                    echo "Installing HydrenDashboard ..."
                    bash curl -s (https://raw.githubusercontent.com/hydren-dev/HydrenDashboard-Installer/main/install.sh)
                    ;;
                4)
                    exit
                    ;;
                *)
                    echo "Invalid choice"
                    ;;
            esac
            ;;
        4)
            exit
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
done
