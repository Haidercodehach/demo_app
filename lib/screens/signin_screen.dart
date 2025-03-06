import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final logoSize = screenWidth * 0.3;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.7, 0.7, 1.0],
          colors: [Colors.black, Colors.black, Colors.white, Colors.white],
          // colors: [Colors.black, Colors.white],
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
                    // TOP SECTION WITH BACKGROUND IMAGE
                    Container(
                      width: double.infinity,
                      // AspectRatio ensures a fixed ratio for the background image area
                      child: AspectRatio(
                        aspectRatio:
                            16 / 9, // Adjust ratio as needed (e.g., 3/2, 4/3)
                        child: Stack(
                          children: [
                            // Background image
                            Positioned.fill(
                              child: Image.asset(
                                'image_bg.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            // Dark overlay to improve text visibility
                            // Container(color: Colors.black.withOpacity(0.3)),
                            // Logo, title, and "Create account" prompt
                            SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
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
                                      // Sign in text
                                      const Text(
                                        'Sign in',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      // New User? Create an account
                                      Row(
                                        children: [
                                          const Text(
                                            'New User? ',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16,
                                            ),
                                          ),
                                          MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: GestureDetector(
                                              onTap: () {
                                                // Navigate to Create Account
                                              },
                                              child: const Text(
                                                'Create an account',
                                                style: TextStyle(
                                                  color: Color(0xff43B888),
                                                  fontSize: 16,
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
                            ),
                          ],
                        ),
                      ),
                    ),

                    // FORM SECTION (EMAIL, PASSWORD, SIGN IN BUTTON)
                    Container(
                      // margin: const EdgeInsets.only(top: -20),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
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
                            // Sign In Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle sign in
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff43B888),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      6,
                                    ), // Adjust value as desired
                                  ),
                                ),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontSize: 18,
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
