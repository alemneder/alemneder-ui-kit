import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostStyleTwo extends StatefulWidget {
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

  const PostStyleTwo(
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
  _PostStyleTwoState createState() => _PostStyleTwoState();
}

class _PostStyleTwoState extends State<PostStyleTwo> {
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
          left: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(
                      height: 8.0,
                    ),
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
                  ],
                ),
              ),
              SafeArea(
                top: false,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 8.0),
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
                        const SizedBox(width: 24.0),
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
                        const SizedBox(width: 24.0),
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
                        const SizedBox(width: 24.0),
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
                        const SizedBox(width: 24.0),
                        Wrap(
                          direction: Axis.vertical,
                          spacing: 4.0,
                          runSpacing: 4.0,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: const [
                            Icon(FontAwesomeIcons.ellipsisV),
                          ],
                        ),
                        const SizedBox(width: 24.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
