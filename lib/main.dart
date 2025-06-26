import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:projects/screens/auth/screen/login_page.dart';
import 'package:projects/screens/auth/screen/viewmodel/authentication_cubit.dart';
import 'package:projects/screens/home_page_screen/screen/home_page.dart';
import 'package:projects/screens/home_page_screen/screen/viewmodel/home_page_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'constants/constatnts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageCubit()..fetchData(),),
        BlocProvider(create: (context) => AuthenticationCubit(),),
      ],
      child: GetMaterialApp(
        theme: ThemeData(fontFamily: "outfit"),
        home: CurrentUser != null ?  HomePage() : LoginPage(),
        debugShowCheckedModeBanner: false,

      ),
    );
  }
}
