import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ReplyWidget extends StatefulWidget {
  final String profileURL;
  final String username;
  final String content;
  final String date;

  const ReplyWidget(
      {Key? key,
      required this.profileURL,
      required this.username,
      required this.content,
      required this.date})
      : super(key: key);

  @override
  _ReplyWidgetState createState() => _ReplyWidgetState();
}

class _ReplyWidgetState extends State<ReplyWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            widget.profileURL,
          ),
          minRadius: 25,
        ),
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.content),
                  SizedBox(
                    height: 2.0,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 4.0,
                    runSpacing: 4.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        widget.username,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '·',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        widget.date,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
