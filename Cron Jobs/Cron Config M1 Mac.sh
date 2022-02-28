#!/bin/zsh

# prevent mail alerts https://www.cyberciti.biz/faq/disable-the-mail-alert-by-crontab-command/
# (crontab -l && echo "MAILTO=''") | crontab -
# if line above is disabled, a log of cronjobs can be accesssed via `mail`
# mails can be deleted by removing `/private/var/mail/chrisgrieser`

CRON_JOB_FOLDER=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Cron Jobs"

echo -n "" | crontab - # to reset
function add-cronjob () {
	(crontab -l && echo "$1 \"$CRON_JOB_FOLDER/$2\"") | crontab -
}

add-cronjob "*/30 * * * *" '30-min_[Browser].sh'
add-cronjob "0 3 * * *" sleep-timer.applescript
add-cronjob "5 6 * * *" 'daily-morning_[Browser].applescript'
add-cronjob "5 6 * * 1,4" biweekly.applescript
add-cronjob "0 5 * * 3" weekly.sh
add-cronjob "0 5 1-7 * *" first-sunday-of-month.sh

crontab -l # check the current cronjobs
