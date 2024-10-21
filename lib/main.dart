import 'package:flutter/material.dart';
import 'package:tripbolgguri/tripbolgguri.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bolgguri.dart';
import 'jalgguri.dart';
import 'mukgguri.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tourguide',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('여행친구'),
      ),
      body:SingleChildScrollView( // 스크롤 기능 추가
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // const Spacer(),
              Center(
                child: Image.asset(
                  'assets/earth_white.gif',
                  width: 300,  // 원하는 너비로 변경
                  height: 250, // 원하는 높이로 변경
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => PageOne()),
              //     );
              //   },
              //   child: Text('Go to Page One'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => PageTwo()),
              //     );
              //   },
              //   child: Text('Go to Page Two'),
              // ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bolgguri()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/view_icon.png', // 이미지 경로
                      width: 30, // 아이콘 크기와 유사한 크기 설정
                      height: 30,
                    ),
                    // Icon(Icons.forest), // 원하는 아이콘 추가
                    SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격
                    Text('볼꺼리',style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 60), // 버튼 크기 설정
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mukgguri()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/food_icon.png', // 이미지 경로
                      width: 30, // 아이콘 크기와 유사한 크기 설정
                      height: 30,
                    ),
                    // Icon(Icons.food_bank), // 원하는 아이콘 추가
                    SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격
                    Text('먹꺼리',style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 60), // 버튼 크기 설정
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Jalgguri()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 60), // 버튼 크기 설정
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/hotel_icon.png', // 이미지 경로
                      width: 30, // 아이콘 크기와 유사한 크기 설정
                      height: 30,
                    ),
                    // Icon(Icons.house), // 원하는 아이콘 추가
                    SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격
                    Text('잘꺼리',style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TripBolgguri()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 60), // 버튼 크기 설정
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/car_icon.png', // 이미지 경로
                      width: 30, // 아이콘 크기와 유사한 크기 설정
                      height: 30,
                    ),
                    // Icon(Icons.drive_eta_rounded), // 원하는 아이콘 추가
                    SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격
                    Text('경로볼꺼리',style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
      ),
      body: Center(
        child: Text('This is Page One'),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
      ),
      body: Center(
        child: Text('This is Page Two'),
      ),
    );
  }
}
