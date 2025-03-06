import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  final Color color;
  final double dashWidth;
  final double dashGap;
  final double thickness;

  const DashedDivider({
    Key? key,
    required this.color,
    required this.dashWidth,
    required this.dashGap,
    required this.thickness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final dashCount = (width / (dashWidth + dashGap)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return Container(width: dashWidth, height: thickness, color: color);
          }),
        );
      },
    );
  }
}

class PricingScreen extends StatelessWidget {
  const PricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 1200;
    final isMediumScreen = size.width > 800 && size.width <= 1200;

    // Adjust container width based on screen size
    final contentWidth =
        isLargeScreen
            ? size.width * 0.7
            : isMediumScreen
            ? size.width * 0.8
            : size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          // Center the content
          child: Container(
            constraints: BoxConstraints(maxWidth: contentWidth),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 80,
                      left: 16,
                      right: 16,
                    ),
                    child: Row(
                      children: [
                        // Back icon button
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF43B888),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        // Centered title
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'PRICING - UNITED STATES',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Legacy Plan',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                              ],
                            ),
                          ),
                        ),
                        // Spacer to balance the row
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),
                  // Wrap pricing cards in Row for large screens
                  if (isMediumScreen || isLargeScreen)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildLegacyPlanCard()),
                          const SizedBox(width: 24),
                          Expanded(child: _buildBookPlanCard()),
                        ],
                      ),
                    )
                  else
                    Column(
                      children: [_buildLegacyPlanCard(), _buildBookPlanCard()],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLegacyPlanCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF43B888), // Adjust green shade
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'START NOW (3 FREE TRIAL)',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Price: "$7.99 / month"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              '\$7.99 / month',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Billing info: "Billed after 3 weeks..."
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Available for 2 weeks',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                SizedBox(height: 6),
                Text(
                  "Take a walk through your past to pull out the pillars that will shape your loved one's future.",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: DashedDivider(
              color: Colors.white.withOpacity(0.5),
              dashWidth: 5,
              dashGap: 3,
              thickness: 1,
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Origin Story Includes:',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          // Feature list
          _buildFeatureRow('Weekly Legacy Questions (70+)'),
          _buildFeatureRow('Access to digitally store your memories'),
          _buildFeatureRow('Send advice and gifts (triggered by dates)'),
          _buildFeatureRow('Create Hardbound Book (extra cost to print)'),
          _buildFeatureRow('300 GB of storage (more storage available)'),
          const SizedBox(height: 16),
          // Pay Now button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  // TODO: Handle "Pay now"
                },
                child: Text(
                  'Buy now',
                  style: TextStyle(
                    color: const Color(0xFF43B888),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookPlanCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'BUY BOOKS',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Price: "$79.95 / month"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              '\$79.95 / month',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Billing info: "One time purchase"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              'Once subscribed to the monthly plan, answer our legacy questions and print them as books.',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: DashedDivider(
              color: Colors.white.withOpacity(0.5),
              dashWidth: 5,
              dashGap: 3,
              thickness: 1,
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Hardbound Book Specs (unlimited)',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          // Feature list
          _buildFeatureRow(
            'Hardbound Book / Full Color',
            textColor: Colors.white,
            iconColor: const Color(0xFF43B888),
          ),
          _buildFeatureRow(
            'Size: 8.3 x 8.3 in',
            textColor: Colors.white,
            iconColor: const Color(0xFF43B888),
          ),
          _buildFeatureRow(
            'Paper: Mohawk Superfine Eggsgell Ultrawhite',
            textColor: Colors.white,
            iconColor: const Color(0xFF43B888),
          ),
          _buildFeatureRow(
            'Binding: Perfect bound',
            textColor: Colors.white,
            iconColor: const Color(0xFF43B888),
          ),
          _buildFeatureRow(
            'Up to 300 pages',
            textColor: Colors.white,
            iconColor: const Color(0xFF43B888),
          ),
          const SizedBox(height: 16),
          // Buy Now button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF43B888),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  // TODO: Handle "Buy now"
                },
                child: const Text(
                  'Buy now',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Helper method to build a single feature row with an icon and text.
  Widget _buildFeatureRow(
    String text, {
    Color textColor = Colors.white,
    Color iconColor = Colors.white,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline, color: iconColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: TextStyle(color: textColor, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
