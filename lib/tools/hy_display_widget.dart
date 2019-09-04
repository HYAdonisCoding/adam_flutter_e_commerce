import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class TopNavigator extends StatelessWidget {
  final Map comics;

  TopNavigator({Key key, this.comics}): super(key: key);

  

  Widget _recommedList(BuildContext context, listData) {  

    Widget _gridViewItemUI(BuildContext context, item) {
      return InkWell(
          onTap: (){ print('点击了${listData[item]['name']}!');},
          child: Column(
            children: <Widget>[
              Image.network(listData[item]['cover'], width:ScreenUtil().setWidth(750/2), height: ScreenUtil().setHeight(240), fit: BoxFit.fill),
              Text(listData[item]['name'], style: TextStyle(fontSize: 12, color: Colors.blueGrey,), textAlign: TextAlign.left,),
              Text(listData[item]['subTitle'], style: TextStyle(fontSize: 10, color: Colors.grey), textAlign: TextAlign.left)
            ],
          ),
        );
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listData.length,
        itemBuilder: (context, item){
          return _gridViewItemUI(context, item);
        },
      ),
    );
  }

  Widget _titleWidget(BuildContext context, comic) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10.0, 2.0, 0,5.0),
        decoration: BoxDecoration(
          color:Colors.white,
          border: Border(
            bottom: BorderSide(width:0.5,color:Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Text(
              comic['itemTitle'],
              style:TextStyle(color:Colors.pink)
            ),
            RaisedButton(
              onPressed: (){ print('点击了 更多${comic['itemTitle']}');},
              
            ),

          ],
        )
       
     );
  }
  
  @override
  Widget build(BuildContext context) {
    List list = comics['comics'];
    
    if (list.length > 4){
      list = list.sublist(0, 4);
    }
    
    return Container(
      height: ScreenUtil().setHeight(380),
      padding: EdgeInsets.all(3.0),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _titleWidget(context, comics),
            _recommedList(context, list)
          ],
        )
      )
    );
  }
}

//测试打电话功能
class TestPhone extends StatelessWidget {
  final String image;
  final String phone;
  TestPhone({Key key, this.image, this.phone}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('1'),
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
          if (comic['comicType']==5 || comic['comicType']==9){
            return Text(comic['itemTitle']);
          }
          return TopNavigator(comics: comic);
        }).toList(),
      ),
    );
  }
}