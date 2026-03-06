# Mouse Follow Window Focus
Makes the mouse cursor follow window focus, but ONLY if the focus change wasn't caused by the mouse - e.g. Alt-Tab, Win+<Number>, hotkeys, etc. Saves a lot of mousing around on multi-monitor setups! 

Modified from [bladeSk's implementation](https://gist.githubusercontent.com/bladeSk/9feeeb6c2ba9939faa3c88cc9133700c/raw/cabc86477ca9bc23856cf84146ecc55eda74ff32/mouse%2520cursor%2520follows%2520focus.ahk) to simplify, update to AutoHotKey v2, and support for the autohide taskbar setting.

## Installation

Compile using [ahk2exe](https://www.autohotkey.com/).

To run automatically go to: 
1. Task Scheduler -> Action -> Create Task
2. Input the Location and Name of the script
3. Run with highest privileges -> On (if you want the mouse follow window focus to also work for windows run as administrator.)
4. Trigger -> New... -> On Workstation Unlock
5. Settings -> Stop the task if runs for longer than. -> Off
6. Ok
