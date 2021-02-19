library bottom_navy_bar;

import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

import 'custom_fade_in.dart';

class CustomBottomNavyBar extends StatefulWidget {
  final int selectedIndex;
  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarCustomItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;
  final double containerWidth;
  final enableAnimation;
  final BottomNavyBarCustomItem homeItem;

  CustomBottomNavyBar({
    Key key,
    this.homeItem,
    this.containerWidth,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.enableAnimation,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 0),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    @required this.items,
    @required this.onItemSelected,
    this.curve = Curves.linear,
  }) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert(onItemSelected != null);
    assert(curve != null);
  }

  @override
  _CustomBottomNavyBarState createState() => _CustomBottomNavyBarState();
}

class _CustomBottomNavyBarState extends State<CustomBottomNavyBar> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  String _deviceInfo = "";

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 0), () async {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        _deviceInfo = androidInfo.manufacturer;
      } else {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

        _deviceInfo = iosInfo.name;
        print('Running on $_deviceInfo');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = (widget.backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : widget.backgroundColor;

    return CustomFadeIn(
      delay: widget.enableAnimation == false ? 0 : 2,
      transformDuration: widget.enableAnimation == false ? 0 : null,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight:
                  Radius.circular(50)), //5 * SizeConfig.heightMultiplier)),
          boxShadow: [
            if (widget.showElevation)
              BoxShadow(
                  offset: Offset(0, 0),
                  color: Colors.blueGrey.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 1),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        height: widget.containerHeight * 1.0,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: Platform.isAndroid
                  ? 0
                  : _deviceInfo.contains(new RegExp(r'[5-8]')) ||
                          _deviceInfo.contains('SE')
                      ? 0
                      : widget.containerHeight * 0.2),
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: widget.items.map((item) {
              var index = widget.items.indexOf(item);
              return CustomFadeIn(
                delay: widget.enableAnimation == false
                    ? 0
                    : index.toDouble() + 0.25,
                transformDuration: widget.enableAnimation == false ? 0 : null,
                transform: false,
                child: CustomBounceAnimationWidget(
                    onTap: () => widget.onItemSelected(index),
                    child: _ItemWidget(
                      item: item,
                      iconSize: widget.iconSize,
                      isSelected: index == widget.selectedIndex,
                      backgroundColor: bgColor,
                      itemCornerRadius: widget.itemCornerRadius,
                      animationDuration: widget.animationDuration,
                      curve: widget.curve,
                      containerHeight: widget.containerHeight,
                    )),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarCustomItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;
  final containerHeight;

  const _ItemWidget({
    Key key,
    this.containerHeight,
    @required this.item,
    @required this.isSelected,
    @required this.backgroundColor,
    @required this.animationDuration,
    @required this.itemCornerRadius,
    @required this.iconSize,
    this.curve = Curves.linear,
  })  : assert(isSelected != null),
        assert(item != null),
        assert(backgroundColor != null),
        assert(animationDuration != null),
        assert(itemCornerRadius != null),
        assert(iconSize != null),
        assert(curve != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight * 1,

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft:
                  Radius.circular(30), //3.2 * SizeConfig.heightMultiplier),
              topRight:
                  Radius.circular(30))), //3.2 * SizeConfig.heightMultiplier))),
      // width: 15 * SizeConfig.widthMultiplier,
      width: MediaQuery.of(context).size.width / 4.3,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconTheme(
            data: IconThemeData(
              size: iconSize,
              color: isSelected
                  ? item.activeColor.withOpacity(1)
                  : item.inactiveColor == null
                      ? item.activeColor
                      : item.inactiveColor,
            ),
            child: item.icon,
          ),
          /* if (isSelected)
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: DefaultTextStyle.merge(
                  style: TextStyle(
                    color: item.activeColor,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  textAlign: item.textAlign,
                  child: item.title,
                ),
              ),
            ),*/
        ],
      ),
    );
  }
}

class BottomNavyBarCustomItem {
  final Icon icon;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;
  final TextAlign textAlign;

  BottomNavyBarCustomItem({
    @required this.icon,
    this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  }) {
    assert(icon != null);
  }
}

class CustomBounceAnimationWidget extends StatefulWidget {
  final Widget child;
  final Function onTap;
  const CustomBounceAnimationWidget(
      {Key key, @required this.child, @required this.onTap})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _CustomBounceAnimationWidgetState();
}

class _CustomBounceAnimationWidgetState
    extends State<CustomBounceAnimationWidget>
    with TickerProviderStateMixin<CustomBounceAnimationWidget> {
  AnimationController controller;
  Animation<double> easeInAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 180,
        ),
        value: 1.0);
    easeInAnimation = Tween(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ),
    );
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap == null) {
          return;
        }
        widget.onTap();
        controller.forward().then((val) {
          controller.reverse().then((val) {});
        });
      },
      child: ScaleTransition(
        scale: easeInAnimation,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
