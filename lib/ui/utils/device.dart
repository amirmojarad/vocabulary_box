import 'package:flutter/material.dart';

class Device {
  double width;
  double height;
  Orientation orientation;

  Device(BuildContext context) {
    this.width = MediaQuery.of(context).size.width;
    this.height = MediaQuery.of(context).size.height;
    this.orientation = MediaQuery.of(context).orientation;
  }
}
