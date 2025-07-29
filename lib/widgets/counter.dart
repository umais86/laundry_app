// import 'package:flutter/material.dart';

// class Counter1 extends StatefulWidget {
//   const Counter1({super.key});

//   @override
//   State<Counter1> createState() => _Counter1State();
// }

// class _Counter1State extends State<Counter1> {
//   int _count = 0;

//   void _increment() {
//     setState(() {
//       _count++;
//     });
//   }

//   void _decrement() {
//     setState(() {
//       if (_count > 0) _count--;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: _decrement,
//           child: Container(
//             width: 20,
//             height: 20,
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(2),
//               color: Color(0xFFE29A4F),
//             ),
//             child: Center(
//               child: Icon(Icons.remove, color: Colors.white, size: 15),
//             ),
//           ),
//         ),
//         SizedBox(width: 10),
//         Container(
//           width: 20,
//           height: 20,
//           decoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(2),
//             color: Color(0xFFE29A4F),
//           ),
//           child: Center(
//             child: Text(
//               '$_count',
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: 10),
//         GestureDetector(
//           onTap: _increment,
//           child: Container(
//             width: 20,
//             height: 20,
//             decoration: const BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.all(Radius.circular(4)),
//               color: Color(0xFFE29A4F),
//             ),

//             child: const Center(
//               child: Icon(Icons.add, color: Colors.white, size: 15),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:par_1/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class Counter1 extends StatefulWidget {
  final String clothLabel;

  const Counter1({super.key, required this.clothLabel});

  @override
  State<Counter1> createState() => _Counter1State();
}

class _Counter1State extends State<Counter1> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });

    final cart = Provider.of<CartProvider>(context, listen: false);
    cart.addItem(widget.clothLabel, _count);
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });

      final cart = Provider.of<CartProvider>(context, listen: false);
      if (_count == 0) {
        cart.removeItem(widget.clothLabel);
      } else {
        cart.addItem(widget.clothLabel, _count);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: _decrement,
          child: _circleBox(icon: Icons.remove),
        ),
        const SizedBox(width: 10),
        _circleBox(label: '$_count'),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: _increment,
          child: _circleBox(icon: Icons.add),
        ),
      ],
    );
  }

  Widget _circleBox({IconData? icon, String? label}) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: const Color(0xFFE29A4F),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
        child: icon != null
            ? Icon(icon, color: Colors.white, size: 15)
            : Text(
                label!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
      ),
    );
  }
}
