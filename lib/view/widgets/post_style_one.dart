import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostStyleOne extends StatefulWidget {
  final String postURL;
  final String title;
  final String description;
  final String userPhoto;
  final String username;
  final String likeCount;
  final String unlikeCount;
  final String commentCount;
  final Function()? onLike;
  final Function()? onDislike;
  final Function()? onComment;

  const PostStyleOne(
      {Key? key,
      required this.postURL,
      required this.title,
      required this.description,
      required this.userPhoto,
      required this.username,
      required this.likeCount,
      required this.unlikeCount,
      required this.commentCount,
      this.onLike,
      this.onDislike,
      this.onComment})
      : super(key: key);

  @override
  _PostStyleOneState createState() => _PostStyleOneState();
}

class _PostStyleOneState extends State<PostStyleOne> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(widget.postURL,
            width: double.infinity, height: double.infinity, fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black.withOpacity(0.3),
            Colors.transparent,
            Colors.black.withOpacity(0.3)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                )),
            child: SafeArea(
              top: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 4.0,
                      runSpacing: 4.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(FontAwesomeIcons.thumbsUp),
                        Text(
                          widget.likeCount,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 4.0,
                      runSpacing: 4.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
                        Icon(FontAwesomeIcons.thumbsDown),
                        Text(
                          'Beğenme',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 4.0,
                      runSpacing: 4.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(FontAwesomeIcons.comment),
                        Text(
                          widget.commentCount,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 4.0,
                      runSpacing: 4.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
                        Icon(FontAwesomeIcons.share),
                        Text(
                          'Paylaş',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 4.0,
                      runSpacing: 4.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
                        Icon(FontAwesomeIcons.ellipsisV),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 8.0,
                    runSpacing: 8.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.userPhoto),
                        radius: 15,
                      ),
                      Text(
                        widget.username,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )
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
