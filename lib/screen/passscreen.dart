import 'package:bahonar_shiraz1400/screen/homescreen.dart';
import 'package:bahonar_shiraz1400/screen/main_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: SafeArea(child: SingleChildScrollView(child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: [
            Text('رمز عبور را وارد کنید',style: TextStyle(color: Colors.white)),
            SizedBox(height: 10,),
            TextField(

            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Get.to(Homescreen());
            }, child: Text('ورود'))
          ],
        ),
      ),
    ),)),);
  }
}
