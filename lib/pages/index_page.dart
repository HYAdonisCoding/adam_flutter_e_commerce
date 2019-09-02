import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int currentIndex = 0;
  var currentPage;
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home), 
      title: Text('Home')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search), 
      title: Text('Search')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart), 
      title: Text('Cart')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled), 
      title: Text('Mine')
    ),
  ];
  final List tabBodies = [HomePage(), CategoryPage(), ShoppingCartPage(), MemberPage()];
  @override
  void initState() { 
    currentPage = tabBodies[currentIndex];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
