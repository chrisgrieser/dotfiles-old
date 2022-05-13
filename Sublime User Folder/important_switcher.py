import sublime_plugin
# import re


class ImportantSwitcher(sublime_plugin.TextCommand):  # pylint: disable=too-few-public-methods
	def run(self, edit):
		for region in self.view.sel():  # for every selection (region = range in Sublime)
			line = self.view.line(region.begin())  # get line that contains the beginning of the region
			line_content = self.view.substr(line)  # get content of line

			line_content = line_content.sub()  # placeholder; do line manipulation

			self.view.replace(edit, line, line_content)  # replace line with new contentbla