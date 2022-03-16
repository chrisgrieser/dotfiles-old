// https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
	defaultBrowser: "Brave Browser",
	options: {
		checkForUpdate: true,
		hideIcon: false,
	},

	rewrite: [
		{
			match: ({ url }) => url.host.endsWith("wikipedia.org"),
			url: ( { urlString } ) => urlString.replace (/https?:\/\/(\w+)\.wikipedia\.org\/wiki\/(.*)/, "https://www.wikiwand.com/$1/$2"),
		},
	],

	handlers: [
		{
			match: /discord(app)?\.com\/channel/,
			url: ({ url }) => ({
				...url,
				protocol: "discord"
			}),
			browser: "com.hnc.Discord"
		},
		{
			match: /zoom\.us\/j/,
			browser: "us.zoom.xos"
		},
		// not workign yet: https://github.com/johnste/finicky/issues/252
		{
			match: ({ url, opener }) =>
				url.host.endsWith("github.com") && opener.bundleId === "com.mimestream.Mimestream",
			browser: {
				name: "Brave Browser",
				openInBackground: true // Force opening the link in the background
			}
		},
		{
			match: ({ url }) => url.host.endsWith("hvgruender.de"),
			browser: "com.apple.Safari"
		}
	]
}
