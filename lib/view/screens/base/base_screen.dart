import 'package:alemneder_ui_kit/view/screens/discovery/discovery_screen.dart';
import 'package:alemneder_ui_kit/view/screens/home/home_screen.dart';
import 'package:alemneder_ui_kit/view/screens/messages/messages_screen.dart';
import 'package:alemneder_ui_kit/view/screens/notification/notification_screen.dart';
import 'package:alemneder_ui_kit/view/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../core/lang/locale_keys.g.dart';
import '../../../core/extensions/string_translate.dart';
import '../../utils/theme_manager.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedPage = 0;
  late PageController _pageController;
  late ThemeManager _themeManager;
  bool _isChangingwithNavBar = false;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              HomeScreen(),
              DiscoveryScreen(),
              NotificationScreen(),
              ProfileScreen()
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 150),
                opacity: _selectedPage != 0 && _selectedPage != 3 ? 1.0 : 0.0,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.grey.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _menuIcons(),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _menuIcons() {
    return [
      IconButton(
        onPressed: () {
          _selectPage(0);
        },
        icon: Icon(
          FontAwesomeIcons.home,
          color: Colors.grey[600],
        ),
      ),
      IconButton(
        onPressed: () {
          _selectPage(1);
        },
        icon: Icon(
          FontAwesomeIcons.search,
          color: _selectedPage == 1 ? Colors.orange : Colors.grey[600],
        ),
      ),
      IconButton(
        onPressed: () {
          _selectPage(2);
        },
        icon: Icon(
          FontAwesomeIcons.bell,
          color: _selectedPage == 2 ? Colors.orange : Colors.grey[600],
        ),
      ),
      IconButton(
        onPressed: () {
          _selectPage(3);
        },
        icon: Icon(
          FontAwesomeIcons.user,
          color: _selectedPage == 3 ? Colors.orange : Colors.grey[600],
        ),
      ),
    ];
  }

  _selectPage(int i) async {
    _isChangingwithNavBar = true;
    setState(() {
      _selectedPage = i;
    });
    await _pageController.animateToPage(_selectedPage,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    _isChangingwithNavBar = false;
  }

  void _onPageChanged(int value) async {
    if (!_isChangingwithNavBar) {
      setState(() {
        _selectedPage = value;
      });
    }
  }
}
