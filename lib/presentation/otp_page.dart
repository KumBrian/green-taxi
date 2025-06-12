import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_taxi/presentation/custom_curve_path.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            scrolledUnderElevation: 0,
            elevation: 0,
            expandedHeight: MediaQuery.of(context).size.height * 0.55,
            backgroundColor: Colors.transparent,
            collapsedHeight: MediaQuery.of(context).size.height * 0.4,
            flexibleSpace: ClipPath(
              clipper: CustomCurvePath(), // Apply the custom clipper
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Image.asset(
                      'assets/logo/logo.png',
                      width: 100,
                      height: 100,
                    ),
                    Image.asset(
                      'assets/logo/name.png',
                      width: 150,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.45,
                maxHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 20,
                  children: [
                    Text('Phone Verification'),
                    Text(
                      'Enter Your OTP Code',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Container(
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
                      child: TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 14,
                        inputFormatters: [
                          // Allows only digits (you can change this regex based on allowed characters)
                          FilteringTextInputFormatter.digitsOnly,
                          // Custom formatter to add spaces
                          _FourCharacterSpaceFormatter(),
                        ],
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          counterText: '',
                          suffixIcon: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
                          hint: Text(
                            'XXXX XXXX XXXX',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'Resend Code in ',
                          ),
                          TextSpan(
                            text: '10s',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FourCharacterSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Get the plain text without any spaces
    final cleanText = newValue.text.replaceAll(' ', '');

    // If the text is empty, just return the new value as is
    if (cleanText.isEmpty) {
      return newValue;
    }

    String formattedText = '';
    for (int i = 0; i < cleanText.length; i++) {
      formattedText += cleanText[i];
      // Add a space after every 4 characters, but not at the very end
      if ((i + 1) % 4 == 0 && (i + 1) != cleanText.length) {
        formattedText += ' ';
      }
    }

    // --- Improved Cursor Position Logic ---
    int newSelectionOffset = newValue.selection.end;
    int oldSelectionOffset = oldValue.selection.end;

    // Calculate how many spaces were in the original text up to the old cursor position
    int oldSpaceCount = 0;
    for (int i = 0; i < oldSelectionOffset; i++) {
      if (oldValue.text[i] == ' ') {
        oldSpaceCount++;
      }
    }

    // Calculate the 'unformatted' position of the cursor in the old text
    int oldUnformattedOffset = oldSelectionOffset - oldSpaceCount;

    // Determine the number of spaces that should be present in the formatted text
    // up to the 'unformatted' cursor position
    int newSpaceCount = 0;
    for (int i = 0; i < oldUnformattedOffset; i++) {
      if ((i + 1) % 4 == 0) {
        // Check if a space would be inserted here
        newSpaceCount++;
      }
    }

    // The new selection offset should be the old unformatted offset plus the new spaces
    newSelectionOffset = oldUnformattedOffset + newSpaceCount;

    // Ensure the new offset does not exceed the length of the formatted text
    if (newSelectionOffset > formattedText.length) {
      newSelectionOffset = formattedText.length;
    }

    // If the user is deleting a character and the cursor was after a space,
    // we need to potentially move it back if the space is now gone.
    // This handles backspacing over spaces cleanly.
    if (newValue.text.length < oldValue.text.length) {
      if (oldValue.text.length > 0 &&
          oldValue.text[oldSelectionOffset - 1] == ' ' &&
          oldSelectionOffset - 1 == newValue.selection.end &&
          formattedText.length < oldValue.text.length) {
        newSelectionOffset--; // Move cursor back if a space was deleted just before it
      }
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: newSelectionOffset),
    );
  }
}
