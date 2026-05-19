import 'package:flutter/material.dart';

class Election extends StatefulWidget {

  final String city;

  const Election({super.key,
  required this.city,
  });

  @override
  State<Election> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Election> {
  @override
  Widget build(BuildContext context) {
    List elections = [

      {
        "title": "Municipal Election",
        "place": "Vadodara City",
        "date": "25 May 2026",
        "icon": Icons.location_city,
      },

      {
        "title": "State Election",
        "place": "Gujarat State",
        "date": "10 June 2026",
        "icon": Icons.account_balance,
      },

      {
        "title": "National Election",
        "place": "India",
        "date": "15 July 2026",
        "icon": Icons.flag,
      },
    ];

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Vadodara Elections",style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
         backgroundColor: const Color.fromARGB(255, 17, 177, 158),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color:  const Color.fromARGB(255, 194, 255, 242),

        child: Column(
          children: [

            const SizedBox(height: 20),

            const Text(
              "Available Elections",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // MAP
            ...elections.map((e) {

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

                    // ICON
                    Container(
                      height: 60,
                      width: 60,

                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Icon(
                        e["icon"],
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
                          e["title"],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          e["place"],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "Date : ${e["date"]}",
                        ),
                      ],
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