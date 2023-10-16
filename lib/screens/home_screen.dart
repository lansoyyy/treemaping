import 'package:communal/screens/tabs/aboutus_tab.dart';
import 'package:communal/screens/tabs/home_tab.dart';
import 'package:communal/screens/tabs/trees_tab.dart';
import 'package:communal/widgets/text_widget.dart';
import 'package:communal/widgets/textfield_widget.dart';
import 'package:communal/widgets/toast_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  bool? inUser;

  HomeScreen({
    super.key,
    this.inUser = true,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final passController = TextEditingController();

    return DefaultTabController(
      length: widget.inUser! ? 2 : 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 500,
                    child: TabBar(
                      labelStyle: const TextStyle(
                          color: Colors.black, fontFamily: 'Bold'),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: widget.inUser!
                          ? [
                              const Tab(
                                text: 'MAP',
                              ),
                              const Tab(
                                text: 'ABOUT US',
                              ),
                            ]
                          : [
                              const Tab(
                                text: 'MAP',
                              ),
                              const Tab(
                                text: 'TREES',
                              ),
                              const Tab(
                                text: 'ABOUT US',
                              ),
                            ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: TextWidget(
                              text: 'Enter Admin Password',
                              fontSize: 18,
                              fontFamily: 'Bold',
                            ),
                            content: SizedBox(
                              height: 100,
                              child: TextFieldWidget(
                                  label: 'Password',
                                  showEye: true,
                                  isObscure: true,
                                  controller: passController),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  if (passController.text != 'password123') {
                                    Navigator.pop(context);
                                    showToast('Incorrect admin password!');
                                  } else {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => HomeScreen(
                                                  inUser: false,
                                                )));
                                  }
                                },
                                child: TextWidget(
                                  text: 'Continue',
                                  fontSize: 18,
                                  fontFamily: 'Bold',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.admin_panel_settings,
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     TextButton(
              //       onPressed: () {},
              //       child: TextWidget(
              //         text: 'HOME',
              //         fontSize: 18,
              //         fontFamily: 'Bold',
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 20,
              //     ),
              //     TextButton(
              //       onPressed: () {},
              //       child: TextWidget(
              //         text: 'ABOUT US',
              //         fontSize: 18,
              //         fontFamily: 'Bold',
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 20,
              //     ),
              //     TextButton(
              //       onPressed: () {},
              //       child: TextWidget(
              //         text: 'CONTACT US',
              //         fontSize: 18,
              //         fontFamily: 'Bold',
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 20,
              //     ),
              //     IconButton(
              //       onPressed: () {},
              //       icon: const Icon(
              //         Icons.admin_panel_settings,
              //       ),
              //     ),
              //   ],
              // ),

              Expanded(
                child: TabBarView(
                    children: widget.inUser!
                        ? [
                            const HomeTab(),
                            const AboutUsTab(),
                          ]
                        : [
                            const HomeTab(),
                            const TreesTab(),
                            const AboutUsTab(),
                          ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.facebook),
                    label: TextWidget(
                      text: 'sample@facebook.com',
                      fontSize: 18,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.g_mobiledata),
                    label: TextWidget(
                      text: 'sample@google.com',
                      fontSize: 18,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.phone),
                    label: TextWidget(
                      text: '09090104355',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
