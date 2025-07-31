import 'package:flutter/material.dart';
import 'package:par_1/view/how_it_work.dart';

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  final Color color6;
  final Color color7;
  final Color color8;
  const CustomAppBar1({
    super.key,
    required this.color,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    required this.color5,
    required this.color6,
    required this.color7,
    required this.color8,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      elevation: 0,
      leading: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: CircleAvatar(
              radius: 21,
              backgroundImage: AssetImage('assets/images/logo.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello 👋",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: color1,
                ),
              ),
              Text(
                'Al-Danah',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: color2,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            backgroundColor: color4,
            child: IconButton(
              onPressed: () {
                final RenderBox button =
                    context.findRenderObject() as RenderBox;
                final RenderBox overlay =
                    Overlay.of(context).context.findRenderObject() as RenderBox;

                final Offset offset = button.localToGlobal(
                  Offset.zero,
                  ancestor: overlay,
                );
                final Size size = button.size;

                showMenu<String>(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    offset.dx + size.width - 50,
                    offset.dy + size.height - 60,
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
              icon: Image.asset('assets/icons/tab.png'),
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 35,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorHeight: 18,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(fontSize: 14, color: color7),
                      prefixIcon: Icon(Icons.search, color: color6),
                      filled: true,
                      fillColor: color5,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color8,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/search.png', color: color6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 45);
}
