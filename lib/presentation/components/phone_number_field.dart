import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    required TextEditingController phoneNumberController,
  }) : _phoneNumberController = phoneNumberController;

  final TextEditingController _phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.15),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: IntlPhoneField(
        controller: _phoneNumberController,
        onCountryChanged: (country) {
          debugPrint('Country changed to: ${country.name}');
        },
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 20,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          hint: Text('Phone Number'),
        ),
      ),
    );
  }
}
