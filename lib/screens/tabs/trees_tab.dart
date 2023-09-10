import 'package:communal/widgets/button_widget.dart';
import 'package:communal/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
              SizedBox(
                height: 500,
                width: 350,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          showTreeDetails();
                        },
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
                  Container(
                    width: 375,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        size: 48,
                        color: Colors.white,
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
                        onPressed: () {},
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

  showTreeDetails() {
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
                  Container(
                    width: 375,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        size: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    isEnabled: false,
                    label: 'Name of Tree',
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    isEnabled: false,
                    label: 'Description of Tree',
                    controller: descController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    isEnabled: false,
                    label: 'Location of Tree',
                    controller: locationController,
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
