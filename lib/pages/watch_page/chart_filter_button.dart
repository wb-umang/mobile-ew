import 'package:flutter/material.dart';

class ChartFilterButton extends StatefulWidget {
  final String text;
  final Color color;
  final bool isSelected;
  final VoidCallback onPressed;
  final bool isFirst;
  final bool isLast;
  final bool isBorderRight;
  final bool isBlocked;

  const ChartFilterButton({
    super.key,
    required this.text,
    required this.color,
    required this.isSelected,
    required this.onPressed,
    this.isFirst = false,
    this.isLast = false,
    this.isBorderRight = false,
    this.isBlocked = false,
  });

  @override
  State<ChartFilterButton> createState() => _ChartFilterButtonState();
}

class _ChartFilterButtonState extends State<ChartFilterButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: !widget.isBlocked ? null : widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft:
                    widget.isFirst ? Radius.circular(12) : Radius.circular(0),
                topRight:
                    widget.isLast ? Radius.circular(12) : Radius.circular(0),
                bottomLeft:
                    widget.isFirst ? Radius.circular(12) : Radius.circular(0),
                bottomRight:
                    widget.isLast ? Radius.circular(12) : Radius.circular(0)),
            color: !widget.isBlocked
                ? Color(0xFFF7F7FA)
                : widget.isSelected
                    ? const Color(0xFF001633)
                    : Colors.transparent,
            border: Border(
              top: BorderSide(
                width: 1,
                color: !widget.isBlocked
                    ? Color(0xFFE6E8F0)
                    : widget.isSelected
                        ? const Color(0xFF001633)
                        : const Color(0xFFE6E8F0),
              ),
              bottom: BorderSide(
                width: 1,
                color: !widget.isBlocked
                    ? Color(0xFFE6E8F0)
                    : widget.isSelected
                        ? const Color(0xFF001633)
                        : const Color(0xFFE6E8F0),
              ),
              right: widget.isBorderRight
                  ? BorderSide(
                      width: 1,
                      color: !widget.isBlocked
                          ? Color(0xFFE6E8F0)
                          : widget.isSelected
                              ? const Color(0xFF001633)
                              : const Color(0xFFE6E8F0),
                    )
                  : BorderSide.none,
              left: BorderSide(
                width: 1,
                color: !widget.isBlocked
                    ? Color(0xFFE6E8F0)
                    : widget.isSelected
                        ? const Color(0xFF001633)
                        : const Color(0xFFE6E8F0),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: !widget.isBlocked
                      ? Color.fromRGBO(4, 7, 49, 0.42)
                      : widget.isSelected
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
