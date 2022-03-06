@ECHO OFF
ECHO NoteManageR: an R script to manage (create/edit/read) plain-text notes.
:yes
Rscript NoteManageR.R
SET /p input=Do you want to run the script again? (y/n): 
IF /I "%input%"=="y" GOTO yes
GOTO no
:no