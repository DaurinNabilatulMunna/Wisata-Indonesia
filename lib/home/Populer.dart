
import 'package:flutter/material.dart';
import 'package:project_mobile/Detail/DetailPage_top.dart';
import 'package:project_mobile/models/wisataModel.dart';
import 'package:project_mobile/models/viewmodels/fetch_data_top.dart';

class Populer extends StatefulWidget {
  @override
  _PopulerState createState() => _PopulerState();
}

class _PopulerState extends State<Populer> {
  late Future<List<Wisata>> futureWisata;

  @override
  void initState() {
    super.initState();
    futureWisata = fetchData();
  }

  Future<List<Wisata>> fetchData() async {
    Repository repository = Repository();
    List<Wisata> data = await repository.fetchDataPlaces();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 137, 15, 34),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<Wisata>>(
          future: futureWisata,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Wisata> trip = snapshot.data!;

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int index = 1; index < trip.length && index <= 16; index += 2)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage_top(
                                wisataId: trip[index].gambar,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Image.network(trip[index].gambar),
                        ),
                      ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
