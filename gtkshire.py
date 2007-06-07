#!/usr/bin/env python
#
# Display a small icon in the status bar, with a tooltip that gives
# the current date by Shire reckoning.

import threading
import os
import sys
from datetime import datetime

import shire

try:
    import pygtk
    pygtk.require('2.0')
    import gtk
    import gobject
except:
    print "ERROR: Python GTK is missing."
    sys.exit(1)

class ShireStatusIcon(object):
    def __init__(self):
        self.status = gtk.status_icon_new_from_file('monogram.png')
        self.status.set_tooltip("")
        self.status.set_visible(True)

        # Context menu
        self.menu = gtk.Menu()

        self.menu_item_date = gtk.MenuItem(label="")
        self.menu_item_date.set_sensitive(False)
        self.menu.append(self.menu_item_date)

        self.menu.append(gtk.SeparatorMenuItem())

        menu_item_quit = gtk.ImageMenuItem(stock_id=gtk.STOCK_QUIT)
        menu_item_quit.connect('button-release-event', self.quit)
        self.menu.append(menu_item_quit)

        self.menu.show_all()
        self.status.connect('popup-menu', self.show_menu)

        self.update_date()

    def quit(self, widget, event):
        gtk.main_quit()

    def show_menu(self, status, button, activate_time):
        self.menu.popup(None, None, None, button, activate_time)

    def update_date(self):
        date = str(shire.ShireDate.today())
        self.menu_item_date.get_child().set_text(date)
        self.status.set_tooltip(date)

        t = datetime.now()
        elapsed_secs = (t.hour * 3600 + t.minute * 60 + t.second)
        secs_to_next_day = (24*3600) - elapsed_secs + 2 # Safety margin
        gobject.timeout_add(secs_to_next_day * 1000, self.update_date)

        return False

if __name__ == '__main__':
    icon = ShireStatusIcon()
    gtk.main()
