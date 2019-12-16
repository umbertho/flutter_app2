import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './color_palette.dart';

import './palettes_list.dart';

class paletteList{

  var list = new Map();

  paletteList(){
    this.list['cyan']  = new colorPalette(Colors.cyan, Colors.white70, Colors.black12, Colors.black12);
    this.list['orange'] = new colorPalette(Colors.orange, Colors.white, Colors.white70, Colors.amberAccent);
    this.list['green'] = new colorPalette(Colors.lightGreen, Colors.white, Colors.white70, Colors.black26);
  }

}