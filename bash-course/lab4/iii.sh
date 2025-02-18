#!/bin/bash

crontab -l > schedule
echo "*/1 * * * 6 $HOME/lab4/i.sh" >> schedule
crontab schedule

rm schedule

# field          allowed values
#
# -----         --------------
#
# minute        0-59
#
# hour          0-23
#
# day of month  1-31
#
# month         1-12 (or names, see below)
#
# day of week   0-7 (0 or 7 is Sun, or use names)
