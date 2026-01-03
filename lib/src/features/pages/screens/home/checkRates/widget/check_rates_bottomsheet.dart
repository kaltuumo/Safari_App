import 'package:flutter/material.dart';

enum DeliveryType { regular, cargo, express }

Future<DeliveryType?> showCheckRatesBottomSheet(BuildContext context) {
  DeliveryType? selected;
  return showModalBottomSheet<DeliveryType>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle
                  Container(
                    width: 56,
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E7EB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    "Check Rates",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Pickup / Destination Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _PlaceBlock(
                          label: "Pickup",
                          city: "Mogadishu,Somalia",
                          code: "MGQ",
                          alignEnd: false,
                        ),
                      ),

                      // Swap button
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDECEC),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.swap_horiz_rounded,
                          color: Color(0xFFEF4444),
                          size: 22,
                        ),
                      ),

                      Expanded(
                        child: _PlaceBlock(
                          label: "Destination",
                          city: "Nairobi,Kenya",
                          code: "NBO",
                          alignEnd: true,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Stats row
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: _StatCell(
                            title: "Parcel",
                            subtitle: "Shipping Type",
                            showRightDivider: true,
                          ),
                        ),
                        Expanded(
                          child: _StatCell(
                            title: "1",
                            subtitle: "Quantity",
                            showRightDivider: true,
                          ),
                        ),
                        Expanded(
                          child: _StatCell(
                            title: "13.5 Kg",
                            subtitle: "Weight",
                            showRightDivider: false,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Options
                  _RateCard(
                    iconBg: const Color(0xFFFDECEC),
                    icon: Icons.inventory_2_outlined,
                    iconColor: const Color(0xFFEF4444),
                    title: "Regular delivery",
                    price: "\$10 USD",
                    days: "3 Days",
                    selected: selected == DeliveryType.regular,
                    onTap: () =>
                        setState(() => selected = DeliveryType.regular),
                  ),
                  const SizedBox(height: 12),
                  _RateCard(
                    iconBg: const Color(0xFFEFF6FF),
                    icon: Icons.local_shipping_outlined,
                    iconColor: const Color(0xFF2563EB),
                    title: "Cargo delivery",
                    price: "\$25 USD",
                    days: "5 Days",
                    selected: selected == DeliveryType.cargo,
                    onTap: () => setState(() => selected = DeliveryType.cargo),
                  ),
                  const SizedBox(height: 12),
                  _RateCard(
                    iconBg: const Color(0xFFFDECEC),
                    icon: Icons.local_shipping_rounded,
                    iconColor: const Color(0xFFEF4444),
                    title: "Express delivery",
                    price: "\$45 USD",
                    days: "1 Days",
                    selected: selected == DeliveryType.express,
                    onTap: () =>
                        setState(() => selected = DeliveryType.express),
                  ),

                  // Optional: Continue button (if you want)
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class _PlaceBlock extends StatelessWidget {
  const _PlaceBlock({
    required this.label,
    required this.city,
    required this.code,
    required this.alignEnd,
  });

  final String label;
  final String city;
  final String code;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    final align = alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final textAlign = alignEnd ? TextAlign.end : TextAlign.start;

    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          label,
          textAlign: textAlign,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF9CA3AF),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          city,
          textAlign: textAlign,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF111827),
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          code,
          textAlign: textAlign,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF111827),
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.title,
    required this.subtitle,
    required this.showRightDivider,
  });

  final String title;
  final String subtitle;
  final bool showRightDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: showRightDivider
            ? const Border(
                right: BorderSide(color: Color(0xFFE5E7EB), width: 1),
              )
            : null,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}

class _RateCard extends StatelessWidget {
  const _RateCard({
    required this.iconBg,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.price,
    required this.days,
    required this.selected,
    required this.onTap,
  });

  final Color iconBg;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String price;
  final String days;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? const Color(0xFFF59E0B) : const Color(0xFFE5E7EB),
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 16,
                    color: Color(0xFF111827),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    days,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111827),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
