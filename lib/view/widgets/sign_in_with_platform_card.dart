import 'package:alemneder_ui_kit/view/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum PlatformType { facebook, apple, twitter, google }

class SignInWithPlatformCard extends StatelessWidget {
  final PlatformType type;
  final Function()? onTap;

  const SignInWithPlatformCard({Key? key, required this.type, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getColor,
      child: ListTile(
        leading: Icon(_getIcon),
      ),
    );
  }

  IconData? get _getIcon {
    switch (type) {
      case PlatformType.facebook:
        return FontAwesomeIcons.facebook;
      case PlatformType.apple:
        return FontAwesomeIcons.apple;
      case PlatformType.twitter:
        return FontAwesomeIcons.twitter;
      case PlatformType.google:
        return FontAwesomeIcons.google;
    }
  }

  Color? get _getColor {
    switch (type) {
      case PlatformType.facebook:
        return HexColor('#4267B2');
      case PlatformType.apple:
        return Colors.black;
      case PlatformType.twitter:
        return HexColor('#1DA1F2');
      case PlatformType.google:
        return HexColor('#50C7C7');
    }
  }
}
