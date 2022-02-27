module.exports = {
	defaultBrowser: "Vivaldi",
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
			match: /discord(app)?\.com\/channel/i,
			url: ({ url }) => ({
				...url,
				protocol: "discord"
			}),
			browser: "com.hnc.Discord"
		},
		{
			match: /zoom\.us\/j/i,
			browser: "us.zoom.xos"
		},
		{
			match: ({ url }) => url.host.endsWith("hvgruender.de"),
			browser: "com.apple.Safari"
		}
	]
}
