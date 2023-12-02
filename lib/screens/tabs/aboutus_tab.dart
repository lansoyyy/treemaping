import 'package:communal/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AboutUsTab extends StatelessWidget {
  const AboutUsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 1000,
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage('assets/images/back.jpg'),
                      opacity: 0.25,
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: TextWidget(
                    text: 'About Us',
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 1000,
                child: TextWidget(
                  text:
                      'Kisolon Tree Park, nestled in the heart of Brgy. Kisolon, Sumilao, Bukidnon, is a natural wonderland celebrated for its thriving biodiversity and plethora of native tree species. The park sprawls across rolling hills, dense woodlands, and pristine streams, providing a haven for tree species like Narra, Tanguile, Molave, Almond, Lauan, Tipolo, and Tulips, each uniquely adapted to its local habitat. Beyond its ecological significance, Kisolon Tree Park stands as a testament to the enduring power of community-led conservation efforts. Local government agencies, non-profit organizations, and community groups collaborate diligently to execute sustainable reforestation practices, monitor wildlife populations, and bolster environmental education initiatives. In addition to its role in conservation, the park beckons eco-enthusiasts and nature lovers with its extensive trail network, scenic beauty, and opportunities for bird-watching and wildlife observation. It also holds a profound cultural and historical value, serving as a sacred site where indigenous traditions and ecological wisdom are lovingly preserved. Kisolon Tree Park represents a powerful call to action for the preservation and rejuvenation of our forests, fostering the well-being of both the environment and future generations.',
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'Regular',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/logs.png',
                        height: 150,
                        width: 250,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Our Company',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'The greatest wealth is a healty planet',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Our Mission',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'To create innovative solutions that make a difference.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Email: mariobaldo2001@gmail.com\nPhone: +1 (123) 456-7890',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
