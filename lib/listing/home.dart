import 'package:flutter/material.dart';


class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<String> cities = ["Anand", "Vadodara", "Surat", "Ahmedabad"];

  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 17, 177, 158),
        title: const Text(
          "E-Voting System",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 194, 255, 242),

        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              "Welcome to E-Voting System",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),

              child: DropdownButton(
                dropdownColor:  const Color.fromARGB(255, 210, 255, 245),
                value: selectedCity,
                isExpanded: true,
                underline: const SizedBox(),

                hint: const Text("Select City"),

                items: cities.map((city) {
                  return DropdownMenuItem(value: city, child: Text(city));
                }).toList(),

                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},

              child: const Text(
                "View Elections",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
