import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GmButton extends StatelessWidget {
  const GmButton(
      {super.key,
      required this.text,
      this.icon,
      required this.onTap,
      this.radius = 10,
      required this.color,
      this.backgroundColor,
      this.height = 35,
      this.width = 100,
      this.padding = EdgeInsets.zero});

  final String text;
  final dynamic icon;
  final VoidCallback onTap;
  final double radius;
  final Color color;
  final Color? backgroundColor;
  final double height;
  final double width;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor ?? color.withValues(alpha: 0.25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? (icon is IconData
                      ? Icon(icon as IconData, color: color, size: 15)
                      : FaIcon(icon as FaIconData, color: color, size: 15))
                  : const SizedBox.shrink(),
              icon != null
                  ? const SizedBox(
                      width: 7.5,
                    )
                  : const SizedBox.shrink(),
              Text(text,
                  style: TextStyle(
                      color: color, fontSize: 15, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
