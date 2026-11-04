import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Դավիթ Աբրահամյան',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Flutter Սովորող',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              const CustomTextField(
                icon: Icons.email,
                hintText: 'Enter your email',
              ),

              const SizedBox(height: 10),

              const CustomTextField(
                icon: Icons.phone,
                hintText: 'Enter your phone number',
              ),

              const SizedBox(height: 10),

              const CustomTextField(
                icon: Icons.location_city,
                hintText: 'Enter your city',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
