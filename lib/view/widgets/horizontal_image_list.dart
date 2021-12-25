import 'package:alemneder_ui_kit/view/widgets/card_item.dart';
import 'package:flutter/material.dart';

class HorizontalImageList extends StatefulWidget {
  @override
  _HorizontalImageListState createState() => _HorizontalImageListState();
}

class _HorizontalImageListState extends State<HorizontalImageList> {
  final images = [
    "https://i.pinimg.com/originals/1c/31/83/1c3183a86e5a6d4c1ea3e8db6f49ac97.jpg",
    "https://i.pinimg.com/564x/9a/4b/75/9a4b759517691a55756616fa33bcafa0.jpg",
    "https://i.pinimg.com/736x/ab/02/1d/ab021d241b7d08a9d58fef8548e384cf.jpg",
    "https://i.pinimg.com/736x/11/ee/0c/11ee0cc43d5da946e98977342cb39eaa.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.00,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];
            return CardItem(
              imageName: image,
              onTap: () => _onCardClicked(),
            );
          }),
    );
  }

  void _onCardClicked() {}
}