import 'package:flutter/material.dart';

class FragranceCard extends StatefulWidget {
  final String title;
  final IconData? icon;
  final String? iconAssetPath;
  final List<String> options;
  final bool initialSwitchValue;
  final Function(bool)? onToggle;

  const FragranceCard({
    super.key,
    required this.title,
    this.icon,
    this.iconAssetPath,
    required this.options,
    this.initialSwitchValue = true,
    this.onToggle,
  });

  @override
  State<FragranceCard> createState() => _FragranceCardState();
}

class _FragranceCardState extends State<FragranceCard> {
  late bool isOn;
  late String selectedScent;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialSwitchValue;
    selectedScent = widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 177,
      padding: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFFD1A32F),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Transform.scale(
                scale: 0.4,
                child: Switch(
                  value: isOn,
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                      widget.onToggle?.call(value);
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.green,
                  inactiveTrackColor: Colors.grey.shade300,
                  inactiveThumbColor: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 2),
              if (widget.iconAssetPath != null)
                Image.asset(
                  widget.iconAssetPath!,
                  width: 24,
                  height: 24,
                  color: const Color(0xFFD1A32F),
                )
              else if (widget.icon != null)
                Icon(widget.icon, color: const Color(0xFFD1A32F), size: 24),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.options
                    .map(
                      (option) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: buildRadioOption(option),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRadioOption(String label) {
    bool isSelected = selectedScent == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedScent = label;
        });
      },
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black87, width: 2),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFD1A32F),
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
