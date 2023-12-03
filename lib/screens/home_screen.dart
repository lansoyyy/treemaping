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
    final usernameController = TextEditingController();

    return DefaultTabController(
      length: widget.inUser! ? 2 : 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0),
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
                  widget.inUser!
                      ? IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: TextWidget(
                                    text: 'Enter Admin Credentails',
                                    fontSize: 18,
                                    fontFamily: 'Bold',
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        child: TextFieldWidget(
                                            label: 'Username',
                                            controller: usernameController),
                                      ),
                                      SizedBox(
                                        height: 100,
                                        child: TextFieldWidget(
                                            label: 'Password',
                                            showEye: true,
                                            isObscure: true,
                                            controller: passController),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        if (usernameController.text !=
                                                'admin-username' &&
                                            passController.text !=
                                                'admin-password') {
                                          Navigator.pop(context);
                                          showToast(
                                              'Incorrect admin password!');
                                        } else {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen(
                                                        inUser: false,
                                                      )));

                                          showToast('Logged in as admin!');
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
                        )
                      : const SizedBox(),
                  !widget.inUser!
                      ? IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text(
                                        'Logout Confirmation',
                                        style: TextStyle(
                                            fontFamily: 'QBold',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: const Text(
                                        'Are you sure you want to Logout?',
                                        style:
                                            TextStyle(fontFamily: 'QRegular'),
                                      ),
                                      actions: <Widget>[
                                        MaterialButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(
                                                fontFamily: 'QRegular',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () async {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomeScreen(
                                                              inUser: true,
                                                            )));
                                          },
                                          child: const Text(
                                            'Continue',
                                            style: TextStyle(
                                                fontFamily: 'QRegular',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ));
                          },
                          icon: const Icon(
                            Icons.logout,
                          ),
                        )
                      : const SizedBox()
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
            ],
          ),
        ),
      ),
    );
  }
}
