// lib/features/tracking/pages/tracking_details_page.dart
import 'package:flutter/material.dart';
import 'package:safari_app/src/features/pages/screens/home/trackingDetails/widget/report_issue_field.dart';
import 'package:safari_app/src/features/pages/screens/home/trackingDetails/widget/round_icon_button.dart';
import 'package:safari_app/src/features/pages/screens/home/trackingDetails/widget/tracking_step_model.dart';
import 'package:safari_app/src/features/pages/screens/home/trackingDetails/widget/tracking_summary_card.dart';
import 'package:safari_app/src/features/pages/screens/home/trackingDetails/widget/tracking_timeline.dart';

class TrackingDetailsPage extends StatelessWidget {
  const TrackingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    const orange = Color(0xFFF5A623);
    const bg = Color(0xFFF6F7FB);

    final steps = <TrackingStep>[
      TrackingStep(
        title: "Checking",
        subtitle: "Completed · 10 July, 2025",
        isDone: true,
        isActive: false,
      ),
      TrackingStep(
        title: "Waiting for Pickup",
        subtitle: "Completed · 11 July, 2025",
        isDone: true,
        isActive: false,
      ),
      TrackingStep(
        title: "In Transit",
        subtitle: "On Transit · 11 July, 2025",
        isDone: true,
        isActive: true,
      ),
      TrackingStep(
        title: "Out of Delivery",
        subtitle: "Pending · 12 July, 2025",
        isDone: false,
        isActive: false,
      ),
    ];

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 16),
          child: Column(
            children: [
              // Top bar
              Padding(
                padding: EdgeInsets.only(top: height * 0.05, bottom: 20),
                child: Row(
                  children: [
                    RoundIconButton(
                      icon: Icons.arrow_back_ios_new_rounded,
                      onTap: () => Navigator.maybePop(context),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "Tracking Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ),
                    RoundIconButton(
                      icon: Icons.headset_mic_rounded,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              // Main content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TrackingSummaryCard(
                        code: "#SPX82749231",
                        date: "Ongoing  3 July, 2025",
                        accent: orange,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Tracking History",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF111827),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TrackingTimeline(steps: steps, accent: orange),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Report Issue",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const ReportIssueField(),
                    ],
                  ),
                ),
              ),

              // Submit button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orange,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
