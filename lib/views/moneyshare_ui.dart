import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshare/views/show_moneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyshareUI extends StatefulWidget {
  const MoneyshareUI({Key? key}) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  bool? check_tip = false;

  //สร้างออปเจ็กต์เพื่อนำไปใช้ควบคุม TextField ในหน้าจอที่สร้างไว้
  TextEditingController? money_ctrl = TextEditingController();
  TextEditingController? person_ctrl = TextEditingController();
  TextEditingController? tip_ctrl = TextEditingController();

  //เมธอด -> โค้ดแสดง Dialog เตือน โดยจะรับข้อความมาแสดงที่ Dialog
  showWarningDialog(context, msg) {
    //เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

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
          child: GestureDetector(   //กดหน้าจอแล้วคีบอร์ดจะหายไป
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            behavior: HitTestBehavior.opaque,   //กดหน้าจอแล้วคีบอร์ดจะหายไป
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
                    controller: money_ctrl,
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
                        FontAwesomeIcons.moneyBillWave,
                        color: Color(0xFF7F0CAE),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                    top: 20.0,
                  ),
                  child: TextField(
                    controller: person_ctrl,
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
                      hintText: 'ป้อนจำนวนคน (คน)',
                      hintStyle: TextStyle(
                        color: Color(0xFF9B979C),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFF7F0CAE),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (checked) {
                        setState(() {
                          check_tip = checked;
                          if(checked == false) {
                            tip_ctrl!.text = '';
                          }
                        });
                      },
                      value: check_tip,
                      activeColor: Color(0xFF7F0CAE),
                      checkColor: Colors.yellow,
                      side: BorderSide(
                        color: Color(0xFF7F0CAE),
                      ),
                    ),
                    Text(
                      'ทิปให้พนักงานเสิร์ฟ',
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                    top: 5.0,
                  ),
                  child: TextField(
                    controller: tip_ctrl,
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
                        FontAwesomeIcons.coins,
                        color: Color(0xFF7F0CAE),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    //สร้างตัวแปรเก็บผลลัพธ์ที่ได้จากการคำนวณ
                    double? moneyshare =0;
          
                    //ตรวจสอบและคำนวณ
                    if (money_ctrl!.text.isEmpty) {
                      showWarningDialog(context, 'ป้อนจำนวนเงินด้วย');
                      return;
                    } else if (person_ctrl!.text.length == 0) {
                      showWarningDialog(context, 'ป้อนจำนวนคนด้วย');
                      return;
                    } else if ( check_tip! == false ) {
                      //คำนวณแบบไม่มี tip
                      double? money = double.parse( money_ctrl!.text ) ;
                      int? person = int.parse(person_ctrl!.text) ;
                      moneyshare = money / person ;
                    } else {
                      // ตรวจสอบว่าได้ป้อน tip หรือยัง
                      if (tip_ctrl!.text.isEmpty){
                        showWarningDialog(context, 'ป้อนทิปด้วย...');
                        return;                     
                      } else {
                        //คำนวณแบบมี tip
                        double? money = double.parse( money_ctrl!.text );
                        int? person = int.parse(person_ctrl!.text);
                        double? tip = double.parse( tip_ctrl!.text );
                        moneyshare = (money+tip) / person ;
                      }
                    }
          
                        //ส่งข้อมูลที่ป้อน และที่คำนวณได้ไปแสดงอีกหน้า ShowMoneyshareUI
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>ShowMoneyshareUI(
                              money: double.parse( money_ctrl!.text ),
                              person: int.parse(person_ctrl!.text),
                              tip: double.parse( tip_ctrl!.text.isEmpty ? '0' : tip_ctrl!.text ),
                              moneyshare: moneyshare,
                            ),
                          ),
                        );
                  },
                  child: Text(
                    'คำนวณ',
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 90.0, //กว้าง
                      50.0, //สูง
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50.0,
                      ),
                    ),
                    primary: Color(0xFF7F0CAE),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    //เขียน Logic การทำงานโดยจะเคลียร์ค่าทุกอย่างบนหน้าจอกลับเป้นเหมือนเดิม
                    setState(() {
                      money_ctrl!.text = ''; // ใช้ " " ก็ได้
                      person_ctrl!.text = '';
                      tip_ctrl!.text = '';
                      check_tip = false;
                    });
                  },
                  icon: Icon(
                    Icons.refresh,
                  ),
                  label: Text(
                    'ยกเลิก',
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 90.0,
                      50.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50.0,
                      ),
                    ),
                    primary: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Created by BC SAU 2022',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
