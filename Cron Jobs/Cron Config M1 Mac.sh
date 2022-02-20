# to reset, use
echo -n "" | crontab -

# prevent mail alerts https://www.cyberciti.biz/faq/disable-the-mail-alert-by-crontab-command/
# (crontab -l && echo "MAILTO=''") | crontab -
# if line above is disabled, a log of cronjobs can be accesssed via `mail`

# every half hour
(crontab -l && echo "*/30 * * * * '/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Cron Jobs/30-min.sh'") | crontab -

# daily at 3:00 (sleep timer)
(crontab -l && echo "0 3 * * * osascript '/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Cron Jobs/sleep-timer.applescript'") | crontab -
# daily at 6:05
(crontab -l && echo "5 6 * * * osascript '/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Cron Jobs/daily-morning.applescript'") | crontab -

# triweekly every Monday, Wednesday & Saturday at 6:05
(crontab -l && echo "5 6 * * 1,3,6 osascript '/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Cron Jobs/triweekly.applescript'") | crontab -
# every week
(crontab -l && echo "0 5 * * 3 '/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Cron Jobs/weekly.sh'") | crontab -

# first sunday of month at 5:00 (weekday check in file)
(crontab -l && echo "0 5 1-7 * * '/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Cron Jobs/first-sunday-of-month.sh'") | crontab -

# check the current cronjobs
crontab -l

# to edit crontabs with the EDITOR set in zshrc (won't work with subl)
# crontab -e

