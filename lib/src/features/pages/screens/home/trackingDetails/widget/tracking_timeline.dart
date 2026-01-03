// lib/features/tracking/widgets/tracking_timeline.dart
import 'package:flutter/material.dart';
import 'package:safari_app/src/features/pages/screens/home/trackingDetails/widget/tracking_step_model.dart';

class TrackingTimeline extends StatelessWidget {
  final List<TrackingStep> steps;
  final Color accent;

  const TrackingTimeline({
    super.key,
    required this.steps,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (i) {
        final step = steps[i];
        final isLast = i == steps.length - 1;
        final dotBorder = step.isDone ? accent : const Color(0xFFD1D5DB);

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
                      color: step.isDone
                          ? accent.withOpacity(0.22)
                          : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: dotBorder, width: 2),
                    ),
                    child: step.isDone
                        ? Center(
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                color: accent,
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
                      step.title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: step.isActive
                            ? const Color(0xFF111827)
                            : const Color(0xFF374151),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      step.subtitle,
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
