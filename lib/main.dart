import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshare/views/moneyshare_ui.dart';

main(){
  runApp(
    
    //เรียก widget หลักของ app
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoneyshareUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
    ),
  );
}