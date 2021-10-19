import 'package:flutter/material.dart';

class Themedata {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color blue = Color(0xFF1b6bb0);
  static const Color grey = Color(0xFF98a1a9);
  static const Color greyBackground = Color(0xFFEEEEEE);
  static const Color lightgrey = Color(0xFFf5f5f5);
  static const Color orange = Color(0xFFf09617);

  // Badge
  static const Color badgeBg = Color(0xFFED1727);
  static const Color badgeColor = Color(0xFFfffffff);

  // Button
  static const Color btnDisabledBg = Color(0xFFb5b5b5);
  static const Color btnDisabledClr = Color(0xFFf1f1f1);

  // CheckBox
  static const Color checkboxBgColor = Color(0xFF1b6bb0);
  static const Color checkboxTickColor = Color(0xFFfffffff);

  // Segment
  static const Color segmentBackgroundColor = Color(0xFF1b6bb0);
  static const Color segmentActiveBackgroundColor = Color(0xFFffffff);
  static const Color segmentTextColor = Color(0xFFffffff);
  static const Color segmentActiveTextColor = Color(0xFF1b6bb0);
  static const Color segmentBorderColor = Color(0xFFffffff);
  static const Color segmentBorderColorMain = Color(0xFF1b6bb0);

  // Card
  static const Color cardDefaultBg = Color(0xFFffffff);

  // Color
  static const Color brandPrimary = Color(0xFF1b6bb0);
  static const Color brandInfo = Color(0xFF62B1F6);
  static const Color brandSuccess = Color(0xFF5cb85c);
  static const Color brandDanger = Color(0xFFd9534f);
  static const Color brandWarning = Color(0xFFf09617);
  static const Color brandSidebar = Color(0xFF252932);
  static const Color brandDark = Color(0xFF000000);
  static const Color brandLight = Color(0xFFf4f4f4);

  // Footer
  static const Color footerDefaultBg = Color(0xFF1b6bb0);

  // FooterTab
  static const Color tabBarTextColor = Color(0xFF8bb3f4);
  static const Color activeTab = Color(0xFF1b6bb0);
  static const Color sTabBarActiveTextColor = Color(0xFF1b6bb0);
  static const Color tabBarActiveTextColor = Color(0xFFffffff);
  static const Color tabActiveBgColor = Color(0xFF1b6bb0);

  // Tab
  static const Color tabDefaultBg = Color(0xFF1b6bb0);
  static const Color topTabBarTextColor = Color(0xFFb3c7f9);
  static const Color topTabBarActiveTextColor = Color(0xFFffffff);
  static const Color topTabActiveBgColor = Color(0xFF1b6bb0);
  static const Color topTabBarBorderColor = Color(0xFFffffff);
  static const Color topTabBarActiveBorderColor = Color(0xFFffffff);

  // Header
  static const Color toolbarBtnColor = Color(0xFFffffff);
  static const Color toolbarDefaultBg = Color(0xFF1b6bb0);
  static const Color toolbarInputColor = Color(0xFFCECDD2);
  static const Color toolbarInverseBg = Color(0xFF222222);
  static const Color toolbarTextColor = Color(0xFFffffff);
  static const Color iosStatusbar = Color(0xFFffffff);
  static const Color toolbarDefaultBorder = Color(0xFF1b6bb0);

  // InputGroup
  static const Color inputBorderColor = Color(0xFFD9D5DC);
  static const Color inputSuccessBorderColor = Color(0xFF2b8339);
  static const Color inputErrorBorderColor = Color(0xFFf09617);
  static const Color inputColorPlaceholder = Color(0xFF575757);

  // List
  static const Color listBg = Color(0xFFffffff);
  static const Color listBorderColor = Color(0xFFc9c9c9);
  static const Color listDividerBg = Color(0xFFf4f4f4);
  static const Color listBtnUnderlayColor = Color(0xFFDDDDDD);

  // Card
  static const Color cardBorderColor = Color(0xFFcccccc);
  static const Color listNoteColor = Color(0xFF808080);

  // Progress Bar
  static const Color defaultProgressColor = Color(0xFFf09617);
  static const Color inverseProgressColor = Color(0xFF1A191B);

  // Radio Button
  static const Color radioSelectedColorAndroid = Color(0xFF1b6bb0);

  // New Variable
  static const Color radioColor = Color(0xFF7e7e7e);

  // Spinner
  static const Color defaultSpinnerColor = Color(0xFF45D56E);
  static const Color inverseSpinnerColor = Color(0xFF1A191B);

  // Tabs
  static const Color tabBgColor = Color(0xFFF8F8F8);
  static const Color tabTextColor = Color(0xFF222222);

  // Text
  static const Color textColor = Color(0xFF000000);
  static const Color inverseTextColor = Color(0xFFffffff);

  // Title
  static const Color subtitleColor = Color(0xFFFFFFFF);

  // New Variable
  static const Color titleFontColor = Color(0xFFFFFFFF);

  // Other
  static const Color dropdownBg = Color(0xFF000000);
  static const Color dropdownLinkColor = Color(0xFF414142);
  static const Color jumbotronBg = Color(0xFFC9C9CE);

