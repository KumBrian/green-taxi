import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.green),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: 15),
        ),
      ),
      child: Text(
        'GET CODE',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
