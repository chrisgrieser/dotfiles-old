import sublime
import sublime_plugin

class RemoveTabBarListener(sublime_plugin.EventListener):

	def on_load_async(self, view):
		self.close_tab_bar(view, len(view.window().views()))

		def on_pre_close(self, view):
			self.close_tab_bar(view, len(view.window().views()) - 1)

			def close_tab_bar(self, view, num_views):
				if num_views == 1:
					view.window().set_tabs_visible(False)
				else:
					view.window().set_tabs_visible(True)

					on_load = on_new = on_new_async = on_load_async
