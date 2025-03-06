import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';
import "pricing_screen.dart";

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    final logoSize = size.width * (isSmallScreen ? 0.3 : 0.2);
    final padding = size.width * (isSmallScreen ? 0.05 : 0.1);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.7, 0.7, 1.0],
          colors: [Colors.black, Colors.black, Colors.white, Colors.white],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // TOP SECTION
                    Container(
                      width: double.infinity,
                      child: AspectRatio(
                        aspectRatio: isSmallScreen ? 16 / 9 : 21 / 9,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'image_bg.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            SafeArea(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: padding,
                                  vertical: size.height * 0.02,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        'logo2.png',
                                        width: logoSize,
                                        height: logoSize,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Sign in',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isSmallScreen ? 32 : 48,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Wrap(
                                      children: [
                                        Text(
                                          'New User? ',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: isSmallScreen ? 16 : 18,
                                          ),
                                        ),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              // Navigate to Create Account
                                            },
                                            child: Text(
                                              'Create an account',
                                              style: TextStyle(
                                                color: const Color(0xff43B888),
                                                fontSize:
                                                    isSmallScreen ? 16 : 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // FORM SECTION
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: isSmallScreen ? double.infinity : 600,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: padding,
                          vertical: size.height * 0.03,
                        ),
                        child: Column(
                          children: [
                            // Email TextField
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'tabish@m2m.com',
                                filled: true,
                                fillColor: Color(
                                  0xFFF6F6F7,
                                ), // This will be the permanent background color
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff43B888),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF6F6F7),
                                  ), // Same color as fillColor
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),
                            // Password TextField
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                filled: true,
                                fillColor: const Color.fromARGB(
                                  255,
                                  246,
                                  246,
                                  247,
                                ),
                                suffixIcon: const Icon(
                                  Icons.remove_red_eye_outlined,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff43B888),
                                  ),
                                ),
                              ),
                            ),
                            // Forgot Password?
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  // Navigate to Forgot Password
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const ForgotPasswordScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Color(0xff43B888)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff43B888),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontSize: isSmallScreen ? 18 : 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Navigate to Pricing
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PricingScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Pricing',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            const Text(' - '),
                            TextButton(
                              onPressed: () {
                                // Navigate to Blog
                              },
                              child: const Text(
                                'Blog',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            const Text(' - '),
                            TextButton(
                              onPressed: () {
                                // Navigate to About
                              },
                              child: const Text(
                                'About',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
