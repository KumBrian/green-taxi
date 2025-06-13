import 'package:flutter/cupertino.dart' hide LinearGradient;
import 'package:flutter/material.dart' hide Image;
import 'package:green_taxi/presentation/components/custom_box.dart';
import 'package:green_taxi/presentation/components/dots.dart';
import 'package:green_taxi/presentation/components/my_drawer.dart';
import 'package:green_taxi/presentation/components/search_field.dart';
import 'package:rive/rive.dart' hide Image, LinearGradient;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _destinationController = TextEditingController();
  final FocusNode _destinationFocusNode = FocusNode();
  bool _showDestinationSuggestions = false;
  bool _destinationSelected = false;

  void _onDestinationFocusChange() {
    setState(() {
      // Update visibility based on whether the TextField has focus
      _showDestinationSuggestions = _destinationFocusNode.hasFocus;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _destinationFocusNode.addListener(_onDestinationFocusChange);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _destinationFocusNode.removeListener(_onDestinationFocusChange);
    _destinationController.dispose();
    _destinationFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: MyDrawer(),
      body: Stack(
        children: [
          RiveAnimation.asset(
            'assets/rive/background.riv',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withAlpha(0),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.1,
              horizontal: 40,
            ),
            child: Column(
              spacing: 40,
              children: [
                Row(
                  spacing: 30,
                  children: [
                    Builder(
                      builder: (ctx) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(99),
                          onTap: () {
                            _destinationFocusNode.unfocus();
                            Scaffold.of(ctx).openDrawer();
                          },
                          child: Material(
                            color: Colors.transparent,
                            shape: CircleBorder(),

                            child: Image.asset('assets/images/user.png'),
                          ),
                        );
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Good morning ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Mark ',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Where are you going?',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                FocusScope(
                  child: Column(
                    spacing: 10,
                    children: [
                      _destinationSelected
                          ? CustomBox(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 25,
                                  horizontal: 20,
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.add,
                                          size: 25,
                                        ),
                                        color: Colors.grey,
                                        onPressed: () {},
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.cancel_outlined,
                                          size: 25,
                                        ),
                                        color: Colors.grey,
                                        onPressed: () {
                                          setState(() {
                                            _destinationSelected = false;
                                          });
                                        },
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      spacing: 20,
                                      children: [
                                        Dots(),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          spacing: 20,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'From - Rue Toyota',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Restaurant White House',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'To - Road To PK12',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Station Tradex, PK10',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : CustomBox(
                              child: SearchField(
                                destinationController: _destinationController,
                                destinationFocusNode: _destinationFocusNode,
                              ),
                            ),
                      _showDestinationSuggestions
                          ? CustomBox(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 25,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  spacing: 20,
                                  children: List.generate(
                                    2,
                                    (index) {
                                      return InkWell(
                                        onTap: () {
                                          _destinationController.text =
                                              'Selected Destination $index';
                                          setState(() {
                                            _destinationSelected = true;
                                          });
                                          _destinationFocusNode.unfocus();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'History - Restaurant White House',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Tradex Station, PK10',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.history_toggle_off_sharp,
                                                color: Colors.grey,
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
