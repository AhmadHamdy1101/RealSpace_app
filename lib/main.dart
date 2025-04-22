import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/screens/home_page.dart';
import 'package:projects/screens/opining_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const supabaseUrl = 'https://calwjbkgqhvskqypgeso.supabase.co';
  const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNhbHdqYmtncWh2c2txeXBnZXNvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk2MTUxODAsImV4cCI6MjA1NTE5MTE4MH0.Hbrsk4AjmtQFj-FjLhQ8rrlksUjWjnrR-Ty5QXdoU9c';


  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
  runApp(const RealSpace());
}

class RealSpace extends StatelessWidget {
  const RealSpace({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "outfit"),
      home: OpiningPage(),
      debugShowCheckedModeBanner: false,

    );
  }
}
