import 'package:flutter/material.dart';
import 'package:project_mobile/Detail/DetailPage_beach.dart';
import 'package:project_mobile/models/viewmodels/fetch_data_beach.dart';

class KategoriPage_beach extends StatelessWidget {
  final String selectedCategory;

  KategoriPage_beach({required this.selectedCategory, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository repo = Repository();
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Page'),
        backgroundColor: Color.fromARGB(255, 129, 30, 30),
      ),
      backgroundColor: Color.fromARGB(255, 137, 15, 34),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Add your widgets here as needed
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "INDONESIA",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "THE WONDERLAND OF BHINEKA TUNGGAL IKA",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 10), // Add some spacing
                    Text(
                      "Indonesia's beauty lies in diverse landscapes, vibrant cultures, culture, lush islands, and warm hospitality, creating a captivating, enchanting tapestry.",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    SizedBox(height: 20),
                  ],
                
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: FutureBuilder<List<dynamic>>(
                  future: repo.fetchDataPlaces(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            snapshot.data.length > 25 ? 25 : snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Pass the selected 'wisataId' to DetailPage2
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPage_beach(
                                          wisataId: snapshot.data[index].nama,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 120,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 240, 240, 240),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  snapshot.data[index].gambar),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              snapshot.data[index].nama,
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 85, 85, 85),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              snapshot.data[index].lokasi,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 85, 85, 85),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
