// ==============================
// listing/candidates.dart
// ==============================

import 'package:flutter/material.dart';

class Candidates extends StatelessWidget {
  final List candidates;

  final Function(int, BuildContext) onVote;

  final Function(int) onEdit;

  final VoidCallback onAddCandidate;

  final VoidCallback onBack;

  const Candidates({
    super.key,
    required this.candidates,
    required this.onVote,
    required this.onEdit,
    required this.onAddCandidate,
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

        title: const Text("Candidates"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: onAddCandidate,

        child: const Icon(Icons.add),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        color: const Color.fromARGB(255, 194, 255, 242),

        child: ListView.builder(
          itemCount: candidates.length,

          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

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

                    child: Icon(
                      IconData(
                        candidates[index]["symbol"],

                        fontFamily: 'MaterialIcons',
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          candidates[index]["name"],

                          style: const TextStyle(
                            fontSize: 20,

                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(candidates[index]["party"]),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      onEdit(candidates[index]["id"]);
                    },

                    icon: const Icon(Icons.edit),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      onVote(index, context);
                    },

                    child: const Text("Vote"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
