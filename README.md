
## What is this?
Shell scripts to help with re-texturing **Minecraft** mods, **Minetest** games or similarly structured projects where there are lots of individual sprites stored across lots of folders.

## What does it do?
- **`stitch.sh`** combines all 16x16 PNGs from given directory in one file called `atlas.png`.
- User edits `atlas.png` with Aseprite or whatever.
- **`unstitch.sh`** cuts `atlas.png` back into multiple files.

`ext.sh` *is needed by* `stitch.sh` *to remove PNGs with resolution different from 16x16.*

## Warning
As with any programs (and especially Shell scripts), be cautious when running them on your system. When testing these scripts I managed to delete everything but PNGs on the disk, and while currently they work as intended (on my system), there are always edge cases or untested configurations. Have backups and don't run this as root. **I'm not responsible for any lost files.**

## Target system and Requirements
These scripts were created and tested on **Linux** but not on Windows.
These scripts need GraphicsMagick to be installed:
- Debian: `sudo apt install graphicsmagick`
- Arch: `sudo pacman -S graphicsmagick`

## Why reinvent the wheel?
I couldn't find the right tool for the job. There were at least 20 one-way converters but no both ways.

## To-Do
The scripts are sub-optimal and any improvements are welcomed.
- At least more comments because Shell scripts get very difficult to read after a month.
- Basic refactoring.
- Throw exceptions on file or folder names with spaces.
- Integration of `ext.sh` in `stitch.sh` (line 24 in latter). It should be extremely simple but I can't do it.

Final goal would be complete freedom in texture proportions and sizes, but that's way out of my expertise at the moment.


## Credits
- [**StackOverflow**](https://stackoverflow.com/) — All the code
- [**TEMHOTAOKEAHA**](https://github.com/temhotaokeaha) — Pressing Ctrl+C and Ctrl+V on the keyboard
