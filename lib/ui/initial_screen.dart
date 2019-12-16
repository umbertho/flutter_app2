import 'dart:ui';

import 'package:flutter/material.dart';

//import 'package:flutter/scheduler.dart';
//import 'dart:async';
import './palettes_list.dart';
import './color_palette.dart';
import 'package:animator/animator.dart';

class InitialScreen extends StatefulWidget {
  String subtitle, title;
  IconData icon;
  colorPalette colorPal;
  String palette;

  InitialScreen(String title, String subtitle, IconData icon, String palette) {
    this.title = title;
    this.subtitle = subtitle;
    this.icon = icon;
    this.palette = palette;
  }

  @override
  State<StatefulWidget> createState() {
    return new InitialScreenState(
        this.title, this.subtitle, this.icon, this.palette);
  }
}

class InitialScreenState extends State<InitialScreen> {
  int builTimes = 0;
  String subtitle, title;
  IconData icon;
  bool _isLoaded = false;
  colorPalette colorPal;
  paletteList pList = new paletteList();

  InitialScreenState(
      String title, String subtitle, IconData icon, String palette) {
        this.title = title;
        this.subtitle = subtitle;
        this.icon = icon;
        this.colorPal = pList.list[palette];
  }

  @override
  Widget build(BuildContext context) {
    this.builTimes++;
    debugPrint("build() counter: " + this.builTimes.toString());
//    if (!this._isLoaded) {
//      Timer( Duration( seconds: 2), () {
//        this.setState( () {
//          this._isLoaded = true;
//        } );
//      } );
//    }

    if (this._isLoaded == true) {
      return Animator(
//        tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(seconds: 2),
          builder: (Animation anim2) => Opacity(
              opacity: anim2.value,
              child: new Scaffold(
                appBar: new AppBar(
                  backgroundColor: Colors.blue,
                  title: new Text("App"),
                ),
                backgroundColor: Colors.grey.shade300,
                body: new Container(
                  alignment: Alignment.center,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text("Row 1"),
                      new Text("Row 2"),
                    ],
                  ),
                ),
              )));
    } else {
      return Animator(
          tween: Tween<double>(begin: 1, end: 0),
          duration: Duration(seconds: 2),
          endAnimationListener: (State) => {
                this.setState(() => {this._isLoaded = true})
          },
          builder: (Animation anim) => Opacity(
                opacity: anim.value,
                child: new Container(
                    color: this.colorPal.background,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          this.title,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: this.colorPal.header,
                              fontWeight: FontWeight.bold,
                              fontSize: 66,
                              decoration: TextDecoration.none,
                              fontFamily: 'Raleway'),
                        ),
                        new Text(
                          this.subtitle,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: this.colorPal.subtitle,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              fontSize: 33,
                              fontFamily: 'Raleway'),
                        ),
                        Icon(
                          this.icon,
                          color: this.colorPal.icon,
                          size: 55.0,
                        ),
                      ],
                    )),
              ));
    }
  }
}
