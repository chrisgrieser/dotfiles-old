import re
import sublime_plugin


class ImportantSwitcher(sublime_plugin.TextCommand):  # pylint: disable=too-few-public-methods
	def run(self, edit):
		for region in self.view.sel():  # for every selection (region = range in Sublime)
			line = self.view.line(region.begin())  # get line that contains the beginning of the selection
			line_content = self.view.substr(line)

			if "!important" in line_content:
				line_content = re.sub(r"\s?!important", "", line_content, 1)
			else:
				line_content = re.sub(";?$", " !important;", line_content, 1)

			self.view.replace(edit, line, line_content)
