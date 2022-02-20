#!/usr/bin/env python3

import sqlite3
import sys
import time
import json
import re
import unicodedata as ud
from contextlib import closing
from os.path import expanduser
import os

# tags not to display in search
tagToExclude = os.getenv('tagToExcludeFromSearch')


def searchDraft(strSearch):
	strPathDB = expanduser("~") + "/Library/Group Containers/GTFQ98J4YG.com.agiletortoise.Drafts/DraftStore.sqlite"

	with closing(sqlite3.connect(strPathDB)) as connection:
		with closing(connection.cursor()) as cursor:
			rows = cursor.execute(("select ZUUID, ZCONTENT, ZCREATED_AT, ZCHANGED_AT, ZCACHED_TAGS, ZFOLDER, ZFLAGGED from main.ZMANAGEDDRAFT where ZCONTENT like '%{}%' and ZFOLDER = 0 and ZCACHED_TAGS != 'ZZZ" + tagToExclude + "ZZZ';").format(strSearch)).fetchall()
			return rows

# draft ZFOLDER codes: Inbox = 0, Archive = 1, Trash = 10000
# the condition at the end of line "rows = cursor.execute" filters for drafts in the Inbox not being a tasklist.
# draft ZFLAGGED codes: unflagged = 0, flagged = 1

strArg = ' '.join(sys.argv[1:])
# Normalise any decomposed UTF-8 text from Alfred to composed UTF-8 test to use with SQLite
strArg = ud.normalize('NFC',strArg)

intSQLLiteEpoch = 978307200
draftMatch = searchDraft(strArg)
arrItems = []
for x in draftMatch:
	objItem = {}

	# flagged status
	draftFlagged = x[6]
	if draftFlagged == 1:
		draftFlagged = "🟠 "
	else:
		draftFlagged = ""

	# remove markdown from title for readability
	draftTitle = x[1].partition('\n')[0]
	draftTitle = re.sub ('(^#* |\*\*|^- )','',draftTitle, 0)

	# title
	objItem['title'] = draftFlagged + draftTitle

	# edit the ZCACHED_TAGS for readability
	draftTags = x[4].replace("ZZZ ZZZ",", ")
	draftTags = draftTags[3:-3]
	if len(draftTags) != 0: draftTags = " ◼︎ " + draftTags

	# subtitle construction
	# use "%e. %b %Y %H:%M" for date and time
	objItem['subtitle'] = time.strftime('%e. %b %Y', time.localtime(x[3] + intSQLLiteEpoch)) + draftTags

	# UUID
	objItem['arg'] = x[0]
	objItem['uid'] = x[0]
	arrItems.append(objItem)

# new draft option
newdraft = {}
newdraft['title'] = "new Draft with title: '" + strArg + "'"
newdraft['arg'] = strArg
newdraft['icon'] = { "path": "new draft.png" }
newdraft['uid'] = 'newdraft'
arrItems.append(newdraft)

objOutput = { "items" : arrItems }
sys.stdout.write(json.dumps(objOutput))
