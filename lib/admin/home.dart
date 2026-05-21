// ==============================
// listing/home.dart
// ==============================

import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final List<String> cityList;

  final String selectedCity;

  final Function(String)
  onCitySelect;

  final VoidCallback
  onViewElection;

  final VoidCallback
  onAddElection;

  final VoidCallback
  onAddCity;

  const Home({
    super.key,
    required this.cityList,
    required this.selectedCity,
    required this.onCitySelect,
    required this.onViewElection,
    required this.onAddElection,
    required this.onAddCity,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor:
        const Color.fromARGB(
            255, 17, 177, 158),

        centerTitle: true,

        title: const Text(
            "E-Voting System",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      ),

      floatingActionButton:
      Column(

        mainAxisAlignment:
        MainAxisAlignment.end,

        children: [

          FloatingActionButton(

            heroTag: "1",

            onPressed:
            onAddCity,

            child:
            const Icon(Icons.location_city),
          ),

          const SizedBox(height: 15),
        ],
      ),

      body: Container(

        width: double.infinity,
        height: double.infinity,

        color: const Color.fromARGB(
            255, 194, 255, 242),
        
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(

              "Welcome to E-Voting System",

              style: TextStyle(

                fontSize: 18,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            Container(

              margin:
              const EdgeInsets.symmetric(
                  horizontal: 20),

              padding:
              const EdgeInsets.symmetric(
                  horizontal: 15),

              decoration:
              BoxDecoration(

                color: Colors.white,

                borderRadius:
                BorderRadius.circular(
                    12),
              ),

              child:
              DropdownButton<String>(

                value:
                selectedCity.isEmpty
                    ? null
                    : selectedCity,

                isExpanded: true,

                underline:
                const SizedBox(),

                hint: const Text(
                    "Select City"),

                items:
                cityList.map((city) {

                  return DropdownMenuItem(

                    value: city,

                    child: Text(city),
                  );

                }).toList(),

                onChanged: (value) {

                  onCitySelect(
                      value!);
                },
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(

              onPressed:
              onViewElection,

              child: const Text(
                  "View Elections"),
            ),
          ],
        ),
      ),
    );
  }
}