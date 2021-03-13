import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debouncer
{
  int milisecs;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milisecs});

  run(VoidCallback action){
    if(null != _timer){
      _timer.cancel();
    }
    _timer = Timer(Duration(microseconds: milisecs),action);
  }
}