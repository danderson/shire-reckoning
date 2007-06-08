from distutils.core import setup
import py2exe

setup(windows=['gtkshire.py'],
      options = {'py2exe': {
          'packages': 'encodings',
          'includes': 'cairo, pango, pangocairo, atk, gobject'}
                 },
      data_files = ['monogram.png', 'monogram.svg'])
