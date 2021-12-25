import 'package:alemneder_ui_kit/view/widgets/horizontal_image_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const followingButtonColor = const Color(0xFFDFD8C8);
const followingTextButtonColor = const Color(0xFF41444B);

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Image(
          image: NetworkImage('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bW9kZWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
        ),
        Container(
          color: Color.fromRGBO(0, 0, 0, 0.55),
        ),
        _buildBodyData()
      ],
    );
  }

  Widget _buildBodyData() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildUSerName(),
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.centerLeft,
            children: [HorizontalImageList(), _buildPostData()],
          ),
          _buildSocialRow(),
        ],
      ),
    );
  }

  Widget _buildUSerName() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Büşra Nur",
                style: TextStyle(color: Colors.white, fontSize: 40.00)),
            Text("Buralarda Yeni",
                style: TextStyle(color: followingButtonColor, fontSize: 20.00)),
          ],
        ),
      ),
    );
  }

  Widget _buildPostData() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.00),
              bottomRight: Radius.circular(10.00))),
      width: 70,
      height: 110.00,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("4",
              style: TextStyle(color: followingButtonColor, fontSize: 40.00)),
          Text("Gönderi",
              style:
                  TextStyle(color: followingTextButtonColor, fontSize: 15.00))
        ],
      ),
    );
  }

  Widget _buildIconMenu() {
    return GestureDetector(
      onTap: () {
        print("Menu touched");
      },
      child: Icon(Icons.menu),
    );
  }

  Widget _buildIconMore() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {
          print("More touched");
        },
        child: Icon(Icons.more_vert),
      ),
    );
  }

  Widget _buildSocialRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFollowingData(),
          _buildFollowerData(),
          _followingButton(),
          _buildIconMessage(),
        ],
      ),
    );
  }

  Widget _buildFollowingData() {
    return _buildSocialMetaData("2041", "Beğenilme");
  }

  Widget _buildFollowerData() {
    return _buildSocialMetaData("426", "Yorum");
  }

  Widget _buildSocialMetaData(String socialNumber, String socialText) {
    return Column(
      children: [
        Text(socialNumber,
            style: TextStyle(color: Colors.white, fontSize: 30.00)),
        Text(socialText,
            style: TextStyle(color: followingButtonColor, fontSize: 15.00))
      ],
    );
  }

  Widget _followingButton() {
    return RaisedButton(
      onPressed: () {},
      color: followingButtonColor,
      textColor: followingTextButtonColor,
      child: Text("Mesaj At"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.00)),
    );
  }

  Widget _buildIconMessage() {
    return GestureDetector(
      onTap: () {
        print("Message touched");
      },
      child: Icon(
        FontAwesomeIcons.ellipsisV,
        color: Colors.white,
      ),
    );
  }
}
