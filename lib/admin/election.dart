// ==============================
// listing/election.dart
// ==============================

import 'package:flutter/material.dart';

class Election extends StatelessWidget {
  final List elections;

  final Function(String) onElectionTap;

  final Function(int) onEdit;

  final VoidCallback onAddElection;

  final VoidCallback onBack;

  const Election({
    super.key,
    required this.elections,
    required this.onElectionTap,
    required this.onEdit,
    required this.onAddElection,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onBack,

          icon: const Icon(Icons.arrow_back),
        ),

        centerTitle: true,

        backgroundColor: const Color.fromARGB(255, 17, 177, 158),

        title: const Text("Available Elections"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: onAddElection,

        child: const Icon(Icons.add),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        color: const Color.fromARGB(255, 194, 255, 242),

        child: ListView.builder(
          itemCount: elections.length,

          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                onElectionTap(elections[index]["title"]);
              },

              child: Container(
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
                    Container(
                      height: 60,
                      width: 60,

                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,

                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Icon(elections[index]["icon"], size: 35),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            elections[index]["title"],

                            style: const TextStyle(
                              fontSize: 20,

                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(elections[index]["place"]),

                          Text(elections[index]["date"]),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        onEdit(elections[index]["id"]);
                      },

                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
