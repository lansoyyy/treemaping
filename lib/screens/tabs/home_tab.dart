import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 500,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              height: 400,
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
          ],
        ),
      ),
    );
  }
}
