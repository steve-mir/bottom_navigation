import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  Color backgroundColor = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text("Home")),
    NavigationItem(Icon(Icons.favorite_border), Text("Favourite")),
    NavigationItem(Icon(Icons.search), Text("Search")),
    NavigationItem(Icon(Icons.person_outline), Text("Account"))
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 270),
      height: double.maxFinite,
      width: isSelected ? 120 : 50,
      padding: isSelected ? EdgeInsets.only(left: 8, right: 8) : null,
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(50)))
          : null,
      child: Row(
        children: [
          IconTheme(
            data: IconThemeData(
                size: 24, color: isSelected ? backgroundColor : Colors.black),
            child: item.icon,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8,
            ),
            child: isSelected
                ? DefaultTextStyle(
                    style: TextStyle(color: backgroundColor), child: item.text)
                : Container(
                    width: 0,
                  ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      width: MediaQuery.of(context).size.width,
      height: 56,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((e) {
            var itemIndex = items.indexOf(e);
            return GestureDetector(
              onTap: () => setState(() {
                selectedIndex = itemIndex;
              }),
              child: _buildItem(e, selectedIndex == itemIndex),
            );
          }).toList()),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text text;

  NavigationItem(this.icon, this.text);
}
