import 'package:communal/utils/colors.dart';
import 'package:communal/widgets/button_widget.dart';
import 'package:communal/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    text: 'HOME',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    text: 'ABOUT US',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    text: 'CONTACT US',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.admin_panel_settings,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              height: 400,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 300,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonWidget(
                      radius: 100,
                      color: primary,
                      label: 'Book Now',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      text:
                          'Ut quis aliquip nisi ad laborum deserunt ullamco culpa consectetur. Ut quis aliquip nisi ad laborum deserunt ullamco culpa consectetur. Ut quis aliquip nisi ad laborum deserunt ullamco culpa consectetur. Ut quis aliquip nisi ad laborum deserunt ullamco culpa consectetur. Ut quis aliquip nisi ad laborum deserunt ullamco culpa consectetur. Ut quis aliquip nisi ad laborum deserunt ullamco culpa consectetur.',
                      fontSize: 14,
                      fontFamily: 'Regular',
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
