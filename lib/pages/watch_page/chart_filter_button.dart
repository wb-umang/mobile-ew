import 'package:flutter/material.dart';

class ChartFilterButton extends StatefulWidget {
  final String text;
  final Color color;
  final bool isSelected;
  final VoidCallback onPressed;

  const ChartFilterButton({
    super.key,
    required this.text,
    required this.color,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  State<ChartFilterButton> createState() => _ChartFilterButtonState();
}

class _ChartFilterButtonState extends State<ChartFilterButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: widget.isSelected
                ? const Color(0xFF001633)
                : Colors.transparent,
            border: Border.all(
              color: widget.isSelected
                  ? const Color(0xFF001633)
                  : const Color(0xFFE6E8F0),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.isSelected
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF001633),
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
