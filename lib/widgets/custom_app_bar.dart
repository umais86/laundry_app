import 'package:flutter/material.dart';
import 'package:par_1/view/how_it_work.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Image.asset('assets/images/logo.png', height: 40, width: 40),
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
          child: Builder(
            builder: (context) => CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Image.asset('assets/icons/tab.png'),
                onPressed: () {
                  final RenderBox button =
                      context.findRenderObject() as RenderBox;
                  final RenderBox overlay =
                      Overlay.of(context).context.findRenderObject()
                          as RenderBox;

                  final Offset offset = button.localToGlobal(
                    Offset.zero,
                    ancestor: overlay,
                  );
                  final Size size = button.size;

                  showMenu<String>(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      offset.dx + size.width - 150,
                      offset.dy + size.height,
                      offset.dx + size.width,
                      0,
                    ),
                    items: const [
                      PopupMenuItem<String>(
                        value: 'How It Works ?',
                        child: Text('How It Works ?'),
                      ),
                    ],
                  ).then((selectedValue) {
                    if (selectedValue == 'How It Works ?') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HowItWork()),
                      );
                    }
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
