import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  const Dots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
