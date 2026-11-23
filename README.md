# Triforce Profile Switcher
This is a bash script to swap save files for different user profiles for the OOT Remake recompiled with [Triforce](https://triforceproject.com).

I created it because I have multiple users sharing the same computer and Triforce does not (at the time of creating this script) have a built in way to swap between users save files or different profiles.

The script is very basic and could easily be modified to work with different applications.

## What It Does
1. If a Triforce save folder already exists, it creates a backup of the current save folder before it does anything. If a backup of a previous launch exists, it will remove it so it can create a new one.
2. It deletes the current Triforce save directory (the one it just made a backup of) to allow Triforce to use the desired save files instead.
3. A symbolic link is created from the designated user profile to the save directory for Triforce.
4. Triforce is launched.

## How To Use
### Prepare Your Computer

1. Copy your current save (most likely located at /home/{username}/.local/share/triforce/user) user directory to a location of your choosing. I copied mine to /home/deck/Triforce Legend of Zelda Ocarina of Time Saves/{PROFILE_NAME}/user
2. Create any additional profile folders you want. Inside the additional profiles, create an empty folder named 'user' if that profile does not already have saves you want to copy to it. To keep things tidy in my home directory, my folder structure looks like this:

<details>
  <summary>My profile saves directory tree</summary>

``` bash
/home/deck/Triforce Legend of Zelda Ocarina of Time Saves
├── Launchers
│   ├── triforce_profileone.sh
│   ├── triforce_profiletwo.sh
│   ├── triforce_profilethree.sh
│   ├── triforce_profilefour.sh
├── {PROFILE_ONE}
│   └── user
│       ├── prompts_auto.txt
│       ├── save
│       │   └── 5a3c9e1f0b7d24680000000000000001
│       │       ├── account.sav
│       │       ├── option.sav
│       │       ├── slot_00
│       │       │   ├── caption.sav
│       │       │   └── progress.sav
│       │       ├── slot_01
│       │       │   ├── caption.sav
│       │       │   └── progress.sav
│       │       ├── slot_02
│       │       │   ├── caption.sav
│       │       │   └── progress.sav
│       │       ├── slot_03
│       │       │   ├── caption.sav
│       │       │   └── progress.sav
│       │       ├── slot_04
│       │       │   ├── caption.sav
│       │       │   └── progress.sav
│       │       └── slot_05
│       │           ├── caption.sav
│       │           └── progress.sav
│       ├── save-backup
│       │   └── 5a3c9e1f0b7d24680000000000000001
│       │       ├── 20261122-042209
│       │       │   ├── account.sav
│       │       │   ├── option.sav
│       │       │   ├── slot_00
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_01
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_02
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_03
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_04
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   └── slot_05
│       │       │       ├── caption.sav
│       │       │       └── progress.sav
│       │       ├── 20261122-042717
│       │       │   ├── account.sav
│       │       │   ├── option.sav
│       │       │   ├── slot_00
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_01
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_02
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_03
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_04
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   └── slot_05
│       │       │       ├── caption.sav
│       │       │       └── progress.sav
│       │       ├── 20261122-043230
│       │       │   ├── account.sav
│       │       │   ├── option.sav
│       │       │   ├── slot_00
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_01
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_02
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_03
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_04
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   └── slot_05
│       │       │       ├── caption.sav
│       │       │       └── progress.sav
│       │       ├── 20261122-121851
│       │       │   ├── account.sav
│       │       │   ├── option.sav
│       │       │   ├── slot_00
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_01
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_02
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_03
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_04
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   └── slot_05
│       │       │       ├── caption.sav
│       │       │       └── progress.sav
│       │       └── 20261122-122437
│       │           ├── account.sav
│       │           ├── option.sav
│       │           ├── slot_00
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_01
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_02
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_03
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_04
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           └── slot_05
│       │               ├── caption.sav
│       │               └── progress.sav
│       ├── save.lock
│       ├── save-tx
│       │   └── 5a3c9e1f0b7d24680000000000000001
│       │       └── work
│       │           ├── account.sav
│       │           ├── option.sav
│       │           ├── slot_00
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_01
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_02
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_03
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_04
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           └── slot_05
│       │               ├── caption.sav
│       │               └── progress.sav
│       └── temp
├── {PROFILE_TWO}
│   └── user
├── {PROFILE_THREE}
│   └── user
│       ├── prompts_auto.txt
│       ├── save
│       │   └── 5a3c9e1f0b7d24680000000000000001
│       │       ├── account.sav
│       │       ├── option.sav
│       │       ├── slot_00
│       │       │   ├── caption.sav
│       │       │   └── progress.sav
│       │       ├── slot_01
│       │       │   ├── caption.sav
│       │       │   └── progress.sav
│       │       ├── slot_02
│       │       │   ├── caption.sav
│       │       │   └── progress.sav
│       │       ├── slot_03
│       │       │   ├── caption.sav
│       │       │   └── progress.sav
│       │       └── slot_04
│       │           ├── caption.sav
│       │           └── progress.sav
│       ├── save-backup
│       │   └── 5a3c9e1f0b7d24680000000000000001
│       │       ├── 20261122-143405
│       │       │   ├── account.sav
│       │       │   ├── option.sav
│       │       │   ├── slot_00
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   └── slot_01
│       │       │       ├── caption.sav
│       │       │       └── progress.sav
│       │       ├── 20261122-144003
│       │       │   ├── account.sav
│       │       │   ├── option.sav
│       │       │   ├── slot_00
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   └── slot_01
│       │       │       ├── caption.sav
│       │       │       └── progress.sav
│       │       ├── 20261122-144506
│       │       │   ├── account.sav
│       │       │   ├── option.sav
│       │       │   ├── slot_00
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_01
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_02
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   └── slot_03
│       │       │       ├── caption.sav
│       │       │       └── progress.sav
│       │       ├── 20261122-145051
│       │       │   ├── account.sav
│       │       │   ├── option.sav
│       │       │   ├── slot_00
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_01
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_02
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   ├── slot_03
│       │       │   │   ├── caption.sav
│       │       │   │   └── progress.sav
│       │       │   └── slot_04
│       │       │       ├── caption.sav
│       │       │       └── progress.sav
│       │       └── 20261122-145145
│       │           ├── account.sav
│       │           ├── option.sav
│       │           ├── slot_00
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_01
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_02
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_03
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           └── slot_04
│       │               ├── caption.sav
│       │               └── progress.sav
│       ├── save.lock
│       ├── save-tx
│       │   └── 5a3c9e1f0b7d24680000000000000001
│       │       └── work
│       │           ├── account.sav
│       │           ├── option.sav
│       │           ├── slot_00
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_01
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_02
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           ├── slot_03
│       │           │   ├── caption.sav
│       │           │   └── progress.sav
│       │           └── slot_04
│       │               ├── caption.sav
│       │               └── progress.sav
│       └── temp
└── {PROFILE_FOUR}
    └── user
```
</details>

### Setup Triforce Profile Switcher

1. Download the triforce_USERNAME.sh file.
2. Edit the triforce_USERNAME.sh file with your favorite text editor.
3. Change the PROFILE_SAVE= variable to the absolute path of the desired save file directory. This should be the directory you copied your save file to earlier. For me it was:
/home/deck/Triforce Legend of Zelda Ocarina of Time Saves/{USER_NAME}/user
4. Change the TRIFORCE_SAVE= variable to the absolute path of the Triforce save folder location (NOTE THIS DOES NOT POINT TO THE ACTUAL 'user' DIRECTORY INSIDE THE 'triforce' DIRECTORY). This is most likely located at:
/home/{user}/.local/share/triforce 
5. Change the OOT= variable to the absolute path of either the 'triforce' file inside the {Triforce_Install_Location}/bin/ directory, or the Triforce AppImage file. If you point it to the file inside the bin/ directory, it will skip the Triforce launcher and directly launch the game; conversely, if you point it to the AppImage, it will open the Launcher and you can launch the game from there.
6. Save the file and exit the text editor.
7. Rename the script to whatever you want and make sure it is executable.
8. You can now copy the script and rename it for multiple profiles, you just need to change the 'PROFILE_SAVE=" variable now for the save location of the new profile.

### Running the script
You can now either add the script(s) to Steam (right click menu 'Add to Steam' will not work, but it will work through the normal Steam window) or you can just run the script where it sits.

I added my 4 scripts to Steam, renamed them all to "{PROFILE_NAME} - The Legend of Zelda - Ocarina of Time (Triforce)" then used Steam Grid DB to change the artwork for all of the profiles so it looks nice in my Library.

#### I hope this helps until profiles are added to Triforce (if they ever are).
