import 'package:alemneder_ui_kit/view/widgets/post_style_one.dart';
import 'package:alemneder_ui_kit/view/widgets/post_style_three.dart';
import 'package:alemneder_ui_kit/view/widgets/post_style_two.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          PostStyleOne(
              id: '',
              asset: 'https://wallpapercave.com/wp/wp2089665.jpg',
              userPhoto:
                  'https://thumbs.dreamstime.com/b/smart-person-eyewear-man-official-clothes-stands-against-white-background-studio-165962936.jpg',
              username: 'Buğra Saltuk',
              likeCount: '2,3 Mn',
              unlikeCount: '2,9 B',
              commentCount: '8.4 B',
              title: 'Yeni aracım sizce nasıl?',
              content: 'Yorumlarınızı bekliyorum bir hayırlı olsun alırım :)'),
          PostStyleTwo(
              id: '',
              asset:
                  'https://blog.walls.io/wp-content/uploads/2020/09/Death-to-Stock-Elevate-and-Represent.jpg',
              userPhoto:
                  'https://thumbs.dreamstime.com/b/copyspace-photo-brown-excited-ecstatic-cheerful-cute-charming-nice-girlfriend-black-blogger-wearing-jeans-denim-copyspace-photo-158760219.jpg',
              username: 'Toprak Eylül',
              likeCount: '72,3 B',
              unlikeCount: '898',
              commentCount: '2,2 B',
              title: 'Yeni Art Çalışmam',
              content: 'Bunu sizce sayfalarımda paylaşayım mı?'),
          PostStyleThree(
              id: '',
              userPhoto:
                  'https://i.pinimg.com/originals/50/ac/3f/50ac3fd6a1c5e8ab2cfdd924fd92ec52.jpg',
              username: 'Büşra Sancar',
              likeCount: '7,7 Mn',
              unlikeCount: '13 B',
              commentCount: '98 B',
              title: 'Saçlarımın Yeni Hali',
              content: 'Saçlarım nasıl olmuş?'),
        ],
      ),
    );
  }
}
