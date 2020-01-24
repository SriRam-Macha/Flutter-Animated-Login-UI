import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loginui/Widgets/LoginCard.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
      width: 16.0,
      height: 16,
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.black)),
      child: isSelected
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            )
          : Container());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff121212),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: new FlareActor(
              'assets/sd.flr',
              animation: 'peace',
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(180),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 250, horizontal: 16),
            child: FormCard(),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(40),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 320, left: 8),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: _radio,
                  child: radioButton(_isSelected),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Remember Me",
                  style: TextStyle(fontSize: 12, fontFamily: "Poppins-Medium"),
                ),
              ],
            ),
          ),
          Positioned(
            width: 110,
            height: 50,
            left: 250,
            bottom: 40,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Card(
                elevation: 10,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text("LOGIN",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins-Bold",
                              fontSize: 18,
                              letterSpacing: 1.0)),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
