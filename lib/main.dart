import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aldult's Life",
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePagePage createState() => HomePagePage();
}

class HomePagePage extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF21BFBD),
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1565786423298-4bdca4334241?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80'))),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 50.0),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        'Hướng dẫn',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'sử dụng',
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 30.0),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(75.0)),
                  ),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 45.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height - 300.0,
                            child: ListView(
                              children: <Widget>[
                                OptionBox('Dùng Zalo', Colors.lightBlue,
                                    PhoneCall(), Icon(Icons.call)),
                                OptionBox('Nhắn tin', Colors.orange, Texting(),
                                    Icon(Icons.chat)),
                                OptionBox('Đọc tin trên mạng', Colors.green,
                                    Browsing(), Icon(Icons.language)),
                                OptionBox('Dùng Tivi', Colors.blue, MyTV(),
                                    Icon(Icons.live_tv))
                              ],
                            )),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}

class OptionBox extends StatelessWidget {
  final String name;
  final Color mycolor;
  final Object f;
  final Icon myicon;

  const OptionBox(this.name, this.mycolor, this.f, this.myicon);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Material(
            color: Colors.white.withOpacity(0.0),
            child: InkWell(
              highlightColor: mycolor,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => f));
              },
              child: new Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)),
                  margin: EdgeInsets.all(10.0),
                  child: Wrap(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 50.0,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Text(name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      (myicon ?? null)
                    ],
                  )),
            )));
  }
}

class PhoneCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dùng Zalo'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              OptionBox('Gọi điện Zalo', Colors.lightBlue, callZalo(),
                  Icon(Icons.info_outline)),
              OptionBox('Tìm cuộc gọi nhỡ', Colors.lightBlue, missCall(),
                  Icon(Icons.info_outline)),
              OptionBox('Đọc tin nhắn', Colors.lightBlue, readText(),
                  Icon(Icons.info_outline))
            ],
          ),
        ));
  }

  Widget callZalo() {
    return Scaffold(
        appBar: AppBar(title: Text('Gọi điện Zalo')),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 8.0),
              Row(children: <Widget>[
                Text('1, Ấn vào biểu tượng Zalo.',
                    style: TextStyle(fontSize: 25.0)),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.contain, // otherwise the logo will be tiny
                    child: const FlutterLogo(),
                  ),
                )
              ]),
              SizedBox(height: 10.0),
              Text('2, Tìm kiếm ấn vào mũi tên ở phía bên trái.',
                  style: TextStyle(fontSize: 25.0)),
              SizedBox(height: 10.0),
              Text('3, Ấn vào nút gọi.', style: TextStyle(fontSize: 25.0)),
              SizedBox(height: 10.0),
            ],
          ),
          padding: EdgeInsets.all(8.0),
        ));
  }

  Widget missCall() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tìm cuộc gọi nhỡ'),
      ),
      body: Container(
        child: Text('Khi mở máy thì Zalo đã báo ngay cuộc gọi nhỡ',
            style: TextStyle(fontSize: 25.0)),
        padding: EdgeInsets.all(20.0),
      ),
    );
  }

  Widget readText() {
    return Scaffold(
        appBar: AppBar(
          title: Text('Đọc tin nhắn'),
        ),
        body: Container(
            child: Text('Mở máy, bấm Zalo để xem có tin nhắn không.',
                style: TextStyle(fontSize: 25.0)),
            padding: EdgeInsets.all(20.0)));
  }
}

class Texting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Nhắn tin')),
        body: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10.0),
                Text('1, Ấn vào biểu tượng Message.',
                    style: TextStyle(fontSize: 25.0)),
                SizedBox(height: 10.0),
                Text(
                    '''2, Ấn vào biểu tượng loa để nhắn tin. Sau khi nói xong thì tắt loa và ấn nút gửi.

* Lưu ý: tin nhắn soạn kiểu này dễ không chính xác, nên dùng bàn phím
              ''',
                    style: TextStyle(fontSize: 25.0))
              ],
            )));
  }
}

class Browsing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đọc tin trên mạng'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),
            Text('1, Ấn vào biểu tượng Chrome.',
                style: TextStyle(fontSize: 25.0)),
            SizedBox(height: 10.0),
            Text(
                '2, Ấn vào ô tìm kiếm ở trên cùng. Muốn đọc tin gì thì đánh máy bằng bàn phím.',
                style: TextStyle(fontSize: 25.0)),
            SizedBox(height: 10.0),
            Text('3, Ấn vào tin tức muốn đọc để đọc.',
                style: TextStyle(fontSize: 25.0))
          ],
        ),
      ),
    );
  }
}

class MyTV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dùng Tivi'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            OptionBox(
                'Tìm VTV1', Colors.cyan, findVTV(), Icon(Icons.info_outline)),
            OptionBox('Tìm pháp luân công', Colors.cyan, plc(),
                Icon(Icons.info_outline))
          ],
        ),
      ),
    );
  }

  Widget findVTV() {
    return Scaffold(
        appBar: AppBar(title: Text('Tìm VTV1')),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0),
              Text('1, Ấn mạng, ấn phím trái 1 lần.',
                  style: TextStyle(fontSize: 25.0)),
              SizedBox(height: 10.0),
              Text('2, Ấn vào OK.', style: TextStyle(fontSize: 25.0))
            ],
          ),
        ));
  }

  Widget plc() {
    return Scaffold(
        appBar: AppBar(title: Text('Bật pháp luân công')),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0),
              Text('1, Ấn vào mạng, ấn phím phải 1 lần.',
                  style: TextStyle(fontSize: 25.0)),
              SizedBox(height: 10.0),
              Text('2, Ấn giữa 1 lần.', style: TextStyle(fontSize: 25.0)),
              SizedBox(height: 10.0),
              Text('3, Ấn trái 1 lần.', style: TextStyle(fontSize: 25.0)),
              SizedBox(height: 10.0),
              Text('4, Ấn lên 1 lần.', style: TextStyle(fontSize: 25.0)),
              SizedBox(height: 10.0),
              Text('5, Ấn sang phải 1 lần.', style: TextStyle(fontSize: 25.0)),
              SizedBox(height: 10.0),
              Text('6, Ấn OK 2 lần.', style: TextStyle(fontSize: 25.0))
            ],
          ),
        ));
  }
}
