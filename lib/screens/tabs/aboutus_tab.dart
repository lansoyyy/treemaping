import 'package:communal/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AboutUsTab extends StatelessWidget {
  const AboutUsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircleAvatar(
                      radius: 80,
                      // Replace with your own image
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Our Company',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We are a creative team of developers and designers.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Our Mission',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'To create innovative solutions that make a difference.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Email: contact@example.com\nPhone: +1 (123) 456-7890',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: TextWidget(
                text:
                    'Do cillum occaecat do officia nulla elit. Voluptate ex enim labore ad. Occaecat veniam adipisicing labore adipisicing id ut. Eiusmod commodo tempor consequat esse aute ea ipsum aute amet sint esse mollit ea officia. Consectetur esse deserunt amet culpa laborum. Mollit aliqua eiusmod deserunt nisi non cupidatat consequat dolore voluptate et ex aliqua laborum ex. Sunt mollit cupidatat aliquip mollit amet magna fugiat. Velit anim eiusmod commodo culpa sit et pariatur fugiat labore ut. Irure excepteur culpa ad ea enim aliquip id minim. Consequat ut cillum nostrud sint mollit qui culpa irure ut ea tempor. Adipisicing labore cupidatat dolor ullamco ipsum aliqua ea esse.',
                fontSize: 14,
                color: Colors.grey,
                fontFamily: 'Regular',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
