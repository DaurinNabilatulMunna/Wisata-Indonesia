import 'package:flutter/material.dart';
import 'package:project_mobile/models/viewmodels/fetch_data_montain.dart';
import 'package:project_mobile/models/wisataModel.dart';

class DetailPage extends StatefulWidget {
  final String wisataId;

  DetailPage({required this.wisataId});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<Wisata> futureWisata;

  @override
  void initState() {
    super.initState();
    futureWisata = fetchData();
  }

  Future<Wisata> fetchData() async {
    Repository repository = Repository();
    List<Wisata> data = await repository.fetchDataPlaces();

    Wisata selectedWisata =
        data.firstWhere((wisata) => wisata.nama == widget.wisataId);

    return selectedWisata;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        backgroundColor: Color.fromARGB(255, 237, 44, 44),
      ),
      body: FutureBuilder<Wisata>(
        future: futureWisata,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            Wisata wisata = snapshot.data!;
            return buildDetailPage(wisata);
          }
        },
      ),
    );
  }

  Widget buildDetailPage(Wisata wisata) {
    return SafeArea(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
            child: Image.network(
              wisata.gambar,
              fit: BoxFit.cover,
              height: 370,
              width: double.infinity,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 350),
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  padding: EdgeInsets.all(19),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wisata.nama,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        wisata.lokasi,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 30,
                          ),
                          Text(
                            wisata.rating.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up_alt,
                            color: Colors.white,
                            size: 25,
                          ),
                          Text(
                            "${wisata.like} Like",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Description:",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            wisata.deskripsi,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
