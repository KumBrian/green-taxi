import 'package:flutter/material.dart';

class AgreementWidget extends StatelessWidget {
  const AgreementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 14),
        children: [
          TextSpan(
            text: 'By creating an account, you agree to our ',
          ),
          TextSpan(
            text: 'Terms of Service',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: '.'),
        ],
      ),
    );
  }
}
