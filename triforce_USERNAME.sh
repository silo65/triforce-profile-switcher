#!/usr/bin/env bash

## Variables ##
## Name of the profile ##
# CHANGE THE VALUE AFTER 'PROFILE=' TO THE NAME YOU WANT FOR YOUR PROFILE. IT CAN NOT CONTAIN SPACES.
 PROFILE="Dad"

## Launch the Game or the Launcher ##
# IF YOU WANT TO RUN THE GAME, UNCOMMENT RUN="/bin/triforce"
# IF YOU WANT TO RUN THE LAUNCHER, UNCOMMENT RUN="/triforce"
 RUN="/bin/triforce"
 #RUN="/triforce"

## Profile save file location ##
# IF YOU SET UP YOUR FILES IN ACCORDANCE WITH THE README, YOU DO NOT NEED TO CHANGE THE VARIABLE BELOW.
# CHANGE THE VALUE AFTER 'PROFILE_SAVE=' TO THE ABSOLUTE PATH FOR THE PROFILE YOU WANT TO USE IN
# TRIFORCE. IF IT IS INSIDE YOUR HOME DIRECTORY, YOU CAN JUST CHANGE THE VALUE AFTER
# 'PROFILE="/home/$USER/'. I NAMED MY PROFILE FOLDERS THE SAME NAME AS THE PROFILE VARIABLE FOR EASE
# OF USE IN THIS SCRIPT.
 PROFILE_SAVE="/home/$USER/Triforce Legend of Zelda Ocarina of Time Saves/$PROFILE"

## Triforce save file location ##
# THIS VALUE MOST LIKELY DOES NOT NEED TO BE CHANGED, BUT IF FOR SOME REASON YOUR SAVE FILES ARE LOCATED
# SOMEWHERE OTHER THAN THE DEFAULT /home/{user}/.local/triforce/, THEN CHANGE THE VALUE AFTER
# TRIFORCE_SAVE='
 TRIFORCE_SAVE="/home/$USER/.local/share/triforce/"

## Triforce build location ##
# THIS IS THE DIRECTORY YOU BUILT TRIFORCE TO. IT DEFAULTS TO /home/{user}/Games/Triforce
# IF YOU BUILT TRIFORCE TO A DIFFERENT LOCATION, CHANGE THE PATH TO THE CORRECT LOCATION.
 OOT="/home/$USER/Games/Triforce"

#################################################################
#                                                               #
# SCRIPT BELOW! DO NOT EDIT UNLESS YOU KNOW WHAT YOU ARE DOING! #
#                                                               #
#################################################################

# Create a backup of the current saves
 if [ -d "$TRIFORCE_SAVE/saves_backup" ]; then # Searches for old backup direcotry
   rm "$TRIFORCE_SAVE/saves_backup/*" -rf # Removes old backups if found
   # This is needed so a new backup of the current saves can be made
   else
     mkdir "$TRIFORCE_SAVE/saves_backup"
 fi

 # Create the backup of Slot-1
 if [ -d "$TRIFORCE_SAVE/user" ]; then # Searches for current save directory
   if [[ -L "$TRIFORCE_SAVE/user" ]]; then # Checks if that directory is a link or an actual directory
     cp -fr --remove-destination "$(readlink $TRIFORCE_SAVE/user)" "$TRIFORCE_SAVE/saves_backup/user" # Creates a backup if a link
     rm "$TRIFORCE_SAVE/user" -rf # Removes current save directory so we can move the desired saves in
   else
     cp -fr "$TRIFORCE_SAVE/user" "$TRIFORCE_SAVE/saves_backup/user" # Creates a backup if not a link
     rm "$TRIFORCE_SAVE/user" -rf
   fi
 fi

 # Create the backup of Slot-2
 if [ -d "$TRIFORCE_SAVE/user-2" ]; then # Searches for current save directory
   if [[ -L "$TRIFORCE_SAVE/user-2" ]]; then # Checks if that directory is a link or an actual directory
     cp -fr --remove-destination "$(readlink $TRIFORCE_SAVE/user-2)" "$TRIFORCE_SAVE/saves_backup/user-2" # Creates a backup if a link
     rm "$TRIFORCE_SAVE/user-2" -rf # Removes current save directory so we can move the desired saves in
   else
     cp -fr "$TRIFORCE_SAVE/user-2" "$TRIFORCE_SAVE/saves_backup/user-2" # Creates a backup if not a link
     rm "$TRIFORCE_SAVE/user-2" -rf
   fi
 fi

 # Create the backup of Slot-3
 if [ -d "$TRIFORCE_SAVE/user-3" ]; then # Searches for current save directory
   if [[ -L "$TRIFORCE_SAVE/user-3" ]]; then # Checks if that directory is a link or an actual directory
     cp -fr --remove-destination "$(readlink $TRIFORCE_SAVE/user-3)" "$TRIFORCE_SAVE/saves_backup/user-3" # Creates a backup if a link
     rm "$TRIFORCE_SAVE/user-3" -rf # Removes current save directory so we can move the desired saves in
    else
     cp -fr "$TRIFORCE_SAVE/user-3" "$TRIFORCE_SAVE/saves_backup/user-3" # Creates a backup if not a link
     rm "$TRIFORCE_SAVE/user-3" -rf
   fi
 fi


 ## START SAVE SLOT 1 ACHIEVEMENT BACKUP ##

 # Check for old achievements file backup and remove if it exists
 if [ -f "$OOT/triforce_achievements.txt.bak" ]; then
   rm -f "$OOT/triforce_achievements.txt.bak"
 fi


 # Create a file tie the achievements file to a profile and manage it all
 if compgen -G "$OOT/tps_*" > /dev/null; then # Checks if the tps_ file exists
   if [ ! -f "$OOT/tps_$PROFILE" ]; then # Checks if it is not for the desired profile
     # Create a backup of the current achievement file if it's not for the correct profile
     if [[ -L "$OOT/triforce_achievements.txt" ]]; then # Checks if the achievements file is a symbolic link
       cp -f --remove-destination "$(readlink $OOT/triforce_achievements.txt)" "$OOT/triforce_achievements.txt.bak" # Creates backup if a link
       else
         cp -f "$OOT/triforce_achievements.txt" "$OOT/triforce_achievements.txt.bak"
     fi
     rm -f "$OOT/triforce_achievements.txt"
     rm -f "$OOT/tps_"*
     touch "$OOT/tps_$PROFILE"
     ln -s "$PROFILE_SAVE/triforce_achievements.txt" "$OOT/"
   fi
   else
    rm -f "$OOT/triforce_achievements.txt"
    touch "$OOT/tps_$PROFILE"
    ln -s "$PROFILE_SAVE/triforce_achievements.txt" "$OOT/"
 fi

## END SLOT 1 ACHIEVEMENT BACKUP ##


# Create a symbolic link for the profile save to the trifoce location
 ln -s "$PROFILE_SAVE/user" "$TRIFORCE_SAVE"
 ln -s "$PROFILE_SAVE/user-2" "$TRIFORCE_SAVE"
 ln -s "$PROFILE_SAVE/user-3" "$TRIFORCE_SAVE"

# Launch the program
$OOT$RUN
