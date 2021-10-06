import 'package:alemneder_ui_kit/view/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SurveyStyle extends StatefulWidget {
  final int id;
  final String? asset;
  final String? title;
  final String? content;
  final String? userPhoto;
  final String username;
  final int? voteCount;
  final int? votedOption;
  final List<String> options;
  final List<int>? optionsCount;
  final Function(int)? onVoted;
  final Function()? onShare;
  final Function()? onOptions;

  const SurveyStyle(
      {Key? key,
      required this.id,
      this.asset,
      this.title,
      this.content,
      this.userPhoto,
      required this.username,
      this.voteCount,
      this.votedOption,
      required this.options,
      this.optionsCount,
      this.onVoted,
      this.onShare,
      this.onOptions})
      : super(key: key);

  @override
  _SurveyStyleState createState() => _SurveyStyleState();
}

class _SurveyStyleState extends State<SurveyStyle> {
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
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 4.0,
                      runSpacing: 4.0,
                      children: [
                        Text(
                          widget.title ?? '',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        widget.voteCount != null && widget.voteCount! > 0
                            ? Text(
                                '· ${widget.voteCount!} Oy',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            : Container()
                      ],
                    ),
                    Text(
                      widget.content ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SafeArea(
                top: false,
                child: Column(
                  children: _getOptions(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _getOptions() {
    var widgetList = <Widget>[];
    widget.options.asMap().forEach((index, option) {
      widgetList.add(
        InkWell(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          onTap: () {
            if (widget.onVoted != null) widget.onVoted!(index);
          },
          child: Stack(
            children: [
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 8.0),
                width: MediaQuery.of(context).size.width * 0.77,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.votedOption != null && widget.votedOption == index
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                FontAwesomeIcons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: Text(
                          option,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      widget.votedOption != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                widget.optionsCount![index].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: 50,
                margin: EdgeInsets.only(top: 8.0),
                width: widget.votedOption != null
                    ? _getVoteShadowWidth(index, option)
                    : 0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
    return widgetList;
  }

  double _getVoteShadowWidth(int index, String option) {
    if (widget.voteCount != null &&
        widget.voteCount! > 0 &&
        widget.optionsCount != null &&
        index < widget.optionsCount!.length) {
      var votePercent = widget.optionsCount![index] / widget.voteCount!;
      print('VOTE PERCENT : $votePercent');
      return ((MediaQuery.of(context).size.width * 0.77) * votePercent);
    } else
      return 0;
  }
}
