import 'package:alemneder_ui_kit/view/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostStyleThree extends StatefulWidget {
  final int id;
  final String? asset;
  final String? title;
  final String? content;
  final String? userPhoto;
  final String username;
  final int likeCount;
  final int unlikeCount;
  final int commentCount;
  final Function()? onLike;
  final Function()? onDislike;
  final Function()? onComment;

  const PostStyleThree(
      {Key? key,
      required this.id,
      this.asset,
      this.title,
      this.content,
      this.userPhoto,
      required this.username,
      required this.likeCount,
      required this.unlikeCount,
      required this.commentCount,
      this.onLike,
      this.onDislike,
      this.onComment})
      : super(key: key);

  @override
  _PostStyleThreeState createState() => _PostStyleThreeState();
}

class _PostStyleThreeState extends State<PostStyleThree> {
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
            Colors.black.withOpacity(0.5),
            Colors.transparent,
            Colors.black.withOpacity(0.5)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        /* Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
        ), */
        Positioned(
          bottom: 0,
          child: SafeArea(
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
                          widget.userPhoto != null
                              ? CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(widget.userPhoto!),
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
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        widget.title ?? '',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        widget.content ?? '',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 280,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Bir şeyler yaz...'),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        FontAwesomeIcons.thumbsUp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(FontAwesomeIcons.thumbsDown,
                          color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
