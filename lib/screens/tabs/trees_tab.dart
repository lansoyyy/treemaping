import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class TreesTab extends StatelessWidget {
  const TreesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Endimic Tree Records',
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.grey,
                                  height: 50,
                                  width: 50,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                      text: 'Name of Tree',
                                      fontSize: 16,
                                      fontFamily: 'Bold',
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextWidget(
                                      text: 'Description of Tree',
                                      fontSize: 12,
                                      fontFamily: 'Medium',
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
