import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationBar extends StatelessWidget with PreferredSizeWidget {
  ApplicationBar(this.color, this.colorNavigation, this.title, this.TitleColor,
      this.AddWidget);
  final Color color;
  final Color colorNavigation;
  final String title;
  final Color TitleColor;
  final Widget AddWidget;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: colorNavigation,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      title: AutoSizeText(
        title,
        style: GoogleFonts.montserrat(color: TitleColor),
      ),
      actions: [
        AddWidget
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