  // Old colors
  static const Color primarySwatch = Colors.blue;
  static const Color primaryColor = Color(0xFF2196f3);
  static const Color accentColor = Color(0xFF2196f3);
  static const Color canvasColor = Color(0xFFfafafa);
  static const Color backgroundColor = Color(0xFF000055);
  static const Color selectedItemColor = Color(0xFFFFFFFF);
  static const Color unselectedItemColor = Color(0x55FFFFFF);

  ///
  ///
  ///
  static Map<String, Color> getAllColors() {
    return {
      'white': Themedata.white,
      'black': Themedata.black,
      'blue': Themedata.blue,
      'grey': Themedata.grey,
      'greyBackground': Themedata.greyBackground,
      'lightgrey': Themedata.lightgrey,
      'orange': Themedata.orange,
      'badgeBg': Themedata.badgeBg,
      'badgeColor': Themedata.badgeColor,
      'btnDisabledBg': Themedata.btnDisabledBg,
      'btnDisabledClr': Themedata.btnDisabledClr,
      'checkboxBgColor': Themedata.checkboxBgColor,
      'checkboxTickColor': Themedata.checkboxTickColor,
      'segmentBackgroundColor': Themedata.segmentBackgroundColor,
      'segmentActiveBackgroundColor': Themedata.segmentActiveBackgroundColor,
      'segmentTextColor': Themedata.segmentTextColor,
      'segmentActiveTextColor': Themedata.segmentActiveTextColor,
      'segmentBorderColor': Themedata.segmentBorderColor,
      'segmentBorderColorMain': Themedata.segmentBorderColorMain,
      'cardDefaultBg': Themedata.cardDefaultBg,
      'brandPrimary': Themedata.brandPrimary,
      'brandInfo': Themedata.brandInfo,
      'brandSuccess': Themedata.brandSuccess,
      'brandDanger': Themedata.brandDanger,
      'brandWarning': Themedata.brandWarning,
      'brandSidebar': Themedata.brandSidebar,
      'brandDark': Themedata.brandDark,
      'brandLight': Themedata.brandLight,
      'footerDefaultBg': Themedata.footerDefaultBg,
      'tabBarTextColor': Themedata.tabBarTextColor,
      'activeTab': Themedata.activeTab,
      'sTabBarActiveTextColor': Themedata.sTabBarActiveTextColor,
      'tabBarActiveTextColor': Themedata.tabBarActiveTextColor,
      'tabActiveBgColor': Themedata.tabActiveBgColor,
      'tabDefaultBg': Themedata.tabDefaultBg,
      'topTabBarTextColor': Themedata.topTabBarTextColor,
      'topTabBarActiveTextColor': Themedata.topTabBarActiveTextColor,
      'topTabActiveBgColor': Themedata.topTabActiveBgColor,
      'topTabBarBorderColor': Themedata.topTabBarBorderColor,
      'topTabBarActiveBorderColor': Themedata.topTabBarActiveBorderColor,
      'toolbarBtnColor': Themedata.toolbarBtnColor,
      'toolbarDefaultBg': Themedata.toolbarDefaultBg,
      'toolbarInputColor': Themedata.toolbarInputColor,
      'toolbarInverseBg': Themedata.toolbarInverseBg,
      'toolbarTextColor': Themedata.toolbarTextColor,
      'iosStatusbar': Themedata.iosStatusbar,
      'toolbarDefaultBorder': Themedata.toolbarDefaultBorder,
      'inputBorderColor': Themedata.inputBorderColor,
      'inputSuccessBorderColor': Themedata.inputSuccessBorderColor,
      'inputErrorBorderColor': Themedata.inputErrorBorderColor,
      'inputColorPlaceholder': Themedata.inputColorPlaceholder,
      'listBg': Themedata.listBg,
      'listBorderColor': Themedata.listBorderColor,
      'listDividerBg': Themedata.listDividerBg,
      'listBtnUnderlayColor': Themedata.listBtnUnderlayColor,
      'cardBorderColor': Themedata.cardBorderColor,
      'listNoteColor': Themedata.listNoteColor,
      'defaultProgressColor': Themedata.defaultProgressColor,
      'inverseProgressColor': Themedata.inverseProgressColor,
      'radioSelectedColorAndroid': Themedata.radioSelectedColorAndroid,
      'radioColor': Themedata.radioColor,
      'defaultSpinnerColor': Themedata.defaultSpinnerColor,
      'inverseSpinnerColor': Themedata.inverseSpinnerColor,
      'tabBgColor': Themedata.tabBgColor,
      'tabTextColor': Themedata.tabTextColor,
      'textColor': Themedata.textColor,
      'inverseTextColor': Themedata.inverseTextColor,
      'subtitleColor': Themedata.subtitleColor,
      'titleFontColor': Themedata.titleFontColor,
      'dropdownBg': Themedata.dropdownBg,
      'dropdownLinkColor': Themedata.dropdownLinkColor,
      'jumbotronBg': Themedata.jumbotronBg,
      'primarySwatch': Themedata.primarySwatch,
      'primaryColor': Themedata.primaryColor,
      'accentColor': Themedata.accentColor,
      'canvasColor': Themedata.canvasColor,
      'backgroundColor': Themedata.backgroundColor,
      'selectedItemColor': Themedata.selectedItemColor,
      'unselectedItemColor': Themedata.unselectedItemColor,
    };
  }
}
