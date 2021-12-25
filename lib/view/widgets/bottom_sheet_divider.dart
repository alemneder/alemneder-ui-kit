import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomSheetDivider extends StatelessWidget {
  final Color color;

  BottomSheetDivider({this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Divider(
        color: color,
        thickness: 3,
        indent: (MediaQuery.of(context).size.width) * 0.45,
        endIndent: (MediaQuery.of(context).size.width) * 0.45,
      ),
    );
  }
}

class BottomSheetOpener extends StatelessWidget {
  final Color color;

  BottomSheetOpener({this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        FontAwesomeIcons.angleUp,
        color: color,
      ),
    );
  }
}

class BottomSheetCloser extends StatelessWidget {
  final Color color;

  BottomSheetCloser({this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        FontAwesomeIcons.angleDown,
        color: color,
      ),
    );
  }
}
