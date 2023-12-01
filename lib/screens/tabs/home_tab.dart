import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communal/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as lt;

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getTrees();
  }

  // GoogleMapController? mapController;

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  late double lat;
  late double long;
  // Set<Polygon> polygon = HashSet<Polygon>();

  // CameraPosition initialCameraPosition = const CameraPosition(
  //   target: LatLng(8.332155, 124.975465),
  //   zoom: 14,
  // );

  bool hasLoaded = false;

  // getTrees() async {
  //   FirebaseFirestore.instance
  //       .collection('Trees')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) async {
  //     for (var doc in querySnapshot.docs) {
  //       List<LatLng> lats = [];

  //       for (int i = 0; i < doc['coordinates'].length; i++) {
  //         lats.add(LatLng(
  //             doc['coordinates'][i]['lat'], doc['coordinates'][i]['long']));
  //       }
  //       setState(() {
  //         polygon.add(Polygon(
  //             onTap: () {
  //               showTreeDetails(doc);
  //             },
  //             fillColor: Colors.white.withOpacity(0.5),
  //             strokeWidth: 1,
  //             polygonId: PolygonId(doc['name']),
  //             points: lats));
  //       });

  //       print(lats);
  //     }
  //   });

  //   setState(() {
  //     hasLoaded = true;
  //   });
  // }

  List<CircleMarker> circles = [];

  final controller = MapController();

  @override
  Widget build(BuildContext context) {
    return true
        ? Stack(
            children: [
              FlutterMap(
                mapController: controller,
                options: MapOptions(
                    zoom: 15, center: lt.LatLng(8.333504, 124.972149)),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  CircleLayer(
                    circles: circles,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, right: 20, top: 50),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Card(
                    color: Colors.white.withOpacity(0.5),
                    child: SizedBox(
                      height: 700,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Padding(
                                      padding: EdgeInsets.only(top: 50),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.black,
                                      )),
                                    );
                                  }

                                  final data = snapshot.requireData;
                                  return Expanded(
                                    child: ListView.builder(
                                      itemCount: data.docs.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                circles.add(CircleMarker(
                                                    borderColor: Colors.black,
                                                    borderStrokeWidth: 1,
                                                    color: Colors.red,
                                                    point: lt.LatLng(
                                                        data.docs[index]
                                                                ['coordinates']
                                                            [0]['lat'],
                                                        data.docs[index]
                                                                ['coordinates']
                                                            [0]['long']),
                                                    radius: 10));

                                                controller.move(
                                                    lt.LatLng(
                                                        data.docs[index]
                                                                ['coordinates']
                                                            [0]['lat'],
                                                        data.docs[index]
                                                                ['coordinates']
                                                            [0]['long']),
                                                    18);
                                                // mapController!.moveCamera(CameraUpdate
                                                //     .newCameraPosition(CameraPosition(
                                                //         zoom: 14,
                                                //         target: LatLng(
                                                //             data.docs[index][
                                                //                     'coordinates']
                                                //                 [0]['lat'],
                                                //             data.docs[index]
                                                //                     ['coordinates']
                                                //                 [0]['long']))));
                                              });
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 75,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
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
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        TextWidget(
                                                          text: data.docs[index]
                                                              ['name'],
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
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        : const Center(
            child: CircularProgressIndicator(),
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
