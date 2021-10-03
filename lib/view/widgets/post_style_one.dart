import 'package:alemneder_ui_kit/core/utils/enums.dart';
import 'package:alemneder_ui_kit/view/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostStyleOne extends StatefulWidget {
  final int id;
  final String? asset;
  final String? title;
  final String? content;
  final String? userPhoto;
  final String username;
  final int likeCount;
  final int unlikeCount;
  final int commentCount;
  final PostVoteType voteType;
  final Function()? onLike;
  final Function()? onDislike;
  final Function()? onComment;
  final Function()? onShare;
  final Function()? onOptions;

  const PostStyleOne(
      {Key? key,
      required this.id,
      this.asset,
      required this.title,
      this.content,
      required this.userPhoto,
      required this.username,
      required this.voteType,
      required this.likeCount,
      required this.unlikeCount,
      required this.commentCount,
      this.onLike,
      this.onDislike,
      this.onOptions,
      this.onShare,
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
        widget.asset != null
            ? Image.network(widget.asset!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover)
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      HexColor('#C04848'),
                      HexColor('#480048'),
                    ],
                  ),
                ),
              ),
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
                        InkWell(
                          onTap: widget.onLike,
                          child: Icon(
                            FontAwesomeIcons.thumbsUp,
                            color: widget.voteType == PostVoteType.Like
                                ? Colors.orange
                                : Colors.black,
                          ),
                        ),
                        Text(
                          widget.likeCount.toString(),
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
                      children: [
                        InkWell(
                          onTap: widget.onDislike,
                          child: Icon(
                            FontAwesomeIcons.thumbsDown,
                            color: widget.voteType == PostVoteType.Dislike
                                ? Colors.orange
                                : Colors.black,
                          ),
                        ),
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
                        InkWell(
                          onTap: widget.onComment,
                          child: const Icon(FontAwesomeIcons.comment),
                        ),
                        Text(
                          widget.commentCount.toString(),
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
                      children: [
                        InkWell(
                          onTap: widget.onShare,
                          child: Icon(FontAwesomeIcons.share),
                        ),
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
                      children: [
                        InkWell(
                          onTap: widget.onOptions,
                          child: Icon(FontAwesomeIcons.ellipsisV),
                        ),
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
                    widget.title ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    widget.content ?? '',
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
                      widget.userPhoto != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(widget.userPhoto!),
                              radius: 15,
                            )
                          : Container(),
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
