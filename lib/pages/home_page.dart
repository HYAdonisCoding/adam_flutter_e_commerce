import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/httpHeaders.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String showText = 'Have not requested remote data yet';


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title:Text('Request remote data')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: _geekbang,
                child: Text('Send Request'),
                padding: EdgeInsets.only(left: 100, right: 100),
              ),
              Text(showText),
            ],
          ),
        ),
      ),
    );
  }

  void _geekbang(){
    print('开始向极客时间请求数据.........');
    getHttp().then((val){
      setState(() {
        showText = val['data'].toString();
      });
    });
  }

  Future getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      dio.options.headers = httpHeaders;
      response = await dio.get('https://time.geekbang.org/serv/v1/column/newAll');
      print(response.data);
      return response.data;
    } catch(e) {
      print(e);
      return e;
    }
  }
}