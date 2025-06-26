import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projects/constants/Colors.dart';
import 'package:projects/screens/home_page_screen/screen/home_page.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  int _secondsRemaining = 12;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _otpBox() {
    return TextField(
      decoration: InputDecoration(
        hintText: '**************',
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors_app.orange_color)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    const phoneNumber = "458-465-6466";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                Image.asset(
                  'assets/images/cuate 2.png', // <-- Replace with your image path

                ),
                const SizedBox(height: 40),
                const Text(
                  'Enter OTP',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'An 4 digit OTP has been sent to\n',
                    style: const TextStyle(color: Colors.black87, fontSize: 14),
                    children: [
                      TextSpan(
                        text: phoneNumber,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (_) => _otpBox()),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){ Get.to(HomePage());}      ,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors_app.orange_color,
                      // disabledBackgroundColor: Colors.grey.shade400,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Verify',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                  ),
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    text: 'Resend OTP ',
                    style: const TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: '(${_secondsRemaining.toString().padLeft(2, '0')})',
                        style: const TextStyle(color: Color(0xFFDDAC29)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}