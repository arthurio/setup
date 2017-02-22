import sublime
import sublime_plugin


class ResetFontSizeToUserDefaultsCommand(sublime_plugin.ApplicationCommand):
    def run(self):
        s = sublime.load_settings("Preferences.sublime-settings")
        s.set('font_size', s.get('default_font_size'))
        sublime.save_settings("Preferences.sublime-settings")
