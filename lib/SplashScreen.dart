import 'package:flutter/material.dart';
import 'package:project_mobile/home/HomePage.dart';
import 'package:project_mobile/models/login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/home4.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 725), // Ubah nilai ini untuk mengatur jarak
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      primary: Colors.transparent,
                      onPrimary: Color.fromARGB(255, 255, 255, 255),
                      textStyle: TextStyle(fontSize: 30)),
                  child: Text('Please Welcome'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
