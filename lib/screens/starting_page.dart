import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:projects/screens/login_page.dart';
import 'package:projects/screens/signup_page.dart';
import 'package:projects/utils/size_config.dart';

import '../constants/Colors.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrls = [
      'assets/images/Image.png',
      'assets/images/Image 1.png',
      'assets/images/Image-1.png',
      'assets/images/Image-2.png',
      'assets/images/Image-3.png',
      'assets/images/Image-4.png',
      'assets/images/Image-5.png',
      'assets/images/Image-6.png',
      'assets/images/Image7.png',
    ];
    final screenWidth = MediaQuery.of(context).size.width;

    final isSmallScreen = screenWidth < 400;

    final paddingHorizontal = isSmallScreen ? 16.0 : 24.0;
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.6,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 600 ? 4 : 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(imageUrls[index], fit: BoxFit.cover),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'New Property, New Home!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
              child: const Text(
                'Are you ready to start fresh in a new location?\nPropyrite is here to support you on your journey!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Colors_app.orange_color,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Get.to(LoginPage());
                      },
                      child: const Text('Log in' , style: TextStyle(color: Colors_app.white_color , fontSize: 20),),
                    ),
                  ),

                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFD4AF37),
                        side: const BorderSide(color: Color(0xFFD4AF37)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Get.to(SignUpPage());
                      },
                      child: Text('Sign up', style: TextStyle(fontSize: 20,),),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
