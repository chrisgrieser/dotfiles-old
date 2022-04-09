#!/usr/bin/env osascript -l JavaScript

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat

function run (argv) {
	ObjC.import("stdlib");
	const app = Application.currentApplication();
	app.includeStandardAdditions = true;

	function onlineJSON (url) {
		return JSON.parse (app.doShellScript('curl -s "' + url + '"'));
	}

	function setAlfredEnv (envVar, newValue) {
		Application("com.runningwithcrayons.Alfred")
			.setConfiguration(envVar, {
				toValue: newValue,
				inWorkflow: $.getenv("alfred_workflow_bundleid"),
				exportable: false
			});
	}

	const dateFormatOption = { year: "numeric", month: "short", day: "2-digit" };
	const language = $.getenv("lang");
	const resultInBrackets = $.getenv("in_brackets") === "true";

	const dateInput = argv.join("");
	const nextWeek = new Date();
	let weekCounter;
	let startDateISO;

	// MAIN
	// ------------------------

	// date input → set startdate + reset week counter
	if (dateInput) {
		setAlfredEnv ("startdate", dateInput);
		weekCounter = 0;
		startDateISO = dateInput;
	}

	else {
		weekCounter = parseInt($.getenv("week_counter"));
		weekCounter++; // count one more week
		startDateISO = $.getenv("startdate");
	}
	setAlfredEnv ("week_counter", weekCounter.toString()); // set week counter for next run

	// calculate new date
	const startDate = new Date(startDateISO); // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/parse
	nextWeek.setDate = startDate.getDate() + (7*weekCounter);
	let output = nextWeek.toLocaleDateString(language, dateFormatOption);

	// consider state-specific German holidays
	const bundesland = $.getenv("bundesland_feiertage");
	if (bundesland) {
		const url =
			"https://feiertage-api.de/api/?jahr="
			+ nextWeek.getFullYear()
			+ "&nur_land="
			+ bundesland;
		const feiertageJSON = onlineJSON(url);
		const feiertage = Object.keys(feiertageJSON).map (function (tag) {
			const isoDate = feiertageJSON[tag].datum;
			const desc = tag + " " + feiertageJSON[tag].hinweis;
			return [isoDate, desc];
		});

		const nextWeekISO = nextWeek.toISOString().slice(0, 10);
		feiertage.forEach(feiertag => {
			const feiertagISODate = feiertag[0];
			const desc = feiertag[1];
			if (feiertagISODate === nextWeekISO) output += " " + desc;
		});
	}

	if (resultInBrackets) return "(" + output + ")";
	return output;
}

