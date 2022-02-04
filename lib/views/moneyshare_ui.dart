import 'package:flutter/material.dart';

class MoneyshareUI extends StatefulWidget {
  const MoneyshareUI({ Key? key }) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCDA8DA),
      appBar: AppBar(
        backgroundColor: Color(0xFF6D2088),
        title: Text(
          'แชร์เงินกันเถอะ',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/banner.png',
                height: 120.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                  top: 40.0,
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF6D2088),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF6D2088),
                      ),
                    ),
                    hintText: 'ป้อนจำนวนเงิน (บาท)',
                    hintStyle: TextStyle(
                      color: Color(0xFF9B979C),
                    ),
                    prefixIcon: Icon(
                      Icons.money_off_csred_outlined,
                      color:  Color(0xFF7F0CAE),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}