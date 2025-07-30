import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:par_1/auth/login.dart';
import 'package:par_1/providers/cart_provider.dart';
// import 'package:par_1/view/welcome.dart';
// import 'package:par_1/auth/sign_up.dart';
// import 'package:par_1/widgets/nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Laundry App',
            theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              // '/': (context) => const WelcomeScreen(),
              // '/signup': (context) => const SignUp(),
              '/': (context) => const Login(),
              // '/main': (context) => const NavBar(),
            },
          );
        },
      ),
    );
  }
}
