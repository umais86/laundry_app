import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:par_1/providers/cart_provider.dart';
import 'package:par_1/view/welcome.dart';
import 'package:par_1/auth/login.dart';
import 'package:par_1/widgets/nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: MaterialApp(
        title: 'Laundry App',
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/login': (context) => const Login(),
          '/main': (context) => const NavBar(),
        },
      ),
    );
  }
}
