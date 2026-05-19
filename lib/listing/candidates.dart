import 'package:flutter/material.dart';

class Candidates extends StatefulWidget {

  final String candidate;

  const Candidates({super.key,
  required this.candidate,
  });

  @override
  State<Candidates> createState() => _CandidatesState();
}

class _CandidatesState extends State<Candidates> {
  @override
  Widget build(BuildContext context) {
    
    // LIST
    List candidates = [

      {
        "name": "Rahul Sharma",
        "party": "ABC Party",
        "symbol": Icons.diamond,
      },

      {
        "name": "Priya Patel",
        "party": "XYZ Party",
        "symbol": Icons.star,
      },

      {
        "name": "Amit Verma",
        "party": "National Party",
        "symbol": Icons.hexagon,
      },
    ];

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Candidates", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 17, 177, 158),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 194, 255, 242),

        child: Column(
          children: [

            const SizedBox(height: 20),

            const Text(
              "Available Candidates",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // MAP
            ...candidates.map((c) {

              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),

                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Row(
                  children: [

                    // SYMBOL
                    Container(
                      height: 60,
                      width: 60,

                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Icon(
                        c["symbol"],
                        size: 35,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(width: 15),

                    // DETAILS
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          c["name"],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          c["party"],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // VOTE BUTTON
                    Container(
                      height: 40,

                      child: ElevatedButton(
                        onPressed: () {

                        },

                        child: const Text("Vote", style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}