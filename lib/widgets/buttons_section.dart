import 'package:flutter/material.dart';
import 'package:cinemagic/constants/colors.dart';
import 'package:cinemagic/widgets/section_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonsSection extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final double itemHeight = 60;
  final Color backgroundColor;
  final List<ButtonSectionItem> items;
  const ButtonsSection(
      {super.key,
      this.height = 0,
      this.width = double.infinity,
      required this.items,
      this.backgroundColor = const Color(0xff132D4E),
      this.borderRadius = 15});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: (items.length * itemHeight) + 5,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Row(
        children: [
          Flexible(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          color: kBackgroundColor, width: 0.25),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: index == 0
                            ? BorderRadius.only(
                                topLeft: Radius.circular(borderRadius),
                                topRight: Radius.circular(borderRadius))
                            : index == items.length - 1
                                ? BorderRadius.only(
                                    bottomRight: Radius.circular(borderRadius),
                                    bottomLeft: Radius.circular(borderRadius))
                                : BorderRadius.zero,
                      )),
                  onPressed: items[index].onPressed,
                  child: Container(
                      height: itemHeight,
                      width: width,
                      margin: index == 0
                          ? const EdgeInsets.only(top: 2.5)
                          : index == items.length - 1
                              ? const EdgeInsets.only(bottom: 2.5)
                              : EdgeInsets.zero,
                      child: Row(
                        children: [
                          buttonSectionIcon(item: items[index], size: 40),
                          Expanded(
                            child: Container(
                              height: itemHeight,
                              width: width,
                              decoration: BoxDecoration(
                                  border: index + 1 != items.length
                                      ? const Border(
                                          bottom: BorderSide(
                                            color: Colors.white,
                                            width: 0.5,
                                          ),
                                        )
                                      : null),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SectionTitle(
                                        title: items[index].title,
                                        fontSize: 15,
                                        padding: EdgeInsets.zero,
                                      ),
                                      const SectionTitle(
                                        title: ">",
                                        fontSize: 20,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSectionItem {
  final String title;
  final dynamic icon;
  final Color iconColor;
  final VoidCallback? onPressed;
  final EdgeInsets iconPadding;
  const ButtonSectionItem(
      {required this.onPressed,
      required this.title,
      required this.icon,
      required this.iconColor,
      this.iconPadding = EdgeInsets.zero});
}

Widget buttonSectionIcon(
        {required ButtonSectionItem item, required final double size}) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 5),
      width: size,
      height: size,
      padding: item.iconPadding,
      decoration: BoxDecoration(
          color: item.iconColor, borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: item.icon is IconData
              ? Icon(
                  item.icon as IconData,
                  size: size / 2,
                  color: Colors.white,
                )
              : FaIcon(
                  item.icon as FaIconData,
                  size: size / 2,
                  color: Colors.white,
                )),
    );
