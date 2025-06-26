import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:projects/constants/Colors.dart';
import 'package:projects/constants/constatnts.dart';
import 'package:projects/screens/auth/screen/signup_page.dart';
import 'package:projects/screens/auth/screen/viewmodel/authentication_cubit.dart';
import 'package:projects/screens/home_page_screen/screen/home_page.dart';
import 'package:projects/screens/home_page_screen/screen/viewmodel/home_page_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    var cubit = context.read<AuthenticationCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height*0.1,),
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

              const SizedBox(height: 8),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(ForgotPasswordScreen());
                  },
                  child: const Text(
                    'forgot password?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 8),

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
                  onPressed: () {
                    cubit.signin(context, _emailController, _passwordController) ;
                  },
                  child: const Text('Log in',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
                ),
              ),

              const SizedBox(height: 16),

              // Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,),),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignUpPage());
                    },
                    child: const Text(
                      'Sign Up',
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
          );
  },
),
        ),
      ),
    );
  }
}
