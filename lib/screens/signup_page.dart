import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constants/Colors.dart';
import 'package:projects/screens/login_page.dart';

import 'forget_password.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isEmailValid = false;

  void _validateEmail(String email) {
    setState(() {
      _isEmailValid = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
      ).hasMatch(email);
    });
  }

  void initState() {
    super.initState();
    _emailController.addListener(() {
      _validateEmail(_emailController.text);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sing Up", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height*0.021,),
              const Text('Phone', style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Example@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors_app.orange_color)),
                  suffixIcon:
                  _isEmailValid
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),
              // Email Field
              const Text('Email', style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Example@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors_app.orange_color)),
                  suffixIcon:
                  _isEmailValid
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              // Password Field
              const Text('Password',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: '**************',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors_app.orange_color)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Text('Re-Enter Password',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: '**************',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors_app.orange_color)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              // Forgot Password


              const SizedBox(height: 50),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors_app.orange_color,
                    foregroundColor: Colors_app.white_color,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
                ),
              ),

              const SizedBox(height: 16),

              // Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I Already have an account ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,),),
                  GestureDetector(
                    onTap: () {
                      Get.to(LoginPage());
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                          color: Colors_app.orange_color,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // OR separator
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('or',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 16),

              // Google Button
              OutlinedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/1298745_google_brand_branding_logo_network_icon.png',
                  width: 20,
                ),
                label: const Text('Continue with Google',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17),),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  side: const BorderSide(color: Colors_app.gray_color),
                  foregroundColor: Colors_app.blcak_color,
                ),
              ),

              const SizedBox(height: 12),

              // Apple Button
              OutlinedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/3225194_app_facebook_logo_media_popular_icon.png',
                  width: 20,
                ),
                label: const Text('Continue with Apple',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17),),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  side: const BorderSide(color: Colors.grey),
                  foregroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
