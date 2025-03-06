import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/pricing_screen.dart';
// import 'screens/verification_screen.dart';
// import 'screens/reset_password_screen.dart';
// import 'screens/password_reset_success_screen.dart';
// import 'screens/create_account_screen.dart';
// import 'screens/verification_success_screen.dart';
// import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/signin': (context) => SignInScreen(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/pricing': (context) => PricingScreen(),
        // '/verification': (context) => VerificationScreen(),
        // '/reset_password': (context) => ResetPasswordScreen(),
        // '/password_reset_success': (context) => PasswordResetSuccessScreen(),
        // '/create_account': (context) => CreateAccountScreen(),
        // '/verification_success': (context) => VerificationSuccessScreen(),
        // '/home': (context) => HomeScreen(),
      },
    );
  }
}
