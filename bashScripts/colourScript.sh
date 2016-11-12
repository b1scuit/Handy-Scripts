#!/bin/sh

# Define variables
txtund=$(tput sgr 0 1)    # Underline
txtbld=$(tput bold)       # Bold
txtred=$(tput setaf 1)    # Red
txtgrn=$(tput setaf 2)    # Green
txtylw=$(tput setaf 3)    # Yellow
txtblu=$(tput setaf 4)    # Blue
txtpur=$(tput setaf 5)    # Purple
txtcyn=$(tput setaf 6)    # Cyan
txtwht=$(tput setaf 7)    # White
txtrst=$(tput sgr0)      # Text reset

# Use them as
echo "${txtbld}This is bold text output from shell script${txtrst}\n"
echo "${txtred}This is coloured red except\n${txtblu}This is blue${txtrst}"

## reset the terminal
echo "${txtrst} \n"
