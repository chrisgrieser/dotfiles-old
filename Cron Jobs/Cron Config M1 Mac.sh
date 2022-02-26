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

add-cronjob "*/30 * * * *" "30-min.sh"

(crontab -l && echo "*/30 * * * * \"$CRON_JOB_FOLDER/30-min.sh\"") | crontab -
(crontab -l && echo "0 3 * * * \"$CRON_JOB_FOLDER/sleep-timer.applescript\"") | crontab -
(crontab -l && echo "5 6 * * * \"$CRON_JOB_FOLDER/daily-morning_[Browser].applescript\"") | crontab -
(crontab -l && echo "5 6 * * 1,3,6 \"$CRON_JOB_FOLDER/triweekly.applescript\"") | crontab -
(crontab -l && echo "0 5 * * 3 \"$CRON_JOB_FOLDER/weekly.sh\"") | crontab -
(crontab -l && echo "0 5 1-7 * * \"$CRON_JOB_FOLDER/first-sunday-of-month.sh\"") | crontab -

crontab -l # check the current cronjobs
