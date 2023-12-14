import 'package:flutter/material.dart';
import 'package:project_mobile/home/kategori.dart';
import 'package:project_mobile/home/Populer.dart';
import 'package:project_mobile/home/ItemTop.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
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
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Add some spacing
                    Text(
                      "Where do you want to go on an adventure today?",
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
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Kategori(),
                    Populer(), // Mengirimkan data 'trip' ke widget 'Populer'
                    ItemTop(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
