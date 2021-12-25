import 'package:alemneder_ui_kit/view/constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(WidgetConstants.DEFAULT_CONTENT_PADDING),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bildirimler',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: WidgetConstants.DEFAULT_TITLE_SPACING,
            ),
            Expanded(
              child: ListView(
                children: [
                  singleNotification(
                      title: 'Berkan gönderini beğendi',
                      type: 'Beğeni',
                      color: Colors.green,
                      date: '2 dakika önce'),
                  singleNotification(
                      title: 'Cansu gönderini yorumladı',
                      type: 'Yorum',
                      color: Colors.cyan,
                      date: '3 dakika önce'),
                  singleNotification(
                      title: 'Fatih gönderini yorumladı',
                      type: 'Yorum',
                      color: Colors.cyan,
                      date: '4 dakika önce'),
                  singleNotification(
                      title: 'Esra gönderini beğenmedi',
                      type: 'Beğenmeme',
                      color: Colors.red,
                      date: '4 dakika önce'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleNotification(
      {required String title,
      required String type,
      required Color color,
      required String date}) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.bell),
        ],
      ),
      title: Text(
        title,
        style: TextStyle(),
      ),
      subtitle: Wrap(
        direction: Axis.horizontal,
        spacing: 4.0,
        runSpacing: 4.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            type,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            '·',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            date,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
