import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communal/services/add_tree.dart';
import 'package:communal/widgets/button_widget.dart';
import 'package:communal/widgets/textfield_widget.dart';
import 'package:communal/widgets/toast_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:html';
import '../../widgets/text_widget.dart';

List<LatLng> point = [];

class TreesTab extends StatefulWidget {
  const TreesTab({super.key});

  @override
  State<TreesTab> createState() => _TreesTabState();
}

class _TreesTabState extends State<TreesTab> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final locationController = TextEditingController();

  GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  late double lat;
  late double long;

  Polygon poly = Polygon(
      polygonId: const PolygonId('New Poly'),
      points: point,
      fillColor: Colors.white.withOpacity(0.5),
      strokeWidth: 1);

  String newUrl = '';

  List<Map<String, dynamic>> coords = [];
  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
      target: LatLng(8.332155, 124.975465),
      zoom: 14,
    );
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Tree Records',
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Trees')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return const Center(child: Text('Error'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
                      );
                    }

                    final data = snapshot.requireData;
                    return SizedBox(
                      height: 500,
                      width: 350,
                      child: ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                showTreeDetails(data.docs[index]);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 75,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                data.docs[index]['imageURL'],
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                        height: 50,
                                        width: 50,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextWidget(
                                            text: data.docs[index]['name'],
                                            fontSize: 16,
                                            fontFamily: 'Bold',
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextWidget(
                                            text: data.docs[index]
                                                ['description'],
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
                    );
                  }),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          const VerticalDivider(),
          const SizedBox(
            width: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Add Tree',
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    label: 'Name of Tree',
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    label: 'Description of Tree',
                    controller: descController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    label: 'Location of Tree',
                    controller: locationController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    text: 'Picture of Tree',
                    fontSize: 14,
                    fontFamily: 'Bold',
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      InputElement input = FileUploadInputElement()
                          as InputElement
                        ..accept = 'image/*';
                      FirebaseStorage fs = FirebaseStorage.instance;
                      input.click();
                      input.onChange.listen((event) {
                        final file = input.files!.first;
                        final reader = FileReader();
                        reader.readAsDataUrl(file);
                        reader.onLoadEnd.listen((event) async {
                          var snapshot = await fs
                              .ref()
                              .child(DateTime.now().toString())
                              .putBlob(file);
                          String downloadUrl =
                              await snapshot.ref.getDownloadURL();
                          setState(
                            () {
                              newUrl = downloadUrl;
                            },
                          );
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: TextWidget(
                                  text: 'Photo Updated Succesfully!',
                                  fontSize: 14,
                                  color: Colors.white)));
                        });
                      });
                    },
                    child: Container(
                      width: 375,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: newUrl != ''
                            ? DecorationImage(
                                image: NetworkImage(newUrl), fit: BoxFit.cover)
                            : null,
                      ),
                      child: Center(
                        child: newUrl != ''
                            ? const SizedBox()
                            : const Icon(
                                Icons.image,
                                size: 48,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Location of Tree',
                    fontSize: 14,
                    fontFamily: 'Bold',
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 350,
                    height: 500,
                    child: Scaffold(
                      floatingActionButton: point.isNotEmpty
                          ? FloatingActionButton(
                              child: const Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  point.clear();
                                });
                              },
                            )
                          : null,
                      body: SizedBox(
                        width: 350,
                        height: 500,
                        child: GoogleMap(
                          onTap: (argument) {
                            setState(() {
                              point.add(LatLng(
                                  argument.latitude, argument.longitude));

                              coords.add({
                                'lat': argument.latitude,
                                'long': argument.longitude
                              });
                            });
                          },
                          zoomControlsEnabled: false,
                          mapType: MapType.hybrid,
                          polygons: {poly},
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: initialCameraPosition,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: Center(
                      child: ButtonWidget(
                        width: 175,
                        radius: 100,
                        color: Colors.black,
                        label: 'Save',
                        onPressed: () {
                          addTree(nameController.text, descController.text,
                              locationController.text, newUrl, coords);

                          nameController.clear();
                          descController.clear();
                          locationController.clear();

                          setState(() {
                            point.clear();
                            newUrl = '';
                            coords.clear();
                          });

                          showToast('Tree recorded!');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  showTreeDetails(data) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 375,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Picture of Tree',
                          fontSize: 14,
                          fontFamily: 'Bold',
                          color: Colors.black,
                        ),
                        TextButton.icon(
                          label: TextWidget(
                            text: 'Close',
                            fontSize: 14,
                            fontFamily: 'Medium',
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: Container(
                      width: 375,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(
                            data['imageURL'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Name:',
                        fontSize: 12,
                        fontFamily: 'Regular',
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: data['name'],
                        fontSize: 15,
                        fontFamily: 'Bold',
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Description:',
                        fontSize: 12,
                        fontFamily: 'Regular',
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: data['description'],
                        fontSize: 15,
                        fontFamily: 'Bold',
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Location:',
                        fontSize: 12,
                        fontFamily: 'Regular',
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: data['location'],
                        fontSize: 15,
                        fontFamily: 'Bold',
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
