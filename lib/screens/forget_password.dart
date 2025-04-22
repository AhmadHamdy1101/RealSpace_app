import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constants/Colors.dart';
import 'package:projects/screens/verify_page.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = false;

  void _validateEmail(String email) {
    setState(() {
      _isEmailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email);
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      _validateEmail(_emailController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/cuate.png',

            ),
            const SizedBox(height: 30),

            // Heading
            const Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              "Don’t worry! It happens. Please enter the phone number associated with your account",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Email field
            const Text('Email',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Example@gmail.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors_app.orange_color)),
                suffixIcon: _isEmailValid
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : null,
              ),
            ),

            const SizedBox(height: 30),

            // Get OTP Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){ Get.to(VerifyScreen());}      ,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors_app.orange_color,
                  // disabledBackgroundColor: Colors.grey.shade400,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Get OTP',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
