import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TopNavigator extends StatelessWidget {
  final Map comics;

  TopNavigator({Key key, this.comics}): super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    print("name - ${item['name']}");
    return Container(
      child: InkWell(
        onTap: (){ print('点击了导航!');},
        child: Column(
          children: <Widget>[
            Image.network(item['cover'], width:ScreenUtil().setWidth(750/2), height: ScreenUtil().setHeight(200), fit: BoxFit.fill),
            Text(item['name'], style: TextStyle(fontSize: 12, color: Colors.blueGrey,), textAlign: TextAlign.left,),
            Text(item['subTitle'], style: TextStyle(fontSize: 10, color: Colors.grey), textAlign: TextAlign.left)
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    List list = comics['comics'];
    list.map((comic){
      if (comic['']) {
        
      } else {
      }
    });
    print('1============${list[0]['name']}, ${list[0]['subTitle']}, ${list[0]['author_name']}');
    
    if (list.length > 2){
      list = list.sublist(0, 2);
    }
    print('2============${list[1]['name']}, ${list[1]['subTitle']}, ${list[1]['author_name']}');
    print("itemTitle - ${comics['itemTitle']}");
    
    return Container(
      height: ScreenUtil().setHeight(500),
      padding: EdgeInsets.all(3.0),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(comics['itemTitle'], style: TextStyle(fontSize: 14, color: Colors.white10,), textAlign: TextAlign.left,),
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(4.0),
              children: list.map((item){
                return _gridViewItemUI(context, item);
              }).toList(),
            ),
          ],
        )
      )
    );
  }
}

class HomePageWidget extends StatelessWidget {
  final List comicLists;
  
  HomePageWidget({Key key, this.comicLists}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(720),
      width: ScreenUtil.screenWidth,
      child: GridView.count(
        crossAxisCount: 1,
        children: comicLists.map((comic){
          if (comic['comicType']==5){
            return Text(comic['itemTitle']);
          }
          return TopNavigator(comics: comic);
        }).toList(),
      ),
    );
  }
}