import 'package:flutter/material.dart';
import 'package:green_taxi/presentation/components/agreement_widget.dart';
import 'package:green_taxi/presentation/components/my_button.dart';
import 'package:green_taxi/presentation/components/phone_number_field.dart';
import 'package:green_taxi/presentation/custom_curve_path.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
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
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/ui_elements/leaf.png',
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.center,
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
                    Text('Hello Nice To Meet You'),
                    Text(
                      'Get Moving With Green Taxi',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    PhoneNumberField(
                      phoneNumberController: _phoneNumberController,
                    ),
                    MyButton(),
                    AgreementWidget(),
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
