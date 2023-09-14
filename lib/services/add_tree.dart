import 'package:cloud_firestore/cloud_firestore.dart';

Future addTree(name, description, location, imageURL, coordinates) async {
  final docUser = FirebaseFirestore.instance.collection('Trees').doc();

  final json = {
    'name': name,
    'description': description,
    'location': location,
    'imageURL': imageURL,
    'coordinates': coordinates,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
