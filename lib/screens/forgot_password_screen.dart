import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        // Set a white background to match the screenshot
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Top section with background image
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image_bg.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    // Add a semi-transparent overlay to ensure text visibility
                    decoration: BoxDecoration(
                      // color: Colors.black.withOpacity(0.1), // Add white overlay
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Please enter your email or phone number to get\nreset password link',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              height: 1.5, // Add line height
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Spacing before the input field
                const SizedBox(height: 20),

                // Email/Phone TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'tabish@m2m.com',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),

                // Spacing before the button
                const SizedBox(height: 20),

                // Send reset link button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // If you need a specific color for the button,
                        // set it here with backgroundColor:
                        // primary: Colors.black,
                      ),
                      onPressed: () {
                        // TODO: Handle button press
                      },
                      child: const Text(
                        'Send reset link',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),

                // Extra spacing at the bottom (if needed)
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
