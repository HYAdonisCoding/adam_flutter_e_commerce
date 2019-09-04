import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:amap_base/amap_base.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  AMapController _controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'People Living',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),//(primaryColor: Colors.pink),
        home: _myMapView()//IndexPage(),
      ),
    );
  }

  Widget _myMapView() {
    return AMapView(
      onAMapViewCreated: (controller){
        _controller = controller;
      },
      amapOptions: AMapOptions(
        compassEnabled: false,
        zoomControlsEnabled: true,
        logoPosition: LOGO_POSITION_BOTTOM_LEFT,
        camera: CameraPosition(
          target: LatLng(41.851827, 112.801637),
          zoom: 4,
        )
      ),
    );
  }
}
