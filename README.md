# Triforce Profile Switcher
This is a bash script to swap save files for different user profiles for the OOT Remake recompiled with [Triforce](https://triforceproject.com).

I created it because I have multiple users sharing the same computer and Triforce does not (at the time of creating this script) have a built in way to swap between users save files or different profiles.

The script is very basic and could easily be modified to work with different applications.

## What It Does
1. It creates a backup of the current save folder before it does anything. If a backup of a previous launch exists, it will remove it so it can create a new one.
2. It deletes the current Triforce save directory (the one it just made a backup of) to allow Triforce to use the desired save files instead.
3. A symbolic link is created from the designated user profile to the save directory for Triforce.
4. Triforce is launched.

## How To Use
1. Download the user.sh file.
2. Edit the user.sh file with your favorite text editor
3. In the user.sh file, change the PROFILE_SAVE= variable to the absolute path of the desired save file directory.
