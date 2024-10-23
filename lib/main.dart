import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripbolgguri/tripbolgguri.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bolgguri.dart';
import 'jalgguri.dart';
import 'mukgguri.dart';
import 'KeywordBolgguri.dart';
import 'package:google_fonts/google_fonts.dart';

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
  bool _isTextVisible = false; // 텍스트 가시성 상태 관리

  void _toggleTextVisibility() {
    setState(() {
      _isTextVisible = !_isTextVisible; // 버튼 클릭 시 텍스트의 가시성 토글
    });
  }

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
        title: Text('여행친구',
                    style: GoogleFonts.eastSeaDokdo(
                      fontSize: 48,
                      fontWeight: FontWeight.w300,
                      textStyle: TextStyle(color: Colors.blue, letterSpacing: 5.5),
                    ),
          // style: GoogleFonts(),
          // googleFonts.pacifico( // Pacifico 폰트 사용
          //   fontSize: 25.0, // 폰트 크기
          //   color: Colors.white, // 텍스트 색상
          // ),
            // style: TextStyle(
            //   fontSize: 20.0, // 폰트 크기
            //   fontWeight: FontWeight.bold, // 굵은 글씨
            //   color: Colors.white, // 텍스트 색상
            //   shadows: [
            //     Shadow(
            //       color: Colors.black54, // 그림자 색상
            //       offset: Offset(2.0, 2.0), // 그림자 위치
            //       blurRadius: 4.0, // 그림자 흐림 정도
            //     ),
            //   ],
            // ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite,color: Colors.red, size: 25.0),
            onPressed: _toggleTextVisibility, // 버튼을 눌렀을 때 텍스트 입력 창 보여주기
          ),
           // SizedBox(width:0), // 간격 조정 (0으로 설정하면 간격이 없게됨)
          TextButton(
            child: Text('Donate', style: TextStyle(fontSize: 20.0,color: Colors.red)),
            onPressed: _toggleTextVisibility, // 버튼 클릭 시 텍스트 토글
          ),
        ],
      ),
      body:SingleChildScrollView( // 스크롤 기능 추가
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              // Padding(
              //   padding: EdgeInsets.all(16.0), // 모든 방향에 16픽셀 패딩
              //   child: SelectableText('선택 가능한 텍스트'),
              // )
            children: <Widget>[
              if (_isTextVisible) // 가시성에 따라 텍스트 표시 여부 결정
              Padding(
                // padding: EdgeInsets.all(25.0), // 모든 방향에 16픽셀 패딩
                padding: EdgeInsets.symmetric(horizontal: 30.0), // 좌우에만 패딩
                child: SelectableText(' 앱에 만족하시면 더 많은 프로그램을 개발할수 있도록 '
                    '백수개발자를 지원해 주세요.^^\n'
                    '- 우리은행 신동철\n'
                    '022-204590-02-101\n'
                    '앱 관련 문의: bluelegend75@gmail.com',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,),
              ),
              if(MediaQuery.of(context).size.height<=700)
              Center(
                child: Image.asset(
                  'assets/earth_white.gif',
                  width: 200,  // 원하는 너비로 변경
                  height: 200, // 원하는 높이로 변경
                )
              ),
              if(MediaQuery.of(context).size.height>700)
              Center(
                child: Image.asset(
                'assets/earth_white.gif',
                width: 350,  // 원하는 너비로 변경
                height: 350, // 원하는 높이로 변경
                )
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
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KeywordBolgguri()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 60), // 버튼 크기 설정
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search), // 원하는 아이콘 추가
                    SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격
                    Text('키워드 검색',style: TextStyle(fontSize: 30),
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
