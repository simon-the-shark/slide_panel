import 'package:slide_panel/views/left_slide_panel.dart';
import 'package:slide_panel/views/right_slide_panel.dart';
import 'package:slide_panel/models/is_opened_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideController {
  final leftSlideKey = GlobalKey<LeftSlidePanelState>();
  final rightSlideKey = GlobalKey<RightSlidePanelState>();

  void openLeft() {
    if (leftSlideKey?.currentContext == null) return;
    Provider.of<IsOpenedProvider>(leftSlideKey?.currentContext, listen: false)
        .setOpenLeftState(true);
    leftSlideKey?.currentState?.open();
  }

  void openRight() {
    if (rightSlideKey?.currentContext == null) return;
    Provider.of<IsOpenedProvider>(rightSlideKey?.currentContext, listen: false)
        .setOpenRightState(true);
    rightSlideKey?.currentState?.open();
  }

  void closeLeft() {
    if (leftSlideKey?.currentContext == null) return;
    Provider.of<IsOpenedProvider>(leftSlideKey.currentContext, listen: false)
        .setOpenLeftState(false);
  }

  void closeRight() {
    if (rightSlideKey?.currentContext == null) return;
    Provider.of<IsOpenedProvider>(rightSlideKey.currentContext, listen: false)
        .setOpenRightState(false);
  }
}
