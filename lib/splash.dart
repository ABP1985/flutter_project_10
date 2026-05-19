import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            colors: [const Color.fromARGB(255, 173, 190, 189), const Color.fromARGB(255, 33, 173, 141), const Color.fromARGB(255, 7, 54, 54)],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            // CENTER AREA
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LOGO CONTAINER
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: const Icon(
                      Icons.how_to_vote,
                      size: 80,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // APP NAME
                  Container(
                    child: const Text(
                      "E-Voting System",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // SLOGAN
                  Container(
                    child: const Text(
                      "Secure • Fast • Transparent",
                      style: TextStyle(color: Color.fromARGB(179, 0, 0, 0), fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // LOADING
                  Container(
                    child: const CircularProgressIndicator(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),

            // COPYRIGHT
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                "© copyright 2026",
                style: TextStyle(color: Colors.white60, fontSize: 14),
              ),
            ),
            Container(
              child: const Text(
                "Version 1.0",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
