#!/usr/bin/env python

from calendar import isleap
from datetime import date
import unittest


MONTHS = [
    "Afteryule",
    "Solmath",
    "Rethe",
    "Astron",
    "Thrimidge",
    "Forelithe",
    "Afterlithe",
    "Wedmath",
    "Halimath",
    "Winterfilth",
    "Blotmath",
    "Foreyule",
    ]


WEEKDAYS = [
    "Sterday",
    "Sunday",
    "Monday",
    "Trewsday",
    "Hevensday",
    "Mersday",
    "Highday",
    ]

SPECIALS = [
    "2 Yule",
    "1 Lithe",
    "Mid-year's Day",
    "2 Lithe",
    "1 Yule",
    "Overlithe",
    ]

SPECIALS_DAYS = [1, 182, 183, 184, 365]

LEAP_DAY = 184


def gregorian_day(year, month, day):
    """Compute the gregorian calendar day for the given date."""
    return int(date(year, month, day).strftime("%j"))


def shire_year_day(gregorian_year, gregorian_day):
    """Return the shire year and day matching the given gregorian
    year/day."""
    shire_day = gregorian_day + 9
    if isleap(gregorian_year) and shire_day > 366:
        shire_year = gregorian_year + 1
        shire_day %= 366
    elif not isleap(gregorian_year) and shire_day > 365:
        shire_year = gregorian_year + 1
        shire_day %= 365
    else:
        shire_year = gregorian_year

    return shire_year, shire_day


class ShireDate(object):
    def __init__(self, year, month, day):
        """Create a ShireDate instance matching the given gregorian
        calendar date."""
        greg_day = gregorian_day(year, month, day)
        shire_year, shire_day = shire_year_day(year, greg_day)

        self.year = shire_year
        self.year_day = shire_day

        # Leap year and Overlithe day
        day = self.year_day
        if isleap(self.year):
            if day == LEAP_DAY:
                self.month = None
                self.day = None
                self.special_day = 6
                return
            elif day > LEAP_DAY:
                # Adjust the values down to eliminate Overlithe.
                day -= 1

        # Other special days
        if day in SPECIALS_DAYS:
            self.month = None
            self.day = None
            self.special_day = SPECIALS_DAYS.index(day)
            return

        # Remove all special days, so that we end up with a "year" of
        # 12*30 days, making month calculations easy.
        new_day = day
        for special in SPECIALS_DAYS:
            if day > special:
                new_day -= 1
        day = new_day

        self.day = ((day - 1) % 30) + 1
        self.month = ((day - self.day) / 30) + 1
        self.special_day = None

    def __str__(self):
        if self.special_day is not None:
            return "%s in the year %d by Shire reckoning" % (
                SPECIALS[self.special_day], self.year)
        else:
            return "%d %s in the year %d by Shire reckoning" % (
                self.day, MONTHS[self.month-1], self.year)

    @classmethod
    def today(klass):
        d = date.today()
        return klass(d.year, d.month, d.day)


class ShireTests(unittest.TestCase):
    def testGregorianDay(self):
        self.assertEquals(gregorian_day(2007, 1, 1), 1)
        self.assertEquals(gregorian_day(2007, 1, 2), 2)
        self.assertEquals(gregorian_day(2007, 2, 1), 32)
        self.assertEquals(gregorian_day(2007, 3, 1), 60)
        self.assertEquals(gregorian_day(2004, 3, 1), 61)

    def testShireYearDay(self):
        self.assertEquals(shire_year_day(2007, 1), (2007, 10))
        self.assertEquals(shire_year_day(2007, 100), (2007, 109))
        self.assertEquals(shire_year_day(2007, 365), (2008, 9))
        self.assertEquals(shire_year_day(2004, 365), (2005, 8))

    def testShireDateCreation(self):
        d = ShireDate(2007, 1, 30)
        d = ShireDate(2004, 2, 29)
        self.assertRaises(ValueError, ShireDate, 2007, 2, 29)

    def testShireDateSimpleMonths(self):
        d = ShireDate(2007, 1, 1)
        self.assertEquals(d.year, 2007)
        self.assertEquals(d.month, 1)
        self.assertEquals(d.day, 9)
        self.assertEquals(d.special_day, None)

        d = ShireDate(2005, 12, 23)
        self.assertEquals(d.year, 2006)
        self.assertEquals(d.month, None)
        self.assertEquals(d.day, None)
        self.assertEquals(d.special_day, 0)

    def testShireDatePrinting(self):
        d = ShireDate(2007, 1, 1)
        self.assertEquals(
            str(d), '9 Afteryule in the year 2007 by Shire reckoning')

        d = ShireDate(2005, 12, 23)
        self.assertEquals(
            str(d), '2 Yule in the year 2006 by Shire reckoning')

if __name__ == '__main__':
    print ShireDate.today()
    unittest.main()
