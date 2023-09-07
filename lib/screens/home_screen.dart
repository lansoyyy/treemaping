import 'package:communal/screens/tabs/aboutus_tab.dart';
import 'package:communal/screens/tabs/contactus_tab.dart';
import 'package:communal/screens/tabs/home_tab.dart';
import 'package:communal/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  SizedBox(
                    width: 500,
                    child: TabBar(
                      labelStyle:
                          TextStyle(color: Colors.black, fontFamily: 'Bold'),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: 'MAP',
                        ),
                        Tab(
                          text: 'TREES',
                        ),
                        Tab(
                          text: 'ABOUT US',
                        ),
                      ],
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

              const Expanded(
                child: TabBarView(children: [
                  HomeTab(),
                  AboutUsTab(),
                  SizedBox(),
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
