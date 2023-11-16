#!/usr/bin/env bash
# Regular Colors
BLACK='\033[0;30m'        # Black
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
ORANGE='\033[0;33m'       # Orange/Brown
BLUE='\033[0;34m'         # Blue
PURPLE='\033[0;35m'       # Purple
CYAN='\033[0;36m'         # Cyan
LIGHTGRAY='\033[0;37m'    # Light Gray

# Bold (Bright) Colors
DARKGRAY='\033[1;30m'     # Dark Gray
LIGHTRED='\033[1;31m'     # Light Red
LIGHTGREEN='\033[1;32m'   # Light Green
YELLOW='\033[1;33m'       # Yellow
LIGHTBLUE='\033[1;34m'    # Light Blue
LIGHTPURPLE='\033[1;35m'  # Light Purple
LIGHTCYAN='\033[1;36m'    # Light Cyan
WHITE='\033[1;37m'        # White

# No Color
NC='\033[0m'              # No Color

CHECK='\xE2\x9C\x94' # Check mark
CROSS='\xE2\x9D\x8C' # Cross mark

KCOLOR=$LIGHTCYAN
BCOLOR=$LIGHTPURPLE
SHADOWCOLOR=$YELLOW
BGCOLOR=$BLACK

printf "
${BGCOLOR}░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░${BCOLOR}██████${SHADOWCOLOR}╗${BGCOLOR}░${BCOLOR}██${SHADOWCOLOR}╗${BGCOLOR}░░░░░░${BCOLOR}█████${SHADOWCOLOR}╗${BGCOLOR}░░${BCOLOR}█████${SHADOWCOLOR}╗${BGCOLOR}░${BCOLOR}██${SHADOWCOLOR}╗${BGCOLOR}░░${BCOLOR}██${SHADOWCOLOR}╗${KCOLOR}██${SHADOWCOLOR}╗${BGCOLOR}░░${KCOLOR}██${SHADOWCOLOR}╗${KCOLOR}██${SHADOWCOLOR}╗${BGCOLOR}░░░${KCOLOR}██${SHADOWCOLOR}╗${KCOLOR}██████${SHADOWCOLOR}╗${BGCOLOR}░${KCOLOR}███████${SHADOWCOLOR}╗${BGCOLOR}░░
░░${BCOLOR}██${SHADOWCOLOR}╔══${BCOLOR}██${SHADOWCOLOR}╗${BCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░░░░░${BCOLOR}██${SHADOWCOLOR}╔══${BCOLOR}██${SHADOWCOLOR}╗${BCOLOR}██${SHADOWCOLOR}╔══${BCOLOR}██${SHADOWCOLOR}╗${BCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░${BCOLOR}██${SHADOWCOLOR}╔╝${KCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░${KCOLOR}██${SHADOWCOLOR}╔╝${KCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░░░${KCOLOR}██${SHADOWCOLOR}║${KCOLOR}██${SHADOWCOLOR}╔══${KCOLOR}██${SHADOWCOLOR}╗${KCOLOR}██${SHADOWCOLOR}╔════╝${BGCOLOR}░░
░░${BCOLOR}██████${SHADOWCOLOR}╦╝${BCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░░░░░${BCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░░${BCOLOR}██${SHADOWCOLOR}║${BCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░░${SHADOWCOLOR}╚═╝${BCOLOR}█████${SHADOWCOLOR}═╝${BGCOLOR}░${KCOLOR}█████${SHADOWCOLOR}═╝${BGCOLOR}░${KCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░░░${KCOLOR}██${SHADOWCOLOR}║${KCOLOR}██████${SHADOWCOLOR}╦╝${KCOLOR}█████${SHADOWCOLOR}╗${BGCOLOR}░░░░
░░${BCOLOR}██${SHADOWCOLOR}╔══${BCOLOR}██${SHADOWCOLOR}╗${BCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░░░░░${BCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░░${BCOLOR}██${SHADOWCOLOR}║${BCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░░${BCOLOR}██${SHADOWCOLOR}╗${BCOLOR}██${SHADOWCOLOR}╔═${BCOLOR}██${SHADOWCOLOR}╗${BGCOLOR}░${KCOLOR}██${SHADOWCOLOR}╔═${KCOLOR}██${SHADOWCOLOR}╗${BGCOLOR}░${KCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░░░${KCOLOR}██${SHADOWCOLOR}║${KCOLOR}██${SHADOWCOLOR}╔══${KCOLOR}██${SHADOWCOLOR}╗${KCOLOR}██${SHADOWCOLOR}╔══╝${BGCOLOR}░░░░
░░${BCOLOR}██████${SHADOWCOLOR}╦╝${BCOLOR}███████${SHADOWCOLOR}╗${SHADOWCOLOR}╚${BCOLOR}█████${SHADOWCOLOR}╔╝${BCOLOR}╚█████${SHADOWCOLOR}╔╝${BCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░${SHADOWCOLOR}╚${BCOLOR}██${SHADOWCOLOR}╗${KCOLOR}██${SHADOWCOLOR}║${BGCOLOR}░${SHADOWCOLOR}╚${KCOLOR}██${SHADOWCOLOR}╗╚${KCOLOR}██████${SHADOWCOLOR}╔╝${KCOLOR}██████${SHADOWCOLOR}╦╝${KCOLOR}███████${SHADOWCOLOR}╗${BGCOLOR}░░
░░${SHADOWCOLOR}╚═════╝${BGCOLOR}░${SHADOWCOLOR}╚══════╝${BGCOLOR}░${SHADOWCOLOR}╚════╝${BGCOLOR}░░${SHADOWCOLOR}╚════╝${BGCOLOR}░${SHADOWCOLOR}╚═╝${BGCOLOR}░░${SHADOWCOLOR}╚═╝╚═╝${BGCOLOR}░░${SHADOWCOLOR}╚═╝${BGCOLOR}░░${SHADOWCOLOR}╚════╝${BGCOLOR}░░${SHADOWCOLOR}╚════╝${BGCOLOR}░░${SHADOWCOLOR}╚═════╝${BGCOLOR}░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"



# Welcome message with the user's name
USERNAME=$(whoami)
echo -e "${GREEN}Welcome, ${YELLOW}${USERNAME}${GREEN}, to ${BCOLOR}Block${KCOLOR}Kube${NC}"

# Check for Docker, Node.js, and Minikube installation
echo "Checking system requirements..."
echo -e "Docker: $( [ -x "$(command -v docker)" ] && echo -e "${GREEN}${CHECK}${NC}" || echo -e "${RED}${CROSS}${NC}" )"
echo -e "Node.js: $( [ -x "$(command -v node)" ] && echo -e "${GREEN}${CHECK}${NC}" || echo -e "${RED}${CROSS}${NC}" )"
echo -e "Minikube: $( [ -x "$(command -v minikube)" ] && echo -e "${GREEN}${CHECK}${NC}" || echo -e "${RED}${CROSS}${NC}" )"

# Menu loop
while true; do
    # Show menu options
    echo -e "\n${ORANGE}Choose an option to proceed:"
    echo -e "${ORANGE}A${NC} - Auto: Run everything              ${ORANGE}R${NC} - Reset configurations to default"
    echo -e "${ORANGE}K${NC} - Apply Kubernetes configuration    ${ORANGE}C${NC} - Check configurations (environment.yaml)"
    echo -e "${RED}E${NC} - Exit\n"

    # Read user choice
    read -p "Enter your choice (A/R/K/C/E): " choice

    # Handle user choice
    case $choice in
        A|a)
            printf "\n${YELLOW}Do you want to start minikube? Y/n\n${NC}"
            read -p "Y/n: " input
            if [ "$input" = "Y" ]; then
                echo "Starting minikube"
                minikube start --cpus 4 --memory 4096
            fi
            printf "\n${YELLOW}Running BlockKube script"
            cd kubernetes
            node blockkube.js
            cd ..
            printf "\n${YELLOW}Applying Kubernetes configuration\n\n"
            kubectl apply -f kubernetes/yaml/
            ;;
        R|r)
            printf "\n${YELLOW}Resetting configurations..."
            cd kubernetes
            node blockkube.js
            cd ..
            printf "\n${GREEN}Configurations Reseted.\n\n"
            ;;
        K|k)
            printf "\n${YELLOW}Applying Kubernetes configuration"
            kubectl apply -f kubernetes/yaml/
            ;;
        C|c)
            printf "\n${YELLOW}Current environment configurations:\n\n"
            cat kubernetes/environment.yaml
            ;;
        E|e)
            echo "Exiting..."
            break
            ;;
        *)
            echo -e "${RED}Invalid choice. Please try again.${NC}"
            ;;
    esac
done