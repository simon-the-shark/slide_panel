import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_panel/models/is_opened_provider.dart';
import 'package:slide_panel/views/body_panel.dart';
import 'package:slide_panel/views/left_slide_panel.dart';
import 'package:slide_panel/views/right_slide_panel.dart';
import 'package:slide_panel/models/slide_controller.dart';

class SlidePanel extends StatefulWidget {
  final Widget body;
  final Widget leftSlide;
  final Widget rightSlide;
  final double slidePanelWidth;
  final double slidePanelHeight;
  final double slideHandlerWidth;
  final bool slideOffBodyTap;
  final bool leftPanelVisible;
  final bool rightPanelVisible;
  final bool appbarIsExist;
  final void Function(SlideController) registerSlideController;
  const SlidePanel(
      {Key key,
      this.body,
      this.leftSlide,
      this.rightSlide,
      this.slidePanelWidth,
      this.slidePanelHeight,
      this.slideHandlerWidth,
      this.slideOffBodyTap,
      this.leftPanelVisible,
      this.rightPanelVisible,
      this.registerSlideController,
      this.appbarIsExist = true})
      : super(key: key);
  @override
  _SlidePanelState createState() => _SlidePanelState();
}

class _SlidePanelState extends State<SlidePanel> {
  bool isOpened = false;

  final slideController = SlideController();

  @override
  Widget build(BuildContext context) {
    widget.registerSlideController(slideController);
    return ChangeNotifierProvider<IsOpenedProvider>(
      create: (_) => IsOpenedProvider(),
      child: Stack(
        children: <Widget>[
          BodyPanel(
            body: widget.body,
            slideOffBodyTap: widget.slideOffBodyTap,
          ),
          widget.leftPanelVisible
              ? LeftSlidePanel(
                  key: slideController.leftSlideKey,
                  body: Container(
                      width: widget.slidePanelWidth + widget.slideHandlerWidth,
                      height: widget.slidePanelHeight,
                      color: Colors.red,
                      child: widget.leftSlide),
                  slideHandlerWidth: widget.slideHandlerWidth,
                  slidePanelHeight: widget.slidePanelHeight,
                  slidePanelWidth: widget.slidePanelWidth,
                  appbarIsExist: widget.appbarIsExist,
                )
              : Container(),
          widget.rightPanelVisible
              ? RightSlidePanel(
                  key: slideController.rightSlideKey,
                  body: Container(
                      width: widget.slidePanelWidth + widget.slideHandlerWidth,
                      height: widget.slidePanelHeight,
                      color: Colors.green,
                      child: widget.rightSlide),
                  slideHandlerWidth: widget.slideHandlerWidth,
                  slidePanelHeight: widget.slidePanelHeight,
                  slidePanelWidth: widget.slidePanelWidth,
                  appbarIsExist: widget.appbarIsExist,
                )
              : Container()
        ],
      ),
    );
  }
}
