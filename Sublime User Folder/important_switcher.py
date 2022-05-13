import re
import sublime_plugin


class ImportantSwitcher(sublime_plugin.TextCommand):  # pylint: disable=too-few-public-methods
	def run(self, edit):
		for region in self.view.sel():  # for every selection (region = range in Sublime)
			line = self.view.line(region)  # extend to beginning/end of line
			line_content = self.view.substr(line)

			if "!important" in line_content:
				line_content = re.sub(r"\s?!important", "", line_content, 0)
			else:
				line_content = re.sub(";$", " !important;", line_content, 0, re.MULTILINE)

			self.view.replace(edit, line, line_content)
