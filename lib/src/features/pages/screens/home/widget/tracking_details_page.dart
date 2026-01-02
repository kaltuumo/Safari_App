import 'package:flutter/material.dart';

class TrackingDetailsPage extends StatelessWidget {
  const TrackingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    const orange = Color(0xFFF5A623);
    const bg = Color(0xFFF6F7FB);
    // const cardShadow = [
    //   BoxShadow(
    //     color: Color(0x14000000),
    //     blurRadius: 18,
    //     offset: Offset(0, 10),
    //   ),
    // ];

    final steps = <_TrackingStep>[
      _TrackingStep(
        title: "Checking",
        subtitle: "Completed · 10 July, 2025",
        isDone: true,
        isActive: false,
      ),
      _TrackingStep(
        title: "Waiting for Pickup",
        subtitle: "Completed · 11 July, 2025",
        isDone: true,
        isActive: false,
      ),
      _TrackingStep(
        title: "In Transit",
        subtitle: "On Transit · 11 July, 2025",
        isDone: true,
        isActive: true,
      ),
      _TrackingStep(
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
                    _RoundIconButton(
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
                    _RoundIconButton(
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
                      // Tracking summary card
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                color: orange.withOpacity(0.14),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.inventory_2_outlined,
                                color: orange,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "#SPX82749231",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: orange,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Ongoing  3 July, 2025",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF111827),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Tracking history card
                      Container(
                        padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tracking History",
                              style: TextStyle(
                                fontSize: 16, // <-- wayn
                                fontWeight: FontWeight.bold, // <- font normal
                                color: const Color(0xFF111827),
                              ),
                            ),
                            const SizedBox(height: 12),
                            _TrackingTimeline(steps: steps, accent: orange),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Report Issue
                      const Text(
                        "Report Issue",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Write your issue here...",
                            hintStyle: const TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: const EdgeInsets.all(14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom submit button
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

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _RoundIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(999),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 14,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Icon(icon, size: 18, color: const Color(0xFF111827)),
      ),
    );
  }
}

class _TrackingTimeline extends StatelessWidget {
  final List<_TrackingStep> steps;
  final Color accent;

  const _TrackingTimeline({required this.steps, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (i) {
        final s = steps[i];
        final isLast = i == steps.length - 1;

        final dotBorder = s.isDone ? accent : const Color(0xFFD1D5DB);

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left timeline rail
            SizedBox(
              width: 26,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: s.isDone ? accent.withOpacity(0.22) : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: dotBorder, width: 2),
                    ),
                    child: s.isDone
                        ? Center(
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF5A623),
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        : null,
                  ),
                  if (!isLast)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 38,
                      width: 2,
                      color: const Color(0xFFE5E7EB),
                    ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // Right content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.title,
                      style: TextStyle(
                        fontSize: 17, // <-- wayn
                        fontWeight: FontWeight.normal, // <- font normal
                        color: s.isActive
                            ? const Color(0xFF111827)
                            : const Color(0xFF374151),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      s.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _TrackingStep {
  final String title;
  final String subtitle;
  final bool isDone;
  final bool isActive;

  const _TrackingStep({
    required this.title,
    required this.subtitle,
    required this.isDone,
    required this.isActive,
  });
}
