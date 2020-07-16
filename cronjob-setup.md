To set up a cron job, type '**cronjob -e**' in the terminal.

When the vi file pops open, type '**i**' to enter a script for scheduling.

Example: **00 00 01 01 * ./test-script.sh**
Template : MIN HOUR DOM MON DOW CMD

The description of numbers are below : 
```
Field    Description    Allowed Value
MIN      Minute field    0 to 59
HOUR     Hour field      0 to 23
DOM      Day of Month    1-31
MON      Month field     1-12
DOW      Day Of Week     0-6
CMD      Command         Any command to be executed. 
```

Finally, click '**Esc**', then type '**:wq**' to write and exit vi mode.

The cronjob should be set up, viewable from typing '**cronjob -l**' in the terminal.
 
