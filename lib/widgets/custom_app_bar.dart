import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // Optional: match your theme
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Image.asset('assets/images/pic.png', height: 40, width: 40),
      ),
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Hello 👋",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                'Al-Danah',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/tab.png'),
            ),
          ),
        ),
      ],
    );
  }
}
