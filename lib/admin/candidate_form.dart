// ==============================
// listing/candidate_form.dart
// ==============================

import 'package:flutter/material.dart';

class CandidateForm
    extends StatelessWidget {

  final bool isEdit;

  final Map<String, dynamic>? data;

  final Function(
      String,
      String)
  onSave;

  final VoidCallback onBack;

  CandidateForm({
    super.key,
    required this.isEdit,
    required this.data,
    required this.onSave,
    required this.onBack,
  });

  final TextEditingController
  nameController =
  TextEditingController();

  final TextEditingController
  partyController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    if (data != null) {

      nameController.text =
      data!["name"];

      partyController.text =
      data!["party"];
    }

    return Scaffold(

      appBar: AppBar(

        leading: IconButton(

          onPressed: onBack,

          icon: const Icon(
              Icons.arrow_back),
        ),

        centerTitle: true,

        backgroundColor:
        const Color.fromARGB(
            255, 17, 177, 158),

        title: Text(

          isEdit
              ? "Edit Candidate"
              : "Add Candidate",
        ),
      ),

      body: Container(

        width: double.infinity,
        height: double.infinity,

        color: const Color.fromARGB(
            255, 194, 255, 242),

        child: Padding(

          padding:
          const EdgeInsets.all(20),

          child: Column(

            children: [

              TextField(

                controller:
                nameController,

                decoration:
                const InputDecoration(

                  filled: true,

                  fillColor:
                  Colors.white,

                  hintText:
                  "Candidate Name",
                ),
              ),

              const SizedBox(height: 20),

              TextField(

                controller:
                partyController,

                decoration:
                const InputDecoration(

                  filled: true,

                  fillColor:
                  Colors.white,

                  hintText:
                  "Party Name",
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(

                onPressed: () {

                  onSave(

                    nameController.text,

                    partyController.text,
                  );
                },

                child: Text(

                  isEdit
                      ? "Update"
                      : "Save",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}