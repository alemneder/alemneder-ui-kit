import 'package:alemneder_ui_kit/core/utils/enums.dart';
import 'package:alemneder_ui_kit/view/widgets/bottom_sheet_divider.dart';
import 'package:alemneder_ui_kit/view/widgets/comment_widget.dart';
import 'package:alemneder_ui_kit/view/widgets/post_style_one.dart';
import 'package:alemneder_ui_kit/view/widgets/post_style_three.dart';
import 'package:alemneder_ui_kit/view/widgets/post_style_two.dart';
import 'package:alemneder_ui_kit/view/widgets/reply_widget.dart';
import 'package:alemneder_ui_kit/view/widgets/survey_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedVote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          PostStyleOne(
              id: 0,
              asset: 'https://wallpapercave.com/wp/wp2089665.jpg',
              userPhoto:
                  'https://thumbs.dreamstime.com/b/smart-person-eyewear-man-official-clothes-stands-against-white-background-studio-165962936.jpg',
              username: 'Buğra Saltuk',
              voteType: PostVoteType.Idle,
              likeCount: 2303,
              unlikeCount: 2990,
              commentCount: 8458,
              onComment: _showComment,
              title: 'Yeni aracım sizce nasıl?',
              content: 'Yorumlarınızı bekliyorum bir hayırlı olsun alırım :)'),
          PostStyleTwo(
              id: 2,
              asset:
                  'https://blog.walls.io/wp-content/uploads/2020/09/Death-to-Stock-Elevate-and-Represent.jpg',
              userPhoto:
                  'https://thumbs.dreamstime.com/b/copyspace-photo-brown-excited-ecstatic-cheerful-cute-charming-nice-girlfriend-black-blogger-wearing-jeans-denim-copyspace-photo-158760219.jpg',
              username: 'Toprak Eylül',
              voteType: PostVoteType.Idle,
              likeCount: 73817,
              unlikeCount: 898,
              commentCount: 2291,
              title: 'Yeni Art Çalışmam',
              content: 'Bunu sizce sayfalarımda paylaşayım mı?'),
          PostStyleThree(
              id: 3,
              userPhoto:
                  'https://i.pinimg.com/originals/50/ac/3f/50ac3fd6a1c5e8ab2cfdd924fd92ec52.jpg',
              username: 'Büşra Sancar',
              likeCount: 7865,
              unlikeCount: 135,
              commentCount: 337,
              title: 'Saçlarımın Yeni Hali',
              content: 'Saçlarım nasıl olmuş?'),
          SurveyStyle(
            id: 4,
            userPhoto:
                'https://i.pinimg.com/originals/50/ac/3f/50ac3fd6a1c5e8ab2cfdd924fd92ec52.jpg',
            username: 'Cansu Akyol',
            title: 'Sizce dolar artar mı?',
            content: 'Dolar aldı başını gidiyor sizce ne olur?',
            options: ['Artar', 'Düşer', 'Olduğu gibi kalır', 'Yorumsuz'],
            optionsCount: [80, 15, 0, 5],
            voteCount: 100,
            votedOption: selectedVote,
            onVoted: (vote) {
              setState(() {
                selectedVote = vote;
              });
            },
          ),
        ],
      ),
    );
  }

  void _showComment() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      elevation: 4.0,
      context: context,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetDivider(),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4.0,
              runSpacing: 4.0,
              children: [
                Text('Yorumlar', style: Theme.of(context).textTheme.headline5),
                Text('·'),
                Text('786 adet')
              ],
            ),
          ),
          SizedBox(),
          Expanded(
            child: ListView(
              children: [
                CommentWidget(
                  profileURL:
                      'https://thumbs.dreamstime.com/b/smart-person-eyewear-man-official-clothes-stands-against-white-background-studio-165962936.jpg',
                  content: 'Bence araba gayet güzel duruyor.',
                  username: '@berkancinar',
                  date: '2 saat önce',
                  emotionType: 1,
                  replies: [
                    ReplyWidget(
                      profileURL:
                          'https://img.donanimhaber.com/images/haber/137434/1400x1050lucifer-in-6-sezonundan-fragman-geldi.jpg',
                      content: 'Bu araba cidden güzel ya',
                      username: '@lucifer',
                      date: '2 saat önce',
                    ),
                  ],
                ),
                CommentWidget(
                    profileURL:
                        'https://thumbs.dreamstime.com/b/copyspace-photo-brown-excited-ecstatic-cheerful-cute-charming-nice-girlfriend-black-blogger-wearing-jeans-denim-copyspace-photo-158760219.jpg',
                    content:
                        'Şu tür arabaların nesini seviyorsunuz anlamadım gitti!',
                    username: '@tufancik',
                    date: '7 saat önce',
                    emotionType: -1),
                CommentWidget(
                    profileURL:
                        'https://i.pinimg.com/originals/50/ac/3f/50ac3fd6a1c5e8ab2cfdd924fd92ec52.jpg',
                    content: 'İdare eder yani.',
                    username: '@gamzetutar',
                    date: '10 saat önce',
                    emotionType: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }

/*   AnimatedContainer _singleComment(
      {required String profileURL,
      required String username,
      required String content,
      required String date,
      required int emotionType}) {
    var isOpenReplies = false;
    return 
  } */

}
