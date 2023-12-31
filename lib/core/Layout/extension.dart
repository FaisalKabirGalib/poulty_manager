import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/core/Layout/widget/with_app_bar.dart';
import 'widget/base_app_bar.dart';

Widget page({required Widget child}) => Styled.builder(
    builder: (context, ch) {
      return Scaffold(
        appBar: const BaseAppBar(),
        body: Styled.widget(child: ch)
            .padding(vertical: 30, horizontal: 10)
            .scrollable()
            .safeArea(),
      );
    },
    child: child);

Widget blankPage({required Widget child}) => Styled.builder(
    builder: (context, ch) {
      return Scaffold(
        body: Styled.widget(child: ch)
            .padding(vertical: 30, horizontal: 10)
            .scrollable()
            .safeArea(),
      );
    },
    child: child);

const notImplSnackBar =
    SnackBar(content: Text("This Feature is currently Not implemented"));

extension ShowOverlay on BuildContext {
  void showNotImplSnackBar() {
    ScaffoldMessenger.of(this).showSnackBar(notImplSnackBar);
  }
}

extension Layout on Widget {
  Scaffold warpScaffold({
    Key? key,
    PreferredSizeWidget? appBar,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    FloatingActionButtonAnimator? floatingActionButtonAnimator,
    List<Widget>? persistentFooterButtons,
    Widget? drawer,
    DrawerCallback? onDrawerChanged,
    Widget? endDrawer,
    DrawerCallback? onEndDrawerChanged,
    Color? backgroundColor,
    Color? bottomNavigationBarColor,
    double? elevation,
    bool primary = true,
    DragStartBehavior? drawerDragStartBehavior,
    bool extendBody = false,
    bool extendBodyBehindAppBar = false,
    double? drawerScrimColorAlpha,
    Color? drawerScrimColor,
    double? drawerEdgeDragWidth,
    bool? drawerEnableOpenDragGesture,
    bool? endDrawerEnableOpenDragGesture,
    bool? resizeToAvoidBottomInset,
    bool? restoreGeometry,
  }) {
    return Scaffold(
      key: key,
      appBar: appBar,
      body: this,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      primary: primary,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      endDrawer: endDrawer,
      onEndDrawerChanged: onEndDrawerChanged,
      backgroundColor: backgroundColor,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }

  Widget wrapLayout({
    PreferredSizeWidget? appBar,
    FloatingActionButton? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    Widget? bottomNavigationBar,
    int currentIndex = 0,
    Function(int)? onTap,
  }) {
    return Styled.builder(
        builder: (context, child) => Scaffold(
            body: child,
            appBar: appBar ?? defaultAppBar(context),
            floatingActionButtonLocation: floatingActionButtonLocation ??
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: bottomNavigationBar),
        child: this);
  }
}
