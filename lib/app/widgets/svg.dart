import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore_for_file: use_key_in_widget_constructors
class SVG extends StatelessWidget {
  
  const SVG.cancel({
    this.padding,
    this.height,
    this.width,
  }) : _asset = 'assets/cancel.svg';

  const SVG.location({
    this.padding,
    this.height,
    this.width,
  }) : _asset = 'assets/location.svg';

  const SVG.welcome({
    this.padding,
    this.height,
    this.width,
  }) : _asset = 'assets/welcome.svg';

  final String _asset;
  final EdgeInsets? padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SvgPicture.asset(
        _asset,
        width: width,
        height: height,
        semanticsLabel: _asset.split('/').last.split('.').first,
      ),
    );
  }
}
