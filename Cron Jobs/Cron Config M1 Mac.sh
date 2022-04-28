#!/bin/zsh
CRON_JOB_FOLDER=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Cron Jobs"

# prevent mail alerts https://www.cyberciti.biz/faq/disable-the-mail-alert-by-crontab-command/
# if line above is disabled, a log of cronjobs can be accesssed via `mail`
# mails can be deleted by removing `/private/var/mail/chrisgrieser`
(crontab -l && echo "MAILTO=''") | crontab -

echo -n "" | crontab - # to reset
function add-cronjob () {
	(crontab -l && echo "$1 \"$CRON_JOB_FOLDER/$2\"") | crontab -
}

add-cronjob "*/30 * * * *" '30-min_[Browser-Path].sh'
add-cronjob "0 3 * * *" sleep-timer.applescript
add-cronjob "5 6 * * *" 'daily-morning_[Browser].applescript'
add-cronjob "5 6 * * 1,4" biweekly.applescript
echo ""
crontab -l # check the current cronjobs
