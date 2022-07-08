import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text("Home")),
    NavigationItem(Icon(Icons.favorite_border), Text("Favourite")),
    NavigationItem(Icon(Icons.search), Text("Search")),
    NavigationItem(Icon(Icons.person_outline), Text("Account"))
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return Row(
      children: [item.icon, item.text],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      color: Colors.amber,
      width: MediaQuery.of(context).size.width,
      height: 56,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((e) => _buildItem(e, false)).toList()),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text text;

  NavigationItem(this.icon, this.text);
}
