# NoteManageR


<img src="https://github.com/bishwaruppaul/NoteManageR/blob/main/icon.ico" width="70"> 


An R Script to manage (create/edit/read) offline plain text note files

Inspired by a couple of great blogs by [Derek Sivers](https://sive.rs/plaintext) and [Szymon Krajewski](https://szymonkrajewski.pl/taking-notes-in-plaintext/), I created this R Script for my personal use. Taking notes in plain text is rather simplistic, easy, portable and future-proof; and this script provides a great way to organize and manage the notes. 

Why R? Because I love R and use it for my work regularly, and am mostly familiar with the language.

I have created a Windows Batch Script to accompany the R Script. It provides a click-and-run functionality; and otherwise the R Script would require you to open a terminal and soruce the script file.

Note management is done via tags. When creating the note, you have the option of adding tag(s) to the note, which will come in handy later to search notes using the Script. Timestamps are also added to the notes in DD MonthAbbrv YYYY, HH:MM AM/PM format when a new note is created. 

### Disclaimer

Though the R Script should run in any system (Windows/MacOS/Linux/others) with R installed, the Batch Script (```noteApp.bat```) will only work in Windows. I do not have the knowledge of Shell Scripting. If you can, please contribute Shell Scripts for Mac OS and Linux systems.

### Important

1. Make sure you have R installed in your system.

2. Make sure that R is in your system path ([Instructions for Windows](https://www.hanss.info/sebastian/post/rtools-path/))

### INSTRUCTIONS

First, download/git clone the zip file, and unzip it on your machine at your desired location.

Optional: You can create a shortcut of the batch script (```noteApp.bat```) in your desktop for easy access. If you do so, you can change the icon of the shortcut to the ```icon.ico``` file provided.

**OPEN THE SCRIPT:**

Double-click on the ```noteApp.bat``` file to open (Windows only), and then follow the on-screen instructions. For MacOS/Linux systems, you may be able to run the script by sourcing the R Script (```source("NoteManagerR.R")```), or you can write a Shell Script to accompany the R script.

**SEARCH FOR A NOTE:**

Type 's' to search for a note using search terms, which can be words or numbers. The search will look for the search term in the filenames of the notes, and will return a list with the filenames containing the search term. Go through the list, and then enter the ID of the file to open it in your system text editor, or type 'q' to go back to the main screen.

**CREATE A NOTE:**

Type 'c' to create a new note. The script will display a list of tags present in existing notes for convenience. You will have the option of choose from existing tag(s), create new tag(s), or both. Type 'e' to choose from existing tag(s), and then enter the tag IDs. Type 'n' to create new tag(s), followed by entering the new tag(s). Type 'm' to use a combination of existing and new tag(s), then first enter the ID(s) of the existing tag(s), and then enter the new tag(s). Then, enter the filename for the new note. Following this, the new note file will open in your system text editor. The new note will have the tags (Tags: ...) and timestamp (Created: ...) at the top. Keeping these top two lines intact, write anything you want inside the note, and save the file.

**READ/EDIT A NOTE**

Type 'o' to open an existing note. The script will display a list of tags present in existing notes. After you enter the ID of one of the tags, a list of notes with the tag present will be displayed. To open a note from the list, enter the ID of the note, which will open the file in your system text editor. You can read/edit the file. If editing, keep the top two lines intact and save the file at the end.

Enjoy!
