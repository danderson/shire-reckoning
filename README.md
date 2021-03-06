_This is *very* old software that I had lying around. I'm publishing
it for historical interest, and will gladly accept patches to get it
working again, but I won't be doing much to it._

Shire Reckoning
===============

Shire reckoning is a simple application that displays an icon in the
system tray. When you hover over it or right-click it, it displays the
current date by Shire reckoning, in the calendar of our dear hobbit
friends, as imagined by John Ronald Reuel Tolkien CBE, in his Middle
Earth universe.

Technically, Shire Reckoning is written in Python, uses the standard
Python calendar module and a little math to convert from gregorian
year-day to Shire year-day, with appropriate handling of the hobbit
30-day months and the 6 holidays of the year (7 in leap years). The
calendar conversion part is a completely self-contained Python module
that can be reused as a standalone component.

The GUI module builds on the shire calendar module and uses PyGTK. In
particular, it uses the portable systray facility available in recent
versions of PyGTK, which means that Shire Reckoning displays properly
on all open source desktops following the Freedesktop references on
system tray handling (at least Gnome, KDE and Xfce, probably more), as
well as Microsoft Windows.

The source code was written by David Anderson, and is published under
a BSD-style license. The monogram used as the systray icon is the
monogram of David's friend Romain Fernique. It can be distributed
under the terms of the Creative Commons Attribution NonCommercial
ShareAlike 2.0 France contract. See LICENSE for the full text of the
distribution terms of the code and monogram.
