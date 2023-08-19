import 'package:flutter/material.dart';
import 'package:temp/cellframe.dart';
import 'package:temp/farrenframe.dart';

void main() async{

  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'cellframe',
    routes:{ 'cellframe':(contex)=>MyCell(),
      'farrenframe':(contex)=>MyFarren() },
  ),);
}