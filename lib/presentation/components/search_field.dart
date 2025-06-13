import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required TextEditingController destinationController,
    required FocusNode destinationFocusNode,
  }) : _destinationController = destinationController,
       _destinationFocusNode = destinationFocusNode;

  final TextEditingController _destinationController;
  final FocusNode _destinationFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _destinationController,
      focusNode: _destinationFocusNode,
      cursorColor: Colors.green,
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
        hint: Text('Search For a Destination'),
        suffixIcon: Icon(
          CupertinoIcons.search,
          color: Colors.green,
        ),
      ),
    );
  }
}
