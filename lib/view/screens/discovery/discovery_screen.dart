import 'package:alemneder_ui_kit/view/constants/widget_constants.dart';
import 'package:alemneder_ui_kit/view/utils/hex_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  _DiscoveryScreenState createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(WidgetConstants.DEFAULT_CONTENT_PADDING),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Keşif',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: WidgetConstants.DEFAULT_TITLE_SPACING,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Haftanın sevilenleri!',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.green)),
                  CarouselSlider(
                    items: [
                      //https://cocainemodels.de/wp-content/uploads//2019/09/model-anastasia-seliverstova-fashion-black-white-jeans-jacket.jpg
                      singleCard(
                          imageURL:
                              'https://www.esquireme.com/cloud/2021/09/08/Kendall-Jenner-Best-Model-(3).jpg',
                          like: '23K',
                          comment: '3K'),
                      singleCard(
                          imageURL:
                              'https://cocainemodels.de/wp-content/uploads//2019/09/model-anastasia-seliverstova-fashion-black-white-jeans-jacket.jpg',
                          like: '12K',
                          comment: '287'),
                      singleCard(
                          imageURL:
                              'https://i.pinimg.com/originals/e5/6b/79/e56b799b365e63c41041feb38fb7e965.jpg',
                          like: '2K',
                          comment: '82'),
                    ],
                    options: CarouselOptions(
                        aspectRatio: 1.2, viewportFraction: 0.65),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text('Haftanın konuları',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.cyan)),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      singleDaily(
                          title: 'ArabaNeMarka',
                          dailyTime: '2 saattir gündemde',
                          commentCount: '82K'),
                      singleDaily(
                          title: 'SaçlarımınRengi',
                          dailyTime: '19 saattir gündemde',
                          commentCount: '12K'),
                      singleDaily(
                          title: 'Psikoloji',
                          dailyTime: '2 gündür gündemde',
                          commentCount: '248K'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget singleDaily(
      {required String title,
      required String dailyTime,
      required String commentCount}) {
    return ListTile(
      leading: Text(
        '#',
        style: TextStyle(
            color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Wrap(
        direction: Axis.horizontal,
        spacing: 4.0,
        runSpacing: 4.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            commentCount,
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            '·',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            dailyTime,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget singleCard(
      {required String imageURL,
      required String like,
      required String comment}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Image.network(
              imageURL,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.transparent,
                  Colors.black.withOpacity(0.5)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 4.0,
                      runSpacing: 4.0,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        Icon(FontAwesomeIcons.thumbsUp,
                            color: Colors.green, size: 20),
                        Text(
                          like,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 4.0,
                      runSpacing: 4.0,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        Icon(FontAwesomeIcons.comment,
                            color: Colors.cyan, size: 20),
                        Text(
                          comment,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
