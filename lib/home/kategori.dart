import 'package:flutter/material.dart';
import 'package:project_mobile/Kategori/KategoriPage_city.dart';
import 'package:project_mobile/Kategori/KategoriPage_beach.dart';
import 'package:project_mobile/Kategori/KategoriPage_heritage.dart';
import 'package:project_mobile/Kategori/KategoriPage_montain.dart';
import 'package:project_mobile/Kategori/KategoriPage_religius.dart';
import 'package:project_mobile/models/kategoriWisata.dart';

class Kategori extends StatelessWidget {
  // Peta (map) kategori ke halaman tujuan
  final Map<String, Widget> categoryPages = {
    "Heritage": KategoriPage_heritage(selectedCategory: '',),
    "Mountain":KategoriPage_montain(selectedCategory: '',),
    "Religious":KategoriPage_religius(selectedCategory: '',),  
    "Beach": KategoriPage_beach(selectedCategory: '',),
    "City": KategoriPage(selectedCategory: '',),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Category",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 137, 15, 34),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: journey.map((kategori) {
              return GestureDetector(
                onTap: () {
                  // Mendapatkan halaman tujuan dari peta (map)
                  Widget destinationPage = categoryPages[kategori.name]!;
                  // Navigasi ke halaman tujuan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => destinationPage,
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Image.network(
                          kategori.imageUrl,
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                          kategori.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
