import sublime
import sublime_plugin
import re

class ImportantSwitcher(sublime_plugin.TextCommand):
	def run(self, edit):
		for region in self.view.sel(): # for every selection (region = range in Sublime)
			line = self.view.line(region.begin()) # get line that contains the beginning of the region
			sublime.status_message("bla")




