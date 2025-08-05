import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/view/appbar_icon/how_it_work.dart';
import 'package:par_1/view/appbar_icon/testinomial.dart';

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
            padding: EdgeInsets.only(left: 9.04.w),
            child: CircleAvatar(
              radius: 21.r,
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
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: color1,
                ),
              ),
              Text(
                'Al-Danah',
                style: TextStyle(
                  fontSize: 12.sp,
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
          padding: EdgeInsets.only(right: 8.w),
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
                    offset.dx + size.width - 50.w,
                    offset.dy + size.height - 60.h,
                    offset.dx + size.width,
                    0,
                  ),
                  items: const [
                    PopupMenuItem<String>(
                      value: 'How It Works ?',
                      child: Text('How It Works ?'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Testinomials',
                      child: Text('Testinomial & Reviews'),
                    ),
                  ],
                ).then((selectedValue) {
                  if (selectedValue == 'How It Works ?') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HowItWork()),
                    );
                  } else if (selectedValue == 'Testinomials') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Testinomial()),
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
        preferredSize: Size.fromHeight(45.h),
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
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 10.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: color8,
                    borderRadius: BorderRadius.circular(12.r),
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
