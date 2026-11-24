# Triforce Profile Switcher
#### As of version 0.7.1, Triforce now has save slots. v0.7.1 has 3 save slots available. I still need more save slots for my use case, so I updated this script to work with the new version as well as made the script a bit cleaner and easier to use.

This is a bash script to swap save files for different user profiles for the OOT Remake recompiled with [Triforce](https://triforceproject.com).

## What It Does
1. If Triforce save folders already exist, it creates a backups of them before it does anything. If a backups of a previous launch exists, it will remove them so it can create new ones.
2. It deletes the current Triforce save directories (the ones it just made backups of) to allow Triforce to use the desired save files instead.
3. Symbolic links are created from the designated user profile to the save directory for Triforce.
4. Triforce is launched.

## How To Use
### Prepare Your Computer

1.  In your home directory, create a new directory called "Triforce Legend of Zelda Ocarina of Time Saves"
2.  Inside that directory, crate any profile directories you want. I created all 4 users in my house their own.
3.  Copy your current save(s) (most likely located at /home/{username}/.local/share/triforce/) user, user-2, and user-3 directories to the new /home/{user}/Triforce Legend of Zelda Ocarina of Time Saves/{profile}/ directory.
    a. If user-2 and user-3 do not exist in your ~/.local/share/triforce/ directory, create new empty directories inside the profile directory for them.
5. Create any additional profile folders you want. Inside the additional profiles, create a empty folders named 'user', 'user-2', and 'user-3' if that profile does not already have saves you want to copy to it. My folder structure looks like this:

<details>
  <summary>My profile saves directory tree</summary>

``` bash
/home/deck/Triforce Legend of Zelda Ocarina of Time Saves
├── Launchers
│   ├── triforce_dad.sh
│   ├── triforce_ivory.sh
│   ├── triforce_leander.sh
│   ├── triforce_mom.sh
├── profile1
│   ├── triforce_achievements.txt
│   ├── user
│   │   ├── prompts_auto.txt
│   │   ├── save
│   │   │   └── 5a3c9e1f0b7d24680000000000000001
│   │   │       ├── account.sav
│   │   │       ├── option.sav
│   │   │       ├── slot_00
│   │   │       │   ├── caption.sav
│   │   │       │   └── progress.sav
│   │   │       ├── slot_01
│   │   │       │   ├── caption.sav
│   │   │       │   └── progress.sav
│   │   │       ├── slot_02
│   │   │       │   ├── caption.sav
│   │   │       │   └── progress.sav
│   │   │       ├── slot_03
│   │   │       │   ├── caption.sav
│   │   │       │   └── progress.sav
│   │   │       ├── slot_04
│   │   │       │   ├── caption.sav
│   │   │       │   └── progress.sav
│   │   │       └── slot_05
│   │   │           ├── caption.sav
│   │   │           └── progress.sav
│   │   ├── save-backup
│   │   │   └── 5a3c9e1f0b7d24680000000000000001
│   │   │       └── 20261124-113639
│   │   │           ├── account.sav
│   │   │           ├── option.sav
│   │   │           ├── slot_00
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_01
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_02
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_03
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_04
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           └── slot_05
│   │   │               ├── caption.sav
│   │   │               └── progress.sav
│   │   ├── save.lock
│   │   ├── save-tx
│   │   │   └── 5a3c9e1f0b7d24680000000000000001
│   │   │       └── work
│   │   │           ├── account.sav
│   │   │           ├── option.sav
│   │   │           ├── slot_00
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_01
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_02
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_03
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_04
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           └── slot_05
│   │   │               ├── caption.sav
│   │   │               └── progress.sav
│   │   ├── temp
│   │   └── triforce_card.txt
│   ├── user-2
│   │   ├── prompts_auto.txt
│   │   ├── save
│   │   │   └── 5a3c9e1f0b7d24680000000000000001
│   │   │       ├── account.sav
│   │   │       ├── option.sav
│   │   │       ├── slot_00
│   │   │       │   ├── caption.sav
│   │   │       │   └── progress.sav
│   │   │       ├── slot_01
│   │   │       │   ├── caption.sav
│   │   │       │   └── progress.sav
│   │   │       ├── slot_02
│   │   │       │   ├── caption.sav
│   │   │       │   └── progress.sav
│   │   │       └── slot_03
│   │   │           ├── caption.sav
│   │   │           └── progress.sav
│   │   ├── save-backup
│   │   │   └── 5a3c9e1f0b7d24680000000000000001
│   │   │       ├── 20261124-103755
│   │   │       │   └── option.sav
│   │   │       ├── 20261124-104321
│   │   │       │   ├── account.sav
│   │   │       │   └── option.sav
│   │   │       └── 20261124-110159
│   │   │           ├── account.sav
│   │   │           ├── option.sav
│   │   │           ├── slot_00
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           └── slot_01
│   │   │               ├── caption.sav
│   │   │               └── progress.sav
│   │   ├── save.lock
│   │   ├── save-tx
│   │   │   └── 5a3c9e1f0b7d24680000000000000001
│   │   │       └── work
│   │   │           ├── account.sav
│   │   │           ├── option.sav
│   │   │           ├── slot_00
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_01
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_02
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           └── slot_03
│   │   │               ├── caption.sav
│   │   │               └── progress.sav
│   │   ├── temp
│   │   ├── triforce_achievements.txt
│   │   └── triforce_card.txt
│   └── user-3
├── profile2
│   ├── user
│   │   ├── save
│   │   │   └── 5a3c9e1f0b7d24680000000000000001
│   │   ├── save.lock
│   │   ├── save-tx
│   │   │   └── 5a3c9e1f0b7d24680000000000000001
│   │   │       └── work
│   │   └── temp
│   ├── user-2
│   └── user-3
├── profile3
│   ├── user
│   │   ├── prompts_auto.txt
│   │   ├── save
│   │   │   └── 5a3c9e1f0b7d24680000000000000001
│   │   │       ├── account.sav
│   │   │       ├── option.sav
│   │   │       ├── slot_00
│   │   │       │   ├── caption.sav
│   │   │       │   └── progress.sav
│   │   │       ├── slot_01
│   │   │       │   ├── caption.sav
│   │   │       │   └── progress.sav
│   │   │       ├── slot_02
│   │   │       │   ├── caption.sav
│   │   │       │   └── progress.sav
│   │   │       ├── slot_03
│   │   │       │   ├── caption.sav
│   │   │       │   └── progress.sav
│   │   │       └── slot_04
│   │   │           ├── caption.sav
│   │   │           └── progress.sav
│   │   ├── save-backup
│   │   │   └── 5a3c9e1f0b7d24680000000000000001
│   │   │       └── 20261122-201535
│   │   │           ├── account.sav
│   │   │           ├── option.sav
│   │   │           ├── slot_00
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_01
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_02
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_03
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           └── slot_04
│   │   │               ├── caption.sav
│   │   │               └── progress.sav
│   │   ├── save.lock
│   │   ├── save-tx
│   │   │   └── 5a3c9e1f0b7d24680000000000000001
│   │   │       └── work
│   │   │           ├── account.sav
│   │   │           ├── option.sav
│   │   │           ├── slot_00
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_01
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_02
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           ├── slot_03
│   │   │           │   ├── caption.sav
│   │   │           │   └── progress.sav
│   │   │           └── slot_04
│   │   │               ├── caption.sav
│   │   │               └── progress.sav
│   │   └── temp
│   ├── user-2
│   └── user-3
└── profile4
    ├── user
    ├── user-2
    └── user-3
```
</details>

### Setup Triforce Profile Switcher

1. Download the triforce_USERNAME.sh file.
2. Edit the triforce_USERNAME.sh file with your favorite text editor.
3. Change the PROFILE= variable to the same name you gave your profile directory. This value must match the name of that directory. IE:
   /home/{user}/Triforce Legend of Zelda Ocarina of Time Saves/Bob
   would have the variable be PROFILE="Bob"
4. If you want the game to launch directly, leave the RUN= variable alone, if you want the launcher to open instead, comment out the RUN="/bin/triforce" line and uncomment RUN="/triforce"
5. If the save files Triforce uses, not your profile saves, are not in the default /home/{user}/.local/share/triforce location, then change the TRIFORCE_SAVE= variable to the absolute path of the Triforce save folder location (NOTE THIS DOES NOT POINT TO THE ACTUAL 'user' DIRECTORY INSIDE THE 'triforce' DIRECTORY). Otherwise, leave this variable alone.
6. Change the OOT= variable to the absolute path of the directory you built Triforce to. It is set up to the default location Triforce builds to, which is /home/{user}/Games/Triforce. If you did not change the default when you built your game, you should not need to change this variable.
7. Save the file and exit the text editor.
8. Rename the script to whatever you want and make sure it is executable.
9. You can now copy the script and rename it for multiple profiles, you just need to change the "PROFILE=" variable now to the name of each new profile.

### Running the script
You can now either add the script(s) to Steam (right click menu 'Add to Steam' will not work, but it will work through the normal Steam window) or you can just run the script where it sits.

I added my 4 scripts to Steam, renamed them all to "{PROFILE} - The Legend of Zelda - Ocarina of Time (Triforce)" then used Steam Grid DB to change the artwork for all of the profiles so it looks nice in my Library.

#### Enjoy!!
