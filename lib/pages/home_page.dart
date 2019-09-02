import 'dart:convert';
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert' show json;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../tools/hy_display_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = 'HomePage';

  @override
  void initState() {
    getHomePageContent().then((val){
      setState(() {
        homePageContent=val.toString();
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title:Text('Car life')),
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot){
            if (snapshot.hasData) {
              
              var data = snapshot.data ;
              
              // print('000=========$data');
              //<String, dynamic>
              Map user = json.decode(data.toString());  
              List<Map> swiperDataList = (user['data']['returnData']['galleryItems'] as List).cast();
              List<Map> comicLists = (user['data']['returnData']['comicLists'] as List).cast();
      
              // print('123==============\n${comicLists[0]}');
              return Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList,),
                  // TopNavigator(navigatorList: (comicLists[0]['comics'] as List).cast()),
                  HomePageWidget(comicLists: comicLists,),
                  

                ],
              );
            } else {
              return Center(child: Text('Loading...'),);
            }
          },
        )
      ),
    );
  }

  
}


// 首页轮播组件
class SwiperDiy extends StatelessWidget {

  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    //  print('设备宽度:${ScreenUtil.screenWidth}');
    //  print('设备高度:${ScreenUtil.screenHeight}');
    //  print('设备像素密度:${ScreenUtil.pixelRatio}');
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.network("${swiperDataList[index]['cover']}", fit: BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination:  new SwiperPagination(),
        autoplay: true,
      )
    );
  }
}