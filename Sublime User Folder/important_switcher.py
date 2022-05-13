import re
import sublime_plugin


class ImportantSwitcher(sublime_plugin.TextCommand):  # pylint: disable=too-few-public-methods
	def run(self, edit):
		for region in self.view.sel():  # for every selection (region = range in Sublime)
			line = self.view.line(region.begin())  # get line that contains the beginning of the region
			line_content = self.view.substr(line)  # get content of line

			if line_content.find("!important"):
				line_content = re.sub(r"\s?!important", "", line_content)
			else:
				line_content = re.sub(r"\s?!important", "!important", line_content, 0, re.MULTILINE)

			self.view.replace(edit, line, line_content)  # replace line with new contentbla
