import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:alemneder_ui_kit/view/widgets/reply_widget.dart';

class CommentWidget extends StatefulWidget {
  final String profileURL;
  final String username;
  final String content;
  final String date;
  final int emotionType;
  final List<ReplyWidget>? replies;
  const CommentWidget({
    Key? key,
    required this.profileURL,
    required this.username,
    required this.content,
    required this.date,
    required this.emotionType,
    this.replies,
  }) : super(key: key);
  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  var isOpenReplies = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
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
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              Text(
                                widget.date,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    _getEmotionIcon(widget.emotionType),
                    color: _getEmotionColor(widget.emotionType),
                  ),
                ),
              ],
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 200),
              child: isOpenReplies && widget.replies != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 32.0, top: 16.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: widget.replies!,
                      ),
                    )
                  : SizedBox(),
            ),
            widget.replies != null
                ? Padding(
                    padding: const EdgeInsets.only(
                        right: 16.0, left: 62.0, top: 16.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isOpenReplies = !isOpenReplies;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            !isOpenReplies
                                ? 'Cevapları Göster'
                                : 'Cevapları Gizle',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Icon(
                                    !isOpenReplies
                                        ? FontAwesomeIcons.chevronDown
                                        : FontAwesomeIcons.chevronUp,
                                    size: 18,
                                    color: Colors.grey),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  IconData _getEmotionIcon(int emotionType) {
    if (emotionType == 1)
      return FontAwesomeIcons.thumbsUp;
    else if (emotionType == -1)
      return FontAwesomeIcons.thumbsDown;
    else
      return FontAwesomeIcons.neuter;
  }

  Color _getEmotionColor(int emotionType) {
    if (emotionType == 1)
      return Colors.green;
    else if (emotionType == -1)
      return Colors.red;
    else
      return Colors.cyan;
  }
}
