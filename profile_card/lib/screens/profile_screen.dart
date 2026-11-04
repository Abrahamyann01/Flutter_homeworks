import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text("Դավիթ Աբրահամյան",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
              ),
              SizedBox(height: 10),
              Text("Flutter Սովորող",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black, 
              ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                       prefixIcon: Icon(Icons.email),
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                       prefixIcon: Icon(Icons.phone),
                    hintText: 'Enter your phone number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                       prefixIcon: Icon(Icons.location_city),
                    hintText: 'Enter your city',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}