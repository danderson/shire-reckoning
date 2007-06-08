; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Shire Reckoning"
!define PRODUCT_VERSION "0.1"
!define PRODUCT_PUBLISHER "David Anderson"
!define PRODUCT_WEB_SITE "http://natulte.net/"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\gtkshire.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "LICENSE"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\gtkshire.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "French"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Setup.exe"
InstallDir "$PROGRAMFILES\Shire Reckoning"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite try
  File "dist\atk.pyd"
  File "dist\bz2.pyd"
  SetOutPath "$INSTDIR\etc\fonts"
  File "dist\etc\fonts\fonts.conf"
  File "dist\etc\fonts\fonts.dtd"
  File "dist\etc\fonts\local.conf"
  SetOutPath "$INSTDIR\etc\gtk-2.0"
  File "dist\etc\gtk-2.0\gdk-pixbuf.loaders"
  File "dist\etc\gtk-2.0\gtk.immodules"
  File "dist\etc\gtk-2.0\gtkrc"
  SetOutPath "$INSTDIR\etc\pango"
  File "dist\etc\pango\pango.aliases"
  File "dist\etc\pango\pango.modules"
  SetOutPath "$INSTDIR"
  File "dist\gtkshire.exe"
  CreateDirectory "$SMPROGRAMS\Shire Reckoning"
  CreateShortCut "$SMPROGRAMS\Shire Reckoning\Shire Reckoning.lnk" "$INSTDIR\gtkshire.exe"
  CreateShortCut "$DESKTOP\Shire Reckoning.lnk" "$INSTDIR\gtkshire.exe"
  CreateShortCut "$STARTMENU\Shire Reckoning.lnk" "$INSTDIR\gtkshire.exe"
  File "dist\iconv.dll"
  File "dist\intl.dll"
  SetOutPath "$INSTDIR\lib\gtk-2.0\2.10.0\engines"
  File "dist\lib\gtk-2.0\2.10.0\engines\libpixmap.dll"
  File "dist\lib\gtk-2.0\2.10.0\engines\libsvg.dll"
  File "dist\lib\gtk-2.0\2.10.0\engines\libwimp.dll"
  SetOutPath "$INSTDIR\lib\gtk-2.0\2.10.0\immodules"
  File "dist\lib\gtk-2.0\2.10.0\immodules\im-am-et.dll"
  File "dist\lib\gtk-2.0\2.10.0\immodules\im-cedilla.dll"
  File "dist\lib\gtk-2.0\2.10.0\immodules\im-cyrillic-translit.dll"
  File "dist\lib\gtk-2.0\2.10.0\immodules\im-ime.dll"
  File "dist\lib\gtk-2.0\2.10.0\immodules\im-inuktitut.dll"
  File "dist\lib\gtk-2.0\2.10.0\immodules\im-ipa.dll"
  File "dist\lib\gtk-2.0\2.10.0\immodules\im-thai-broken.dll"
  File "dist\lib\gtk-2.0\2.10.0\immodules\im-ti-er.dll"
  File "dist\lib\gtk-2.0\2.10.0\immodules\im-ti-et.dll"
  File "dist\lib\gtk-2.0\2.10.0\immodules\im-viqr.dll"
  SetOutPath "$INSTDIR\lib\gtk-2.0\2.10.0\loaders"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-ani.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-bmp.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-gif.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-ico.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-jpeg.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-pcx.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-png.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-pnm.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-ras.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-tga.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-tiff.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-wbmp.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-xbm.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-xpm.dll"
  File "dist\lib\gtk-2.0\2.10.0\loaders\svg_loader.dll"
  SetOutPath "$INSTDIR\lib\pango\1.5.0\modules"
  File "dist\lib\pango\1.5.0\modules\pango-arabic-fc.dll"
  File "dist\lib\pango\1.5.0\modules\pango-arabic-lang.dll"
  File "dist\lib\pango\1.5.0\modules\pango-basic-fc.dll"
  File "dist\lib\pango\1.5.0\modules\pango-basic-win32.dll"
  File "dist\lib\pango\1.5.0\modules\pango-hangul-fc.dll"
  File "dist\lib\pango\1.5.0\modules\pango-hebrew-fc.dll"
  File "dist\lib\pango\1.5.0\modules\pango-indic-fc.dll"
  File "dist\lib\pango\1.5.0\modules\pango-indic-lang.dll"
  File "dist\lib\pango\1.5.0\modules\pango-khmer-fc.dll"
  File "dist\lib\pango\1.5.0\modules\pango-syriac-fc.dll"
  File "dist\lib\pango\1.5.0\modules\pango-thai-fc.dll"
  File "dist\lib\pango\1.5.0\modules\pango-tibetan-fc.dll"
  SetOutPath "$INSTDIR"
  File "dist\libatk-1.0-0.dll"
  File "dist\libcairo-2.dll"
  File "dist\libfontconfig-1.dll"
  File "dist\libfreetype-6.dll"
  File "dist\libgdk-win32-2.0-0.dll"
  File "dist\libgdk_pixbuf-2.0-0.dll"
  File "dist\libglib-2.0-0.dll"
  File "dist\libgmodule-2.0-0.dll"
  File "dist\libgobject-2.0-0.dll"
  File "dist\libgthread-2.0-0.dll"
  File "dist\libgtk-win32-2.0-0.dll"
  File "dist\libpango-1.0-0.dll"
  File "dist\libpangocairo-1.0-0.dll"
  File "dist\libpangoft2-1.0-0.dll"
  File "dist\libpangowin32-1.0-0.dll"
  File "dist\libpng12.dll"
  File "dist\library.zip"
  File "dist\monogram.png"
  File "dist\monogram.svg"
  File "dist\msvcr71.dll"
  File "dist\pango.pyd"
  File "dist\pangocairo.pyd"
  File "dist\python25.dll"
  SetOutPath "$INSTDIR\share\locale\fr\LC_MESSAGES"
  File "dist\share\locale\fr\LC_MESSAGES\atk10.mo"
  File "dist\share\locale\fr\LC_MESSAGES\glib20.mo"
  File "dist\share\locale\fr\LC_MESSAGES\gtk20-properties.mo"
  File "dist\share\locale\fr\LC_MESSAGES\gtk20.mo"
  SetOutPath "$INSTDIR\share\themes\Default\gtk-2.0-key"
  File "dist\share\themes\Default\gtk-2.0-key\gtkrc"
  SetOutPath "$INSTDIR\share\themes\MS-Windows\gtk-2.0"
  File "dist\share\themes\MS-Windows\gtk-2.0\gtkrc"
  SetOutPath "$INSTDIR\share\xml\libglade"
  File "dist\share\xml\libglade\glade-2.0.dtd"
  SetOutPath "$INSTDIR"
  File "dist\unicodedata.pyd"
  File "dist\w9xpopen.exe"
  File "dist\xmlparse.dll"
  File "dist\xmltok.dll"
  File "dist\zlib1.dll"
  File "dist\_cairo.pyd"
  File "dist\_gobject.pyd"
  File "dist\_gtk.pyd"
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\Shire Reckoning\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\Shire Reckoning\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\gtkshire.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\gtkshire.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\_gtk.pyd"
  Delete "$INSTDIR\_gobject.pyd"
  Delete "$INSTDIR\_cairo.pyd"
  Delete "$INSTDIR\zlib1.dll"
  Delete "$INSTDIR\xmltok.dll"
  Delete "$INSTDIR\xmlparse.dll"
  Delete "$INSTDIR\w9xpopen.exe"
  Delete "$INSTDIR\unicodedata.pyd"
  Delete "$INSTDIR\share\xml\libglade\glade-2.0.dtd"
  Delete "$INSTDIR\share\themes\MS-Windows\gtk-2.0\gtkrc"
  Delete "$INSTDIR\share\themes\Default\gtk-2.0-key\gtkrc"
  Delete "$INSTDIR\share\locale\fr\LC_MESSAGES\gtk20.mo"
  Delete "$INSTDIR\share\locale\fr\LC_MESSAGES\gtk20-properties.mo"
  Delete "$INSTDIR\share\locale\fr\LC_MESSAGES\glib20.mo"
  Delete "$INSTDIR\share\locale\fr\LC_MESSAGES\atk10.mo"
  Delete "$INSTDIR\python25.dll"
  Delete "$INSTDIR\pangocairo.pyd"
  Delete "$INSTDIR\pango.pyd"
  Delete "$INSTDIR\msvcr71.dll"
  Delete "$INSTDIR\monogram.svg"
  Delete "$INSTDIR\monogram.png"
  Delete "$INSTDIR\library.zip"
  Delete "$INSTDIR\libpng12.dll"
  Delete "$INSTDIR\libpangowin32-1.0-0.dll"
  Delete "$INSTDIR\libpangoft2-1.0-0.dll"
  Delete "$INSTDIR\libpangocairo-1.0-0.dll"
  Delete "$INSTDIR\libpango-1.0-0.dll"
  Delete "$INSTDIR\libgtk-win32-2.0-0.dll"
  Delete "$INSTDIR\libgthread-2.0-0.dll"
  Delete "$INSTDIR\libgobject-2.0-0.dll"
  Delete "$INSTDIR\libgmodule-2.0-0.dll"
  Delete "$INSTDIR\libglib-2.0-0.dll"
  Delete "$INSTDIR\libgdk_pixbuf-2.0-0.dll"
  Delete "$INSTDIR\libgdk-win32-2.0-0.dll"
  Delete "$INSTDIR\libfreetype-6.dll"
  Delete "$INSTDIR\libfontconfig-1.dll"
  Delete "$INSTDIR\libcairo-2.dll"
  Delete "$INSTDIR\libatk-1.0-0.dll"
  Delete "$INSTDIR\lib\pango\1.5.0\modules\pango-tibetan-fc.dll"
  Delete "$INSTDIR\lib\pango\1.5.0\modules\pango-thai-fc.dll"
  Delete "$INSTDIR\lib\pango\1.5.0\modules\pango-syriac-fc.dll"
  Delete "$INSTDIR\lib\pango\1.5.0\modules\pango-khmer-fc.dll"
  Delete "$INSTDIR\lib\pango\1.5.0\modules\pango-indic-lang.dll"
  Delete "$INSTDIR\lib\pango\1.5.0\modules\pango-indic-fc.dll"
  Delete "$INSTDIR\lib\pango\1.5.0\modules\pango-hebrew-fc.dll"
  Delete "$INSTDIR\lib\pango\1.5.0\modules\pango-hangul-fc.dll"
  Delete "$INSTDIR\lib\pango\1.5.0\modules\pango-basic-win32.dll"
  Delete "$INSTDIR\lib\pango\1.5.0\modules\pango-basic-fc.dll"
  Delete "$INSTDIR\lib\pango\1.5.0\modules\pango-arabic-lang.dll"
  Delete "$INSTDIR\lib\pango\1.5.0\modules\pango-arabic-fc.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\svg_loader.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-xpm.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-xbm.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-wbmp.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-tiff.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-tga.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-ras.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-pnm.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-png.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-pcx.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-jpeg.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-ico.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-gif.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-bmp.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\loaders\libpixbufloader-ani.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\immodules\im-viqr.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\immodules\im-ti-et.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\immodules\im-ti-er.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\immodules\im-thai-broken.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\immodules\im-ipa.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\immodules\im-inuktitut.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\immodules\im-ime.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\immodules\im-cyrillic-translit.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\immodules\im-cedilla.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\immodules\im-am-et.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\engines\libwimp.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\engines\libsvg.dll"
  Delete "$INSTDIR\lib\gtk-2.0\2.10.0\engines\libpixmap.dll"
  Delete "$INSTDIR\intl.dll"
  Delete "$INSTDIR\iconv.dll"
  Delete "$INSTDIR\gtkshire.exe"
  Delete "$INSTDIR\etc\pango\pango.modules"
  Delete "$INSTDIR\etc\pango\pango.aliases"
  Delete "$INSTDIR\etc\gtk-2.0\gtkrc"
  Delete "$INSTDIR\etc\gtk-2.0\gtk.immodules"
  Delete "$INSTDIR\etc\gtk-2.0\gdk-pixbuf.loaders"
  Delete "$INSTDIR\etc\fonts\local.conf"
  Delete "$INSTDIR\etc\fonts\fonts.dtd"
  Delete "$INSTDIR\etc\fonts\fonts.conf"
  Delete "$INSTDIR\bz2.pyd"
  Delete "$INSTDIR\atk.pyd"

  Delete "$SMPROGRAMS\Shire Reckoning\Uninstall.lnk"
  Delete "$SMPROGRAMS\Shire Reckoning\Website.lnk"
  Delete "$STARTMENU\Shire Reckoning.lnk"
  Delete "$DESKTOP\Shire Reckoning.lnk"
  Delete "$SMPROGRAMS\Shire Reckoning\Shire Reckoning.lnk"

  RMDir "$SMPROGRAMS\Shire Reckoning"
  RMDir "$INSTDIR\share\xml\libglade"
  RMDir "$INSTDIR\share\themes\MS-Windows\gtk-2.0"
  RMDir "$INSTDIR\share\themes\Default\gtk-2.0-key"
  RMDir "$INSTDIR\share\locale\fr\LC_MESSAGES"
  RMDir "$INSTDIR\lib\pango\1.5.0\modules"
  RMDir "$INSTDIR\lib\gtk-2.0\2.10.0\loaders"
  RMDir "$INSTDIR\lib\gtk-2.0\2.10.0\immodules"
  RMDir "$INSTDIR\lib\gtk-2.0\2.10.0\engines"
  RMDir "$INSTDIR\etc\pango"
  RMDir "$INSTDIR\etc\gtk-2.0"
  RMDir "$INSTDIR\etc\fonts"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd