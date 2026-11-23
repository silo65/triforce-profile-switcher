#!/usr/bin/env bash

### Variables ###
### Profile save file location ###
# CHANGE THE VALUE AFTER 'PROFILE_SAVE=' TO THE ABSOLUTE PATH OF THE SAVE FOLDER YOU WANT TO USE IN
# TRIFORCE. IT NEEDS TO BE NAMED 'user' IN ORDER FOR THIS SCRIPT TO WORK
 PROFILE_SAVE="/home/deck/Triforce Legend of Zelda Ocarina of Time Saves/{USER_NAME}/user"

### Triforce save file location ###
# CHANGE THE VALUE AFTER 'TRIFORCE_SAVE=' TO THE ABSOLUTE PATH OF THE TRIFORCE SAVE FOLDER LOCATION.
# YOU MOST LIKELY ONLY NEED TO CHANGE 'deck' TO THE NAME OF YOUR USER ACCOUNT, AS TRIFORCE ON LINUX
# DEFAULTS THE SAVE FILES TO /home/{user}/.local/share/triforce/
 TRIFORCE_SAVE="/home/deck/.local/share/triforce/"

### Triforce program location ###
# CHANGE THE VALUE AFTER 'OOT' TO THE ABSOLUTE PATH OF THE TRIFORCE PROGRAM.
# I SET IT UP TO LAUCH THE GAME DIRECTLY, WHICH FOR ME WAS:
# /home/deck/Games/Triforce/bin/triforce
# IF YOU WANT IT TO OPEN THE LAUNCHER INSTEAD, YOU CAN POINT IT TO THAT FILE AND THE SCRIPT WILL
# STILL WORK THE SAME.
 OOT=/home/deck/Games/Triforce/bin/triforce

#################################################################
#                                                               #
# SCRIPT BELOW! DO NOT EDIT UNLESS YOU KNOW WHAT YOU ARE DOING! #
#                                                               #
#################################################################

# Create a backup of the current saves
 if [ -d "$TRIFORCE_SAVE/user_backup" ]; then # Searches for old backup direcotry
   rm "$TRIFORCE_SAVE/user_backup" -rf # Removes old backup directory if it was found
 fi

 if [ -d "$TRIFORCE_SAVE/user" ]; then # Searches for current save directory
   if [[ -L "$TRIFORCE_SAVE/user" ]]; then # Checks if that directory is a link or an actual directory
     cp -fr --remove-destination "$(readlink $TRIFORCE_SAVE/user)" $TRIFORCE_SAVE/user_backup # Creates a backup if a link
     rm "$TRIFORCE_SAVE/user" -rf # Removes current save directory so we can move the desired saves in
   else
     cp -fr $TRIFORCE_SAVE/user $TRIFORCE_SAVE/user_backup # Creates a backup if not a link
     rm "$TRIFORCE_SAVE/user" -rf
   fi
 fi

# Create a symbolic link for the profile save to the trifoce location
 ln -s "$PROFILE_SAVE" "$TRIFORCE_SAVE"

# Launch the program
$OOT
