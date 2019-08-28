import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '欢迎您来到美好人间';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('美好人间'),),
      body: Container(
        height: 1000,
        child: Column(
          children: <Widget>[
            TextField(
              controller: typeController,
              decoration: InputDecoration(
                icon: Icon(Icons.gesture),
                contentPadding: EdgeInsets.all(10.0),
                labelText: '美女类型',
                helperText: '请输入您喜欢的类型'
              ),
              autofocus: false,
            ),
            RaisedButton(
              onPressed: (){
                print('开始选择你喜欢的类型...');
                if (typeController.text.toString()=='') {
                  showDialog(
                    context: context,
                    builder: (context)=>AlertDialog(title: Text('美女类型不能为空!'),)
                  );
                } else {
                  getHttp(typeController.text.toString()).then((val){
                    setState((){
                      print(val['name']);
                      showText=val['name'].toString();
                    });
                  });
                }
              },
              child: Text('选择完毕'),
            ),
            Text(
              showText,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }

  void _choiceActioin() {
    print('开始选择你喜欢的类型...');
    if (typeController.text.toString()=='') {
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(title: Text('美女类型不能为空!'),)
      );
    } else {
      getHttp(typeController.text.toString()).then((val){
        setState((){
          showText=val['data']['name'].toString();
        });
      });
    }
  }

  Future getHttp(String typeText) async {
    try{
      Response response;
      var params = {'name': typeText};
      response = await Dio().get('https://www.easy-mock.com/mock/5d661e58dedc794b6c2f8093/apiphoneweb/dabaojian.do',
            queryParameters: params
          );
      return response.data;
    } catch(e){
      return print(e);
    }
  }
}
