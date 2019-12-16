import 'package:flutter/material.dart';
import './palettes_list.dart';
import './color_palette.dart';

class WelcomeScreen extends StatelessWidget{
  String subtitle, title;
  IconData icon;
  colorPalette colorPal;
  paletteList pList = new paletteList();

  WelcomeScreen(String title, String subtitle, IconData icon, String palette){
    this.title = title;
    this.subtitle = subtitle;
    this.icon = icon;
    this.colorPal = pList.list[palette];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: this.colorPal.background,
        child:
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              this.title,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: this.colorPal.header,
                  fontWeight: FontWeight.bold,
                  fontSize:   66,
                  decoration: TextDecoration.none,
                  fontFamily: 'Raleway'
              ),
            ),
            new Text(
              this.subtitle,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: this.colorPal.subtitle,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize:   33,
                  fontFamily: 'Raleway'
              ),
            ),
            Icon(
              this.icon,
              color: this.colorPal.icon,
              size: 55.0,
            ),
          ],
        )
    );
  }

}