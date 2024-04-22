import 'package:flutter/material.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.centerTitle = false,
      this.leadingIcon,
      this.action,
      this.leadingOnPressed,
      this.appBarColor = Colors.transparent});

  final Widget? title;
  final bool showBackArrow;
  final bool centerTitle;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;
  final Color appBarColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: AppBar(
        backgroundColor: appBarColor,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: action,
        centerTitle: centerTitle,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
