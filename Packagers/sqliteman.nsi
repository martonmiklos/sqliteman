; NSIS installer script
; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Sqliteman"
!define PRODUCT_VERSION "1.1svn"
!define PRODUCT_PUBLISHER "Petr Vanek"
!define PRODUCT_WEB_SITE "http://sqliteman.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\sqliteman.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "..\Sqliteman\COPYING"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "setup-Sqliteman-1.1svn.exe"
InstallDir "$PROGRAMFILES\Sqliteman"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  SetOutPath "$INSTDIR\doc\en"
  SetOverwrite try
  File "..\..\release-trunk\doc\en\create_table.png"
  File "..\..\release-trunk\doc\en\index.html"
  File "..\..\release-trunk\doc\en\license.html"
  File "..\..\release-trunk\doc\en\main_window.png"
  File "..\..\release-trunk\doc\en\menu.html"
  File "..\..\release-trunk\doc\en\results.html"
  File "..\..\release-trunk\doc\en\results.png"
  File "..\..\release-trunk\doc\en\sqleditor.html"
  File "..\..\release-trunk\doc\en\sqleditor.png"
  File "..\..\release-trunk\doc\en\sqlite.html"
  File "..\..\release-trunk\doc\en\troubleshooting.html"
  File "..\..\release-trunk\doc\en\usage-context.html"
  File "..\..\release-trunk\doc\en\usage-database.html"
  File "..\..\release-trunk\doc\en\usage-file.html"
  File "..\..\release-trunk\doc\en\usage-prefs.html"
  File "..\..\release-trunk\doc\en\usage-run.html"
  File "..\..\release-trunk\doc\en\usage-system.html"
  SetOutPath "$INSTDIR"
  File "..\..\release-trunk\mingwm10.dll"
  File "..\..\release-trunk\QtCore4.dll"
  File "..\..\release-trunk\QtGui4.dll"
  File "..\..\release-trunk\QtSql4.dll"
  File "..\..\release-trunk\QtXml4.dll"
  SetOutPath "$INSTDIR\sqldrivers"
  File "..\..\release-trunk\sqldrivers\qsqlite4.dll"
  SetOutPath "$INSTDIR"
  File "..\..\release-trunk\sqlite3.exe"
  File "..\..\release-trunk\sqliteman.exe"
  CreateDirectory "$SMPROGRAMS\Sqliteman"
  CreateShortCut "$SMPROGRAMS\Sqliteman\Sqliteman.lnk" "$INSTDIR\sqliteman.exe"
  CreateShortCut "$DESKTOP\Sqliteman.lnk" "$INSTDIR\sqliteman.exe"
  SetOutPath "$INSTDIR\ts"
  File "..\..\release-trunk\ts\sqliteman_cs.qm"
  File "..\..\release-trunk\ts\sqliteman_cs.ts"
  File "..\..\release-trunk\ts\sqliteman_de.qm"
  File "..\..\release-trunk\ts\sqliteman_de.ts"
  File "..\..\release-trunk\ts\sqliteman_en.qm"
  File "..\..\release-trunk\ts\sqliteman_en.ts"
  File "..\..\release-trunk\ts\sqliteman_it.qm"
  File "..\..\release-trunk\ts\sqliteman_it.ts"
  File "..\..\release-trunk\ts\sqliteman_pl.qm"
  File "..\..\release-trunk\ts\sqliteman_pl.ts"
  File "..\..\release-trunk\ts\sqliteman_ru.qm"
  File "..\..\release-trunk\ts\sqliteman_ru.ts"
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\Sqliteman\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\Sqliteman\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\sqlite3.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\sqlite3.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\ts\sqliteman_ru.ts"
  Delete "$INSTDIR\ts\sqliteman_ru.qm"
  Delete "$INSTDIR\ts\sqliteman_pl.ts"
  Delete "$INSTDIR\ts\sqliteman_pl.qm"
  Delete "$INSTDIR\ts\sqliteman_it.ts"
  Delete "$INSTDIR\ts\sqliteman_it.qm"
  Delete "$INSTDIR\ts\sqliteman_en.ts"
  Delete "$INSTDIR\ts\sqliteman_en.qm"
  Delete "$INSTDIR\ts\sqliteman_de.ts"
  Delete "$INSTDIR\ts\sqliteman_de.qm"
  Delete "$INSTDIR\ts\sqliteman_cs.ts"
  Delete "$INSTDIR\ts\sqliteman_cs.qm"
  Delete "$INSTDIR\sqliteman.exe"
  Delete "$INSTDIR\sqlite3.exe"
  Delete "$INSTDIR\sqldrivers\qsqlite4.dll"
  Delete "$INSTDIR\QtXml4.dll"
  Delete "$INSTDIR\QtSql4.dll"
  Delete "$INSTDIR\QtGui4.dll"
  Delete "$INSTDIR\QtCore4.dll"
  Delete "$INSTDIR\mingwm10.dll"
  Delete "$INSTDIR\doc\en\usage-system.html"
  Delete "$INSTDIR\doc\en\usage-run.html"
  Delete "$INSTDIR\doc\en\usage-prefs.html"
  Delete "$INSTDIR\doc\en\usage-file.html"
  Delete "$INSTDIR\doc\en\usage-database.html"
  Delete "$INSTDIR\doc\en\usage-context.html"
  Delete "$INSTDIR\doc\en\troubleshooting.html"
  Delete "$INSTDIR\doc\en\sqlite.html"
  Delete "$INSTDIR\doc\en\sqleditor.png"
  Delete "$INSTDIR\doc\en\sqleditor.html"
  Delete "$INSTDIR\doc\en\results.png"
  Delete "$INSTDIR\doc\en\results.html"
  Delete "$INSTDIR\doc\en\menu.html"
  Delete "$INSTDIR\doc\en\main_window.png"
  Delete "$INSTDIR\doc\en\license.html"
  Delete "$INSTDIR\doc\en\index.html"
  Delete "$INSTDIR\doc\en\create_table.png"

  Delete "$SMPROGRAMS\Sqliteman\Uninstall.lnk"
  Delete "$SMPROGRAMS\Sqliteman\Website.lnk"
  Delete "$DESKTOP\Sqliteman.lnk"
  Delete "$SMPROGRAMS\Sqliteman\Sqliteman.lnk"

  RMDir "$SMPROGRAMS\Sqliteman"
  RMDir "$INSTDIR\ts"
  RMDir "$INSTDIR\sqldrivers"
  RMDir "$INSTDIR\doc\en"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd