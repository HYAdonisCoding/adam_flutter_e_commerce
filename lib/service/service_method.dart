import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

Future getHomePageContent() async {
  try {
    print('Start Request HomePage Data.......');
    Response response;
    Dio dio = new Dio();
    // dio.options.contentType = ContentType.parse('application/json,application/xhtml+xml,application/xml,text/json,text/javascript');
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    
    var formData = {'sexType': '1'};
    response = await dio.post(ServicePath.boutiqueListNew, data: formData);
    if (response.statusCode==200) {
      return response;
    } else {
      throw Exception('The backend interface is abnormal. Please check the code and server status.........');
    }
  } catch(e) {
    if (e.response) {
      print(e.response.data);
      print(e.response.headers);
      print(e.response.request);
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print(e.request);
      print(e.message);
    }
    return print('Error:============$e');
    
  }
}