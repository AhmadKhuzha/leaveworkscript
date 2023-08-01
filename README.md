# Leave Work Script
Leave work script

Just linux script to show you when are going to leave work

It takes the last reboot as the startup time

And it counts 7:30 hours (edit it to suit your case)

I used an alias with "watch -n 0" for a count down

Enjoy.



# Example: 
`I started this laptop at 2023-07-30 10:08 AM, I can leave at 2023-07-30 05:38 PM. Which is in 04:23:21.`



# Install
- Download `leave.sh`
- `chmod +x ./leave.sh`
- `vi ~/.bash_aliases`
- add this to the end of the file: `alias leave='watch -n 0 /home/ahmad/Nextcloud/scripts/leave.sh'`
- Save and close the file. `:wq`
- `source ~/.bash_aliases`
- `leave`


# To exit use 
- `CTRL` + `C`

