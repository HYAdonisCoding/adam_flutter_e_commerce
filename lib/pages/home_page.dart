import 'dart:convert';
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert' show json;

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
              
              print('000=========$data');
              Map<String, dynamic> user = json.decode(data.toString());  
              List<Map> swiperDataList = (user['data']['returnData']['galleryItems'] as List).cast();
              
      
              // print('123==============\n$swiperDataList');
              return Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList,)

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
    return Container(
      height: 200,
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