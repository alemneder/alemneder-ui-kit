import 'package:alemneder_ui_kit/view/constants/widget_constants.dart';
import 'package:flutter/material.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  _DiscoveryScreenState createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(WidgetConstants.DEFAULT_CONTENT_PADDING),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Keşif',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: WidgetConstants.DEFAULT_TITLE_SPACING,
            ),
          ],
        ),
      ),
    );
  }
}
